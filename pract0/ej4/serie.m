function suma = serie(f,epsilon)
  n = 0;
  suma = 0;

  while f(n) >= epsilon
    suma = suma + f(n);
    n = n+1;
  end
  suma = suma + f(n);
end

