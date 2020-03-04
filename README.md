
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
automating feature imputation, and automating preprocessing. Automated
feature imputations and preprocessing detection has been implemented to
minimize time and optimize the processing methods used. The functions in
`nurser` were developed to provide useful and informative metrics that
are applicable to a wide array of datasets.

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

| Function  | Input                    | Output                                 | Description                                                                                           |
| --------- | ------------------------ | -------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `eda`     | \- a tibble or dataframe | \- an R dictionary                     | \- Dictionary that contains histogram and summary statistics for each column                          |
| `impute`  | \- a tibble or dataframe | \- a tibble with imputed values        | \- Functionality for automatic imputation detection and user defined imputation method selection      |
| `preproc` | \- a tibble or dataframe | \- a tibble with preprocessed features | \- Functionality for automatic feature preprocessing detection and user defined feature preprocessing |

### R Ecosystem

-----

`nurser` was developed to closely align with:

  - [caret](https://cran.r-project.org/web/packages/caret/index.html)  
  - [tidyverse](https://www.tidyverse.org/)

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
