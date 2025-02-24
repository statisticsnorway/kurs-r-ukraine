# Exercises on *renv*

## Exercise - create renv environment

1.  Create a new R-project in RStudio (don't bother to use Git)
2.  Set up a new renv-environment for your project with `renv::init()`
3.  Install the package *PriceIndices* from CRAN (<https://cran.r-project.org/web/packages/PriceIndices/index.html>)
4.  Create a new R file and use the package *PriceIndices* to access the milk dataset. For example with the following code:

```
library(PriceIndices)
head(milk)
```

5.  Open the *renv.lock* file and check to see if the *PriceIndices* package is listed.
6.  Take a snapshot with `renv::snapshot()`
7.  See if the *PriceIndices* package is there now.
8.  Install the package `ssb-pris` from Github (from the statisticsnorway GitHub organisation)

## Exercise - share renv environments

1.  Clone the renv test repository from Susie's Github: <https://github.com/sjentoft/renv-test-repo.git>
2.  Create a new branch to work on.
3.  Install all required packages with `renv::restore()`
4.  Open and run the run R-file: *test_caret.R*
5.  Install a new package that isn't in the project from before.
6.  Take a snapshot. Check that the new package is in the *renv.lock* file.\
    TIPS: If it isn't in the *renv.lock*, check that you have actually used the package in the project.
7.  (Optional) Commit and push the changes to Github.
