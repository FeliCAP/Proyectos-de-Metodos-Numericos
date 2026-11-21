function ej8()
  % Definición de las tres funciones de iteración de punto fijo
  g1 = @(x) -log(x);
  g2 = @(x) exp(-x);
  g3 = @(x) (x + exp(-x)) / 2;

  x0 = 0.5;
  max_it = 10;

  % Inicialización de vectores para guardar iterados
  x_g1 = zeros(max_it+1, 1); x_g1(1) = x0;
  x_g2 = zeros(max_it+1, 1); x_g2(1) = x0;
  x_g3 = zeros(max_it+1, 1); x_g3(1) = x0;

  for k = 1:max_it
      x_g1(k+1) = g1(x_g1(k));
      x_g2(k+1) = g2(x_g2(k));
      x_g3(k+1) = g3(x_g3(k));
  end

  % Tabla comparativa de iterados
  fprintf(' k |     g1(x) (Diverge)   |     g2(x) (Lenta)     |     g3(x) (Rápida)    \n');
  fprintf('-----------------------------------------------------------------------\n');
  for k = 0:max_it
      fprintf('%2d | %21.8f | %21.8f | %21.8f \n', k, x_g1(k+1), x_g2(k+1), x_g3(k+1));
  end
end
