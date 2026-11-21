z = log(y);
A_b = [ones(size(t)), t];
beta = (A_b' * A_b) \ (A_b' * z);
x1_b = exp(beta(1));
x2_b = beta(2);

fprintf('Parte b)\n');
fprintf('log(x1) = %f  =>  x1 = %f\n', beta(1), x1_b);
fprintf('x2 = %f\n', x2_b);
