function partea ()
  % Datos completos
  v_all = [100, 150, 200, 250, 300, 350, 400, 450];
  M_all = [1.0, 5.1, 48.2, 36.0, 61.0, 150.1, 340.0, 410.0];

  % Nodos de interpolacion parte a)
  idx_sub = [1, 2, 4, 6, 8]; % posiciones de 100, 150, 250, 350, 450
  v_sub = v_all(idx_sub);
  M_sub = M_all(idx_sub);

  % Polinomio de grado 4
  p4_coeff = polyfit(v_sub, M_sub, 4);

  % Puntos restantes
  idx_rest = [3, 5, 7]; % posiciones de 200, 300, 400
  v_rest = v_all(idx_rest);
  M_rest = M_all(idx_rest);

  % Evaluacion de p4 en los puntos restantes
  p4_eval = polyval(p4_coeff, v_rest);
  err_abs = abs(M_rest - p4_eval);

  % Mostrar errores
  disp('Errores absolutos en v = [200, 300, 400]:');
  for i = 1:length(v_rest)
      fprintf('v = %d | M_obs = %.1f | p4(v) = %.4f | Error = %.4f\n', ...
              v_rest(i), M_rest(i), p4_eval(i), err_abs(i));
  end

  % Grafico
  v_grid = linspace(100, 450, 500);
  M_grid = polyval(p4_coeff, v_grid);

  figure;
  plot(v_grid, M_grid, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Polinomio p_4(v)');
  hold on;
  plot(v_sub, M_sub, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r', 'DisplayName', 'Nodos interpolados');
  plot(v_rest, M_rest, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'g', 'DisplayName', 'Datos restantes');
  xlabel('Velocidad v (km/s)');
  ylabel('Masa M (10^{10} M_\odot)');
  title('Parte a): Interpolacion Polinomial de Grado 4 (Tully-Fisher)');
  legend('location', 'northwest');
  grid on;
end
