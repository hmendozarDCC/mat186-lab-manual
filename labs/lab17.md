# Lab 17: Regression Models

## Learning Objectives
* Understand the Linear Regression equation: $y = \beta_0 + \beta_1x + \epsilon$.
* Calculate and interpret the **Correlation Coefficient ($r$)**.
* Fit a Linear Model in R using the `lm()` function.
* Evaluate model fit using **R-squared ($R^2$)**.

---

::: {.callout-note}
## Download the Dataset
To complete the exercises in this lab, you will need the regression dataset.

[<i class="bi bi-download"></i> Download survey_data.csv](data/survey_data.csv){.btn .btn-primary .btn-sm role="button"}
:::


# Option 1: Reading from the local file they downloaded
# data <- read.csv("survey_data.csv")

# Option 2: Reading directly from your website (Easiest for students)
url <- "https://hmendozardcc.github.io/mat186-lab-manual/data/survey_data.csv"
data <- read.csv(url)

# Preview the data
head(data)


---
## Part 1: Correlation ($r$)
Before building a model, we need to know if a linear relationship even exists. The correlation coefficient ($r$) ranges from **-1** to **1**.
* **1**: Perfect positive relationship.
* **0**: No relationship at all.
* **-1**: Perfect negative relationship.

~~~r
library(tidyverse)

# Calculate correlation between height and mass
starwars |>
  drop_na(height, mass) |>
  summarize(correlation = cor(height, mass))
~~~



---

## Part 2: Visualizing the Best Fit Line
We use `geom_smooth(method = "lm")` to draw the line that minimizes the distance between all data points (the "Ordinary Least Squares" method).

~~~r
# Scatter plot with a regression line
ggplot(starwars |> filter(mass < 500), aes(x = height, y = mass)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "blue", se = TRUE) +
  labs(title = "Predicting Mass based on Height",
       subtitle = "The blue line represents our regression model")
~~~



---

## Part 3: Building the Model in R
In R, the "Linear Model" function is `lm()`. The syntax is `lm(dependent_variable ~ independent_variable)`.

~~~r
# 1. Create the model
my_model <- lm(mass ~ height, data = starwars |> filter(mass < 500))

# 2. View the results
summary(my_model)
~~~

### How to interpret the summary:
* **Intercept ($\beta_0$):** The predicted value of $y$ when $x$ is zero.
* **Slope ($\beta_1$):** For every 1 unit increase in $x$, how much $y$ is expected to change.
* **R-squared ($R^2$):** The percentage of variation in $y$ explained by your model. (e.g., $0.75$ means your model explains 75% of the data).

---

## Part 4: Making Predictions
Once you have a model, you can plug in a value for $x$ to predict $y$. If our model is $Mass = -100 + 1.2(Height)$, we can predict the mass of a character who is 200cm tall.

~~~r
# Predict mass for a height of 200cm
new_data <- data.frame(height = 200)
predict(my_model, newdata = new_data)
~~~

---

<div class="dcc-important">
**Lab Task 17:**
1. Pick two numeric variables from your dataset that you think are related.
2. Create a **Scatter Plot** and add a linear regression line.
3. Use the `cor()` function to find the correlation coefficient.
4. Fit a linear model using `lm()` and look at the `summary()`.
5. **The Report:**
   * What is the slope of your model? 
   * What is the $R^2$ value? 
   * Use your model to make one prediction for a value not in your dataset.
</div>

---

## Pro-Tip: Correlation $\neq$ Causation
Just because two variables are mathematically related doesn't mean one
