function parteb()
  f = @(x) sin(5*x);
  df_exacta = 5*cos(5);
  a = 1;
  k = 0:20;
  h = 10.^(-k);
  derivadas = (f(a + h) - f(a - h)) ./ (2*h);
  errores = abs(derivadas - df_exacta);
  loglog(h, errores, '-o')
endfunction

