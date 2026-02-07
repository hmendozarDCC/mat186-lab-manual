# MAT 186: Lab Manual Website

This repository contains the source code and materials for the **MAT 186 Course Website**. It is built using [Quarto](https://quarto.org/) and hosted via GitHub Pages.

## 📁 Project Structure

* `index.qmd`: The homepage of the website.
* `labs/`: Contains the student-facing lab assignments.
* `solutions/`: Contains password-protected solution files (secretly named).
* `images/`: All figures, diagrams, and solution screenshots.
* `_quarto.yml`: The main configuration file for the website sidebar and theme.

## 🚀 How to Update the Site

1.  **Edit Content**: Modify the `.qmd` files in RStudio.
2.  **Preview**: Run `quarto preview` in the terminal to see changes locally.
3.  **Render**: Click the **Render** button in RStudio (or run `quarto render`). This updates the `_site/` folder.
4.  **Publish**:
    * Open **GitHub Desktop**.
    * Commit changes (e.g., "Added Lab 2 Solutions").
    * Push to Origin.

## 🔑 Solution Management

To keep solutions secure:
1.  **Secret Filenames**: Solutions are named using a `sol-XX-xxxx.qmd` pattern to prevent URL guessing.
2.  **Password Protection**: Files use a JavaScript gatekeeper. 
3.  **To Activate a Solution**: Go to `_quarto.yml` and uncomment the solution line in the sidebar menu.

## 🛠 Technical Requirements

* RStudio
* Quarto CLI
* GitHub Desktop