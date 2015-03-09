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
y_real = gaussmf(x,[a_actual_sigma a_actual_mean]);
y_sample = gaussmf(x,[sqrt(a_sample_var) a_sample_mean]);

figure(101)
plot(x,y_real,'g');
hold on;
plot(x,y_sample,'r');
xlabel('x');
ylabel('p(x)');
hold off;

% p(x) real and sample for b
x = 2:0.1:10;
y_real = b_actual_lambda*exp(b_actual_lambda*x);
y_sample = gaussmf(x,[sqrt(b_sample_var) b_sample_mean]);

figure(102)
plot(x,y_real,'g');
hold on;
plot(x,y_sample,'r');
xlabel('x');
ylabel('p(x)');
hold off;

end
