% Definicion del problema: y' = -2*t*y^2*(1+t) - y/(1+t), y(0) = 1
f = @(t,y) -2*t*y^2*(1+t) - y/(t+1);
y0 = 1;
h = 0.1;

N = round(1/h);
t = (0:N)*h;

y_tr = zeros(1, N+1);
y_tr(1) = y0;

for k = 2:N+1
    % Valor inicial para la iteracion de punto fijo
    y_tr(k) = y_tr(k-1);

    % Funcion de iteracion de punto fijo del metodo del trapecio
    g = @(y) y_tr(k-1) + (h/2) * (f(t(k-1), y_tr(k-1)) + f(t(k), y));

    % Hacemos solo tres iteraciones de punto fijo
    for l = 1:3
        y_tr(k) = g(y_tr(k));
    end
end

y_aprox = y_tr(end);
y_exacta = 1/4;
error_abs = abs(y_exacta - y_aprox);

fprintf('Valor aproximado y(1): %.8f\n', y_aprox);
fprintf('Valor exacto     y(1): %.8f\n', y_exacta);
fprintf('Error absoluto       : %.5e\n', error_abs);
