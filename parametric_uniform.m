function [] = parametric_uniform( a,b )
    x = 0:0.01:9;
    function [est_y] = get_uniform(u)
        min_u = min(u);
        max_u = max(u);
        est_y = unifpdf(x,min_u, max_u);
    end

    act_b = exppdf(x, 1);
    act_a = gaussmf(x,[1 5]);
    est_a = get_uniform(a);
    est_b = get_uniform(b);
    
    figure(301);
    plot(x, act_a, 'g');
    hold on;
    plot(x, est_a, 'r');
    hold off;

    figure(302);
    plot(x, act_b, 'g');
    hold on;
    plot(x, est_b, 'r');
    hold off;

end

