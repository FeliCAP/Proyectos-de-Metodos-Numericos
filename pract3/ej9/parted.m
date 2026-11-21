function parted()
  % Nodos de la parte a)
  v_sub = [100, 150, 250, 350, 450];
  M_sub = [1.0, 5.1, 36.0, 150.1, 410.0];

  % Coeficientes de p4(v)
  p4_coeff = polyfit(v_sub, M_sub, 4);

  % Modelo de Tully-Fisher M(v) = 10^-8 * v^4
  M_TF = @(v) 1e-8 * (v.^4);

  % Malla fina en [100, 450]
  v_grid = linspace(100, 450, 1000);

  % Evaluaciones
  M_p4_grid = polyval(p4_coeff, v_grid);
  M_TF_grid = M_TF(v_grid);

  % Grafico
  figure;
  plot(v_grid, M_p4_grid, 'b--', 'LineWidth', 1.8, 'DisplayName', 'Polinomio p_4(v)');
  hold on;
  plot(v_grid, M_TF_grid, 'r-', 'LineWidth', 1.8, 'DisplayName', 'Modelo M(v) = 10^{-8}v^4');
  plot(v_sub, M_sub, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r', 'DisplayName', 'Nodos interpolados');

  xlabel('Velocidad v (km/s)');
  ylabel('Masa M (10^{10} M_\odot)');
  title('Parte d): Comparacion entre p_4(v) y el modelo M(v) = 10^{-8} v^4');
  legend('location', 'northwest');
  grid on;

  % Definicion del error en la malla
  error_grid = abs(M_TF_grid - M_p4_grid);

  % Cota del error maximo (norma del supremo)
  max_error = max(error_grid);

  % Ubicacion donde ocurre el error maximo
  [val_max, idx_max] = max(error_grid);
  v_max_err = v_grid(idx_max);

  fprintf('La cota superior del error en [100, 450] es: %.4f\n', max_error);
  fprintf('El error maximo ocurre en v = %.2f km/s\n', v_max_err);
end
