function [ output_args ] = nonparametric_parzen_window( a,b )
x = 0:0.1:10;

k = 5;
h_a = k/sqrt(length(a));
h_b = k/sqrt(length(b));

b_actual_lambda = 1;
a_actual_mean = 5;
a_actual_sigma = 1;

s_deviation_1 = 0.1;
s_deviation_2 = 0.4;

a_1 = zeros(1,101);
a_2 = zeros(1,101);
b_1 = zeros(1,101);
b_2 = zeros(1,101);

for i = 1:length(a)
    a_1 = a_1 + (1/length(a))*normpdf(x, a(i), s_deviation_1);
    a_2 = a_2 + (1/length(a))*normpdf(x, a(i), s_deviation_2);
end

for i = 1:length(a)
    b_1 = b_1 + (1/length(b))*normpdf(x, b(i), s_deviation_1);
    b_2 = b_2 + (1/length(b))*normpdf(x, b(i), s_deviation_2);
end


a_real = normpdf(x, a_actual_mean, a_actual_sigma);
figure(401)
plot(x,a_real,'g');
hold on;
plot(x,a_1,'r');
xlabel('x');
ylabel('p(x)');
title('Non-Parametric Gaussian Window (S = 0.1) Estimation: p(x) Real vs. Sample for dataset A');
legend('real', 'sample');
hold off;

a_real = normpdf(x, a_actual_mean, a_actual_sigma);
figure(402)
plot(x,a_real,'g');
hold on;
plot(x,a_2,'r');
xlabel('x');
ylabel('p(x)');
title('Non-Parametric Gaussian Window (S = 0.4) Estimation: p(x) Real vs. Sample for dataset A');
legend('real', 'sample');
hold off;

b_real = b_actual_lambda*exp(-1*b_actual_lambda*x);
figure(403)
plot(x,b_real,'g');
hold on;
plot(x,b_1,'r');
xlabel('x');
ylabel('p(x)');
title('Non-Parametric Gaussian Window (S = 0.1) Estimation: p(x) Real vs. Sample for dataset B');
legend('real', 'sample');
hold off;

figure(404)
plot(x,b_real,'g');
hold on;
plot(x,b_2,'r');
xlabel('x');
ylabel('p(x)');
title('Non-Parametric Gaussian Window (S = 0.4) Estimation: p(x) Real vs. Sample for dataset B');
legend('real', 'sample');
hold off;

end