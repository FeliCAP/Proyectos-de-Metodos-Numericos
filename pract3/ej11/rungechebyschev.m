function rungechebyschev()
  % Función de Runge
  f = @(x) 1 ./ (1 + 25*x.^2);

  % Malla densa para graficar las curvas de forma suave
  x_grid = linspace(-1, 1, 1000);
  y_real = f(x_grid);

  % Grados a evaluar
  grados = [4, 8, 12, 16];

  figure;
  for k = 1:length(grados)
      n = grados(k);

      % Nodos de Chebyschev (n + 1 puntos en [-1, 1])
      j = 0:n;
      x_cheb = cos((2*j + 1) * pi / (2 * (n + 1)));
      y_cheb = f(x_cheb);

      % Polinomio interpolante usando nodos de Chebyschev
      % Se utiliza el centrado y escalado (mu) para mayor estabilidad numerica
      [p_coeff, ~, mu] = polyfit(x_cheb, y_cheb, n);
      y_interp = polyval(p_coeff, x_grid, [], mu);

      % Graficación por grado
      subplot(2, 2, k);
      plot(x_grid, y_real, 'k-', 'LineWidth', 1.5, 'DisplayName', 'f(x)');
      hold on;
      plot(x_grid, y_interp, 'r--', 'LineWidth', 1.2, 'DisplayName', sprintf('p_{%d} Cheby', n));
      plot(x_cheb, y_cheb, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 4, 'DisplayName', 'Nodos Cheb');

      title(sprintf('Chebyschev: Grado n = %d', n));
      xlabel('x'); ylabel('y');
      ylim([-0.2, 1.2]);
      grid on;
      legend('location', 'northeast');
  end
end
