function partec()
  % 1. Datos observacionales completos
  v_obs = [100, 150, 200, 250, 300, 350, 400, 450];
  M_obs = [1.0, 5.1, 48.2, 36.0, 61.0, 150.1, 340.0, 410.0];

  % 2. Modelo teorico sin materia oscura
  f_teorica = @(v) 1e-6 * (v.^3);

  % Malla para graficar la curva
  v_grid = linspace(100, 450, 1000);
  M_grid_teorica = f_teorica(v_grid);

  % 3. Grafico
  figure;
  plot(v_grid, M_grid_teorica, 'g-', 'LineWidth', 2, 'DisplayName', 'Modelo sin materia oscura: M = 10^{-6} v^3');
  hold on;
  plot(v_obs, M_obs, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'r', 'DisplayName', 'Datos observacionales');

  xlabel('Velocidad v (km/s)');
  ylabel('Masa M (10^{10} M_\odot)');
  title('Parte c): Modelo sin Materia Oscura vs. Datos Observacionales');
  legend('location', 'northwest');
  grid on;
end
