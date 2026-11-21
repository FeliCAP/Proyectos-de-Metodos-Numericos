function y = g(x,h)
  if h == 0
    y = -sin(x);
  else
    y = -sin(x+(h/2))*(sin(h/2))/(h/2);
  endif
endfunction

