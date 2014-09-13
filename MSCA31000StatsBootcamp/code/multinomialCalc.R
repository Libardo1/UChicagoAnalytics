multinomial <- function(totEvents = sum(numEvents), numEvents, probEvents) {
    factorial(sum(totEvents)) * prod((probEvents ^ numEvents)) / prod(factorial(numEvents))
}