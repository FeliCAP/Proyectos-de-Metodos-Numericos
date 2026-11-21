function x = resolver()
   % x = resolver() devuelve el vector de estado estacionario x.

  % Matriz A del sistema (3 ecuaciones de transicion + 1 de normalizacion)
  A = [  0.5, -0.3, -0.2, -0.1;
        -0.2,  0.6, -0.3, -0.1;
        -0.2, -0.2,  0.6, -0.2;
         1.0,  1.0,  1.0,  1.0 ];

  % Vector del lado derecho b
  b = [0; 0; 0; 1];

  % Resolver el sistema de forma directa usando backslash
  x = A \ b;
end
