function X = inversa(A)
  % INVERSA Computa la inversa de una matriz A usando la factorización LU de lutx
  % X = inversa(A) calcula A^(-1) resolviendo AX = I de manera eficiente.
  % Llama a lutx una sola vez y no utiliza 'inv' ni '\'.

  [n, m] = size(A);
  if n ~= m
    error('La matriz debe ser cuadrada.');
  end

  % 1. Computamos la factorización LU (una única vez)
  [L, U, p] = lutx(A);

  % 2. Construimos la identidad y le aplicamos la permutación de filas
  I_perm = eye(n);
  I_perm = I_perm(p, :);

  % 3. Resolvemos L*Y = I(p,:) usando sustitución hacia adelante (fila por fila)
  % Esto calcula la matriz intermedia Y para todas las columnas a la vez
  Y = zeros(n, n);
  for i = 1:n
    % Restamos la contribución de las filas superiores ya calculadas
    Y(i, :) = (I_perm(i, :) - L(i, 1:i-1) * Y(1:i-1, :)) / L(i, i);
  end

  % 4. Resolvemos U*X = Y usando sustitución hacia atrás (fila por fila regresiva)
  % Esto calcula la inversa final X para todas las columnas a la vez
  X = zeros(n, n);
  for i = n:-1:1
    % Restamos la contribución de las filas inferiores ya calculadas
    X(i, :) = (Y(i, :) - U(i, i+1:n) * X(i+1:n, :)) / U(i, i);
  end
end
