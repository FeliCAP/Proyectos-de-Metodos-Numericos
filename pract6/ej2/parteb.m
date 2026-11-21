g = @(t) 2 * exp(t.^2);
a = 0;
b = 1;
I_exact = integral(g, a, b);
n_vals = [10^2, 10^3, 10^4, 10^5, 10^6];

fprintf('n   |   q   |   Error\n');
for k = 1:length(n_vals)
    n = n_vals(k);
    q = trapecio(g, a, b, n);
    error = abs(q - I_exact);
    fprintf('%d | %f | %e\n', n, q, error);
end
