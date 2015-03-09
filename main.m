load('lab2_1.mat');
parametric_gaussian_ml(a,b);

lambda_a = parametric_exponential(a);
lambda_b = parametric_exponential(b);

x = -5:0.1:5;
y_a_ex = exppdf(x, lambda_a);
y_b_ex = exppdf(x, lambda_b);
y_ex = exppdf(x, 1);
%figure(1);
%plot(y_ex);
figure(2);
plot(y_a_ex);

