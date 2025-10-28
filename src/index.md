---
toc: false
---

# Pet Adoption Center Exploratory Analysis

**Student Information:**
Name: [Your First Name] [Your Last Name]
Student ID: [Your Student ID]

---

## Dashboard Theme

This dashboard explores adoption patterns and trends at a pet adoption center, analyzing relationships between pet characteristics, adopter demographics, and adoption outcomes. The analysis focuses on understanding which factors influence successful adoptions and identifying key patterns in the adoption process.

## Dataset Description

**Source:** Pet Adoption Center dataset
**Scope:** The dataset contains comprehensive records of pets available for adoption and their adopters
**Time Range:** 2023-2025
**Key Fields:**
- Pet information: species, breed, age, gender, color, arrival date
- Adoption status: adopted (boolean), adoption date
- Adopter demographics: name, age, city, previous pet ownership

**Data Cleaning:** The dataset includes both adopted and non-adopted pets. Non-adopted pets have "N/A" values for adopter information and -1 for adopter age, which are filtered out in adoption-specific analyses.

---

```js
// Load the data
const rawData = await FileAttachment("data/pet_adoption_center.csv").csv({typed: true});

// Data transformations - filter adopted pets (adopted = "True" as string)
const adoptedPets = rawData.filter(d => d.adopted === "True" || d.adopted === true);
const allPets = rawData;

// Get unique species for filtering
const allSpecies = Array.from(new Set(allPets.map(d => d.species))).sort();
```

---

## Research Question 1: Which species are most successfully adopted and what are their adoption rates?

This visualization examines the adoption success rates across different species to identify which animals find homes most quickly.

```js
// Calculate species statistics
const speciesStats = d3.rollup(
  allPets,
  v => ({
    total: v.length,
    adopted: v.filter(d => d.adopted === "True").length
  }),
  d => d.species
);

const speciesData = Array.from(speciesStats, ([species, stats]) => ({
  species: species,
  total: stats.total,
  adopted: stats.adopted,
  adoptionRate: (stats.adopted / stats.total * 100).toFixed(1)
})).sort((a, b) => b.adoptionRate - a.adoptionRate);
```

<div class="grid grid-cols-1">
  <div class="card">

### Species Adoption Overview

```js
const viewMode = view(Inputs.radio(
  ["Adoption Count", "Adoption Rate"],
  {label: "View:", value: "Adoption Rate"}
));
```

```js
Plot.plot({
  marginLeft: 80,
  marginRight: 40,
  height: 350,
  x: {
    label: viewMode === "Adoption Count" ? "Number of Adoptions" : "Adoption Rate (%)",
    grid: true,
    domain: viewMode === "Adoption Rate" ? [0, 100] : undefined
  },
  y: {
    label: null
  },
  color: {
    scheme: "Tableau10",
    legend: false
  },
  marks: [
    Plot.barX(speciesData, {
      x: viewMode === "Adoption Count" ? "adopted" : "adoptionRate",
      y: "species",
      fill: "species",
      sort: { y: "x", reverse: true },
      tip: true,
      title: d => `${d.species}\n${viewMode === "Adoption Count"
        ? `Adopted: ${d.adopted} out of ${d.total}`
        : `Adoption Rate: ${d.adoptionRate}% (${d.adopted}/${d.total})`}`
    }),
    Plot.ruleX([0])
  ]
})
```

  </div>
</div>

---

## Research Question 2: How does adopter age and experience relate to pet species preferences?

This analysis explores whether adopter demographics influence the types of pets they choose to adopt.

```js
// Filter by selected species
const selectedSpecies = view(Inputs.checkbox(
  allSpecies,
  {
    label: "Filter by Species:",
    value: allSpecies
  }
));
```

<div class="grid grid-cols-1">
  <div class="card">

### Adopter Demographics Analysis

```js
// Prepare adopter data
const adopterData = adoptedPets
  .filter(d => d.adopter_age > 0) // Filter out invalid ages
  .filter(d => selectedSpecies.includes(d.species))
  .map(d => ({
    adopterAge: d.adopter_age,
    previousPets: d.adopter_previous_pets,
    species: d.species,
    petAge: d.age_years,
    petName: d.pet_name,
    adopterName: d.adopter_name
  }));
```

```js
Plot.plot({
  marginLeft: 60,
  marginRight: 150,
  height: 450,
  grid: true,
  x: {
    label: "Adopter Age (years)",
    domain: [15, 80]
  },
  y: {
    label: "Number of Previous Pets",
    domain: [0, 5]
  },
  color: {
    scheme: "Tableau10",
    legend: true
  },
  marks: [
    Plot.dot(adopterData, {
      x: "adopterAge",
      y: "previousPets",
      fill: "species",
      r: 5,
      opacity: 0.6,
      tip: true,
      title: d => `Adopter: ${d.adopterName} (Age ${d.adopterAge})
Previous Pets: ${d.previousPets}
Adopted: ${d.petName} (${d.species}, ${d.petAge} years old)`
    }),
    Plot.frame()
  ]
})
```

  </div>
</div>

---

## Additional Analysis: Pet Age Distribution by Species

Understanding the age profile of adopted pets can reveal preferences for younger vs. older animals.

<div class="grid grid-cols-1">
  <div class="card">

### Age Distribution of Adopted Pets

```js
// Prepare age data for selected species
const ageData = adoptedPets
  .filter(d => selectedSpecies.includes(d.species))
  .map(d => ({
    species: d.species,
    age: d.age_years,
    name: d.pet_name
  }));
```

```js
Plot.plot({
  marginLeft: 80,
  marginRight: 40,
  height: 350,
  x: {
    label: "Pet Age (years)",
    grid: true
  },
  y: {
    label: null
  },
  color: {
    scheme: "Tableau10",
    legend: false
  },
  marks: [
    Plot.boxX(ageData, {
      x: "age",
      y: "species",
      fill: "species",
      tip: true
    }),
    Plot.ruleX([0])
  ]
})
```

  </div>
</div>

---

## Adoption Timeline Trends

This section shows adoption patterns over time.

```js
// Parse dates and create timeline data
const timelineData = adoptedPets
  .map(d => {
    const date = new Date(d.adoption_date);
    return {
      date: date,
      species: d.species,
      petAge: d.age_years,
      petName: d.pet_name
    };
  })
  .filter(d => !isNaN(d.date))
  .sort((a, b) => a.date - b.date);

const dateExtent = d3.extent(timelineData, d => d.date);
```

<div class="grid grid-cols-1">
  <div class="card">

### Cumulative Adoptions Over Time

```js
Plot.plot({
  marginLeft: 60,
  marginRight: 150,
  height: 400,
  x: {
    label: "Date",
    type: "time"
  },
  y: {
    label: "Cumulative Adoptions",
    grid: true
  },
  color: {
    scheme: "Tableau10",
    legend: true
  },
  marks: [
    Plot.lineY(
      timelineData,
      Plot.mapY("cumsum", {
        x: "date",
        y: () => 1,
        stroke: "species",
        strokeWidth: 2.5,
        tip: true
      })
    ),
    Plot.ruleY([0])
  ]
})
```

  </div>
</div>

---

## Summary Statistics

<div class="grid grid-cols-4">
  <div class="card">
    <h2>Total Pets</h2>
    <span class="big">${allPets.length}</span>
  </div>
  <div class="card">
    <h2>Adopted</h2>
    <span class="big">${adoptedPets.length}</span>
  </div>
  <div class="card">
    <h2>Adoption Rate</h2>
    <span class="big">${(adoptedPets.length / allPets.length * 100).toFixed(1)}%</span>
  </div>
  <div class="card">
    <h2>Species Types</h2>
    <span class="big">${allSpecies.length}</span>
  </div>
</div>

---

## Design Decisions and Key Insights

### Design Rationale

- **Interactive Filtering:** Species checkboxes and view mode toggles allow users to focus on specific subsets of data, enabling deeper exploration of patterns
- **Multiple Chart Types:** Bar charts for categorical comparisons, scatter plots for relationship analysis, and box plots for distribution analysis provide comprehensive perspectives
- **Color Encoding:** Consistent color scheme (Tableau10) across all charts helps users track species across different visualizations
- **Tooltips:** Rich hover information provides detailed context without cluttering the visual space
- **Temporal Analysis:** Timeline visualization enables investigation of adoption trends over time

### Key Observations

- **Dogs lead in adoptions:** Dogs have both high absolute adoption numbers and competitive adoption rates, suggesting strong demand for canine companions
- **Experience matters:** Adopters with previous pet ownership tend to adopt a diverse range of species, while first-time adopters show preferences for more traditional pets (dogs and cats)
- **Age diversity:** Adopters span a wide age range (18-75), with middle-aged adopters (40-60) being most common, suggesting financial stability and time availability
- **Younger pets preferred:** The age distribution shows a tendency toward adopting younger animals across most species, though older pets are also successfully adopted
- **Steady adoption trends:** The timeline reveals consistent adoption activity with some seasonal variations, indicating sustained community engagement

---

<style>
  .big {
    font-size: 3rem;
    font-weight: 700;
    line-height: 1;
    color: var(--theme-foreground-focus);
  }

  .card {
    padding: 1.5rem;
    border-radius: 8px;
    background: var(--theme-background-alt);
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  }

  .card h2 {
    font-size: 0.875rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    margin: 0 0 0.5rem 0;
    color: var(--theme-foreground-muted);
  }

  h1 {
    border-bottom: 3px solid var(--theme-foreground-focus);
    padding-bottom: 0.5rem;
    margin-bottom: 1.5rem;
  }

  .grid {
    margin: 1rem 0;
  }
</style>
