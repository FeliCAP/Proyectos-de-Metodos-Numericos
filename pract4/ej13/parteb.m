% 1. Definición del sistema no lineal f(x) como function handle
f = @(v) [ v(3)^2 + 10*v(2)^2 - 100*v(1) - 23*v(2) - 14; ...
           10*v(1)*v(2) + 10*v(2)*v(3) - 20*v(1) - 40*v(2) - v(3) + 8; ...
           10*v(2)^2 + 10*v(3)^2 + v(1) - 23*v(2) - 50*v(3) + 24 ];

% 2. Vector de iterado inicial x0 obtenido en la parte a)
x0 = [-0.207961; 0.295482; 0.339919];

% 3. Configuración de opciones para fsolve (tolerancia estricta)
opts = optimset('TolFun', 1e-12, 'TolX', 1e-12, 'Display', 'off');

% 4. Resolución con fsolve
[x_sol, fval, info, output] = fsolve(f, x0, opts);

% 5. Impresión de resultados
fprintf('=== RESOLUCION CON FSOLVE (PARTE B) ===\n');
fprintf('Iterado inicial x0 : [%.6f, %.6f, %.6f]^T\n', x0(1), x0(2), x0(3));
fprintf('Solucion hallada x*: [%.12f, %.12f, %.12f]^T\n', x_sol(1), x_sol(2), x_sol(3));
fprintf('Residuo ||f(x*)||_2 : %.2e\n', norm(fval, 2));
fprintf('Iteraciones        : %d\n', output.iterations);
