function m = maximo(A)
  m = A(1,1);
  [a,b] = size(A);
  for i = 1:a
    for j = 1:b
      if A(i,j) > m
        m = A(i,j);
      end
    end
  end
end

