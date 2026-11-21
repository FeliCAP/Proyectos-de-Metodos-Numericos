f = @(x) exp(x) ./ sqrt(x);
a = 1e-10;
b = 1;
I_exact = 2.9253;
n_vals = [10^2, 10^3, 10^4, 10^5, 10^6];

fprintf('n   |   q   |   Error\n');
for k = 1:length(n_vals)
    n = n_vals(k);
    q = trapecio(f, a, b, n);
    error = abs(q - I_exact);
    fprintf('%d | %f | %e\n', n, q, error);
end
