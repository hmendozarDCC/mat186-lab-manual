# 1. Build the student version
quarto render

# 2. Build the teacher version into a subfolder
quarto render --profile solution

# 3. Send everything to the web
quarto publish gh-pages
