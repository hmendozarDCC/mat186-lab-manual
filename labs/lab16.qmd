# Lab 16: Analysis of Variance (ANOVA)

## Learning Objectives
* Understand when to use **ANOVA** instead of multiple t-tests.
* State the Null ($H_0$) and Alternative ($H_a$) hypotheses for multiple groups.
* Conduct a **One-Way ANOVA** in R.
* Perform **Post-hoc testing** (Tukey’s HSD) to find exactly where differences lie.

---

## Part 1: Why ANOVA?
If you have three groups (e.g., Freshman, Sophomores, Juniors) and you want to compare their average GPA, you *could* run three separate t-tests. However, every time you run a test, there is a 5% chance of being wrong. By the third test, your error rate has ballooned! 

**ANOVA** tests all groups at once, keeping our error rate at 5%.

* **Null Hypothesis ($H_0$):** All group means are equal ($\mu_1 = \mu_2 = \mu_3$).
* **Alternative Hypothesis ($H_a$):** At least one group mean is different.



---

## Part 2: Visualizing Multiple Groups
With ANOVA, side-by-side boxplots are essential. They allow us to see if the "spread" within groups is smaller than the "distance" between groups.

~~~r
library(tidyverse)

# Example: Do different 'eye colors' in Star Wars have different average heights?
# We'll filter for the most common eye colors
eye_data <- starwars |> 
  filter(eye_color %in% c("blue", "brown", "yellow", "orange")) |>
  drop_na(height)

ggplot(eye_data, aes(x = eye_color, y = height, fill = eye_color)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Height Distribution by Eye Color")
~~~

---

## Part 3: Running the ANOVA in R
We use the `aov()` function. Like the t-test, we use the formula `numeric_variable ~ categorical_variable`.

~~~r
# 1. Fit the ANOVA model
model <- aov(height ~ eye_color, data = eye_data)

# 2. View the summary table
summary(model)
~~~

### How to read the ANOVA Table:
* **Df:** Degrees of freedom.
* **F value:** The ratio of variance *between* groups to variance *within* groups. A large F-value usually leads to a small p-value.
* **Pr(>F):** This is your **p-value**. If it is < 0.05, we reject the Null.



---

## Part 4: Post-hoc Testing (Tukey's HSD)
If your ANOVA p-value is significant, you know *someone* is different, but you don't know who. We use **Tukey’s Honest Significant Difference** to compare every possible pair.

~~~r
# Running Tukey's HSD
TukeyHSD(model)
~~~

---

<div class="dcc-important">
**Lab Task 16:**
1. Identify a categorical variable in your data with **3 or more groups** (e.g., County, Year, or Category).
2. Create a **Boxplot** comparing a numeric variable across these groups.
3. Run the `aov()` function and look at the `summary()`.
4. **Conclusion:** * If p > 0.05: State that there is no significant difference between any groups.
   * If p < 0.05: Run `TukeyHSD()` and identify which specific pairs are actually different.
</div>

---

## Pro-Tip: The "Equal Variance" Assumption
ANOVA assumes that the "spread" (variance) is roughly the same for all groups. If one boxplot is massive and another is tiny, the math might be unreliable. In those cases, we go back to the **Non-parametric** methods from Lab 15!
