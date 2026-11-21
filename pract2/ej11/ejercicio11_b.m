function ejercicio11_b()
  % EJERCICIO11_B Resuelve la parte b) del Ejercicio 11 (Matriz de Hilbert).
  % Calcula el error, el residuo y sus normas (1, 2 e infinito) para n = 5 y 10.

  pasos_n = [5, 10];

  for n = pasos_n
    % 1. Definición del sistema de la parte a)
    x = ones(n, 1);
    H = hilb(n);
    b = H * x;
    x_star = H \ b; % Solución computada

    % 2. Cómputo del error y el residuo
    e = x - x_star;         % Error: e_n = x_n - x*_n
    r = b - H * x_star;     % Residuo: r_n = b_n - H_n*x*_n

    % 3. Impresión de resultados
    fprintf('\n==================================================\n');
    fprintf('   RESULTADOS PARA n = %d\n', n);
    fprintf('==================================================\n');

    fprintf('Normas del Error (e_n = x_n - x*_n):\n');
    fprintf('  ||e_n||_1   ( Manhattan ) : %e\n', norm(e, 1));
    fprintf('  ||e_n||_2   ( Euclídea  ) : %e\n', norm(e, 2));
    fprintf('  ||e_n||_inf ( Máxima    ) : %e\n', norm(e, inf));

    fprintf('\nNormas del Residuo (r_n = b_n - H_n*x*_n):\n');
    fprintf('  ||r_n||_1   ( Manhattan ) : %e\n', norm(r, 1));
    fprintf('  ||r_n||_2   ( Euclídea  ) : %e\n', norm(r, 2));
    fprintf('  ||r_n||_inf ( Máxima    ) : %e\n', norm(r, inf));
  end
  fprintf('==================================================\n\n');
end
