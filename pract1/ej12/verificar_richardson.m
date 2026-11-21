function verificar_richardson()
  h_valores = [1e-2, 1e-3, 1e-4];
  e_real = exp(1); % Valor exacto de e en la máquina

  fprintf('   h   |  Aprox p0(h) (O(h)) |  Error p0(h)  |  Aprox p1(h) (O(h^2)) |  Error p1(h)\n');
  fprintf('-------|---------------------|---------------|-----------------------|---------------\n');

  for h = h_valores
    % Aproximación original (Primer orden)
    p0 = (1 + h)^(1/h);

    % Aproximación extrapolada (Segundo orden, t = 2)
    p1 = 2 * (1 + h/2)^(2/h) - p0;

    % Errores absolutos
    err0 = abs(p0 - e_real);
    err1 = abs(p1 - e_real);

    fprintf('%d  |  %f     |  %e     |  %f          |  %e\n', h, p0, err0, p1, err1);
  endfor
endfunction
