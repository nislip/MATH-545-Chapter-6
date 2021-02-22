# Trapezoidal rule 

#------------------- # Defining functions to integrate

#-------------------------------------------
fc <- function(x){
  return(1/x) 
}

fd <- function(x){
  return(exp(-x))  
}

fe <- function(x){
  return(1/(1+x^2))  
}

ff <- function(x){
  return(atan(x)) 
}

# (Regular) Trapezoidal Rule ----------------
# Degree n, step size h = b - a

its_a_Trap <- function(f, a, b){
  h <- b - a # Bounds for to integrate 
  d_dx <- (h / 2)*((f(a) + f(b))) 
  return(d_dx)
}

# (Regular) Simpsons Rule -------------------
# Degree n = 2, step size h = (b - a)/2

homer <- function(f, a, b){ # Function inputs are 
  h <- (b - a)/2
  x0 <- a # a + 0*h
  x1 <- a + h # a + 1*h 
  x2 <- a + 2*h # a + 2*h
  d_dx <- (h /3)*((f(x0) + 4*f(x1) + f(x2))) # Put it all together
  return(d_dx) # return the approximation 
}

#--------------------------------------------




