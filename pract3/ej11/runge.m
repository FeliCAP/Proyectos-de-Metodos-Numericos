function runge()
  % Función de Runge
  f = @(x) 1 ./ (1 + 25*x.^2);

  % Malla fina para graficar suavemente
  x_grid = linspace(-1, 1, 1000);
  y_real = f(x_grid);

  % Grados a evaluar
  grados = [4, 8, 12, 16];

  figure;
  for k = 1:length(grados)
      n = grados(k);

      % Nodos equiespaciados (n + 1 puntos)
      x_nodes = linspace(-1, 1, n + 1);
      y_nodes = f(x_nodes);

      % Polinomio interpolante
      p_coeff = polyfit(x_nodes, y_nodes, n);
      y_interp = polyval(p_coeff, x_grid);

      % Subplot para cada grado
      subplot(2, 2, k);
      plot(x_grid, y_real, 'k-', 'LineWidth', 1.5, 'DisplayName', 'f(x)');
      hold on;
      plot(x_grid, y_interp, 'r--', 'LineWidth', 1.2, 'DisplayName', sprintf('p_{%d}(x)', n));
      plot(x_nodes, y_nodes, 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 4, 'DisplayName', 'Nodos');

      title(sprintf('Grado n = %d', n));
      xlabel('x'); ylabel('y');
      ylim([-0.5, 1.5]);
      grid on;
      legend('location', 'northeast');
  end
end
