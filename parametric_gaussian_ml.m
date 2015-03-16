function [] = parametric_gaussian_ml(a,b)
b_actual_lambda = 1;
a_actual_mean = 5;
a_actual_sigma = 1;

a_sample_mean = mean(a);
b_sample_mean = mean(b);

a_sample_var = 0;
b_sample_var = 0;

for i = 1:length(a)
    a_sample_var = a_sample_var + ((a(i)-a_sample_mean)^2)/length(a);
end

for i = 1:length(b)
    b_sample_var = b_sample_var + ((b(i)-b_sample_mean)^2)/length(b);
end

% p(x) real and sample for a
x = 2:0.1:10;
y_real = normpdf(x,a_actual_mean,a_actual_sigma);
y_sample = normpdf(x, a_sample_mean, sqrt(a_sample_var));
figure(101)
plot(x,y_real,'g');
hold on;
plot(x,y_sample,'r');
xlabel('x');
ylabel('p(x)');
title('Parametric-Gaussian Estimation: p(x) Real vs. Sample for dataset A');
legend('real', 'sample');
hold off;

% p(x) real and sample for b
x = 2:0.1:10;
y_real = b_actual_lambda*exp(-1*b_actual_lambda*x);
y_sample = normpdf(x, b_sample_mean , sqrt(b_sample_var));
figure(102)
plot(x,y_real,'g');
hold on;
plot(x,y_sample,'r');
xlabel('x');
ylabel('p(x)');
title('Parametric-Gaussian Estimation: p(x) Real vs. Sample for dataset B');
legend('real', 'sample');
hold off;

end
