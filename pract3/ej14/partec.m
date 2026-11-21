function partec()
  % Evaluacion en una malla fina sobre [1, 2]
  v = linspace(1, 2, 200);
  f_v = log(v);

  % Interpolante a) - Polinomio cubico global por x = 0.1, 1, 2, 2.9
  x_a = [0.1, 1, 2, 2.9];
  y_a = log(x_a);
  p_a_coef = polyfit(x_a, y_a, 3);
  w_a = polyval(p_a_coef, v);

  % Interpolante b) - Hermite en [1, 2]
  x0 = 1; x1 = 2;
  y0 = log(x0); y1 = log(x1);
  d0 = 1/x0;    d1 = 1/x1;
  h = x1 - x0;

  w_b = zeros(size(v));
  for j = 1:length(v)
      s = v(j) - x0;
      w_b(j) = ((3*h*s^2 - 2*s^3) / h^3) * y1 ...
             + ((h^3 - 3*h*s^2 + 2*s^3) / h^3) * y0 ...
             + (s^2 * (s - h) / h^2) * d1 ...
             + (s * (s - h)^2 / h^2) * d0;
  end

  % Graficar las tres funciones
  figure;
  plot(v, f_v, 'k-', 'LineWidth', 2); hold on;
  plot(v, w_a, 'r--', 'LineWidth', 1.5);
  plot(v, w_b, 'b-.', 'LineWidth', 1.5);
  grid on;
  xlabel('x'); ylabel('y');
  title('Comparación de interpolantes para f(x) = log(x) en [1, 2]');
  legend('f(x) = log(x)', 'Polinomio Cúbico Global (a)', 'Hermite Cúbico (b)', 'Location', 'northwest');
end
