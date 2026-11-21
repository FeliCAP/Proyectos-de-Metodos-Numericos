function ejercicio11_c()
  % EJERCICIO11_C Resuelve la parte c) del Ejercicio 11.
  % Compara el número de condición calculado mediante "cond"
  % frente al cálculo directo usando "invhilb" y "norm".

  pasos_n = [5, 10];
  normas = [1, 2, inf];

  for n = pasos_n
    H = hilb(n);
    H_inv_exacta = invhilb(n); % Inversa analítica exacta

    fprintf('\n==================================================\n');
    fprintf('   NÚMEROS DE CONDICIÓN PARA n = %d\n', n);
    fprintf('==================================================\n');

    for p = normas
      % Determinar etiqueta para la norma
      if p == 1
        norm_label = 'Norma 1   (Columnas)';
      elseif p == 2
        norm_label = 'Norma 2   (Espectral)';
      else
        norm_label = 'Norma Inf (Filas)';
      end

      % 1. Cálculo con comando nativo "cond"
      cond_nativo = cond(H, p);

      % 2. Cálculo directo con invhilb
      norm_H = norm(H, p);
      norm_H_inv = norm(H_inv_exacta, p);
      cond_directo = norm_H * norm_H_inv;

      % Mostrar resultados
      fprintf('%s:\n', norm_label);
      fprintf('  - cond nativo (cond(H))               : %e\n', cond_nativo);
      fprintf('  - cond directo (||H||*||invhilb(H)||) : %e\n', cond_directo);
      fprintf('  - Diferencia relativa                 : %e\n\n', abs(cond_nativo - cond_directo) / cond_directo);
    end
  end
  fprintf('==================================================\n\n');
end
