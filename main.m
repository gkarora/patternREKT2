load('./BIG DATER/lab2_1.mat');
% parametric_gaussian_ml(a,b);
% parametric_exponential(a,b);
% parametric_uniform(a,b); 
 nonparametric_parzen_window(a,b);

%load('./BIG DATER/lab2_2.mat');

load('./BIG DATER/lab2_3.mat');
error = sequential_discriminants(a,b,3);

error = [];
sequences = [];

for i = 1:5
    errors = [];
    for j = 1:1 %should be 20
        errors = [errors sequential_discriminants(a,b,i)];
    end
    errors
    min_errors = min(errors);
    max_errors = max(errors);
    avg_errors = mean(errors);
    std_errors = std(errors);
    i_sequence = [i min_errors max_errors avg_errors std_errors];
    sequences = [sequences; i_sequence]
end

sequences
csvwrite('sequential_discriminants.csv',sequences);
