SELECT 'CREATE DATABASE fractal_test'
WHERE NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'fractal_test')
\gexec
\c fractal_test
CREATE TABLE IF NOT EXISTS prova (id serial PRIMARY KEY, nota text);
INSERT INTO prova (nota) SELECT 'caricato dal repository' WHERE NOT EXISTS (SELECT 1 FROM prova);
