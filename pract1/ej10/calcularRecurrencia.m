function calcularRecurrencia()
  % Reservamos espacio para I0 hasta I30
  I = zeros(31, 1);
  I(1) = log(6/5); % I0 = I(1) ,..., I30 = I(31)

  fprintf(' n  |       In\n');
  fprintf('%d  |  %e\n', 0, I(1)); % Tabla de resultados

  for n = 1:30
    I(n+1) = 1/n - 5 * I(n);
    fprintf('%d  |  %e\n', n, I(n+1));
  end
end
