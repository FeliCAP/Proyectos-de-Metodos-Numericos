function x = tridiagonal(A, b)
  % TRIDIAGONAL Resuelve el sistema Ax = b para una matriz tridiagonal A
  % utilizando el algoritmo de Thomas (factorización LU optimizada).
  %
  % x = tridiagonal(A, b) devuelve la solución x como vector columna.

  n = length(b);

  % Asegurar que b sea un vector columna
  if size(b, 2) > 1
    b = b';
  end

  % 1. Extracción de las diagonales de la matriz tridiagonal A
  dp = diag(A);          % Diagonal principal (a_kk), de tamaño n
  dl = diag(A, -1);      % Subdiagonal (a_k,k-1), de tamaño n-1
  du = diag(A, 1);       % Superdiagonal (a_k,k+1), de tamaño n-1

  % Reservar espacio en memoria para los vectores de la factorización
  c = zeros(n, 1);
  l = zeros(n-1, 1);

  % 2. Fase de Factorización LU (Cómputo de l_k y c_k de forma eficiente)
  c(1) = dp(1);
  for k = 2:n
    l(k-1) = dl(k-1) / c(k-1);
    c(k) = dp(k) - l(k-1) * du(k-1);
  end

  % 3. Sustitución hacia adelante (Resolver L*y = b)
  y = zeros(n, 1);
  y(1) = b(1);
  for k = 2:n
    y(k) = b(k) - l(k-1) * y(k-1);
  end

  % 4. Sustitución hacia atrás (Resolver U*x = y)
  x = zeros(n, 1);
  x(n) = y(n) / c(n);
  for k = n-1:-1:1
    x(k) = (y(k) - du(k) * x(k+1)) / c(k);
  end
end
