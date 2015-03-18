%INPUT: a - data points known as class A
%       b - data points known as class B
%OUTPUT: output_args - error
function [ output_args ] = sequential_discriminants_unlimited(a,b)
    % initial state: set the a_pool and b_pool to initial values.
    % REMEMBER: A IS THE INNER THING, B IS THE OUTER THING.
    a_pool = a;
    b_pool = b;
    error=0;
    
    % create plot: plot the data points.
    figure
    scatter(a_pool(:,1), a_pool(:,2), 20, 'r', 'filled')
    hold on
    scatter(b_pool(:,1), b_pool(:,2), 20, 'g', 'filled')



    
    discriminants = [];
    
    should_continue = true;
    run = true; % flag for repeating the algorithm FOREVER
                
    
    
    
    while run
        a_rand_pool = a_pool;
        b_rand_pool = b_pool;
        % exit condition: there are NO B (GREEN) POINTS
        if(length(b_pool) == 0)
           should_continue = false;
           run = false;
           display('DONE')
        end
        
        % this loop is trying linear discriminants until we find one that
        % classifies everything correctly. 
        
        while should_continue
        %   select 2 random points from a and b            
            if(length(a_rand_pool) == 0)
               a_rand_pool = a_pool;
            end
            if(length(b_rand_pool) == 0)
               b_rand_pool = b_pool;
            end
            size(b_rand_pool,1)
            rA = randi([1 size(a_rand_pool,1)],1,1);
            rB = randi([1 size(b_rand_pool,1)],1,1);
            a_point = a_rand_pool(rA,:);
            b_point = b_rand_pool(rB,:);   
            a_rand_pool(rA, :) = [];
            b_rand_pool(rB, :) = [];

            % make grid
            grid_step = 1;
            [xValuesAB, yValuesAB, MED_AB] = makeGrid2(grid_step, a_pool, b_pool);

            AB_means = [a_point;b_point];

            % iterate through grid AB
            for i = 1:size(MED_AB,1)
                for j = 1:size(MED_AB,2)
                    z = [xValuesAB(j) yValuesAB(i)];
                    class = med(AB_means,z);
                    MED_AB(i,j)=class;
                end
            end

            % confusion matrix
            med_AB_conf = zeros(2,2);
            for i = 1:size(a_pool,1)
                z = [a_pool(i,1), a_pool(i,2)];
                class = med(AB_means, z);
                if(class==1)
                    med_AB_conf(1,1) = med_AB_conf(1,1)+1;
                else
                    med_AB_conf(1,2) = med_AB_conf(1,2)+1;
                end
            end
            for i = 1:size(b_pool,1)
                z = [b_pool(i,1), b_pool(i,2)];
                class = med(AB_means, z);
                if(class==2)
                   med_AB_conf(2,2) = med_AB_conf(2,2)+1;
                else
                   med_AB_conf(2,1) = med_AB_conf(2,1)+1;
                end
            end
            med_AB_conf
            
            %med_AB_conf(2,1)==0 || 
            if(med_AB_conf(1,2)==0 || isempty(a_pool)==1)
                should_continue = false;
                
                display('FOUND DISCRIMINANT')
                         
                % graph data
                  contour(xValuesAB, yValuesAB, MED_AB, 1, 'c');

%                 
%                 scatter(a_point(1), a_point(2), 20, 'b', 'filled')
%                 scatter(b_point(1), b_point(2), 20, 'm', 'filled')
% 
%                 hold off
%                 
%                 discriminants{k} = q;

                %remove successfully classified points
            
                b_temp=[];
                if(med_AB_conf(1,2)==0)
                  % remove class B classified as B
                    for i = 1:size(b_pool,1)
                        z = [b_pool(i,1), b_pool(i,2)];
                        class = med(AB_means, z);
                        if(class==1)
                          b_temp  = [b_temp; z];
                        end
                    end
                    b_pool = b_temp;
                    error = med_AB_conf(2,1);
                end
% comment this out to avoid problem we encountered w/ slicing through A.
%                 a_temp = [];
%                 if(med_AB_conf(2,1)==0)
%                   % remove class A classified as A
%                     for i = 1:size(a_pool,1)
%                         z = [a_pool(i,1), a_pool(i,2)];
%                         class = med(AB_means, z);
%                         if(class==2)
%                            a_temp = [a_temp; z];
%                         end
%                     end
%                     a_pool = a_temp;
%                     error = med_AB_conf(1,2);
%                 end   

            end
        end
        should_continue = true;
    
    end
    output_args = error/200;
%     discriminants
 hold off
end



