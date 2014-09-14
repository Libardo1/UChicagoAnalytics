normal <- function(x, mean, variance, p) {
    (1 / sqrt(2 * p * variance)) * exp((-(x - mean)^2)/(2 * variance))
}