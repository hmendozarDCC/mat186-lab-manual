# Lab 12: Statistical Inference for Two Means

## Learning Objectives
* Understand the difference between **Independent** and **Paired** samples.
* State the Null ($H_0$) and Alternative ($H_a$) hypotheses for comparing two groups.
* Conduct an **Independent Samples t-test** in R.
* Visualize the difference between groups using **Boxplots**.

---

## Part 1: Comparing Two Independent Groups
We use an Independent Samples t-test when we want to compare the means of two distinct, unrelated groups.
* **Example:** Do "Humans" have a different average height than "Droids"?
* **Example:** Is the average house price in Poughkeepsie different from the average price in Fishkill?



---

## Part 2: Hypotheses for Two Means
In this test, we are looking at the **difference** between the two population means ($\mu_1 - \mu_2$).

* **Null Hypothesis ($H_0$):** $\mu_1 = \mu_2$ (The means are the same; the difference is zero).
* **Alternative Hypothesis ($H_a$):** $\mu_1 \neq \mu_2$ (The means are significantly different).

---

## Part 3: Visualizing the Comparison
Before running the math, we should always visualize the two groups side-by-side using a **Boxplot**.

~~~r
library(tidyverse)

# Comparing heights of Humans and Droids
comparison_data <- starwars |> 
  filter(species %in% c("Human", "Droid")) |>
  drop_na(height)

ggplot(comparison_data, aes(x = species, y = height, fill = species)) +
  geom_boxplot() +
  labs(title = "Height Comparison: Humans vs. Droids")
~~~



---

## Part 4: Running the t-test in R
In R, we use the "formula" syntax: `y ~ x` (where `y` is the numeric value and `x` is the grouping category).

~~~r
# Conducting the Independent Samples t-test
t_test_results <- t.test(height ~ species, data = comparison_data)

# View results
t_test_results
~~~

### How to interpret the output:
* **p-value:** If p < 0.05, we conclude that the average heights of Humans and Droids are significantly different.
* **95% Confidence Interval:** This gives the range of the *difference* between the two means. If the interval contains **0**, the results are usually not significant.

---

<div class="dcc-important">
**Lab Task 12:**
1. Pick a dataset that has at least one **categorical variable** with two groups (e.g., Male/Female, Treatment/Control, Yes/No).
2. Create a **Boxplot** to visually compare a numeric variable across those two groups.
3. State your Null and Alternative hypotheses.
4. Run the `t.test()` using the formula syntax.
5. **The Conclusion:** Report your p-value and state whether you reject or fail to reject the null hypothesis. Does the data suggest the groups are truly different?
</div>

---

## Accessibility Tip: High-Contrast Visuals
When using the `fill = species` aesthetic in your plots, remember that some students may have color vision deficiencies. Use `scale_fill_viridis_d()` to ensure your group comparisons are accessible to everyone.
