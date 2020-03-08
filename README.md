
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `nurser`

<!-- badges: start -->

<!-- badges: end -->

An R package for streamlining the front end of the machine learning
workflow.

### Summary

-----

Common to the front end of most machine learning pipelines is an
exploratory data analysis (EDA) and feature preprocessing. EDA’s
facilitate a better understanding of the data being analyzed and allows
for a targeted and more robust model development while feature
imputation and preprocessing is a requirement for many machine learning
alogirthms. `nurser` aims to streamline the front end of the machine
learning pipeline by generating descriptive summary tables and figures,
various feature imputation summaries, and automating preprocessing.
Automated preprocessing detection has been implemented to minimize time
and optimize the processing methods used. The functions in `nurser` were
developed to provide useful and informative metrics that are applicable
to a wide array of datasets.

*`nurser` was developed as part of DSCI 524 of the MDS program at UBC.*

### Installation:

-----

You can install the released version of nurser from CRAN with:

    install.packages("nurser")

The development version can be downloaded from
[GitHub](https://github.com/UBC-MDS/nurser) with:

    # install.packages("devtools")
    devtools::install_github("UBC-MDS/nurser")

### Features

-----

The package includes the following three
functions:

| Function         | Input                    | Output                                                                        | Description                                                                                           |
| ---------------- | ------------------------ | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `eda`            | \- a tibble or dataframe | \- an R dictionary                                                            | \- Dictionary that contains histogram and summary statistics for each column                          |
| `impute_summary` | \- a dataframe           | \- a list with summary statistics and outputs of different imputation methods | \- Functionality for consolidating several imputation methods                                         |
| `preproc`        | \- a tibble or dataframe | \- a tibble with preprocessed features                                        | \- Functionality for automatic feature preprocessing detection and user defined feature preprocessing |

### R Ecosystem

-----

`nurser` was developed to align with:

  - [tidyverse](https://www.tidyverse.org/)

The `impute_summary` function leveraged the imputation methods found in
the following
    packages:

  - [Hmisc](https://cran.r-project.org/web/packages/Hmisc/index.html)  
  - [mi](https://cran.r-project.org/web/packages/mi/index.html)  
  - [mice](https://cran.r-project.org/web/packages/mice/index.html)  
  - [missForest](https://cran.r-project.org/web/packages/missForest/index.html)

However, the functions herein streamline and automate the front-end
machine learning pipeline for use with any machine learning package.

### Dependencies

-----

  - testhat=2.3.2
  - fastDummies=1.6.0
  - dplyr=0.8.4
  - tidyverse=1.3.0

### Usage

-----

``` r
#library(nurser)
## basic example code
```

### Documentation

-----
