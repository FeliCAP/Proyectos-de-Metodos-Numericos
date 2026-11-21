function x = adelante(L, b)
  % ADELANTE Resuelve el sistema triangular inferior L*x = b
  % L debe ser una matriz triangular inferior y no singular.

  n = length(b);
  x = zeros(n, 1);

  % Caso base: primera componente
  x(1) = b(1) / L(1, 1);

  % Sustitución hacia adelante secuencial
  for i = 2:n
    x(i) = (b(i) - L(i, 1:i-1) * x(1:i-1)) / L(i, i);
  end
end
