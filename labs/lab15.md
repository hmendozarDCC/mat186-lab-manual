# Lab 15: Non-parametric Methods for Hypothesis Testing

## Learning Objectives
* Identify when to use **Non-parametric** tests instead of Parametric tests.
* Conduct a **Wilcoxon Rank-Sum Test** (Mann-Whitney U).
* Conduct a **Wilcoxon Signed-Rank Test** for paired data.
* Understand how "Ranking" data removes the influence of extreme outliers.

---

## Part 1: Parametric vs. Non-parametric
"Parametric" tests (like the t-test) assume your data follows a specific distribution (the Normal Distribution). **Non-parametric** tests make no such assumption. They are often called "Distribution-Free" tests.

### Use a Non-parametric test if:
1. Your sample size is very small (n < 30).
2. Your data is heavily skewed and cannot be fixed.
3. You have major outliers that you cannot remove.
4. Your data is **Ordinal** (e.g., Likert scales: "Satisfied", "Neutral", "Dissatisfied").

---

## Part 2: The Wilcoxon Rank-Sum Test
This is the non-parametric alternative to the **Independent Samples t-test** (Lab 12). Instead of comparing means, it compares the **medians** by ranking all the data points from smallest to largest.



**Scenario:** Are the "Mass" values of Droids and Humans different? (Mass is often heavily skewed by outliers like Jabba the Hutt).

~~~r
library(tidyverse)

# Filtering data
comparison_data <- starwars |> 
  filter(species %in% c("Human", "Droid")) |>
  drop_na(mass)

# Running the Wilcoxon Rank-Sum Test
wilcox.test(mass ~ species, data = comparison_data)
~~~

---

## Part 3: The Wilcoxon Signed-Rank Test
This is the non-parametric alternative to the **Paired t-test**. Use this when you have "Before" and "After" measurements on the same subjects, but the differences are not normally distributed.

~~~r
# Example syntax for paired data
# wilcox.test(before_scores, after_scores, paired = TRUE)
~~~

---

## Part 4: The Trade-off
While non-parametric tests are safer for "messy" data, they are slightly **less powerful** than parametric tests when the data *is* actually normal. This means they are less likely to find a significant difference if one actually exists. 



---

<div class="dcc-important">
**Lab Task 15:**
1. Pick a numeric variable from your dataset that looks very skewed (not bell-shaped).
2. Create a **Boxplot** of this variable grouped by a category.
3. Run a `wilcox.test()` to compare the two groups.
4. Run a standard `t.test()` on the **same data**.
5. **Compare:** In your Quarto document, compare the p-values. Are they similar? Which test do you trust more for this specific data, and why?
</div>

---

## Pro-Tip: When in Doubt, Rank it Out
If you are presenting data to a stakeholder and you are worried about one or two "crazy" outliers ruining your average, the Wilcoxon test is your best friend. It treats the outlier as just "the highest rank," preventing it from pulling the results in its direction.
