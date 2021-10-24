--Explain do MySQL - Comandos utilizados

--O que é o explain??
--É o comando que mostra o plano de execução que a sua query vai utilizar.

--Primeiro explain
explain
select * from actor a where first_name='JOHNNY'
union
select * from actor a2 where actor_id=5;

--Segundo Explain (trocando a coluna)
explain
select * from actor a where last_name='CAGE'
union
select * from actor a2 where actor_id=5;

--Comando que informa quais são os indices da tabela
show index from actor;

--Comando para verificar a cardinalida do campo
select count(distinct first_name) from actor;


--Query para verificar o tamanho das tabelas e se estão fragmentadas
SELECT table_schema "Database" ,
table_name "Table",
round(SUM( data_length + index_length ) / 1024 / 1024) "Tamanho_MB",
round(SUM( data_free )/ 1024 / 1024) "Espaço_livre_MB"
FROM information_schema.TABLES
where table_schema = 'employees'
GROUP BY table_schema,table_name 
ORDER BY 3 DESC;
