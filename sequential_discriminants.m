function [ output_args ] = sequential_discriminants(a,b)
    a_pool = a;
    b_pool = b;
    
    should_continue = true;
    
    for j = 1:3
        while should_continue

        %   select 2 random points from a and b
            r = randi([1 length(a_pool)],1,1);

            a_point = a_pool(r);
            a_pool(r) = [];
            b_point = b_pool(r);
            b_pool(r) = [];

            grid_step = 1;
            [xValuesAB, yValuesAB, MED_AB] = makeGrid2(grid_step, a, b);

            AB_means = [a_point;b_point];

            % iterate through grid AB
            for i = 1:size(MED_AB,1)
                for j = 1:size(MED_AB,2)
                    z = [xValuesAB(j) yValuesAB(i)];
                    class = med(AB_means,z);
                    MED_AB(i,j)=class;
                end
            end

            med_AB_conf = zeros(2,2);
            %MED (1, 2, 3 metric)
            for i = 1:size(a,1)
                z = [a(i,1), a(i,2)];
                class = med(AB_means, z);
                if(class==1)
                    med_AB_conf(1,1) = med_AB_conf(1,1)+1;
                else
                    med_AB_conf(1,2) = med_AB_conf(1,2)+1;
                end
            end
            for i = 1:size(b,1)
                z = [b(i,1), b(i,2)];
                class = med(AB_means, z);
                if(class==1)
                    med_AB_conf(2,1) = med_AB_conf(2,1)+1;
                else
                    med_AB_conf(2,2) = med_AB_conf(2,2)+1;
                end
            end

            figure(2)
            scatter(a(:,1), a(:,2), 20, 'r', 'filled')
            hold on
            scatter(b(:,1), b(:,2), 20, 'g', 'filled')
            contour(xValuesAB, yValuesAB, MED_AB, 1, 'r');
            legend('A','B','Decision Boundary');
            hold off

            med_AB_conf
            if(isempty(a_pool)==1 || (med_AB_conf(1,1)==0 && med_AB_conf(2,2)==0))
               should_continue = false
            end
        end
    end
end



