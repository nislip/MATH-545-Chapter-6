

#==================== Composite trap =============================

fb <- function(x){ 
  return(1/(sqrt(1 + x^3))) # b = 2 a = 1 
}

composite.trap <- function(f, a, b, n, eps){ # eps = 0.00005
  sum1 <- 0 # set initial sum = 0 
  t <- log(2) # True value of integral
  app <- 0 # initially set app = 0 
  num <- 0 # initial starting n 
  
  for (j in 1:n-1){
      if (abs(app - t) > eps){ # epsilon condition 
        h <- (b - a)/j # calc for each j
        xj <- a + j*h
        sum1 <- sum1 + f(xj) 
        app <- (h/2)*(f(a) + 2*sum1 + f(b)) # calc summation
        num <- num + 1 # checking the second n 
      }
    else{
      break
    }
  error <- abs(app - t)
  }
  return()
}


#======================== Composite Simpsons ==========================

composite.simpson <- function(f, a, b, n) {
  if (is.function(f) == FALSE) {
    stop('f must be a function with one parameter (variable)')
  }
  
  t <- log(2)
  h <- (b - a) / n
  xj <- seq.int(a, b, length.out = n + 1)
  xj <- xj[-1]
  xj <- xj[-length(xj)]
  approx <- (h / 3) * (f(a) + 2 * sum(f(xj[seq.int(2, length(xj), 2)])) + 4 * sum(f(xj[seq.int(1, length(xj), 2)])) + f(b))
  error <- abs(approx - t)
  print(c(error, approx), digits = 7)
  
}















