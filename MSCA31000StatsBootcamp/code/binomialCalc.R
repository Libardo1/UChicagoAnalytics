binom <- function(N, x, p = .5) {
    (factorial(N) * p^x * (1 - p)^(N - x)) / ((factorial(x) * factorial(N - x)))
}

meanbinom <- function(N, p = .5) {
    N * p
}

variancebinom <- function(N, p = .5) {
    N * p * (1-p)
}

stddevbinom <- function(N, p = .5) {
    sqrt(variancebinom(N,p))
}