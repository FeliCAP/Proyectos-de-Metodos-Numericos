f = @(t,y) -y^2;
y0 = 2;
pasos = [1/10, 1/20, 1/40, 1/80];
y_exacta = 2/3;

sol_ad = zeros(size(pasos));
sol_at = zeros(size(pasos));
sol_tr = zeros(size(pasos));

%(I) Método de Euler hacia adelante
for j = 1:length(pasos)
    h = pasos(j);
    N = round(1/h);
    t = (0:N)*h;
    y_ad = zeros(1, N+1);
    y_ad(1) = y0;

    for k = 2:N+1
        y_ad(k) = y_ad(k-1) + h * f(t(k-1), y_ad(k-1));
    end
    sol_ad(j) = y_ad(end);
end

%(II) Método de Euler hacia atrás
for j = 1:length(pasos)
    h = pasos(j);
    N = round(1/h);
    t = (0:N)*h;
    y_at = zeros(1, N+1);
    y_at(1) = y0;

    for k = 2:N+1
        %Valor inicial para la iteración de punto fijo
        y_at(k) = y_at(k-1);
        g = @(y) y_at(k-1) + h * f(t(k), y);
        %Iteraciones de punto fijo para resolver y_k = y_k-1 + h*f(t_k, y_k)
        for l = 1:15
            y_at(k) = g(y_at(k));
        end
    end
    sol_at(j) = y_at(end);
end

%(III) Método del trapecio
for j = 1:length(pasos)
    h = pasos(j);
    N = round(1/h);
    t = (0:N)*h;
    y_tr = zeros(1, N+1);
    y_tr(1) = y0;

    for k = 2:N+1
        %Valor inicial para la iteración de punto fijo
        y_tr(k) = y_tr(k-1);
        g = @(y) y_tr(k-1) + (h/2) * (f(t(k-1), y_tr(k-1)) + f(t(k), y));
        %Iteraciones de punto fijo para garantizar convergencia hasta precisión de maquina
        for l = 1:15
            y_tr(k) = g(y_tr(k));
        end
    end
    sol_tr(j) = y_tr(end);
end

%Evaluación de los errores globales en t = 1
error_ad = abs(y_exacta - sol_ad);
error_at = abs(y_exacta - sol_at);
error_tr = abs(y_exacta - sol_tr);

fprintf('     h          Error adelante     Error atrás      Error trapecio\n');
for j = 1:length(pasos)
    fprintf('%8.5f       %12.5e     %12.5e     %12.5e\n', pasos(j), error_ad(j), error_at(j), error_tr(j));
end
