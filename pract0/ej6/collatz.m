function v = collatz(m)
  v = zeros(1,200);
  v(1) = m;
  n = 1;
  while v(n) ~= 1 && n < 200
    if mod(v(n),2) == 0;
      v(n+1) = v(n)/2;
    else
      v(n+1) = 3*v(n) + 1;
    end
    n = n+1;
  end
  v = v(1:n); %Eliminamos los ceros que no usamos en la recorrida
end

