function suma = serie(f,N)
  suma = 0;
  for n = 0:N
    suma = suma + f(n);
  end
end

