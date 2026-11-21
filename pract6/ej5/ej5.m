% Script para resolver el Ejercicio 5 (b) mediante Newton-Raphson 4D

% 1. Momentos exactos mu_k = integral de x^k * exp(x) de -1 a 1
mu0 = exp(1) - exp(-1);
mu1 = 2 * exp(-1);
mu2 = exp(1) - 5 * exp(-1);
mu3 = 16 * exp(-1) - 2 * exp(1);

mu = [mu0; mu1; mu2; mu3];

% 2. Definición del sistema F(z) y su Jacobiano J_F(z)
% z = [x1; x2; w1; w2]
F = @(z) [ z(3) + z(4) - mu(1); ...
           z(3)*z(1) + z(4)*z(2) - mu(2); ...
           z(3)*z(1)^2 + z(4)*z(2)^2 - mu(3); ...
           z(3)*z(1)^3 + z(4)*z(2)^3 - mu(4) ];

J = @(z) [ 0,                     0,                     1,       1; ...
           z(3),                  z(4),                  z(1),    z(2); ...
           2*z(3)*z(1),           2*z(4)*z(2),           z(1)^2,  z(2)^2; ...
           3*z(3)*z(1)^2,         3*z(4)*z(2)^2,         z(1)^3,  z(2)^3 ];

% 3. Valor inicial razonable z0 = [x1, x2, w1, w2]^T
% Escogemos nodos separados dentro de (-1, 1) y pesos positivos
z0 = [-0.5; 0.5; 1.0; 1.0];

tol = 1e-12;
max_iter = 50;

z = z0;
fprintf('=== RESOLUCION CON NEWTON-RAPHSON 4D ===\n\n');
fprintf('%-5s %-14s %-14s %-14s %-14s %-12s\n', 'k', 'x1', 'x2', 'w1', 'w2', '||F(z)||_2');
fprintf('-----------------------------------------------------------------------------------\n');

for k = 0:max_iter
    F_val = F(z);
    norm_F = norm(F_val, 2);

    fprintf('%-5d %-14.8f %-14.8f %-14.8f %-14.8f %-12.2e\n', k, z(1), z(2), z(3), z(4), norm_F);

    if norm_F < tol
        break;
    end

    J_val = J(z);
    dz = J_val \ (-F_val); % Paso de Newton
    z = z + dz;
end

fprintf('\nSolución hallada (Nodos y Pesos de la cuadratura):\n');
fprintf('  Nodo x1  = %16.12f\n', z(1));
fprintf('  Nodo x2  = %16.12f\n', z(2));
fprintf('  Peso w1  = %16.12f\n', z(3));
fprintf('  Peso w2  = %16.12f\n', z(4));
