## ----setup, echo = FALSE, message=FALSE, warning=FALSE, results='hide'--------
knitr::opts_chunk$set(
  cache=FALSE,
  comment="#>",
  collapse=TRUE,
  echo=TRUE
)
library(knitr); library(eeptools)

## -----------------------------------------------------------------------------
age_calc(dob = as.Date('1995-01-15'), enddate = as.Date('2003-02-16'),
         units = "years")
age_calc(dob = as.Date('1995-01-15'), enddate = as.Date('2003-02-16'),
         units = "months")
age_calc(dob = as.Date('1995-01-15'), enddate = as.Date('2003-02-16'),
         units = "days")

## -----------------------------------------------------------------------------
x <- data.frame(sid = c(101, 101, 102, 103, 103, 103, 104, 105, 105, 106, 106),
                 grade = c(9, 10, 9, 9, 9, 10, 10, 8, 9, 7, 7))
retained_calc(df = x, sid = "sid", grade = "grade", grade_val = 9)

## -----------------------------------------------------------------------------
df <- data.frame(sid = c(rep(1,3), rep(2,4), 3, rep(4,2)),
                   schid = c(1, 2, 2, 2, 3, 1, 1, 1, 3, 1),
                   enroll_date = as.Date(c('2004-08-26',
                   '2004-10-01', '2005-05-01', '2004-09-01',
                   '2004-11-03', '2005-01-11', '2005-04-02',
                   '2004-09-26', '2004-09-01','2005-02-02'), format='%Y-%m-%d'),
                   exit_date = as.Date(c('2004-08-26', '2005-04-10',
                    '2005-06-15', '2004-11-02', '2005-01-10',
                    '2005-03-01', '2005-06-15', '2005-05-30',
                    NA, '2005-06-15'), format='%Y-%m-%d'))

moves <- moves_calc(df, sid = "sid", schid = "schid", enroll_date = "enroll_date",
                    exit_date = "exit_date")
moves


## ----statamode----------------------------------------------------------------
vecA <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
statamode(vecA, method = "stata")
vecB <- c(1, 1, 1, 3:10)
statamode(vecB, method = "last")
vecC <- c(1, 1, 1, NA, NA, 5:10)
statamode(vecC, method = "last")
vecA <- c(LETTERS[1:10]); vecA <- factor(vecA)
statamode(vecA, method = "last")
vecB <- c("A", "A", "A", LETTERS[3:10]); vecB <- factor(vecB)
statamode(vecB, method = "last")
vecA <- c(LETTERS[1:10])
statamode(vecA, method = "sample")
vecB <- c("A", "A", "A", LETTERS[3:10])
statamode(vecB, method = "stata")
vecC <- c("A", "A", "A", NA, NA, LETTERS[5:10])
statamode(vecC, method = "stata")

## -----------------------------------------------------------------------------
scores <- c(1, 5, 3, 6, "*", 2, 5, "*", "*")
remove_char(scores, "*")

## -----------------------------------------------------------------------------
leading_zero(c(1, 23, 7, 105), digits = 4)

## -----------------------------------------------------------------------------
max_mis(c(7, NA, 3, 2, 0))
max_mis(c(NA, NA, NA, NA))
nth_max(c(1:20, 20:1), n = 2)

## -----------------------------------------------------------------------------
data(stuatt)
isid(stuatt, vars = c("sid"))
isid(stuatt, vars = c("sid", "school_year"))

## -----------------------------------------------------------------------------
set.seed(442)
enrollment <- rpois(100, lambda = 50)
cutoff(enrollment, 0.5)  # elements needed to reach 50% of the total
thresh(enrollment, 10)   # proportion of the total in the 10 largest

## -----------------------------------------------------------------------------
data("stuatt")
head(stuatt)

## -----------------------------------------------------------------------------
data(stulevel)
head(stulevel)


## -----------------------------------------------------------------------------
data("midsch")
head(midsch)


