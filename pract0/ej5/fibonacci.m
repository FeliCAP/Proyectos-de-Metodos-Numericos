function v = fibonacci(n)
  v = zeros(1,n+1); %Crea un vector de ceros
  v(1) = 1;
  v(2) = 1;
  for i = 3:n+1
    v(i) = v(i-1) + v(i-2);
  end
end

