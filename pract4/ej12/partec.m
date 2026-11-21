% Definicion de las function handles para f(x) y J(x)
f = @(v) [v(1)^2 + v(1)*v(2)^3 - 9; ...
          3*v(1)^2*v(2) - v(2)^3 - 4];

J = @(v) [2*v(1) + v(2)^3,       3*v(1)*v(2)^2; ...
          6*v(1)*v(2),           3*v(1)^2 - 3*v(2)^2];

% Parametros de control
tol = 1e-12;
iter_max = 50;

% Lista de los 4 iterados iniciales obtenidos de la grafica
x0_mat = [ -3.01,   0.17;
           -0.90,  -2.06;
            1.31,   1.76;
            2.97,   0.17 ];

fprintf('=== RESOLUCION DEL SISTEMA POR EL METODO DE NEWTON ===\n\n');

for i = 1:size(x0_mat, 1)
    x0 = x0_mat(i, :)';
    [raiz, k] = newton_sistema(f, J, x0, tol, iter_max);

    fprintf('Raiz %d:\n', i);
    fprintf('  Punto inicial x0 : [%.2f, %.2f]^T\n', x0(1), x0(2));
    fprintf('  Iteraciones (k)  : %d\n', k);
    fprintf('  Solucion x*      : [%.12f, %.12f]^T\n', raiz(1), raiz(2));
    fprintf('  Residuo ||f(x*)||: %.2e\n\n', norm(f(raiz), 2));
end
