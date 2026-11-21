% === PARTE C: Función de análisis para un isósceles
function analizar_estabilidad_isosceles()
  fprintf(' n  |   Área (Herón)   | Error Relativo\n');
  fprintf('----|------------------|---------------\n');

  for n = 1:16
    delta = 10^(-n);
    a = 2;
    b = sqrt(1 + delta^2);
    c = b; %Es isósceles

    %Intentamos calcular el área. Usamos un bloque try-catch
    %porque sabemos que fallará por la desigualdad triangular.
    try
      A_heron = area(a, b, c);
      A_real = delta;
      error_rel = abs(A_heron - A_real) / A_real;
      fprintf('%2d  |  %.10e  |  %.2e\n', n, A_heron, error_rel);
    catch
      fprintf('%2d  |  --- FALLO ---   | La máquina colapsó el triángulo\n', n);
      break;
    end
  endfor
endfunction

