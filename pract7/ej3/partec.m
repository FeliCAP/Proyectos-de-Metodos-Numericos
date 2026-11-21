%|e| = C * h^alpha, log(|e|) = log(C) + alpha * log(h)

A = [ones(length(pasos), 1), log(pasos(:))];
coef_ad = A \ log(error_ad(:));
coef_at = A \ log(error_at(:));
coef_tr = A \ log(error_tr(:));

%La segunda componente es la pendiente: el orden experimental alpha
orden_ad = coef_ad(2);
orden_at = coef_at(2);
orden_tr = coef_tr(2);

fprintf('Orden de Euler adelante: %.4f\n', orden_ad);
fprintf('Orden de Euler atrás:    %.4f\n', orden_at);
fprintf('Orden del trapecio:      %.4f\n', orden_tr);
