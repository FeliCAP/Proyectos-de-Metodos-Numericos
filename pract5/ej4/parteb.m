% Vector x e y de la parte a)
x = [9; 2; 6];
y = [-11; 0; 0];

% Vector generador de Householder u y construccion de H
u = x - y;
rho = 2 / (u' * u);
H = eye(3) - rho * (u * u');

% Calculo computacional de autovalores y autovectores mediante eig
[V, D] = eig(H);

% V contiene los autovectores en sus columnas, y D la diagonal de autovalores
disp('--- Autovalores de H (Diagonal de D) ---');
disp(diag(D));

disp('--- Matriz de autovectores V ---');
disp(V);

% Eleccion explicita de vectores no nulos:
% u_vec asociado a lambda = -1
u_vec = u;

% v_vec ortogonal a u (asociado a lambda = 1)
v_vec = [0; -3; 1];

% Verificacion de las identidades:
fprintf('\n--- Verificacion H*u == -u ---\n');
disp(H * u_vec + u_vec); % Debe ser cercano al vector nulo

fprintf('--- Verificacion H*v == v ---\n');
disp(H * v_vec - v_vec); % Debe ser cercano al vector nulo
