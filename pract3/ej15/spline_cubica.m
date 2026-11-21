function spline_cubica()
  % 1. Puntos de interpolacion y condiciones de borde
  x = [0, 2, 3];
  y_nodos = [0, 1, 2];
  d1 = 0; % f'(0+) = 0
  d3 = 0; % f'(3-) = 0

  % 2. Resolucion del sistema lineal para las derivadas d_i
  h1 = x(2) - x(1); h2 = x(3) - x(2);
  delta1 = (y_nodos(2) - y_nodos(1)) / h1;
  delta2 = (y_nodos(3) - y_nodos(2)) / h2;

  % Ecuacion del nodo interior: h2*d1 + 2*(h1+h2)*d2 + h1*d3 = 3*h2*delta1 + 3*h1*delta2
  d2 = (3*h2*delta1 + 3*h1*delta2 - h2*d1 - h1*d3) / (2*(h1 + h2));
  d = [d1; d2; d3];

  % 3. Evaluacion manual de la spline en una malla fina
  xx = linspace(0, 3, 200);
  yy_manual = zeros(size(xx));

  for k = 1:length(xx)
      xk = xx(k);
      if xk <= 2
          % Subintervalo [0, 2]
          s = xk - 0;
          yy_manual(k) = ((3*h1*s^2 - 2*s^3)/h1^3)*y_nodos(2) + ...
                         ((h1^3 - 3*h1*s^2 + 2*s^3)/h1^3)*y_nodos(1) + ...
                         (s^2*(s - h1)/h1^2)*d(2) + (s*(s - h1)^2/h1^2)*d(1);
      else
          % Subintervalo [2, 3]
          s = xk - 2;
          yy_manual(k) = ((3*h2*s^2 - 2*s^3)/h2^3)*y_nodos(3) + ...
                         ((h2^3 - 3*h2*s^2 + 2*s^3)/h2^3)*y_nodos(2) + ...
                         (s^2*(s - h2)/h2^2)*d(3) + (s*(s - h2)^2/h2^2)*d(2);
      end
  end

  % 4. Evaluacion con la funcion de Octave 'spline'
  y_octave = [d1, y_nodos, d3]; % Vector [f'(x1), y1, y2, y3, f'(xn)]
  sc = spline(x, y_octave);
  yy_spline = ppval(sc, xx);

  % 5. Grafico y comparacion
  figure;
  plot(xx, yy_manual, 'b-', 'LineWidth', 2); hold on;
  plot(xx, yy_spline, '--r', 'LineWidth', 1.5);
  plot(x, y_nodos, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8);
  grid on;
  xlabel('x'); ylabel('f(x)');
  title('Ejercicio 15: Spline cúbica completa');
  legend('Spline manual (sistema de ecuaciones)', 'Salida de spline(x, y)', 'Nodos', 'Location', 'northwest');

  % Muestreo de la diferencia maxima entre ambas soluciones
  diff_max = max(abs(yy_manual - yy_spline));
  fprintf('Diferencia máxima entre la construcción manual y spline(): %.2e\n', diff_max);
end
