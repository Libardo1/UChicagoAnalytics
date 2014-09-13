poisson <- function(mean, x) {
    (exp(-mean) * (mean^x)) / factorial(x)
}