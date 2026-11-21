function calcular_rec_atras()
  % Condiciones iniciales propuestas para I100
  I100_valores = [0, 0.1, 1];

  % Matriz para almacenar los resultados
  % Filas: de n = 100 a n = 30 (71 filas) | Columnas: los 3 experimentos
  resultados = zeros(101, 3);

  for col = 1:3
    % Vector para almacenar los términos (base 1 de Octave)
    % I(101) representará a I100 e I(1) representará a I0
    I = zeros(101, 1);
    I(101) = I100_valores(col);

    % Relación de recurrencia hacia atrás: I_{n-1} = 1/(5n) - I_n / 5
    for n = 100:-1:1
      I(n) = 1/(5*n) - I(n+1)/5;
    end

    % Guardamos los resultados correspondientes desde n = 100 hasta n = 30
    for n_idx = 30:100
      resultados(n_idx + 1, col) = I(n_idx + 1);
    end
  end

  % Impresión de resultados en formato de tabla comparativa
  fprintf('  n  |   I100 = 0.0     |   I100 = 0.1     |   I100 = 1.0     \n');
  fprintf('-----|------------------|------------------|------------------\n');

  % Imprime TODOS los datos calculados desde n = 100 hasta n = 30
  for n = 100:-1:30
    row = n + 1; % El índice de fila en Octave es n + 1
    fprintf('%3d  |  %.10e  |  %.10e  |  %.10e\n', n, resultados(row, 1), resultados(row, 2), resultados(row, 3));
  end
end
