% SECTION THREE

A = importdata('./BIG DATER/lab2_2.mat');
[ma,Sa] = getMeanCovar(A.al);
[mb,Sb] = getMeanCovar(A.bl);
[mc,Sc] = getMeanCovar(A.cl);


% do a stupid retarded sample covariance method...


