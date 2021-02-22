% Inputs 
format long
eps_step = 0.0000005;
N = 3;
R = zeros( N + 1, N + 1 );
E = zeros( N + 1, N + 1 );
a = 0; % e^x [0,2]
b = 2; % P.15 [0,1]
h = b - a;
R(0 + 1, 0 + 1) = 0.5 * ( exp(a) + exp(b) ) * h;

% R(0 + 1, 0 + 1) = 0.5*(1/sqrt(1 + (a)^4) + 1/sqrt(1 + (b)^4))*h;
% Outputs matrices R(estimation) and E(error)

for i = 1:N
    h = h/2;
    
    % Problem 15 
    % This calculates the trapezoidal rule with intervals of width h
    % R( i + 1, 1 ) = 0.5*((1/sqrt(1 + (a)^2)) + 2*sum(1./sqrt(1 + ((a + h):h:(b - h)).^4)) + (1/sqrt(1 + (b)^4)))*h;
    
    R( i + 1, 1) =  0.5 * ( exp(a) + 2 * sum(exp(((a + h):h:(b - h)))) +  exp(b) ) * h; 
    
    E(i+1,1)=R(i+1,1)- (exp(1)^2 - 1); % Problem 5 % e^2 -1 
    
    for j = 1:i
        R(i + 1, j + 1) = (4^j*R(i + 1, j) - R(i, j))/(4^j - 1);
        E(i+1,j+1)= abs( R(i+1,j+1)- (exp(1)^2 - 1)); 
    end
    
    E(1,1) = abs(R(1,1) - (exp(1)^2 - 1)); % Compute error for E(1,1)

    if abs( R(i + 1, i + 1) - R(i, i) ) < eps_step % Stopping condition
       break;
    elseif i == N + 1
       error( 'Romberg integration did not converge' );
    end
end
% Output precision for problem 5, equivilent to book
output_precision(8)
R( i + 1, i + 1 );
abs( R(i + 1, i + 1) - R(i, i) )