function ej10()
  % Nodos e imágenes
  x = [0, pi/6, pi/4, pi/3];
  y = sin(x);

  % Polinomio de interpolacion
  p3 = polyfit(x, y, 3);

  % Evaluar en pi/8
  x_eval = pi/8;
  val_p3 = polyval(p3, x_eval);
  val_exacto = sqrt(2 - sqrt(2)) / 2;

  % Error real
  err_real = val_exacto - val_p3;

  % Cota teorica de error
  w3 = prod(x_eval - x);
  max_f4 = sin(pi/3);
  cota_err = (max_f4 / 24) * abs(w3);

  % Impresion de resultados
  fprintf('Valor exacto sen(pi/8): %.8f\n', val_exacto);
  fprintf('Valor p3(pi/8):         %.8f\n', val_p3);
  fprintf('Error real:             %.8e\n', err_real);
  fprintf('Cota teorica del error: %.8e\n', cota_err);
end
