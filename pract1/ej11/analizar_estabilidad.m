% === PARTE B: Función de análisis ===
function analizar_estabilidad()
  fprintf(' n  |   Área (Herón)   | Error Relativo\n');
  fprintf('----|------------------|---------------\n');

  for n = 1:16
    delta = 10^(-n);
    a = 1;
    b = delta;
    c = sqrt(1 + delta^2);

    A_heron = area(a,b,c);
    A_real = delta / 2; % (base * altura) / 2

    %Cálculo del error relativo
    error_rel = abs(A_heron - A_real) / A_real;

    fprintf('%2d  |  %.10e  |  %.2e\n', n, A_heron, error_rel);
  endfor
endfunction

