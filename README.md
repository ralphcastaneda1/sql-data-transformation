# sql-data-transformation
Exploratory data cleaning &amp; transformation on UC Berkeley building sensor data 

Data Transformation

**Clean and transform one month of UC Berkeley building sensor data**  

## 📖 Assignment Overview

Building‐management systems generate billions of sensor readings over decades—but schema complexity and messy raw data can make even “well-structured” datasets a pain to work with. In this project, you’ll ingest, clean, and join multiple tables from a one-month slice of UC Berkeley building sensor data, then reshape it into analysis-ready form.

**Citation:**  
Luo, N., Wang, Z., Blum, D. et al. A three-year dataset supporting research on building energy management and occupancy analytics. _Sci Data_ 9, 156 (2022). https://doi.org/10.1038/s41597-022-01257-x

---

## 🗄️ Table Descriptions

| File                             | Contents                                                                                       |
|----------------------------------|------------------------------------------------------------------------------------------------|
| `buildings_site_mapping.csv`     | Maps a site’s full name (e.g. “Central Plant”) to a building ID (e.g. “CP”)                    |
| `real_estate_metadata.csv`       | Metadata on each real-estate parcel (address, year built, land use)                            |
| `data.csv`                       | Sensor readings: each row = one (building, timestamp, raw_sensor_name, value)                  |
| `metadata.csv`                   | Sensor metadata: raw name → units, data type, description                                      |
| `uc_locations.csv`               | Standardized UC campus location codes and names (used in Q3e)                                  |
| `ontology.csv`                   | Brick ontology triples: subject → predicate → object (used in Q5)                              |
| `mapping.csv`                    | Maps raw sensor names to Brick ontology classes (used in Q5c)                                  |

---

## 🎯 Tasks & Deliverables
1. **Data Ingestion (Q1–Q2)**  
   - Read each CSV into a Pandas DataFrame.  
   - Validate schema and handle missing values.

2. **Building & Site Mapping (Q3a–Q3e)**  
   - Join `data.csv` with `buildings_site_mapping.csv` and `real_estate_metadata.csv`.  
   - Clean timestamps and extract useful time features.  
   - Standardize location names using `uc_locations.csv`.

3. **Sensor Metadata Wrangling (Q4)**  
   - Merge `data.csv` with `metadata.csv`.  
   - Convert raw values to numeric, respecting sensor units.

4. **Ontology Integration (Q5)**  
   - Use `ontology.csv` and `mapping.csv` to classify sensors by Brick ontology class.  
   - Demonstrate how to pivot or filter data to a particular ontology category.

5. **Final Output (Q6)**  
   - Produce a “wide” table (one row per building‐timestamp) containing key sensor readings as separate columns.  
   - Save the cleaned dataset to Parquet for downstream analysis.

6. **Documentation & Reflection**  
   - In your notebook, comment on data‐quality issues you encountered.  
   - Suggest improvements for handling missing or heterogeneous sensor streams.

