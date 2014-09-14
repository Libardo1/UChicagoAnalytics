z <- function(r) {
    0.5 * log((1 + r)/(1 - r))
}

zstderr <- function(N) {
    (N - 3) ^ -.5
}