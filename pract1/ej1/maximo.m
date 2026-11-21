function x = maximo()
  x = 1;
  while x * 2 < Inf
    x = x * 2;
  endwhile
  x = x * (2 - 2^(-52));
end

