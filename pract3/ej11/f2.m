function f2()
  % 1. Definición de la función de Runge y su segunda derivada
  f  = @(x) 1 ./ (1 + 25*x.^2);
  f2 = @(x) 50 * (75*x.^2 - 1) ./ (1 + 25*x.^2).^3;

  x_grid = linspace(-1, 1, 2000);

  % Graficar f''(x) para determinar visualmente el máximo
  figure;
  plot(x_grid, abs(f2(x_grid)), 'b-', 'LineWidth', 1.8);
  grid on;
  title('Valor absoluto de f''''(x) en [-1, 1]');
  xlabel('x'); ylabel('|f''''(x)|');

  max_f2 = max(abs(f2(x_grid)));
  fprintf('El maximo de |f''''(x)| es: %.2f (se alcanza en x = 0)\n', max_f2);

  % 2. Error cometido por p16 con nodos equiespaciados (Parte a)
  n_poly = 16;
  x_eq = linspace(-1, 1, n_poly + 1);
  y_eq = f(x_eq);
  p16_coeff = polyfit(x_eq, y_eq, n_poly);
  y_p16 = polyval(p16_coeff, x_grid);
  err_p16 = max(abs(f(x_grid) - y_p16));

  fprintf('Error maximo de p16 (equiespaciado): %.4f\n', err_p16);

  % 3. Interpolación lineal a trozos con n = 2 subintervalos (3 nodos)
  n_lineal = 2;
  x_lin_nodes = linspace(-1, 1, n_lineal + 1);
  y_lin_nodes = f(x_lin_nodes);
  y_lineal = interp1(x_lin_nodes, y_lin_nodes, x_grid, 'linear');

  err_lineal = max(abs(f(x_grid) - y_lineal));

  fprintf('Error maximo con lineal a trozos (n=%d subintervalos): %.4f\n', n_lineal, err_lineal);

  % Gráfica comparativa
  figure;
  plot(x_grid, f(x_grid), 'k-', 'LineWidth', 1.5, 'DisplayName', 'f(x)');
  hold on;
  plot(x_grid, y_lineal, 'r--', 'LineWidth', 1.5, 'DisplayName', sprintf('Lineal a trozos (n=%d)', n_lineal));
  plot(x_lin_nodes, y_lin_nodes, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Nodos');
  grid on;
  title('Interpolación lineal a trozos de f(x)');
  xlabel('x'); ylabel('y');
  legend('location', 'northeast');
end
