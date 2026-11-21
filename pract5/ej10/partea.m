t = [0.5; 1.0; 1.5; 2.0; 2.5; 3.0; 3.5; 4.0];
y = [6.80; 3.00; 1.50; 0.75; 0.48; 0.25; 0.20; 0.15];
% Iterado inicial
x = [10; -1];

tol = 1e-7;
max_iter = 40;
for k = 1:max_iter
    x1 = x(1);
    x2 = x(2);
    f = x1 * exp(x2 * t);
    A = [exp(x2 * t), x1 * t .* exp(x2 * t)];
    b = y - f;
    d = A \ b;
    x = x + d;

    if norm(d, 2) < tol
        break;
    end
end

fprintf('Parte a)\n');
fprintf('x1 (Gauss-Newton) = %f\n', x(1));
fprintf('x2 (Gauss-Newton) = %f\n', x(2));
