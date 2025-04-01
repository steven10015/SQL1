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

    Cuando ejecutes `app.py`, cada consulta se ejecutará automáticamente y se mostrará como un DataFrame de Pandas.

2. **Misión 1:** Queremos conocer la biodiversidad de cada región. ¿Qué regiones tienen más especies registradas?

    > Usa GROUP BY y COUNT(DISTINCT ...).

3. **Misión 2:** El cambio climático es una preocupación constante. Queremos listar las regiones con climas extremos:

    - Temperaturas medias > 40 °C o < -10 °C
    - Precipitaciones < 100 mm

    > Usa condiciones con WHERE, OR, y operadores relacionales.

4. **Misión 3:** Detecta las especies en riesgo. Hay especies cuya población actual está por debajo del 20% de su población histórica máxima. ¿Cuáles son?

5. **Misión 4:** ¿Qué región tiene el mayor número de especies distintas observadas?

    > Pista: un JOIN entre observations y species, seguido de un GROUP BY.

6. **Misión 5:** ¿Qué especies han sido observadas con mayor frecuencia?

    > Usa COUNT(*) y ordena los resultados para mostrar las más observadas.
<!-- 
🌐 Misión Abierta: Consulta libre
Usando tu curiosidad como analista, escribe una consulta que te parezca interesante. Algunas ideas:

¿Qué especies están presentes en más de una región?

¿Cuál es la temperatura promedio de cada región?

¿Cuántas observaciones hay por mes? -->

<!-- 1. Vamos a trabajr en el archivo dentro de la carpeta `src` llamado `./src/app.py`.

> NOTA: Este archivo contendrá la mayor parte del código de tu aplicación, así como la conexión a la base de datos y las consultas a la base de datos.

2. Crea una base de datos PostgreSQL tal y como se indica en la guia.

3. En tu `app.py`, programa la conexión con tu base de datos.

> NOTA: Puedes tratar de reutilizar la función de Python `connect` anteriormente facilitada.

4. Crea las tablas indicadas en `./src/sql/create.sql`.

5. Inserta los datos indicados de `./src/sql/insert.sql` en las tablas creadas en el punto anterior.

6. Usa Pandas para imprimir una de las tablas como DataFrame usando la función `read_sql` de esta librería.

-->

