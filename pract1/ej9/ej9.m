function ej9()
close all; clear all;
%Calculo valores "exactos" de la integral
n_max = 20;
p_exact = zeros(n_max,1);
n_vals = (1:n_max)';

for k=1:length(n_vals)
  n=n_vals(k);
  f = @(x) x.^n .* exp(x);
   p_exact(k) = quad(f, 0, 1);   % Integro numéricamente
end


printf("######################################################\n")
printf("\t\t RECURRENCIA HACIA ADELANTE\n")
printf("######################################################\n\n")

# Calculo recurrencia hacia adelante
forward_rec = @(x,n) (e-(n+1)*x);
p_forward = zeros(n_max,1);
err_forward = zeros(n_max,1);



p_n = 1;
p_forward(1) = p_n;
err_forward(1) = abs(p_n - p_exact(1))/p_exact(1); %Error relativo

printf("n \t| p_n \t\t| error relativo \n")
printf("------------------------------------------ \n")
printf("%d \t| %d \t\t| %d\n",1,p_n,err_forward(1))

for k = 1:length(n_vals)-1
  n = n_vals(k);
  p_n = forward_rec(p_n,n);
  p_forward(k+1) = p_n;
  err_forward(k+1) = abs(p_n - p_exact(k+1))/p_exact(k+1);
  printf("%d \t| %d \t| %d\n",n+1,p_n,err_forward(k+1))
end

err_plot = max(err_forward, eps);   % evito log(0)

err_bound = factorial(n_vals)*eps/2;

figure; hold on;
semilogy(n_vals, err_plot, '-o', 'LineWidth', 1.5)
semilogy(n_vals, err_bound, '-o', 'LineWidth', 1.5)
xlabel('n', 'FontSize', 24)
ylabel('|Error relativo|', 'FontSize', 24)
title('Error relativo en recurrencia hacia adelante', 'FontSize', 24)
grid on
legend('Real','Estimado (n!*eps/2)', 'Location', 'northeast', 'FontSize', 16)
set(gca, 'FontSize', 20)


##################################################################
p_n = 20;
backward_rec = @(x,n) (e-x)/(n+1);
printf("\n")
printf("######################################################\n")
printf("\t\t RECURRENCIA HACIA ATRÁS\n")
printf("######################################################\n\n")

err_backward = abs(p_n -p_exact(n_max))/p_exact(n_max);

printf("n \t| p_n \t\t|  error relativo\n")
printf("------------------------------------------ \n")
printf("%d \t| %d \t| %d\n",20,p_n,err_backward)

for n = n_max:-1:2
  p_n = backward_rec(p_n,n);
  err_backward = abs(p_n -p_exact(n))/p_exact(n);
  printf("%d \t| %d \t| %d\n",n-1,p_n,err_backward)
end

% Recurrencia hacia atrás: p_n = (e - p_{n+1}) / (n+1)
% Cambio valores en n = 20 para comprarar estabilidad

starts = [1/8, 20, 100];     % tres valores diferentes para p_20
n = (1:n_max)';              % n = 1,...,20

figure; hold on; grid on;

markers = {'-o','-s','-^'};
legendEntries = cell(1,length(starts));

set(gca, 'FontSize', 14)

for k = 1:length(starts)
    p = zeros(n_max,1);        % p(i) guarda p_{i-1}, i.e. p(1)=p_1, ..., p(20)=p_20
    p(n_max) = starts(k);      % fijo p_20

    % Recursión hacia atrás: calculo p_19, p_18, ..., p_1
    for idx = n_max-1:-1:1         % idx corresponde a n = idx-1
        p(idx) = (e - p(idx+1)) / idx;
    end

    err = abs(p - p_exact)./(p_exact);
    plot(n, p, markers{k}, 'LineWidth', 2, 'MarkerSize', 6)
    #semilogy(n, err, markers{k}, 'LineWidth', 2, 'MarkerSize', 6)
    legendEntries{k} = sprintf('p_{20} = %.4g', starts(k));
end

xlabel('n', 'FontSize', 20)
ylabel('p_n', 'FontSize', 20)
title('Recurrencia hacia atrás p_n = (e - p_{n+1})/(n+1) para diferentes p_{20}', 'FontSize', 20)
legend(legendEntries, 'Location', 'northeast', 'FontSize', 16)

set(gca, 'XDir', 'reverse')   % opcional: mostrar n decreciendo de izq a der
hold off;
end
