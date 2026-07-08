# Disney+ Catalog Analytics & 3NF Relational Migration Pipeline
### End-to-End ETL Pipeline, Automated Third Normal Form (3NF) Data Architecture, and MySQL Schema Compiler

---

## Project Overview
Flat file formats (such as raw `.csv` data) are highly convenient for basic storage and quick data transit, but they are fundamentally flawed for production-grade software ecosystems. They mandate severe data redundancies, tolerate formatting anomalies, lack transaction-ready index paths, and explicitly violate the laws of relational database integrity.

This repository features a production-ready **Extract, Transform, Load (ETL)** data pipeline developed in Python (Jupyter Notebook) using the **Disney+ Movies and TV Shows dataset**. The pipeline ingests the unstructured catalog, executes a visual Exploratory Data Analysis (EDA) profile, handles non-atomic column groupings (multi-valued comma-separated arrays), and programmatically migrates the flat sheet into highly optimized **Third Normal Form (3NF)** relational lookup tables.

The transformation layer features an automated SQL compilation routine that writes native, execution-ready `.sql` deployment blueprints straight to disk at runtime.

---

## Database Normalization Architecture (3NF)
To eliminate data duplication and enforce relational boundaries, nested multi-valued fields—specifically `listed_in` (genres), `cast` (actors), and `director`—are programmatically unnested and normalized. 

The application architecture maps out a highly efficient relational data network featuring **4 core dimension tracking tables** interconnected through **3 many-to-many junction bridge tables**:<img width="1294" height="341" alt="UML" src="https://github.com/user-attachments/assets/3b242aee-5d19-40a3-8cba-716cfb07d7dd" />

### Generated Schema Matrix:
* `normalized_titles.csv`: The centralized base inventory table storing singular metadata parameters (`show_id`, `title`, `type`, `release_year`, `rating`, `duration`, `description`).
* `dim_genres.csv`: Isolated master dictionary mapping primary auto-increment keys to distinct genre strings.
* `dim_directors.csv`: Master data reference mapping individual unique production director names.
* `dim_cast.csv`: Master repository mapping distinct actors and vocal talents.
* `junction_title_genres.csv` / `junction_title_directors.csv` / `junction_title_actors.csv`: Referential linkage arrays recording composite cross-entity relationships via primary/foreign key mappings.

---

## Core Technical Layers

### Phase 1: Visual Exploratory Analytics (EDA)
* **Media Type Proportions:** Charts the platform inventory to reveal clear catalog imbalances (1,052 Movies vs. 398 TV Shows).
* **Demographic Indexing:** Tracks content maturity frequencies across global age brackets (TV-G</b> and **TV-PG** leading as dominant distribution layers).
* *Implementation Highlight:* Implemented clean categorical variable assignments matching deprecation-proof guidelines in `seaborn` to ensure future-proof graphics.

### Phase 2: Programmatic 1NF/3NF Transformation Engine
* Engineered a modular text-cleansing function in Python that dynamically reads string objects, manages null value constraints safely, explodes multi-value arrays into atomic cells, and eliminates duplicate text values to maintain normalization requirements.

### Phase 3: Automated DDL Script Generation
* Integrates an interactive code-writing layer that compiles database statements into a standalone `.sql` deployment asset at runtime. The generation engine establishes exact structural lengths, constraints, and relational deletion safeguards (`ON DELETE CASCADE`) to guarantee data continuity across table joins.

---

## Business Intelligence Query Suite (Sample SQL Layer)
Once the database is instantiated using the generated `disney_schema_migration.sql` deployment file, users can run complex relational analytics that are impossible on a traditional flat text file:
