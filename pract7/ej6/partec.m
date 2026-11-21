alpha = 2;
lambda = alpha * i; % Unidad imaginaria en Octave
y0 = 1;
T = 10;
pasos = [0.1, 0.25, 0.6]; % Dos estables (h < 0.5) y uno inestable (h > 0.5)

figure('Name', 'Metodo Leapfrog con lambda imaginario puro (lambda = 2i)');

for idx = 1:length(pasos)
    h = pasos(idx);
    N = round(T / h);
    t = (0:N) * h;
    y_exacta = exp(lambda * t);

    % 1. Leapfrog arrancando y1 con Euler hacia adelante
    y_lf_ad = zeros(1, N+1);
    y_lf_ad(1) = y0;
    y_lf_ad(2) = y0 + h * lambda * y0;
    for k = 2:N
        y_lf_ad(k+1) = y_lf_ad(k-1) + 2 * h * lambda * y_lf_ad(k);
    end

    % 2. Leapfrog arrancando y1 con Euler hacia atras
    y_lf_at = zeros(1, N+1);
    y_lf_at(1) = y0;
    y_lf_at(2) = y0 / (1 - h * lambda);
    for k = 2:N
        y_lf_at(k+1) = y_lf_at(k-1) + 2 * h * lambda * y_lf_at(k);
    end

    % Columna izquierda: Parte Real Re(y(t))
    subplot(length(pasos), 2, 2*idx - 1);
    plot(t, real(y_exacta), 'k-', 'LineWidth', 1.5); hold on;
    plot(t, real(y_lf_ad), 'bo--', 'MarkerSize', 3);
    plot(t, real(y_lf_at), 'rx:', 'MarkerSize', 3);
    grid on;
    title(sprintf('Parte Real - h = %.2f', h));
    xlabel('t'); ylabel('Re(y)');
    if idx == 1
        legend('Exacta cos(2t)', 'y_1 Euler adelante', 'y_1 Euler atras', 'Location', 'southwest');
    end

    % Columna derecha: Parte Imaginaria Im(y(t))
    subplot(length(pasos), 2, 2*idx);
    plot(t, imag(y_exacta), 'k-', 'LineWidth', 1.5); hold on;
    plot(t, imag(y_lf_ad), 'bo--', 'MarkerSize', 3);
    plot(t, imag(y_lf_at), 'rx:', 'MarkerSize', 3);
    grid on;
    title(sprintf('Parte Imaginaria - h = %.2f', h));
    xlabel('t'); ylabel('Im(y)');
end
