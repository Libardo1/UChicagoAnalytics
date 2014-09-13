binom <- function(p = .5, N, x) {
    (factorial(N) * p^x * (1 - p)^(N - x)) / ((factorial(x) * factorial(N - x)))
}

meanbinom <- function(p = .5, N) {
    N * p
}

variancebinom <- function(p = .5, N) {
    N * p * (1-p)
}

stddevbinom <- function(p = .5, N) {
    sqrt(variancebinom(p,N))
}