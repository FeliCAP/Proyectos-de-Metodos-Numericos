function q = trapecio(f, a, b, n)
    h = (b - a) / n;
    x = linspace(a, b, n + 1);
    y = f(x);
    q = (h / 2) * (y(1) + 2 * sum(y(2:end-1)) + y(end));
end
