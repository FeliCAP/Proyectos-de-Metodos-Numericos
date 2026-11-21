% Datos de las observaciones
x = [-1; 0; 1; 2; 3];
y = [7/2; 3/2; 2; 11/5; 3];

% Paso 1: Construir la matriz de diseño A (n x 3) para f(x) = a*x^3 + b*x + c
A = [x.^3, x, ones(size(x))];

% Paso 2: Factorización QR económica (Q: n x 3, R: 3 x 3)
[Q, R] = qr(A, 0);

% Paso 3: Resolver el sistema R * theta = Q' * y
z = Q' * y;
coef = R \ z; % Sustitución hacia atrás

% Coeficientes del polinomio ajustado: coef = [a; b; c]
a = coef(1);
b = coef(2);
c = coef(3);

% Mostrar resultados
fprintf('--- Coeficientes del ajuste ---\n');
fprintf('a = %.6f\n', a);
fprintf('b = %.6f\n', b);
fprintf('c = %.6f\n', c);
