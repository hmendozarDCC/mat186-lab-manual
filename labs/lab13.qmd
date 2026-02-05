# Lab 13: Statistical Inference for Two Proportions

## Learning Objectives
* Compare the "success rates" or percentages of two independent groups.
* State the Null ($H_0$) and Alternative ($H_a$) hypotheses for differences in proportions.
* Use the `prop.test()` function in R for two-sample comparisons.
* Create a **Stacked Bar Chart** to visualize the relative differences between groups.

---

## Introduction
In Lab 11, we looked at one proportion. In the real world, we usually want to compare two. For example: 
* Does Group A have a higher graduation rate than Group B?
* Is a medicine more effective in the treatment group than the control group?

---

## Part 1: Hypotheses for Two Proportions
We are testing the difference between two population proportions ($p_1 - p_2$).

* **Null Hypothesis ($H_0$):** $p_1 = p_2$ (There is no difference between the groups).
* **Alternative Hypothesis ($H_a$):** $p_1 \neq p_2$ (The groups have significantly different proportions).

---

## Part 2: Visualizing with Stacked Bar Charts
When comparing proportions, a standard bar chart can be misleading if the group sizes are different. We use `position = "fill"` to show the **percentage** (0 to 100%) rather than the raw count.

~~~r
library(tidyverse)

# Comparing 'Success' across two different categories
ggplot(my_data, aes(x = group_variable, fill = success_variable)) +
  geom_bar(position = "fill") +
  labs(title = "Proportional Comparison of Success by Group",
       y = "Proportion (0 to 1)",
       x = "Group Name")
~~~



---

## Part 3: Running the Two-Sample Prop Test
In R, we provide the "successes" and the "totals" as vectors within the `prop.test()` function.

**Scenario:** * **Group 1:** 45 people out of 100 succeeded.
* **Group 2:** 30 people out of 100 succeeded.

~~~r
# x = number of successes in each group
# n = total sample size for each group

results <- prop.test(x = c(45, 30), n = c(100, 100), correct = FALSE)

# View the statistical output
results
~~~



---

## Part 4: Interpreting the Results
* **p-value:** If the p-value is less than 0.05, we conclude the difference is "Statistically Significant."
* **Sample Estimates:** R will show you the individual proportions ($\hat{p}_1$ and $\hat{p}_2$).
* **Confidence Interval:** This interval estimates the true difference between the two population percentages.

---

<div class="dcc-important">
**Lab Task 13:**
1. Open your Quarto document for Lab 13.
2. Choose two groups from your data and a binary "success" outcome (e.g., "Pass/Fail" or "Yes/No").
3. Create a **Stacked Bar Chart** using `position = "fill"`.
4. Run `prop.test()` to compare the two groups.
5. **Conclusion:** State your p-value and write a one-sentence conclusion. "We [reject/fail to reject] the null hypothesis and conclude there is [a/no] significant difference in the proportions."
</div>

---

## Accessibility Tip: Color and Texture
When creating stacked bar charts, rely on more than just color. Using high-contrast palettes like `scale_fill_brewer(palette = "Set1")` helps students with color blindness distinguish between the "Success" and "Failure" sections of your bars.
