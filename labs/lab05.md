# Lab 5: Getting Data into R

## Learning Objectives
* Understand the difference between **Absolute** and **Relative** file paths.
* Import data from a local **CSV** file.
* Import data directly from a **URL** (Web).
* Use the `readr` package (part of the tidyverse).

---

## Introduction
Before we can visualize or model data, we have to "import" it into R's memory. Most data you will encounter is stored in **CSV** (Comma Separated Values) format, which looks like an Excel spreadsheet but is much lighter and easier for programs to read.

---

## Part 1: The Working Directory
R needs to know which folder on your computer it should "look" in. 

<div class="dcc-important">
**Crucial Step:** This is why we use **RStudio Projects** (from Lab 2). When you open your `.Rproj` file, R automatically sets your folder as the "Working Directory."
</div>

To check where R is looking, type this in your console:
~~~r
getwd()
~~~

---

## Part 2: Loading Data from a URL
The easiest way to get started is to pull data directly from the internet. We will use the `read_csv()` function from the `tidyverse`.

**Try this code in your Quarto document:**
~~~r
library(tidyverse)

# Loading a dataset about Star Wars characters
url <- "https://raw.githubusercontent.com/tidyverse/dplyr/master/data-raw/starwars.csv"
sw_data <- read_csv(url)

# Preview the data
head(sw_data)
~~~



---

## Part 3: Loading a Local CSV
Often, you will download a dataset from a site like Kaggle or a government portal.

1. Find a CSV file (or download a sample one).
2. Move that file into your **MAT186_Labs** folder.
3. Use the following code (replace `filename.csv` with your actual file name):

~~~r
my_data <- read_csv("filename.csv")
~~~

---

## Part 4: Dealing with Common Errors
* **"File not found":** This usually means the file is not in your Project folder, or you misspelled the name (remember: `Data.csv` is different from `data.csv`).
* **Column Parsing:** Sometimes R guesses the data type wrong (e.g., thinking a zip code is a number instead of a label). We will learn to fix this in future labs!

---

<div class="dcc-important">
**Lab Task 5:** 1. Find any public CSV dataset (or use [this link to DCC-related data](https://example.com/dcc_data.csv)).
2. Import it into a new Quarto document using `read_csv`.
3. Use the `glimpse()` command to show the structure of your data:
   ~~~r
   glimpse(my_data)
   ~~~
4. Render the document and confirm that your data table appears in the HTML.
</div>
