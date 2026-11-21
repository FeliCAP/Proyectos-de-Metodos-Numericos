% Definicion del sistema f(x) y su Jacobiano J(x)
f = @(v) [ v(3)^2 + 10*v(2)^2 - 100*v(1) - 23*v(2) - 14; ...
           10*v(1)*v(2) + 10*v(2)*v(3) - 20*v(1) - 40*v(2) - v(3) + 8; ...
           10*v(2)^2 + 10*v(3)^2 + v(1) - 23*v(2) - 50*v(3) + 24 ];

J = @(v) [ -100,                  20*v(2) - 23,              2*v(3); ...
            10*v(2) - 20,         10*v(1) + 10*v(3) - 40,    10*v(2) - 1; ...
             1,                   20*v(2) - 23,              20*v(3) - 50 ];

tol = 1e-12;
max_iter = 50;

% Lista de puntos iniciales para analizar el comportamiento
puntos_x0 = [
    -0.207961,  0.295482,  0.339919;  % x0 de la parte a)
     0.000000,  0.000000,  0.000000;  % Origen
     1.000000,  1.000000,  1.000000;  % Punto alejado 1
    -2.000000, -2.000000, -2.000000   % Punto alejado 2
];

fprintf('=== ESTUDIO DEL METODO DE NEWTON (PARTE C) ===\n\n');

for i = 1:size(puntos_x0, 1)
    x0 = puntos_x0(i, :)';
    [raiz, k] = newton_sistema(f, J, x0, tol, max_iter);

    fprintf('Prueba %d - x0 = [%.2f, %.2f, %.2f]^T\n', i, x0(1), x0(2), x0(3));
    fprintf('  Iteraciones : %d\n', k);
    fprintf('  Solucion    : [%.12f, %.12f, %.12f]^T\n', raiz(1), raiz(2), raiz(3));
    fprintf('  Residuo     : %.2e\n\n', norm(f(raiz), 2));
end
