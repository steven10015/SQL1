# SQL Queries + Logical Analysis with Python

Welcome to the Global Institute of Life (GIL)! This fictional center monitors ecosystems around the planet to protect biodiversity, understand climate change, and make data-driven decisions.

In your new role as a junior data analyst, you will gain access to a database with historical and current information about:

- Natural regions of the world.
- Flora and fauna species.
- Climatic conditions by region.
- Species observation records.

Your mission will be to execute SQL queries to understand, explore, and detect relevant patterns. As you progress, you will be able to visualize some of your findings using pandas.


## Understand the structure of your project template

The database is loaded and ready for your analysis. The provided files are:

Once you have completed the previous steps, you will have created your SQL database, but there are no tables yet. Next, you need to connect to your empty database and create some tables using Python through SQL scripts found in the `./src/sql/` folder:

- `./src/sql/create.sql` Contains the tables you need: `regions, species, climate, observations`.
- `./src/sql/insert.sql` Inserts realistic but fictitious records.
- `./src/sql/queries.sql` Is empty and ready for you to fill.
- `./src/app.py` → Contains the database configuration and functions to execute SQL scripts.

Other important things to mention about the structure:

- Professional projects often have a `./src` folder that contains all the **code files** (the files the programmer will implement).
- `./assets` is irrelevant to you; it contains all the images we needed for this tutorial.
- The root of any professional project usually contains all the configuration files like `.gitignore`, `requirements.txt`, etc. You will learn more about these files throughout the project.


## 📝 Instructions

Below, you will find real missions from the institute, each designed to develop a different type of SQL query.

1. Open the file `./src/sql/queries.sql` and write the queries as you solve them.

2. **Mission 1:** We want to know the biodiversity of each region. Which regions have the most recorded species?

    > Use GROUP BY and COUNT(DISTINCT ...).

3. **Mission 2:** Climate change is a constant concern. We want to list the regions with extreme climates:

    - Average temperatures > 40 °C or < -10 °C
    - Precipitation < 100 mm

    > Use conditions with WHERE, OR, and relational operators.

4. **Mission 3:** Detect species at risk. There are species whose current population is below 20% of their historical maximum population. Which ones are they?

5. **Mission 4:** Which region has the highest number of distinct observed species?

    > Hint: a JOIN between observations and species, followed by a GROUP BY.

6. **Mission 5:** Which species have been observed most frequently?

    > Use COUNT(*) and sort the results to show the most observed ones.

