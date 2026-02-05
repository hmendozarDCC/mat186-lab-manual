# Lab 9: Probability and Sampling Distributions

## Learning Objectives
* Distinguish between **Discrete** and **Continuous** probability distributions.
* Visualize the **Normal Distribution** (the "Bell Curve").
* Demonstrate the **Central Limit Theorem** through simulation.
* Understand how sample size affects the "Standard Error."

---

## Part 1: The Normal Distribution
In nature and data science, many variables (like heights or exam scores) follow a "Normal" distribution. We can use R to visualize the perfect mathematical curve and compare it to our real data.

~~~r
library(tidyverse)

# Generating a theoretical normal distribution
data.frame(x = c(-4, 4)) |>
  ggplot(aes(x)) +
  stat_function(fun = dnorm, color = "blue", size = 1) +
  labs(title = "The Standard Normal Distribution (z-distribution)",
       subtitle = "Mean = 0, SD = 1",
       x = "Standard Deviations", y = "Density")
~~~



[Image of a standard normal distribution curve with percentages for 68, 95, and 99.7 rules]


---

## Part 2: Working with the Binomial Distribution
When we have "Yes/No" outcomes (like a coin flip or a student passing a test), we use the **Binomial Distribution**.

~~~r
# Simulating 100 people flipping a coin 10 times each
flips <- rbinom(n = 100, size = 10, prob = 0.5)

ggplot(data.frame(flips), aes(x = flips)) +
  geom_bar(fill = "darkorange", color = "white") +
  labs(title = "Binomial Distribution of Coin Flips",
       x = "Number of Heads", y = "Frequency")
~~~

---

## Part 3: The Central Limit Theorem (CLT)
The CLT is the "Magic" of statistics. It states that if you take enough samples, the **distribution of the sample means** will always look normal, even if the original data is messy or skewed.

### Let's Simulate the CLT:
~~~r
# 1. Take 1000 samples of size 30 from a random population
samples <- replicate(1000, mean(rexp(30, rate = 0.5)))

# 2. Visualize the results
ggplot(data.frame(samples), aes(x = samples)) +
  geom_histogram(fill = "seagreen", color = "white") +
  labs(title = "Sampling Distribution of the Mean",
       subtitle = "Notice the bell shape! This is the Central Limit Theorem in action.",
       x = "Sample Means", y = "Count")
~~~



---

## Part 4: Probability in Your Data
We can use the `pnorm()` function to calculate the probability of a specific event occurring.

**Example:** If the average height of a character is 170cm with an SD of 10, what is the probability of a character being taller than 190cm?
~~~r
# 1 - pnorm gives the 'right tail' (the probability of being GREATER than)
1 - pnorm(190, mean = 170, sd = 10)
~~~

---

<div class="dcc-important">
**Lab Task 9:**
1. Create a new Quarto document titled "Lab 9: Probability."
2. Create a histogram of a variable from your own dataset. Does it look "Normal"?
3. Use `mean()` and `sd()` to find the center and spread of that variable.
4. **The Simulation:** Use the "CLT simulation" code above, but change the sample size from `30` to `5`. Render it. Then change it to `100` and render it again.
5. **Observation:** Write 2 sentences explaining how the "spread" of the histogram changed when you increased the sample size.
</div>
