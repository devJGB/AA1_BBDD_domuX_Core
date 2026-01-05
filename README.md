# AA1_BBDD_domuX_Core
Trabajo primera evaluación de Bases de Datos. 

# DomuX_core

**DomuX_core** es un sistema de gestión de viviendas inteligentes que centraliza el control y monitoreo de dispositivos domóticos como sensores, actuadores y rutinas automatizadas. Permite gestionar viviendas, habitaciones, dispositivos y automatizaciones de forma coherente y escalable.

## Estructura de la Base de Datos

La base de datos de DomuX_core está organizada en varias tablas principales:

- **users**: Información de los usuarios del sistema.
- **dwelling**: Datos de las viviendas, incluyendo dirección, tipo de vivienda, superficie, y usuario propietario.
- **rooms**: Habitaciones de cada vivienda que tienen dispositivos.
- **devices**: Dispositivos instalados en cada habitación, como sensores y actuadores (Tabla padre).
- **device_sensors**: Tipos de sensores asociados a cada dispositivo (Tabla hija).
- **device_actuators**: Tipos de actuadores asociados a cada dispositivo (Tabla hija) .
- **device_device**: Relaciones entre dispositivos (por ejemplo, dispositivos vinculados entre sí).
- **routines**: Rutinas de automatización.
- **actions**: Acciones asociadas a cada rutina.
- **device_routine**: Asociación de dispositivos con rutinas y días de la semana que se ejcuta.

---------------------------------------------------------------------------------------
# Diseño Entidad_Relación

![Diseño del modelo Entidad-relación de DomuX_COre](Diseño_entidadRelacion_DomuX_Core.bmp)
