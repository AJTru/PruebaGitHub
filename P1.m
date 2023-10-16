pkg load database
conn = pq_connect(setdbopts('dbname','EXAMEN_P1','host','localhost','port','5432','user','postgres','password','alexj2020'))

    while true
        disp('1. Agregar Estudiante');
        disp('2. Editar Estudiante');
        disp('3. Eliminar Estudiante');
        disp('4. Salir');
        eleccion = input('Ingrese su elección: ', 's');

        if eleccion == "1"
            try
                id_estudiante = input('Ingrese el ID del estudiante: ');
                nombre = input('Ingrese el nombre del estudiante: ', 's');
                edad = input('Ingrese la edad del estudiante: ');
                genero = input('Ingrese el género del estudiante: ', 's');
                direccion = input('Ingrese la dirección del estudiante: ', 's');
                %estudiante = {id_estudiante, nombre, edad, genero, direccion};
                %estudiantes = [estudiantes; estudiante];
                disp('Estudiante agregado.');

                insert_query = sprintf("INSERT INTO estudiantes (carnet, nombre, edad, genero, direccion) VALUES (%d,'%s',%d,'%s','%s')", id_estudiante, nombre, edad, genero, direccion);
                pq_exec_params(conn, insert_query);


            catch
                disp('Error en el ingreso de datos. Por favor, intente nuevamente.');
            end

        elseif eleccion == "2"

            try

                id_estudiante = input('Ingrese el ID del estudiante a editar: ');


                    nombre = input('Ingrese el nuevo nombre del estudiante: ', 's');
                    edad = input('Ingrese la nueva edad del estudiante: ');
                    genero = input('Ingrese el nuevo género del estudiante: ', 's');
                    direccion = input('Ingrese la nueva dirección del estudiante: ', 's');
                    %estudiantes{indice, 2} = nombre;
                    %estudiantes{indice, 3} = edad;
                    %estudiantes{indice, 4} = genero;
                    %estudiantes{indice, 5} = direccion;
                    %disp('Información del estudiante actualizada.');

                    update_query = sprintf("UPDATE estudiantes SET nombre='%s', edad=%d, genero='%s', direccion='%s' WHERE carnet=%d", nombre, edad, genero, direccion, id_estudiante);
                    pq_exec_params(conn, update_query);

            catch
                disp('Error en el ingreso de datos. Por favor, intente nuevamente.');
            end

        elseif eleccion == "3"
            try
                id_estudiante = input('Ingrese el ID del estudiante a eliminar: ');

                   delete_query = sprintf("DELETE FROM estudiantes WHERE carnet= %d", id_estudiante);
                   pq_exec_params(conn, delete_query);

                    disp('Estudiante eliminado.');

            catch
                disp('Error en el ingreso de datos. Por favor, intente nuevamente.');
            end

        elseif eleccion == '4'
            disp('Saliendo del programa.');

            break;

        else
            disp('Opción no válida. Por favor, elija una opción válida.');
        end
    end


            %insert_query = sprintf("INSERT INTO estudiantes (id, nombre, edad, genero, direccion) VALUES (%d,'%s',%d,'%s','%s')", id_estudiante, nombre, edad, genero, direccion);
            %pq_exec_params(conn, insert_query);

            N = pq_exec_params(conn, 'SELECT * FROM estudiantes;');
            disp(N);

            %update_query = sprintf("UPDATE estudiantes SET nombre='%s', edad=%d, genero='%s', direccion='%s' WHERE id=%d", nuevo_nombre, nueva_edad, nuevo_genero, nueva_direccion, id_estudiante);


