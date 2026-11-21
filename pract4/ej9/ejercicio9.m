function ejercicio9()
  f = @(x) exp(x) - 3;
  x_str = log(3);
  x0 = 1;

  valores_d = [1, 2, 3];

  for i = 1:length(valores_d)
      d = valores_d(i);
      fprintf('\n');
      fprintf('d = %d:\n', d);

      x = zeros(6, 1);
      e = zeros(6, 1);
      x(1) = x0;
      e(1) = x(1) - x_str;
      for k = 1:5
          x(k+1) = x(k) - f(x(k)) / d;
          e(k+1) = x(k+1) - x_str;
      end

      fprintf('k  |     x_k      |     e_k       \n');
      fprintf('----------------------------------\n'); %linea para la tabla
      for k = 0:5
          fprintf('%d  |  %f  |  %e\n', k, x(k+1), e(k+1));
      end

      %Verificacion de |e_k+1| / |e_k|^p
      if d == 2
          p = 1; %Orden lineal
          fprintf('\nVerificacion del orden lineal (p = 1):\n');
          fprintf('k  |  |e_k+1| / |e_k|^1  (Predicho = 0.5)\n');
          fprintf('-----------------------------------------\n'); %Linea para la tabla
          for k = 1:5
              division = abs(e(k+1)) / (abs(e(k))^p);
              fprintf('%d  |       %f\n', k-1, division);
          end
      elseif d == 3
          p = 2; %Orden cuadratico
          fprintf('\nVerificacion del orden cuadratico (p = 2):\n');
          fprintf('k  |  |e_k+1| / |e_k|^2\n');
          fprintf('-----------------------------------------\n'); %Linea para la tabla
          for k = 1:5
              division = abs(e(k+1)) / (abs(e(k))^p);
              fprintf('%d  |       %f\n', k-1, division);
          end
      else
          fprintf('\nEl metodo no converge para d = 1 (como se predijo en la parte a))\n');
      end
  end
end
