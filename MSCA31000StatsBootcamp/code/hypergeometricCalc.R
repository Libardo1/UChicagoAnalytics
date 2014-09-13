hypergeometric <- function(k,x,N, n) {
    choose(k, x) * choose(N-k, n-x) / choose(N, n)
}