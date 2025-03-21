# Exercises on *renv*

## Exercise - create renv environment

1.  Create a new R-project in RStudio (don't bother to use Git)
2.  Set up a new renv-environment for your project with `renv::init()`
3.  Install the package [*PriceIndices*](https://cran.r-project.org/web/packages/PriceIndices/index.html) using `renv::install()`. 
4.  Create a new R file and use the package *PriceIndices* to access the milk dataset. For example with the following code:

```
library(PriceIndices)
head(milk)
```

5.  Open the *renv.lock* file and check to see if the *PriceIndices* package is listed.
6.  Take a snapshot with `renv::snapshot()`
7.  See if the *PriceIndices* package is there now.
