function calcularRecurrenciaAtras()
  I100 = [0, 0.1, 1]
  % Matriz de n = 100 a n = 30 filas para almacenar resultados
  resultados = zeros(71, 3);

  for col = 1:3
    I = zeros(101, 1); % I0 = I(1) ,..., I100 = I(101)
    I(101) = I100(col);

    for n = 100:-1:1
      I(n) = 1/(5*n) - I(n+1)/5;
    end
    for nid = 30:100
      resultados(nid + 1, col) = I(nid + 1);
    end
  end

  fprintf('  n  |   I100 = 0.0     |   I100 = 0.1     |   I100 = 1.0     \n'); % Tabla

  for n = 100:-1:30
    fprintf('%d  |  %e  |  %e  |  %e\n', n, resultados(n+1, 1), resultados(n+1, 2), resultados(n+1, 3));
  end
end
