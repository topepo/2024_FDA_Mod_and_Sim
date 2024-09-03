ModSimWG Special Seminar: A short introduction to tidymodels

Abstract:

tidymodels is a collection of R packages for statistical and machine learning models that are very powerful while providing important guardrails that prevent unintentional methodological errors by newcomers. I'll demonstrate the ideas behind the software with tools for feature engineering prior to model building for an example data set.

Bio:

Max Kuhn is a software engineer at Posit PBC (née RStudio). He is improving R’s modeling capabilities and maintaining about 30 packages, including caret. He was a Senior Director of Nonclinical Statistics at Pfizer Global R&D in Connecticut. He has applied models in the pharmaceutical and diagnostic industries for over 18 years. Max has a Ph.D. in Biostatistics. He and Kjell Johnson wrote the book Applied Predictive Modeling, which won the Ziegel award from the American Statistical Association, recognizing the best book reviewed in Technometrics in 2015. He has co-written several other books: [Feature Engineering and Selection](https://bookdown.org/max/FES/), [Tidy Models with R](https://www.tmwr.org/), and [Applied Machine Learning for Tabular Data](https://aml4td.org/) (in process).

To prepare, you’ll need to do a few package installs: 

```r
install.packages(c("Cubist", "splines2", "tidymodels", "rules"))
```

At the time of this tutorial, we have been in the process of releasing a lot of packages. It’s alright if you have the previous versions though.
