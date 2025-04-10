# SQL Queries + Logical Analysis with Python

Welcome to the Global Institute of Life (GIL)! This fictional center monitors ecosystems around the planet to protect biodiversity, understand patterns in species observations, and make data-driven decisions.

In your new role as a junior data analyst, you will gain access to a database with historical and current information about:

- Understanding biodiversity by region
- Identifying highly observed (or rarely observed) species
- Analyzing observer activity
- Detecting patterns over time and space

Your mission will be to execute SQL queries to understand, explore, and detect relevant patterns. As you progress, you will be able to visualize some of your findings using pandas.


## Understand the structure of your project template

The database is loaded and ready for your analysis. The provided files are:

Once you have completed the previous steps, you will have created your SQL database, but it will still be empty. Next, you need to connect to your empty database and create some tables using Python through SQL scripts found in the `./src/sql/` folder:

- `./src/sql/create.sql` Contains the tables you need: `regions, species, climate, observations`
- `./src/sql/insert.sql` Inserts records obtained from a sample provided by [EOD – eBird Observation](https://www.gbif.org/occurrence)
- `./src/sql/queries.sql` is empty and ready for you to fill in.
- `./src/app.py` → Contains the database configuration and functions to execute SQL scripts.

Other important things to mention about the structure:

- Professional projects often have a `./src` folder that contains all the **code files** (the files the programmer will implement).
- `./assets` is irrelevant to you; it contains all the images needed for this tutorial.
- The root of any professional project usually contains all the configuration files like `.gitignore`, `requirements.txt`, etc. You will learn more about these files throughout the project.


## 📝 Instructions

Below, you will find real missions from the institute, each designed to develop a different type of SQL query.

1. Open the file `./src/sql/queries.sql` and write the queries you solve. Separate each query with a semicolon `;`.

     **Example:**
     ```sql
     -- Detect extreme temperatures
     SELECT * FROM climate WHERE avg_temperature > 40 OR avg_temperature < -10;
     ```

     When you finish one or more queries, run the following command in the terminal to see the results:

     ```bash
     python src/app.py
     ```

     This will automatically execute each of your queries and display the results in the terminal as a table using Pandas.

     > 💡 **You can modify `queries.sql` as many times as needed** and re-run the command to see the new results.


2. **Mission 1:** We want to understand the biodiversity of each region. Which regions have the most recorded species?

3. **Mission 2:** Which months have the highest observation activity? Group by month based on actual observation dates. This is useful for detecting seasonality.

4. **Mission 3:** Detect species with few recorded individuals (possible rare cases).

5. **Mission 4:** Which region has the highest number of distinct species observed?

6. **Mission 5:** Which species have been observed most frequently?
7. **Mission 6:** We want to identify the most active observers. Who are the people with the most observation records?
8. **Mission 7:** Which species have never been observed? Check if there are species in the `species` table that do not appear in `observations`.
9. **Mission 8:** On which dates were the most distinct species observed? This information is ideal for exploring maximum biodiversity on specific days.


## 🚀 Make Your Work Visible

One of the main goals of this project is to showcase real and applied skills on your professional profile. You worked with real open data from the [GBIF](https://www.gbif.org/) portal, executed SQL queries, analyzed biodiversity, and visualized valuable patterns.

Publish an insight on LinkedIn that demonstrates analytical thinking based on real data.

### What to Share?
Based on your analysis, write one or two sentences summarizing what you discovered. The goal is to communicate your findings objectively, briefly, and backed by data. Add a chart if you like, and use hashtags to amplify your reach.

### ✨ Postable Examples

> **"The top 5 most observed species in my region [Buenos Aires] account for 27% of the total records in that area. Their dominant presence might indicate unique adaptive habits. 🐦📍 #Biodiversity #DataScience"**

> **"New South Wales (Australia) leads in diversity with over 120 distinct species recorded. Real GBIF data reveals unexpected biodiversity hotspots! 🌿🌏 #SQL #OpenData"**
