function y=f(x)
  y = zeros(size(x));
  pos = (x>0);
  y(pos) = 1/(1+exp(-x(pos)));
  t = exp(x(!pos));
  y(!pos) = t/(1+t);
endfunction

