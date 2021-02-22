% Repeated Richardson Extrapolation (Nate Islip, MATH 545)
% First Draft
%-------------------------------------------------------------------------------
h = [1;0.5;0.25;0.125]; % step size vector factor of 1/2
b = [1;2;4;8];
p = [1:1:n]; % based off o(h), o(h^2), and different steps 
x0 = 2
%-------------------------------------------------------------------------------
n = length(h); % length of h for iteration 
Dtable = zeros(n,n); % populate matrix with values generated for o(h^pn) 

output_precision(10)

for i=1:n % Populating the first column
  Dtable(i,1) = (log(x0 + h(i)) - log(x0))/h(i) % WORKS
  for i=2:n % Populating the second column
    Dtable(i,2) = ((b(i)*p(i))*(Dtable(i+1) - Dtable(i-1)))/((b(i)^p(i)) - 1)  % WORKS 
    for i=3:n % Populating the jth column 
      Dtable(i,3) = ((b(i)*p(i))*(Dtable(i+1) - Dtable(i-1)))/((b(i)^p(i)) - 1) % WORKS 
      for i=4:n 
        Dtable(i,4) = ((b(i)*p(i))*(Dtable(i+1) - Dtable(i-1)))/((b(i)^p(i)) - 1)
      endfor
    endfor
  endfor
endfor
%-------------------------------------------------------------------------------
Dta