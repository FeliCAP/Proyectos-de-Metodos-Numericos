function detA = determinante(A)
  % DETERMINANTE Calcula el determinante de la matriz A usando la factorización LU modificada
  % detA = determinante(A) utiliza lutx_modificada para obtener U y el signo
  % de la permutación, calculando eficientemente el determinante.

  % Validamos que la matriz de entrada sea cuadrada
  [m,n] = size(A);
  if m ~= n
    error('La matriz debe ser cuadrada.');
  end

  % Obtenemos la factorización y el signo del determinante de P
  [L,U,p,sig] = lutx_modificada(A);

  % det(A) = (det(L) * det(U)) / det(P)
  % Como det(L) = 1, queda: det(A) = prod(diag(U)) / sig
  detA = prod(diag(U)) / sig;
end
