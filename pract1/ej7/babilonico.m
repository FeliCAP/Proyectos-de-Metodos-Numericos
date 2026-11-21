function n0 = babilonico()
  %Parámetros iniciales
  a = 2;
  sqrt2_real = sqrt(2);
  n = 0;
  error = abs(a - sqrt2_real);

  %Encabezado simple
  disp(' n  |  error absoluto');
  disp('--------------------');

  %Bucle hasta que el error sea 0 para la máquina
  while error > 0
    fprintf('%2d  |  %.2e\n', n, error);

    %Recursión solicitada: an+1 = ((an^2 + 2)/2)*(1/an);
    a = ((a^2 + 2)/2)*(1/a);

    n = n+1;
    error = abs(a - sqrt2_real);
  endwhile

  %Imprimir el último paso donde el error es 0
  fprintf('%2d  |  %.2e\n', n, error);
  n0 = n;
  fprintf('\nLa máquina confunde an con sqrt(2) en n0 = %d\n', n0);
end

