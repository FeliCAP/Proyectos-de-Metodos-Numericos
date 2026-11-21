function ejercicio5_muchos_sistemas()
  n = 100;
  m = 10;

  % 1. Generamos una matriz aleatoria A bien condicionada (diagonal dominante)
  % para asegurar que lutx y bslashtx no tengan problemas de singularidad
  A = rand(n, n) + n * eye(n);

  % Generamos los 10 vectores columna b de forma aleatoria
  B = rand(n, m);

  % ==========================================
  % MÉTODO 1: Usando bslashtx para cada sistema
  % ==========================================
  X1 = zeros(n, m);
  tic;
  for j = 1:m
    % bslashtx resuelve el sistema completo (factoriza y sustituye) cada vez
    X1(:, j) = bslashtx(A, B(:, j));
  endfor
  t_metodo1 = toc;

  % ==========================================
  % MÉTODO 2: lutx una vez + sustituciones
  % ==========================================
  X2 = zeros(n, m);
  tic;
  % Factorizamos A una única vez
  [L, U, p] = lutx(A);

  for j = 1:m
    bj = B(:, j);
    bj_perm = bj(p); % Permutamos el lado derecho según las filas

    % Sustitución hacia adelante matricial/vectorial (L * y = b_perm)
    y = zeros(n, 1);
    for i = 1:n
      y(i) = (bj_perm(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i);
    endfor

    % Sustitución hacia atrás matricial/vectorial (U * x = y)
    x = zeros(n, 1);
    for i = n:-1:1
      x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
    endfor

    X2(:, j) = x;
  endfor
  t_metodo2 = toc;

  % ==========================================
  % Verificación de precisión y tiempos
  % ==========================================
  discrepancia = norm(X1 - X2, 'fro'); % Norma de Frobenius de la diferencia

  fprintf('=== RESULTADOS DE LA COMPARACIÓN ===\n');
  fprintf('Tiempo Método 1 (bslashtx 10 veces): %f segundos\n', t_metodo1);
  fprintf('Tiempo Método 2 (lutx + sustituciones): %f segundos\n', t_metodo2);
  fprintf('Aceleración empírica (T1 / T2): %.2f veces más rápido\n', t_metodo1 / t_metodo2);
  fprintf('Diferencia entre las soluciones (||X1 - X2||_F): %.2e\n', discrepancia);
end
