function B_inv = corregir_inversa(A)
  % CORREGIR_INVERSA Corrige la inversa de A cuando se cambia su columna 4 por unos.
  %
  % B_inv = corregir_inversa(A) recibe una matriz A de 6x6 y calcula la inversa
  % de la matriz modificada B usando la fórmula de Sherman-Morrison de forma estable.
  %
  % Si se llama sin argumentos: corregir_inversa() genera una matriz aleatoria de prueba.

  % Si no se proporciona A, generamos una matriz de prueba diagonal dominante
  if nargin < 1
    A = rand(6, 6) + 6 * eye(6);
  end

  [n, m] = size(A);
  if n ~= 6 || m ~= 6
    error('La matriz A debe ser de tamaño 6x6.');
  end

  % Imprimimos la matriz original
  fprintf('\n==================================================\n');
  fprintf('1. MATRIZ ORIGINAL A (6x6)\n');
  fprintf('==================================================\n');
  disp(A);

  % 1. Hallar su inversa con el comando inv de Octave
  A_inv = inv(A);

  % 2. Definir la matriz B igual a A excepto en su columna 4, que será de unos
  B = A;
  B(:, 4) = ones(6, 1);
  fprintf('==================================================\n');
  fprintf('2. MATRIZ MODIFICADA B (Columna 4 reemplazada por 1s)\n');
  fprintf('==================================================\n');
  disp(B);

  % 3. Elegir vectores columna u y v de forma que B = A - u*v'
  % Teóricamente: u = a_4 - 1, v = e_4
  u = A(:, 4) - ones(6, 1);
  v = zeros(6, 1);
  v(4) = 1; % Cuarto vector canónico

  fprintf('==================================================\n');
  fprintf('3. VECTORES DE ACTUALIZACIÓN DE RANGO 1 (B = A - u*v'')\n');
  fprintf('==================================================\n');
  fprintf('Vector u'' (traspuesto para visualizar en fila):\n');
  disp(u');
  fprintf('Vector v'' (traspuesto para visualizar en fila):\n');
  disp(v');

  % 4. Aplicar la fórmula de Sherman-Morrison para hallar B^(-1)
  % z = A^(-1) * u
  z = A_inv * u;

  % sigma = v' * A_inv * u
  % Al ser v = e_4, v'*z es exactamente la cuarta componente del vector z
  sigma = z(4);

  % alfa = 1 / (1 - sigma)
  alfa = 1 / (1 - sigma);

  % B_inv = A_inv + alfa * (A_inv * u) * (v' * A_inv)
  % Al ser v = e_4, v'*A_inv es exactamente la fila 4 de A_inv: A_inv(4, :)
  B_inv = A_inv + alfa * z * A_inv(4, :);

  % 5. Verificación del resultado
  B_inv_nativo = inv(B);
  diferencia = norm(B_inv - B_inv_nativo, 1);
  residuo_izq = norm(B * B_inv - eye(6), 1);

  % Imprimimos resultados finales
  fprintf('==================================================\n');
  fprintf('4. INVERSA DE B CALCULADA POR SHERMAN-MORRISON (B_inv)\n');
  fprintf('==================================================\n');
  disp(B_inv);

  fprintf('==================================================\n');
  fprintf('5. VERIFICACIÓN Y MÉTRICAS DE PRECISIÓN\n');
  fprintf('==================================================\n');
  fprintf('Escalar sigma (v'' * A^-1 * u)           : %f\n', sigma);
  fprintf('Escalar alfa de corrección               : %f\n', alfa);
  fprintf('Diferencia L1 con comando nativo inv(B)  : %.2e\n', diferencia);
  fprintf('Residuo del cálculo ||B * B_inv - I||_1  : %.2e\n', residuo_izq);

  if diferencia < 1e-12
    fprintf('\n>>> [¡ÉXITO!] La fórmula de actualización funciona a la perfección. <<<\n');
  else
    fprintf('\n>>> [ALERTA] La diferencia es mayor a la esperada. Verificar condicionamiento. <<<\n');
  end
  fprintf('==================================================\n\n');
end
