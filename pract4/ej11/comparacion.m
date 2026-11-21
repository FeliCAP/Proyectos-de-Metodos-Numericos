%Script para ejecutar pruebas
x0 = 1.2; %Valor inicial fijo para x0
tol = 1e-10; %Tolerancia elegida
alphas = [0, 1, 1.5, 2];

fprintf('x0 = %f | Tolerancia = %e\n\n', x0, tol);

for i = 1:length(alphas)
    alpha0 = alphas(i);
    [x, alpha, k] = ejercicio11(x0, alpha0, tol);
    x_sol = x(end);
    alpha_sol = alpha(end);
    fprintf('alpha0 = %f  |  Iteraciones: %d  |  x* = %f  |  alpha* = %f\n', alpha0, k, x_sol, alpha_sol);
end

fprintf('\nComparación con la parte b) (x_k+1 = exp(x_k/4))\n');
x_b = 1.5;
k_b = 0;
while true
    k_b = k_b + 1;
    x_sig = exp(x_b/4);
    if abs(x_sig - x_b) < tol
        break;
    end
    x_b = x_sig;
end
fprintf('Iteraciones: %d  |  x* = %f\n', k_b, x_sig);
