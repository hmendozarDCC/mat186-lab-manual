# Lab 14: Bootstrapping and Resampling

## Learning Objectives
* Understand the concept of **Sampling with Replacement**.
* Use the `infer` package to create a bootstrap distribution.
* Estimate a **Confidence Interval** without assuming the data is "Normal."
* Compare Bootstrap results to traditional T-test results.

---

## Introduction: Pulling yourself up by your Boots
What if your data is skewed, or you have a very small sample size? Traditional math might fail you. **Bootstrapping** solves this by treating your sample like a "mini-population." We take thousands of samples from our own data to see how much the mean varies.



---

## Part 1: The `infer` Package
In R, the `infer` package makes the logic of bootstrapping very clear. We follow four steps: `specify`, `generate`, `calculate`, and `visualize`.

~~~r
# Install and load the infer package
if(!require(infer)) install.packages("infer")
library(tidyverse)
library(infer)

# Let's bootstrap the mean height of Star Wars characters
boot_dist <- starwars |>
  drop_na(height) |>
  specify(response = height) |>              # 1. What variable?
  generate(reps = 1000, type = "bootstrap") |> # 2. Resample 1000 times
  calculate(stat = "mean")                   # 3. Find the mean each time
~~~

---

## Part 2: Visualizing the Bootstrap Distribution
Instead of a theoretical curve, we look at the actual distribution of our 1,000 "fake" means.

~~~r
visualize(boot_dist) +
  labs(title = "Bootstrap Distribution of the Mean",
       x = "Sample Mean Height", y = "Count")
~~~



---

## Part 3: The Percentile Method
To find a 95% Confidence Interval, we simply look at where the middle 95% of our 1,000 bootstrap means fall.

~~~r
percentile_ci <- boot_dist |>
  get_confidence_interval(level = 0.95, type = "percentile")

# View the interval
percentile_ci
~~~

---

## Part 4: Why Use Bootstrapping?
1. **No "Normality" Required:** It works even if your data is weirdly shaped.
2. **Any Statistic:** You can bootstrap the mean, the median, the standard deviation, or even the correlation coefficient.
3. **Visual Logic:** It helps you *see* the uncertainty in your estimate.

---

<div class="dcc-important">
**Lab Task 1
