# Lab 6: Data Collection and Sources

## Learning Objectives
* Distinguish between **Primary** and **Secondary** data.
* Explore "Open Data" portals (Local, State, and Federal).
* Understand the concept of **Tidy Data**.
* Practice ethical data attribution.

---

## Introduction
Data doesn't just appear out of nowhere; it is collected via sensors, surveys, web scraping, or manual entry. As a data scientist at DCC, you should know how to find reliable sources of information to answer real-world questions.

---

## Part 1: Finding Open Data
Government agencies often provide "Open Data" portals where anyone can download datasets for free. These are excellent sources for your final projects.

### Recommended Portals:
* **[Dutchess County Open Data](https://data.dutchessny.gov/):** Local data on parcels, transit, and public safety.
* **[NY State Open Data](https://data.ny.gov/):** Information on education, health, and the environment across New York.
* **[U.S. Census Bureau](https://data.census.gov/):** The gold standard for demographic data in the United States.



---

## Part 2: What is "Tidy Data"?
Once you collect data, it needs to be in a specific format for R to read it easily. This is called **Tidy Data**. There are three rules:
1. Each **variable** must have its own column.
2. Each **observation** (case) must have its own row.
3. Each **value** must have its own cell.



---

## Part 3: Data Ethics & Attribution
Whenever you collect data that you didn't create yourself, you must provide a **Data Citation**. This gives credit to the original collectors and allows others to verify your work.

**A good citation includes:**
* The name of the organization.
* The year the data was accessed.
* The URL/Link to the dataset.

---

<div class="dcc-important">
**Lab Task 6: The Scavenger Hunt**
1. Visit the [NY State Open Data Portal](https://data.ny.gov/).
2. Search for a dataset that interests you (e.g., "Student Enrollment" or "Water Quality").
3. Download the **CSV** version of that data.
4. Move the file into your RStudio Project folder.
5. In a new Quarto document, write a short paragraph describing:
   * **Where** the data came from.
   * **Who** collected it.
   * **What** one row in the dataset represents (the observation).
6. Use `read_csv()` to load the data and show the first 10 rows using `head()`.
</div>

---

## Part 4: The Next Step (Preview)
Data you find "in the wild" is rarely perfect. In the next lab, we will learn how to "clean" the data you just found—removing empty rows and fixing typos!
