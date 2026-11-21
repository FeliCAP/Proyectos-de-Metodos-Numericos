t = (1:25)';
y = [ 5.0291 6.5099 5.3666 4.1272 4.2948 ...
      6.1261 12.5140 10.0502 9.1614 7.5677 ...
      7.2920 10.0357 11.0708 13.4045 12.8415 ...
      11.9666 11.0765 11.7774 14.5701 17.0440 ...
      17.0398 15.9069 15.4850 15.5112 17.6572]';

A = [ones(size(t)), t];

%(A' * A) * beta = A' * y
AtA = A' * A;
Aty = A' * y;
beta = AtA \ Aty;

y_tk = A * beta;
r = y_tk - y;

figure;
plot(t, r, 'o-', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
grid on;
xlabel('t_k');
ylabel('Residuo y(t_k) - y_k');
title('Parte a)');
