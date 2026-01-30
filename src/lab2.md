# Lab 2: RStudio Projects and Quarto Documents

## Learning Objectives
* Create an **RStudio Project** to organize your work.
* Understand the structure of a **Quarto (.qmd)** document.
* "Render" a document into a professional HTML report.

---

## Part 1: RStudio Projects
In Data Science, organization is everything. An RStudio Project keeps your code, data, and images in one "folder" so R always knows where to look.

1. Open RStudio.
2. Click **File > New Project...**
3. Select **New Directory** > **New Project**.
4. Name your directory `MAT186_Labs` and save it to your Desktop or Documents.

<div class="dcc-note">
**Why use Projects?** It sets the "Working Directory" automatically. You'll never have to type long file paths like `C:/Users/Documents/Data...` again!
</div>

---

## Part 2: Creating a Quarto Document
Quarto allows you to combine text, code, and results in one file.

1. Click **File > New File > Quarto Document...**
2. Title it "Lab 2" and put your name as the Author.
3. Click **Create**.
4. Look at the file. You will see:
   * **YAML Header:** The stuff between the `---` lines (Title, Author, Format).
   * **Code Chunks:** The gray boxes starting with ` ```{r} `.
   * **Markdown:** The plain white areas for your written analysis.



---

## Part 3: Rendering (The "Magic" Button)
To turn your code into a report:
1. Click the **Render** button (blue arrow icon) at the top of the editor.
2. RStudio will save the file and pop up a beautiful HTML window.

---

<div class="dcc-important">
**Lab Task 2:** Inside your Quarto document, create a new code chunk and type `2 + 2`. Render the document and verify that the number `4` appears in the final report. Screenshot your rendered HTML for submission.
</div>
