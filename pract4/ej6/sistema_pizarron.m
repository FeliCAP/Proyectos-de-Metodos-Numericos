% Función del sistema de ecuaciones
function F = sistema_pizarron(vars)
    alpha = vars(1);
    gamma = vars(2);

    l1 = 1;
    l2 = 1.5;
    L_target = 5;

    term = pi - gamma - alpha;

    % Ecuación 1: Largo máximo igual a 5m
    F(1) = l2 / sin(term) + l1 / sin(alpha) - L_target;

    % Ecuación 2: Condición de ángulo óptimo (derivada nula)
    F(2) = (l2 * cos(term)) / (sin(term)^2) - (l1 * cos(alpha)) / (sin(alpha)^2);
end

% Punto inicial aproximado [alpha_0, gamma_0]
vars0 = [0.5, 2.0];

% Resolución con fsolve
sol = fsolve(@sistema_pizarron, vars0);

alpha_min = sol(1);
gamma_min = sol(2);

fprintf('Ángulo óptimo alpha = %.4f rad (%.2f°)\n', alpha_min, alpha_min*180/pi);
fprintf('Ángulo mínimo gamma = %.4f rad (%.2f°)\n', gamma_min, gamma_min*180/pi);
