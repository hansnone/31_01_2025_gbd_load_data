SET @csv_file = 'salarios.csv';

CREATE TEMPORARY TABLE tabla_temporal (
    salario_anual VARCHAR(255),
    sexo VARCHAR(10),
    periodo YEAR,
    total INT
);

-- Para cargar los archivos csv, uso linux, he tenido que poner el archivo en la carpeta raiz.

LOAD DATA INFILE '/salarios.csv'
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
