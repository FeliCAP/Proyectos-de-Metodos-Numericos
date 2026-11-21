function R = cholesky(A)
  % CHOLESKY Computa la factorización de Cholesky A = R'*R
  % A debe ser una matriz simétrica y definida positiva.
  % R es una matriz triangular superior.

  [n, m] = size(A);
  if n ~= m
    error('La matriz debe ser cuadrada.');
  end

  R = zeros(n, n); % Inicializamos la matriz R con ceros

  for i = 1:n
    % Paso 1: Computar el elemento diagonal r_ii
    suma_diag = 0;
    for k = 1:i-1
      suma_diag = suma_diag + R(k, i)^2;
    end

    val_bajo_raiz = A(i, i) - suma_diag;
    if val_bajo_raiz <= 0
      error('La matriz no es definida positiva (se detectó raíz imaginaria).');
    end
    R(i, i) = sqrt(val_bajo_raiz);

    % Paso 2: Computar los elementos no diagonales r_ij de la fila i
    for j = i+1:n
      suma_fuera = 0;
      for k = 1:i-1
        suma_fuera = suma_fuera + R(k, i) * R(k, j);
      end
      R(i, j) = (A(i, j) - suma_fuera) / R(i, i);
    end
  end
end
