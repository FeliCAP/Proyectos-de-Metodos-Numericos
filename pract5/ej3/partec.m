t = (1:25)';
y = [ 5.0291 6.5099 5.3666 4.1272 4.2948 ...
      6.1261 12.5140 10.0502 9.1614 7.5677 ...
      7.2920 10.0357 11.0708 13.4045 12.8415 ...
      11.9666 11.0765 11.7774 14.5701 17.0440 ...
      17.0398 15.9069 15.4850 15.5112 17.6572]';

%Descartar el valor atípico k = 7
id = [1:6, 8:25]';
t_filtrado = t(id);
y_filtrado = y(id);
A = [ones(size(t_filtrado)), t_filtrado, sin(t_filtrado)];

%(A' * A) * beta = A' * y
AtA = A' * A;
Aty = A' * y_filtrado;
beta = AtA \ Aty;

fprintf('Parte c)\n');
fprintf('beta1 = %f\n', beta(1));
fprintf('beta2 = %f\n', beta(2));
fprintf('beta3 = %f\n', beta(3));
