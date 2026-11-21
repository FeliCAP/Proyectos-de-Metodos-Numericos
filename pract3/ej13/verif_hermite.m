function verif_hermite()
  v = linspace(0, pi, 1000);
  f_v = cos(v);

  % 1. Evaluar interpolante con n = 4
  n = 4;
  w4 = eval_hermite_cos(n, v);
  err4 = max(abs(f_v - w4));

  fprintf('Error maximo numérico para n = 4: %.6e\n', err4);

  % 2. Evaluación del punto donde se alcanza el máximo error
  [max_err, idx] = max(abs(f_v - w4));
  fprintf('El error maximo se alcanza en x ≈ %.4f\n', v(idx));
end
