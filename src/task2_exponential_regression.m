% Task 2
% Modified from Example 3 code
% Solves Example 4 using the third-order Newton-type method

clear all;

%
% make data %
N = 200;
bvect = zeros(N,1);
Amat  = zeros(N,2);
for j = 1:N
    Amat(j,1) = 0.2 + ((0.8-0.2)*(j-1)/N);   % t_j in [0.2, 0.8]
    Amat(j,2) = 0.7 - ((0.7-0.3)*(j-1)/N);   % u_j in [0.3, 0.7]
    t = Amat(j,1);
    u = Amat(j,2);
    bvect(j) = exp(sqrt(3)*t) + exp(sqrt(7)*u);   % no noise in Example 4
end

scatter3(Amat(:,1), Amat(:,2), bvect, 10)

%
% Solve the nonlinear system of equations
%
initial = [0.75; 0.25];
NumIter = 10;            % number of iterations
xvect = initial

for iter = 1:NumIter

    x1 = xvect(1);
    x2 = xvect(2);

    sum1 = 0;
    for j = 1:N
        y = bvect(j);  t = Amat(j,1);  u = Amat(j,2);
        a = exp(x1*t); b = exp(x2*u);  r = y - a - b;
        sum1 = sum1 + r*(-a*t);
    end

    sum2 = 0;
    for j = 1:N
        y = bvect(j);  t = Amat(j,1);  u = Amat(j,2);
        a = exp(x1*t); b = exp(x2*u);  r = y - a - b;
        sum2 = sum2 + r*(-b*u);
    end

    Fvect_x = [sum1; sum2];

    sum3 = 0;
    for j = 1:N
        y = bvect(j);  t = Amat(j,1);  u = Amat(j,2);
        a = exp(x1*t); b = exp(x2*u);  r = y - a - b;
        sum3 = sum3 + (a*a*t*t) - (r*a*t*t);
    end

    sum4 = 0;
    for j = 1:N
        t = Amat(j,1);  u = Amat(j,2);
        a = exp(x1*t); b = exp(x2*u);
        sum4 = sum4 + t*u*a*b;
    end

    sum5 = 0;
    for j = 1:N
        y = bvect(j);  t = Amat(j,1);  u = Amat(j,2);
        a = exp(x1*t); b = exp(x2*u);  r = y - a - b;
        sum5 = sum5 + (b*b*u*u) - (r*b*u*u);
    end

    F_prime_x = [sum3 sum4; ...
                 sum4 sum5];

    yvect = xvect - inv(F_prime_x)*Fvect_x;
    y1 = yvect(1);
    y2 = yvect(2);

    sum6 = 0;
    for j = 1:N
        y = bvect(j);  t = Amat(j,1);  u = Amat(j,2);
        a = exp(y1*t); b = exp(y2*u);  r = y - a - b;
        sum6 = sum6 + r*(-a*t);
    end

    sum7 = 0;
    for j = 1:N
        y = bvect(j);  t = Amat(j,1);  u = Amat(j,2);
        a = exp(y1*t); b = exp(y2*u);  r = y - a - b;
        sum7 = sum7 + r*(-b*u);
    end

    Fvect_y = [sum6; sum7];

    zvect = xvect - inv(F_prime_x)*(Fvect_x + Fvect_y);
    xvect = zvect;

    it = num2str(iter);
    message = ['at iteration ', it, ', we have [x, y] ='];
    disp(message)
    disp(round(xvect,10))

    if iter == 2
        iteration2 = xvect;
    end
    if iter == 5
        iteration5 = xvect;
    end
end

disp('Values to write down:')
disp('After iteration 2:')
disp(round(iteration2,10))
disp('After iteration 5:')
disp(round(iteration5,10))
disp('True solution (sqrt(3), sqrt(7)):')
disp(round([sqrt(3); sqrt(7)],10))
disp('Difference between final xvect and true solution:')
disp(round(xvect - [sqrt(3); sqrt(7)],10))
