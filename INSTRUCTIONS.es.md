# Consultas SQL + Análisis lógico con Python

¡Bienvenido/a al Instituto Global de la Vida (IGV)! Este centro ficticio monitorea ecosistemas alrededor del planeta para proteger la biodiversidad, entender el cambio climático y tomar decisiones con base en datos.

En tu nuevo rol como analista de datos junior, vas a recibir acceso a una base con información histórica y actual sobre:

- Regiones naturales del mundo.
- Especies de flora y fauna.
- Condiciones climáticas por región.
- Registros de observación de especies.

Tu misión será ejecutar consultas SQL para entender, explorar y detectar patrones relevantes. A medida que avances, podrás visualizar algunos de tus hallazgos usando pandas


## Comprende la estructura de la plantilla de tu proyecto

La base de datos está cargada y lista para tu análisis. Los archivos provistos son:

Una vez hayas completado los pasos anteriores, habrás creado tu base de datos SQL, pero aún no hay tablas. A continuación, debes conectarte a tu base de datos vacía y crearás algunas tablas usando Python mediante scripts SQL que encontrarás en la carpeta `./src/sql/`:

- `./src/sql/create.sql` Tiene las tablas que necesitas: `regions, species, climate, observations`
- `./src/sql/insert.sql` inserta registros realistas pero ficticios.
- `./src/sql/queries.sql` está vacío y listo para que lo llenes.
- `./src/app.py` → Contiene la configuración de la base de datos y funciones para ejecutar scripts SQL.

Otras cosas importantes a mencionar sobre la estructura:

- Los proyectos profesionales suelen tener una carpeta `./src` que contiene todos los **archivos de código** (los archivos que implementará el programador).
- `./assets` es irrelevante para ti, contiene todas las imágenes que necesitábamos para este tutorial.
- La raíz (*root*) de cualquier proyecto profesional suele contener todos los archivos de configuración como `.gitignore`, `requirements.txt`, etc. Aprenderás más sobre estos archivos durante el resto del proyecto.


## 📝 Instrucciones

A continuación, encontrarás misiones reales del instituto, cada una diseñada para desarrollar un tipo distinto de consulta SQL.

1. Abre el archivo `./src/sql/queries.sql` y escribe las consultas que vayas resolviendo. Separa cada consulta con un punto y coma `;`.

    **Ejemplo:**
    ```sql
    -- Contar especies por región
    SELECT r.name, COUNT(*) 
    FROM species s 
    JOIN regions r ON s.region_id = r.id 
    GROUP BY r.name;

    -- Detectar temperaturas extremas
    SELECT * FROM climate WHERE avg_temperature > 40 OR avg_temperature < -10;
    ```

    Cuando termines una o más consultas, ejecuta el siguiente comando en la terminal para ver los resultados:

    ```bash
    python src/app.py
    ```

    Esto correrá automáticamente cada una de tus consultas y mostrará el resultado en la terminal como una tabla con Pandas.

    > 💡 **Puedes modificar `queries.sql` tantas veces como necesites** y volver a ejecutar el comando para ver los nuevos resultados.


2. **Misión 1:** Queremos conocer la biodiversidad de cada región. ¿Qué regiones tienen más especies registradas?

3. **Misión 2:** El cambio climático es una preocupación constante. Queremos listar las regiones con climas extremos:

    - Temperaturas medias > 40 °C o < -10 °C
    - Precipitaciones < 100 mm

4. **Misión 3:** Detecta las especies en riesgo. Hay especies cuya población actual está por debajo del 20% de su población histórica máxima. ¿Cuáles son?

5. **Misión 4:** ¿Qué región tiene el mayor número de especies distintas observadas?

6. **Misión 5:** ¿Qué especies han sido observadas con mayor frecuencia?
7. **Misión 6:** Queremos identificar a los observadores más activos. ¿Quiénes son las personas que más registros de observación han realizado?
8. **Misión 7:** ¿Qué especies no han sido observadas nunca?
9. **Misión 8:** ¿Cuál es la temperatura media por cada región con especies observadas?


