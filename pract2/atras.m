function x = atras(U, b)
  % ATRAS Resuelve el sistema triangular superior U*x = b
  % U debe ser una matriz triangular superior y no singular.

  n = length(b);
  x = zeros(n, 1);

  % Caso base: última componente
  x(n) = b(n) / U(n, n);

  % Sustitución hacia atrás regresiva
  for i = n-1:-1:1
    x(i) = (b(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
  end
end
