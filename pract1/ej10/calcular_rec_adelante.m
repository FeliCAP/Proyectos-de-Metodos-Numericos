function calcular_rec_adelante()
  % Reservamos espacio para los términos de I0 a I30 (31 elementos)
  I = zeros(31, 1);

  % El índice 1 de Octave representará a I0
  I(1) = log(6/5);

  fprintf(' n  |       I_n\n');
  fprintf('----|-------------------\n');
  fprintf('%d  |  %e\n', 0, I(1));

  for n = 1:30
    % I_n corresponde a I(n+1) e I_{n-1} corresponde a I(n)
    I(n+1) = 1/n - 5 * I(n);
    fprintf('%d  |  %e\n', n, I(n+1));
  end
end
