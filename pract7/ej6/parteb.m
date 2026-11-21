lambda = -2;
y0 = 1;
T = 10;
pasos = [0.25, 0.1, 0.05];

figure('Name', 'Estabilidad absoluta del metodo Leapfrog (lambda < 0)');

for idx = 1:length(pasos)
    h = pasos(idx);
    N = round(T / h);
    t = (0:N) * h;
    y_exacta = exp(lambda * t);

    % 1. Leapfrog arrancando y1 con Euler hacia adelante
    y_lf_ad = zeros(1, N+1);
    y_lf_ad(1) = y0;
    y_lf_ad(2) = y0 + h * lambda * y0; % Euler adelante
    for k = 2:N
        y_lf_ad(k+1) = y_lf_ad(k-1) + 2 * h * lambda * y_lf_ad(k);
    end

    % 2. Leapfrog arrancando y1 con Euler hacia atras
    y_lf_at = zeros(1, N+1);
    y_lf_at(1) = y0;
    y_lf_at(2) = y0 / (1 - h * lambda); % Euler atras
    for k = 2:N
        y_lf_at(k+1) = y_lf_at(k-1) + 2 * h * lambda * y_lf_at(k);
    end

    % Grafica comparativa para cada paso h
    subplot(length(pasos), 1, idx);
    plot(t, y_exacta, 'k-', 'LineWidth', 1.5); hold on;
    plot(t, y_lf_ad, 'bo--', 'MarkerSize', 4);
    plot(t, y_lf_at, 'rx:', 'MarkerSize', 4);
    grid on;
    ylim([-2, 2]);
    title(sprintf('Metodo Leapfrog con \\lambda = %d y paso h = %.2f', lambda, h));
    xlabel('t');
    ylabel('y(t)');
    legend('Exacta e^{-2t}', 'y_1 con Euler adelante', 'y_1 con Euler atras', 'Location', 'northwest');
end
