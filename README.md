## Old Projects: Statistical Inference and Regression in R

This repository contains archived coursework projects originally completed in **2017** as part of the Johns Hopkins *Data Science Specialization (Coursera)*.  
These early exercises illustrate foundational concepts in **simulation, inference, and regression** using the R programming language.  
They are preserved for reference but are **not part of my current professional data science portfolio**.

---

## Contents

### 1. Statistical Inference, Part I — Simulation

**Focus:** Demonstrating the **Law of Large Numbers (LLN)** and the **Central Limit Theorem (CLT)** through simulation.  
**Summary:**  
- Simulates 1,000 exponential samples (`lambda = 0.2`, `n = 40`) to show convergence of sample means.  
- Compares theoretical vs. observed means and variances.  
- Illustrates that sample means of non-normal data approach normality as *n* increases.  
- Reinforces that both the mean and variance of simulated samples are consistent with theoretical expectations.  

**Concepts:** simulation, sampling distributions, normal approximation, consistency  

---

### 2. Statistical Inference, Part II — Inferential Data Analysis

**Focus:** Using *t*-tests for hypothesis testing on small samples.  
**Dataset:** `ToothGrowth` (R’s built-in dataset).  
**Summary:**  
- Tests whether tooth growth depends on supplement type (`OJ` vs `VC`) and dosage level (`0.5`, `1`, `2`).  
- Applies two-sample *t*-tests and interprets p-values and confidence intervals.  
- Finds that tooth length increases with dose, but supplement effects depend on dosage.  
- Demonstrates the logic of using the *t*-distribution to account for small-sample uncertainty.  

**Concepts:** hypothesis testing, *t*-tests, confidence intervals, small-sample inference  

---

### 3. Cars: MPG vs. Transmission Type

**Focus:** Bivariate and multivariate analysis using **linear regression**.  
**Dataset:** `mtcars` (Motor Trend, 1974).  
**Summary:**  
- Tests whether cars with manual transmissions achieve higher MPG than automatics.  
- Uses *t*-tests and OLS regression to evaluate the relationship while controlling for confounders (e.g., weight, horsepower, cylinders).  
- Finds that while manual cars appear more fuel-efficient in bivariate analysis, the transmission effect disappears once controls are added.  
- Includes model selection (`step()`), residual diagnostics, and discussion of statistical power.  

**Concepts:** regression modeling, confounding, model selection, residual analysis  

---

## Tools and Environment

- **Language:** R  
- **Core Packages:** `datasets`, `knitr`, `stats`, base R plotting  
- **Outputs:** `.Rmd`, `.html`, `.pdf`  
- **Originally completed:** September–October 2017  

---

## Author

**Samuel Shaw, PhD**  
Sociologist & Data Scientist  
Seattle, WA  
[LinkedIn](https://www.linkedin.com/in/samuelshawphd)

---

> *Note:* These files are maintained here as part of an “old projects” archive for completeness and documentation of early R-based statistical work. They are intentionally excluded from my active [portfolio repository](https://github.com/SammyShaw).
