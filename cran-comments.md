## Test environments
* local OS X install, R 3.3.3
* ubuntu 12.04 (on travis-ci), R 3.3.3
* win-builder (devel and release)

## R CMD check results

This is from a devtools check:
R CMD check results
0 errors | 0 warnings | 0 notes

## CRAN check notes:
The CRAN check returns this:
** running examples for arch 'i386' ... [39s] NOTE
Examples with CPU or elapsed time > 10s
            user system elapsed
riscoBrasil 12.2   0.15   36.09
** running examples for arch 'x64' ... [48s] NOTE
Examples with CPU or elapsed time > 10s
             user system elapsed
riscoBrasil 20.35   0.04   45.39

This is because the data are downloaded and the delays are due to this. 

* Possibly mis-spelled words in DESCRIPTION:
  IBGE (7:147)

This is not misspelt. 

* Found the following (possibly) invalid URLs:
  URL: 
    From: README.md
    Message: Empty URL

This is due to the CRAN badge in the README. 

## Reverse dependencies

This is a new release, so there are no reverse dependencies.
