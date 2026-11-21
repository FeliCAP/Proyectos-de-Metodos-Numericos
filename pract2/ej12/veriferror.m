function veriferror()
  % Definir la matriz P y la solución x obtenida en la parte c
  P = [ 0.5, 0.2, 0.2, 0.1;
        0.3, 0.4, 0.2, 0.1;
        0.2, 0.3, 0.4, 0.1;
        0.1, 0.1, 0.2, 0.6 ];

  x = [0.29375; 0.25625; 0.25000; 0.20000];
  pi_fila = x';

  % 1. Calcular el error residual de la ecuación de balance (Norma 1)
  residuo = norm(pi_fila * P - pi_fila, 1);

  % 2. Calcular la suma de las componentes
  suma = sum(pi_fila);

  % 3. Verificar si todos los elementos son mayores o iguales a cero
  son_no_negativos = all(pi_fila >= 0);

  % Imprimir verificaciones en la terminal
  fprintf('Diferencia ||pi*P - pi||_1: %e\n', residuo);
  fprintf('Suma de las componentes:    %f\n', suma);
  fprintf('¿Son todos no negativos?:   %d\n', son_no_negativos);
end

