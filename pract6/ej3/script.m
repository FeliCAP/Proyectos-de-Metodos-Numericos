% Script de prueba para la función montecarlo
valor_exacto = pi / 4;
N_vals = [10^3, 10^4, 10^5, 10^6];

fprintf('N          Aproximacion q     Error absoluto     Error relativo\n');
fprintf('----------------------------------------------------------------\n');

for k = 1:length(N_vals)
    N = N_vals(k);

    % Promedio de 10 ejecuciones independientes
    q_acum = 0;
    num_corridas = 10;
    for c = 1:num_corridas
        q_acum = q_acum + montecarlo(N);
    end
    q_prom = q_acum / num_corridas;

    err_abs = abs(q_prom - valor_exacto);
    err_rel = err_abs / valor_exacto;

    fprintf('%-10d %-18.8f %-18.6e %-18.6e\n', N, q_prom, err_abs, err_rel);
end
