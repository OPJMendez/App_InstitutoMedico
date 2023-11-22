# Gestion de citas médicas

El Instituto Medico 'Salud Colombia', requiere un sistema para gestionar los
pacientes, El paciente debe estar en la capacidad de registrarse en la
plataforma, solicitar una cita con el médico deseado, y después de su cita poder
calificar la atención recibida y observar los comentarios realizados por parte
del profesional de la salud. Los médicos pueden ver los pacientes que tiene
asignados junto con la retroalimentación realizada en cada una de las citas, con
el fin de poder estudiarlos y ofrecer al paciente un resumen sobre su estado de
salud.

El médico debe estar en la capacidad de gestionar sus citas crear observaciones
realizadas al paciente.

# Requerimientos Funcionales:

**Registro:**

- Los pacientes deben poder registrarse en la plataforma proporcionando
  información personal.

**Login:**

- El sistema debe permitir la creación de un usuario y contraseña para el acceso
  a la plataforma.

**Solicitud de Citas**:

- El usuario debe poder solicitar citas con médicos específicos, seleccionando
  fecha y hora disponibles.

**Calificación de Atención**:

- Permitir a los pacientes calificar la atención recibida después de cada cita
  médica.

**Visualización de Comentarios**:

- Posibilidad de ver los comentarios y observaciones realizadas por los médicos
  después de cada cita.

3- Gestión de Citas por Médicos:

-> Los médicos deben poder gestionar sus propias citas, incluyendo crear y
modificar citas.

-> Deben poder agregar o modificar los comentarios relacionados con la atención
brindada a cada paciente.

# Requerimientos No Funcionales:

1- Seguridad:

-> Los datos de pacientes y médicos deben estar protegidos mediante medidas de
seguridad adecuadas.

2- Usabilidad:

-> La plataforma debe ser fácil de usar tanto para los médicos como para los
pacientes.

3- Rendimiento:

-> El sistema debe manejar la carga de gestionar citas y comentarios sin demoras
significativas.

4- Disponibilidad:

-> El sistema debe estar disponible para los usuarios en todo momento, dado que
se maneja por orden de llegada.

5- Capacidad de Atención:

-> La cantidad máxima de pacientes atendidos por cada médico debe ser gestionada
y no debe ser excedida.

## Alcance del proyecto

Implementación de un sistema de gestion de citas que permita al personal del
instituto médico y a sus clientes tener un control acerca de sus solicitudes
médicas.

## Datos aparte

Roles: Admin, Medico, Paciente.

Admin: registra, agendar citas (CRUD), alterar estados (Activo, Inactivo,)

Medico - Activo, inactivo, disponible, no disponible Paciente, estados: Activo,
inactivo

Citas estados: asignadas,atendida , cancelada
