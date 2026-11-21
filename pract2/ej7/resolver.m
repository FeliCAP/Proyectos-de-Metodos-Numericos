function [x,y] = resolver(N)
  %%Datos
  a = 0;
  b_lim = 5;
  alpha = 0;
  beta = sin(5);

  %Partición
  if N != 50
    N = 5;
  endif
  h = (b_lim-a)/N;
  x = linspace(a,b_lim,N+1);
  x_int = x(2:N);

  f = @(x)sin(x).*(exp(x)-1);
  g = @(x)exp(x);

  %Montar las diagonales de mi matriz
  diagonalprincipal = h^2*g(x_int)-2;
  diagonalinferior = ones(N-2,1);
  diagonalsuperior = ones(N-2,1);

  A = diag(diagonalprincipal)+diag(diagonalsuperior,1)+diag(diagonalinferior,-1);

  %Vector fuente
  b = (f(x_int)*h^2)';
  b(1) = b(1) - alpha;
  b(N-1) = b(N-1) - beta;

  %Solucional SEL
  y_interior = A\b;
  y = [alpha;y_interior;beta];
