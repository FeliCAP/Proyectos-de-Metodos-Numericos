function parteb()
  % Malla fina de puntos en el intervalo [1.43, 1.71]
  x = linspace(1.43, 1.71, 500);
  p = 816*x.^3 - 3835*x.^2 + 6000*x - 3125;

  % Raíces exactas obtenidas en la parte a)
  raices = [25/17, 25/16, 5/3];

  % Gráfico del polinomio
  figure;
  plot(x, p, 'b-', 'LineWidth', 2); hold on;
  plot([1.43, 1.71], [0, 0], 'k--'); % Eje horizontal y = 0

  % Ubicación de las tres raíces con puntos rojos
  plot(raices, [0, 0, 0], 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

  grid on;
  xlabel('x'); ylabel('p(x)');
  title('Ejercicio 3 - Gráfica de p(x) y ubicación de las tres raíces');
  legend('p(x)', 'Eje y = 0', 'Raíces exactas', 'Location', 'northwest');
end
