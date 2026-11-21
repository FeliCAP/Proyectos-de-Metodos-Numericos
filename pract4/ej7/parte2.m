function parte2()
  % Datos de la tabla
  v = [0, 10, 20, 30, 40, 50, 60];
  d = [0, 5, 20, 46, 70, 102, 153];

  % 1. Generar la grilla fina para la curva d(v)
  v_grid = linspace(0, 60, 500);
  d_pchip = interp1(v, d, v_grid, 'pchip');

  % 2. Invertir la interpolación para hallar v cuando d = 60 m
  d_lim = 60;
  v_lim_pchip = interp1(d, v, d_lim, 'pchip');

  fprintf('Velocidad límite con PCHIP (pchiptx): %.4f m/s\n', v_lim_pchip);

  % 3. Gráfica comparativa
  figure;
  plot(v_grid, d_pchip, 'b-', 'LineWidth', 1.8, 'DisplayName', 'Interpolación PCHIP (pchiptx)');
  hold on;
  plot(v, d, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8, 'DisplayName', 'Datos observacionales');
  plot([0, v_lim_pchip, v_lim_pchip], [d_lim, d_lim, 0], 'k--', 'LineWidth', 1);

  grid on;
  xlabel('v (m/s)'); ylabel('d (m)');
  title('Ejercicio 7 - Parte 2: Interpolación cúbica PCHIP');
  legend('location', 'northwest');
end
