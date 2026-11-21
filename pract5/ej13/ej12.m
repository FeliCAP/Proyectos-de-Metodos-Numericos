% Valores de delta a evaluar (incluyendo sqrt(eps) y eps)
eps_M = eps; % Precisión de máquina (~ 2.22e-16 en doble precisión)
deltas = [1e-1, 1e-4, sqrt(eps_M), 1e-12, eps_M, 1e-18];

fprintf('===========================================================================\n');
fprintf('  delta       | Error Eq. Normales  | Error Householder QR | Error SVD      \n');
fprintf('===========================================================================\n');

for d = deltas
    % Matriz A y vector b
    A = [1, 1, 1;
         d, 0, 0;
         0, d, 0;
         0, 0, d];
    b = [1; 0; 0; 0];

    % Solución exacta de la parte a)
    x_exact = (1 / (3 + d^2)) * ones(3, 1);
    norm_exact = norm(x_exact, 2);

    % --- i) Ecuaciones Normales ---
    % (A'*A) * x = A'*b
    AtA = A' * A;
    Aty = A' * b;
    x_eq_norm = AtA \ Aty;
    err_eq_norm = norm(x_eq_norm - x_exact, 2) / norm_exact;

    % --- ii) Factorización QR (Householder) ---
    [Q, R] = qr(A, 0); % QR reducida (equivalente a Householder)
    x_qr = R \ (Q' * b);
    err_qr = norm(x_qr - x_exact, 2) / norm_exact;

    % --- iii) Descomposición SVD ---
    [U, S, V] = svd(A, 'econ');
    x_svd = V * (S \ (U' * b));
    err_svd = norm(x_svd - x_exact, 2) / norm_exact;

    fprintf(' %10.2e |    %12.4e     |     %12.4e     |  %12.4e\n', ...
            d, err_eq_norm, err_qr, err_svd);
end
fprintf('===========================================================================\n');
