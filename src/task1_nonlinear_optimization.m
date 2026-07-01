% Task 1
% Modified from Example 1 code
% Solves Example 2 using the third-order Newton-type method

clear all;

initial = [-1; 1; -1];
xvect = initial

for iter = 1:10

 x1 = xvect(1);
 x2 = xvect(2);
 x3 = xvect(3);

 Fvect_x = [4*(x1-1)^3 + 6*(x1-x2)^5 + 6*(x1-x3)^5; ...
 4*(x2-3)^3 - 6*(x1-x2)^5 + 6*(x2-x3)^5; ...
 4*(x3-5)^3 - 6*(x2-x3)^5 - 6*(x1-x3)^5];

 F_prime_x = [ ...
 12*(x1-1)^2 + 30*(x1-x2)^4 + 30*(x1-x3)^4, -30*(x1-x2)^4, -30*(x1-x3)^4; ...
 -30*(x1-x2)^4, 12*(x2-3)^2 + 30*(x1-x2)^4 + 30*(x2-x3)^4, -30*(x2-x3)^4; ...
 -30*(x1-x3)^4, -30*(x2-x3)^4, 12*(x3-5)^2 + 30*(x2-x3)^4 + 30*(x1-x3)^4];

 yvect = xvect - inv(F_prime_x)*Fvect_x ;

 y1 = yvect(1);
 y2 = yvect(2);
 y3 = yvect(3);

 Fvect_y = [4*(y1-1)^3 + 6*(y1-y2)^5 + 6*(y1-y3)^5; ...
 4*(y2-3)^3 - 6*(y1-y2)^5 + 6*(y2-y3)^5; ...
 4*(y3-5)^3 - 6*(y2-y3)^5 - 6*(y1-y3)^5];

 xvect = xvect - inv(F_prime_x)*( Fvect_x + Fvect_y );

 it = num2str(iter);
 message = ['at iteration ', it, ', we have [x, y, z] ='];
 disp(message)
 disp(round(xvect,10))

end
