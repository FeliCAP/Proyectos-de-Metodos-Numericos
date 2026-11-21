function x = atras(U,b)
  %Obtener la dimension del sistema
  n = length(b);

  %Inicializar el vector columna de soluciones en cero
  x = zeros(n,1);

  %Caso base: resolver la última variable (xn = bn / Unn)
  x(n) = b(n) / U(n,n);

  %Bucle regresivo desde n-1 hasta n
  for i = n-1:-1:1
    suma = 0;
    %Calcular la sumatoria de los términos ya conocidos: U(i,j) * x(j)
     for j = i+1:n
       suma = suma + U(i,j) * x(j);
     endfor

     %Despejar x(i)
     x(i) = (b(i) - suma) / U(i,i);
  endfor
endfunction

