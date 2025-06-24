# Consultas SQL + Análisis lógico con Python

¡Bienvenido/a al Instituto Global de la Vida (IGV)! Este centro ficticio monitorea ecosistemas alrededor del planeta para proteger la biodiversidad, entender patrones en la observación de especies y tomar decisiones con base en datos reales.

En tu nuevo rol como analista de datos junior, vas a recibir acceso a una base con información histórica y actual sobre:

- Conocer la biodiversidad por región
- Identificar especies muy observadas (o poco observadas)
- Analizar la actividad de los observadores
- Detectar patrones en el tiempo y el espacio

Tu misión será ejecutar consultas SQL para entender, explorar y detectar patrones relevantes. A medida que avances, podrás visualizar algunos de tus hallazgos usando pandas


## Comprende la estructura de la plantilla de tu proyecto

La base de datos está cargada y lista para tu análisis. Los archivos provistos son:

- `./src/sql/create.sql` Tiene las tablas que necesitas: `regions, species, climate, observations`
- `./src/sql/insert.sql` Inserta registros obtenidos de una muestra proporcionada por [EOD – eBird Observation](https://www.gbif.org/occurrence)
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

3. **Misión 2:** ¿Qué meses tienen mayor actividad de observación? Agrupa por mes a partir de las fechas de observación reales. Es útil para detectar estacionalidad.

4. **Misión 3:** Detecta las especies con pocos individuos registrados (posibles casos raros).

5. **Misión 4:** ¿Qué región tiene el mayor número de especies distintas observadas?

6. **Misión 5:** ¿Qué especies han sido observadas con mayor frecuencia?
7. **Misión 6:** Queremos identificar a los observadores más activos. ¿Quiénes son las personas que más registros de observación han realizado?
8. **Misión 7:** ¿Qué especies no han sido observadas nunca? Comprueba si existen especies en la tabla `species` que no aparecen en `observations`.
9. **Misión 8:** ¿En qué fechas se observaron más especies distintas? Esta informacion es ideal para explorar la biodiversidad máxima en días específicos.






