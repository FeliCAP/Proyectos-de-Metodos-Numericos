% Matriz de diseño A y vector de datos b
A = [1 1;
     2 1;
     1 2;
     2 3;
     2 5;
     2 4];

y = [30.006; 44.013; 46.006; 76.012; 108.010; 92.011];

% Solucion de minimos cuadrados
coef = (A' * A) \ (A' * y); % Resolución de A'*A*x = A'*y
disp = (coef);

fprintf('N = %.4f\n', coef(1));
fprintf('O = %.4f\n', coef(2));
