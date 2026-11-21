function [L,U,p,sig] = lutx_modificada(A)
  % LU Triangular factorization con signo de permutación
  % [L,U,p,sig] = lutx_modificada(A) computa una matriz triangular inferior L,
  % una matriz triangular superior U, un vector de permutaciones p y
  % un escalar sig, de forma que L*U = A(p,:) y sig = +1 o -1 si p
  % es una permutación par o impar.

  [n,n] = size(A);
  p = (1:n)';
  sig = 1; % Inicializamos el signo del determinante de P en +1 (0 intercambios)

  for k = 1:n-1
     % Buscar el índice del elemento de mayor valor absoluto en la columna k
     % (desde la fila k hasta la fila n para el pivoteo parcial)
     [r,m] = max(abs(A(k:n,k)));
     m = m+k-1;

     % Realizar la eliminación si el pivote elegido no es cero
     if (A(m,k) ~= 0)

        % Si el elemento máximo no está en la diagonal, intercambiamos filas
        if (m ~= k)
           A([k m],:) = A([m k],:);
           p([k m]) = p([m k]);
           sig = -sig; % Cada intercambio de filas cambia el signo del determinante de P
        end

        % Calcular los multiplicadores de la columna k
        i = k+1:n;
        A(i,k) = A(i,k)/A(k,k);

        % Actualizar el resto de la submatriz
        j = k+1:n;
        A(i,j) = A(i,j) - A(i,k)*A(k,j);
     end
  end

  % Separar las matrices L y U del almacenamiento compacto
  U = triu(A);
  L = tril(A,-1) + eye(n,n);
end
