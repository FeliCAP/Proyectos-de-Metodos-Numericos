function partea()
  % Nodos de interpolacion y sus correspondientes valores de f(x) = log(x)
  x = [0.1, 1, 2, 2.9];
  y = log(x);

  % 1. Obtener los coeficientes del polinomio interpolante cubico (grado 3)
  p = polyfit(x, y, 3);

  % 2. Evaluar la interpolante en x = 1.5
  x_eval = 1.5;
  p_val = polyval(p, x_eval);

  % 3. Valor exacto de f(x) en x = 1.5
  f_val = log(x_eval);

  % 4. Determinar el error absoluto de interpolacion
  err = abs(f_val - p_val);

  % Mostrar resultados por pantalla
  fprintf('Valor interpolado p(1.5) = %.8f\n', p_val);
  fprintf('Valor exacto f(1.5)      = %.8f\n', f_val);
  fprintf('Error absoluto |f-p|     = %.8e\n', err);
end
