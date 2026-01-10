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

----------------------------------------------------------------------------------------------------------------------------
# Diseño Entidad_Relación

![Diseño del modelo Entidad-relación de DomuX_COre](/images/Modelo_entidadRelacion_DomuX_Core.jpg)


# Estructura de carpetas y archivos

DomuX_core/
├─ README.md
├─ images/                               # Capturas y diagramas
│  └─ Modelo_Entidad_Relacion_DomuxCore.jpg
│
├─ design/                               # Diseño de la base de datos
│  ├─ Diseno_ER.graphml                 # Diagrama Entidad–Relación
│  └─ modelo_relacional.txt             # Modelo relacional
│
├─ database/                             # Scripts SQL del proyecto
│  ├─ create_tables.sql                 # Creación de todas las tablas
│  ├─ dump_domuxdb.sql                  # Backup completo de la base de datos
│  ├─ script_patch.sql                  # Script de actualización / parche
│  │
│  └─ queries/                          # Consultas SQL
│     ├─ script_required_15queries.sql  # 15 consultas obligatorias
│     │
│     └─ extra_queries/                 # Consultas adicionales
│        ├─ script_functions.sql        # Funciones almacenadas
│        ├─ script_joins.sql            # Consultas con JOIN
│        ├─ script_more_4_tables.sql    # Consultas con más de 4 tablas
│        ├─ script_triggers.sql         # Triggers
│        └─ script_unions_views.sql     # UNION, INTERSECT y VISTAS

## Ejecución y explicación de los scripts SQL

El proyecto **DomuX_core** incluye varios scripts SQL organizados por finalidad.  
A continuación se explica qué hace cada uno y el orden recomendado para ejecutarlos.

---

### 1️⃣ Creación de la estructura de la base de datos

**Archivo:**  
`database/create_tables.sql`

**Descripción:**  
Este script crea toda la estructura de la base de datos:
- Tablas principales y tablas intermedias
- Claves primarias y foráneas
- Relaciones entre entidades

**Cuándo ejecutarlo:**  
Debe ejecutarse **siempre en primer lugar**, ya que el resto de scripts dependen de que las tablas existan.

---

### 2️⃣ Carga de datos de ejemplo (opcional)

**Archivo:**  
`database/dump_domuxdb.sql`

**Descripción:**  
Restaura un volcado completo de la base de datos con datos de prueba:
- Usuarios
- Viviendas
- Habitaciones
- Dispositivos
- Rutinas y relaciones

**Cuándo ejecutarlo:**  
Es opcional, pero recomendable para poder probar las consultas, funciones y triggers.

> ⚠️ **Aviso:** Este script puede sobrescribir datos existentes.

---

### 3️⃣ Script de actualización / parche

**Archivo:**  
`database/script_patch.sql`

**Descripción:**  
Incluye modificaciones sobre la estructura inicial:
- Añadir nuevas columnas
- Ajustar relaciones
- Correcciones del modelo

**Cuándo ejecutarlo:**  
Solo cuando se indique o si la base de datos ya existe y necesita actualizarse.

---

### 4️⃣ Ejecución de consultas SQL

#### Consultas obligatorias

**Archivo:**  
`database/queries/script_required_15queries.sql`

**Descripción:**  
Contiene las **15 consultas obligatorias** del proyecto, donde se aplican:
- JOINs entre múltiples tablas
- GROUP BY y funciones de agregación
- Subconsultas

---

#### Consultas adicionales

**Directorio:**  
`database/queries/extra_queries/`

**Descripción:**  
Incluye consultas adicionales organizadas por temática:

- `script_joins.sql` → Consultas con JOIN
- `script_more_4_tables.sql` → Consultas con más de 4 tablas
- `script_unions_views.sql` → UNION, INTERSECT y VISTAS

---

### 5️⃣ Funciones almacenadas

**Archivo:**  
`database/queries/extra_queries/script_functions.sql`

**Descripción:**  
Define funciones almacenadas que:
- Devuelven valores calculados
- Realizan comprobaciones previas
- Encapsulan lógica reutilizable en la base de datos

**Ejemplo de uso:**
```sql
SELECT get_powerW_dwewelling(1);

### 6️⃣ Triggers

**Archivo:**  
`database/queries/extra_queries/script_triggers.sql`

**Descripción:**  
Incluye triggers que se ejecutan automáticamente ante ciertos eventos:
- `BEFORE INSERT`
- `AFTER INSERT`
- `AFTER UPDATE`

Se utilizan para:
- Calcular campos automáticamente
- Mantener la coherencia de los datos
- Evitar cálculos manuales en la aplicación

---

### 7️⃣ Orden recomendado de ejecución

1. `create_tables.sql`  
2. `dump_domuxdb.sql` (opcional)  
3. `script_patch.sql`  
4. `script_functions.sql`  
5. `script_triggers.sql`  
6. Scripts de consultas (`script_required_15queries.sql` y `extra_queries/`)

> ⚠️ **Importante:** Seguir este orden evita errores por dependencias entre tablas, funciones o triggers.

---

### 8️⃣ Entorno de ejecución

Los scripts han sido desarrollados y probados en:
- **MariaDB / MySQL**  
- Cliente SQL recomendado: **DBeaver**

**Nota:**  
Para ejecutar cada script en DBeaver:
1. Abrir el script SQL.
2. Seleccionar el esquema de base de datos correcto.
3. Ejecutar todo el script.
4. Comprobar que no aparecen errores antes de pasar al siguiente script.

> Tip: Primero crear las tablas, luego cargar datos de prueba, después aplicar funciones, triggers y finalmente ejecutar consultas.
