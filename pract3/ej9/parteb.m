function parteb()
  % 1. Datos observacionales completos
  v_all = [100, 150, 200, 250, 300, 350, 400, 450];
  M_all = [1.0, 5.1, 48.2, 36.0, 61.0, 150.1, 340.0, 410.0];

  % Nodos seleccionados en la parte a)
  idx_sub = [1, 2, 4, 6, 8];
  v_sub = v_all(idx_sub);
  M_sub = M_all(idx_sub);

  % 2. Polinomio p4 (Grado 4) de la parte a)
  p4_coeff = polyfit(v_sub, M_sub, 4);

  % 3. Polinomio p7 (Grado 7) con TODOS los datos
  %p7_coeff = polyfit(v_all, M_all, 7);
  % Construye p7 normalizando los datos de v
  [p7_coeff, ~, mu] = polyfit(v_all, M_all, 7);

  % 4. Malla para graficar suavemente
  v_grid = linspace(100, 450, 1000);
  M_p4 = polyval(p4_coeff, v_grid);
  %M_p7 = polyval(p7_coeff, v_grid);
  % Para evaluar p7 en la malla, se le pasa 'mu' a polyval:
  M_p7 = polyval(p7_coeff, v_grid, [], mu);

  % 5. Grafico comparativo
  figure;
  plot(v_grid, M_p4, 'b--', 'LineWidth', 1.8, 'DisplayName', 'Interpolacion p_4(v) (Grado 4)');
  hold on;
  plot(v_grid, M_p7, 'r-', 'LineWidth', 1.8, 'DisplayName', 'Interpolacion p_7(v) (Grado 7)');
  plot(v_all, M_all, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'DisplayName', 'Datos observacionales');

  xlabel('Velocidad v (km/s)');
  ylabel('Masa M (10^{10} M_\odot)');
  title('Parte b): Comparacion entre p_4(v) y p_7(v)');
  legend('location', 'northwest');
  grid on;
end
