# Lab 3: Mathematical Notation in Quarto

## Learning Objectives
* Distinguish between **Inline** and **Display** math modes in Quarto.
* Use LaTeX syntax to write essential statistical symbols ($\mu, \sigma, \bar{x}$).
* Format complex equations like Linear Regression for professional lab reports.

---

## Introduction
In Data Science, we often need to document the mathematical models we use. Quarto uses a system called **LaTeX** (pronounced "Lay-tek") to render math. This ensures your formulas look professional and are accessible to screen readers.

---

## Part 1: The Two Math Modes
There are two ways to display math in your Quarto documents depending on where you want the formula to appear.

### 1. Inline Math
Use a single dollar sign `$ ... $` when the math should stay inside a sentence.

* **Code:** `The population mean is represented by $\mu$.`
  
* **Result:** The population mean is represented by $\mu$.

### 2. Display Math
Use double dollar signs `$$...$$` to center the formula on its own line.

* **Code:** `$$\bar{x} = \frac{\sum x_i}{n}$$`
  
* **Result:** $$\bar{x} = \frac{\sum x_i}{n}$$



---

## Part 2: Common Symbols for MAT 186
Copy and paste these codes into your Quarto document to practice:

| Statistical Term | LaTeX Code | Rendered Result |
| :--- | :--- | :--- |
| **Sample Mean** | `$\bar{x}$` | $\bar{x}$ |
| **Standard Deviation** | `$\sigma$` | $\sigma$ |
| **Summation** | `$\sum$` | $\sum$ |
| **Correlation Coefficient** | `$r$` | $r$ |
| **Coefficient of Determination** | `$R^2$` | $R^2$ |

---

## Part 3: Writing Equations
For Linear Regression, we combine several symbols. Try typing this in your Quarto file:

**Code:**
`$$y = \beta_0 + \beta_1 x + \epsilon$$`

**Result:**
$$y = \beta_0 + \beta_1 x + \epsilon$$

---

<div class="dcc-important">
**Lab Task 3:** 1. Open your `MAT186_Labs` project in RStudio.
2. Create a new Quarto document (`.qmd`) titled "Math Practice."
3. Write the formula for the **Standard Deviation** exactly as shown below:
   `$$s = \sqrt{\frac{\sum (x_i - \bar{x})^2}{n - 1}}$$`
4. **Render** the document to HTML and confirm the formula appears correctly.
</div>

---

## Troubleshooting Math Errors
* **Spaces:** Do not put a space between the `$` and your math code. 
    * *Bad:* `$ \mu $`
    * *Good:* `$\mu$`
* **Missing Signs:** If your formula looks like plain text, check if you forgot the closing `$`.

---

### **Accessibility Check**
When you use this LaTeX method, students using screen readers can hear the math described clearly (e.g., "x bar equals fraction sum x sub i over n"). This is much better than using an image of an equation, which a screen reader cannot "see."
