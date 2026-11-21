function parte3()
  % Datos de la tabla
  v = [0, 10, 20, 30, 40, 50, 60];
  d = [0, 5, 20, 46, 70, 102, 153];

  % 1. Malla fina para la representación de la curva spline d(v)
  v_grid = linspace(0, 60, 500);
  d_spline = interp1(v, d, v_grid, 'spline');

  % 2. Invertir la interpolación spline para hallar v cuando d = 60 m
  d_lim = 60;
  v_lim_spline = interp1(d, v, d_lim, 'spline');

  fprintf('Velocidad límite con spline cúbica (splinetx): %.4f m/s\n', v_lim_spline);

  % 3. Gráfica comparativa
  figure;
  plot(v_grid, d_spline, 'b-', 'LineWidth', 1.8, 'DisplayName', 'Spline cúbica (splinetx)');
  hold on;
  plot(v, d, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8, 'DisplayName', 'Datos observacionales');
  plot([0, v_lim_spline, v_lim_spline], [d_lim, d_lim, 0], 'k--', 'LineWidth', 1);

  grid on;
  xlabel('v (m/s)'); ylabel('d (m)');
  title('Ejercicio 7 - Parte 3: Interpolación con splines cúbicas');
  legend('location', 'northwest');
end
