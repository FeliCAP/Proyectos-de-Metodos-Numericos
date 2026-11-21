% === PARTE A: Definición de la función ===
function A = area(a,b,c)
  %1. Validación de positividad: Los lados deben ser números positivos
  if (a <= 0 || b <= 0 || c <= 0)
    error('Las entradas a, b, y c deben ser números positivos.');
  endif

  %2. Validación de la desigualdad triangular:
  %Cualquier lado debe ser menor que la suma de los otros dos
  if (a >= b + c || b >= a + c || c >= a + b)
    error('Los lados proporcionados no cumplen la desigualdad triangular.');
  endif

  %3. Cálculo del semiperímetro p
  p = (a + b + c) / 2;

  %4. Cálculo del área mediante la fórmula de Herón
  A = sqrt(p * (p-a) * (p - b) * (p - c));
endfunction

