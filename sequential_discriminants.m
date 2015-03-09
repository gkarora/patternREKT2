function [ output_args ] = sequential_discriminants(a,b)
    a_pool = a;
    b_pool = b;
    
%   select 2 random points from a and b
    r = randi([1 length(a)],1,1);
    
    a_point = a_pool(r);
    a_pool(r) = [];
    b_point = b_pool(r);
    b_pool(r) = [];
    
%     more stuff
end



