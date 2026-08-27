## Submission

This is the first submission of `ggbipart` to CRAN.

The package provides functions to plot bipartite ecological networks
(e.g. plant–animal interaction webs) using `ggplot2`, `network`, and
`igraph` graphics.

## Test environments

* local macOS (aarch64-apple-darwin20), R 4.5.3
* win-builder (via `devtools::check_win_devel()`), R-devel
* win-builder (via `devtools::check_win_release()`), R release
* R-hub v2 (GitHub Actions, `rhub::rhub_check()`):
    - linux    (Ubuntu, R-devel)
    - windows  (R-devel)
    - macos    (R-devel)
* GitHub Actions `r-lib/actions/check-r-package`:
    - ubuntu-latest  (R release, R-devel, R oldrel-1)
    - macos-latest   (R release)
    - windows-latest (R release)

<!--
Before submitting, run the checks above and REPLACE this block with the
actual results (URLs to the R-hub / GitHub Actions runs, and the win-builder
result emails). Confirm each returned 0 errors, 0 warnings, and only the
expected "New submission" NOTE. Delete any environment you did not run.
-->

## R CMD check results

`R CMD check --as-cran` produced 0 errors and 0 warnings on the local build
(R 4.5.3, macOS). Examples, tests (testthat 3e), and the vignette all run and
re-build cleanly.

There was 1 NOTE:

* checking CRAN incoming feasibility ... NOTE
  Maintainer: 'Pedro Jordano <jordano@ebd.csic.es>'
  New submission

  This is expected for a first-time submission.

## Downstream dependencies

There are currently no downstream dependencies for this package.
