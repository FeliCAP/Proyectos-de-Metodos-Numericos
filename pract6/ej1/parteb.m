% Script para probar la función trapecio y verificar el orden de convergencia
f = @(x) 2 ./ (1 + x.^2);
a = -1;
b = 1;
valor_exacto = pi;

% Lista de valores de n (duplicando n en cada paso)
N_vals = [10, 20, 40, 80, 160, 320, 640];
num_tests = length(N_vals);

errores = zeros(1, num_tests);

fprintf('%-8s %-18s %-18s %-12s\n', 'n', 'Aproximacion q', 'Error absoluto', 'Cociente err(n)/err(2n)');
fprintf('--------------------------------------------------------------------\n');

for k = 1:num_tests
    n = N_vals(k);
    q = trapecio(f, a, b, n);
    errores(k) = abs(valor_exacto - q);

    if k == 1
        fprintf('%-8d %-18.12f %-18.6e %-12s\n', n, q, errores(k), '-');
    else
        ratio = errores(k-1) / errores(k);
        fprintf('%-8d %-18.12f %-18.6e %-12.4f\n', n, q, errores(k), ratio);
    end
end

% Verificación gráfica del orden (gráfico log-log)
figure;
loglog(N_vals, errores, 'o-', 'LineWidth', 1.5, 'DisplayName', 'Error trapecio');
hold on;
% Línea de referencia O(1/n^2)
loglog(N_vals, errores(1)*(N_vals(1)./N_vals).^2, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Pendiente teórica O(1/n^2)');
grid on;
xlabel('n (número de subintervalos)');
ylabel('Error absoluto');
title('Verificación del orden de la regla del trapecio compuesta');
legend('Location', 'northeast');
