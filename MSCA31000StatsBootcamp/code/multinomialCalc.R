multinomial <- function(numEvents, probEvents, totEvents = sum(numEvents)) {
    factorial(sum(totEvents)) * prod((probEvents ^ numEvents)) / prod(factorial(numEvents))
}