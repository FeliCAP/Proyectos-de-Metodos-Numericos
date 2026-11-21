function B = intercambio(A,n,m)
  B = A;
  aux = B(n,:);
  B(n,:) = B(m,:);
  B(m,:) = aux;
end

