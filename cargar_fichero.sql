SET @csv_file = 'salarios.csv';

CREATE TEMPORARY TABLE tabla_temporal (
    salario_anual VARCHAR(255),
    sexo VARCHAR(10),
    periodo YEAR,
    total INT
);

LOAD DATA INFILE '/home/pedro/Escritorio/31_01_2025_gbd_load_data/salarios.csv'
INTO TABLE tabla_temporal
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(salario_anual, sexo, periodo, total);

INSERT INTO salarios (salario_anual, sexo, periodo, total)
SELECT salario_anual, sexo, periodo, total
FROM tabla_temporal;

DROP TEMPORARY TABLE tabla_temporal;
