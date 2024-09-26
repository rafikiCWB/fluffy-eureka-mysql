select * from cursos where id = 1;
select * from cursos where codigo = '001';
select * from turmas where curso_id = 1;

SELECT * FROM turmas WHERE periodo = 'sábado';
SELECT * FROM turmas WHERE periodo = 'SABADO' or periodo = 'NOTURNO';
SELECT * FROM turmas WHERE curso_id < 2;

select * from estudantes;
SELECT id, nome, cpf FROM estudantes WHERE nome LIKE 'ana%'; # % é um coringa, ou seja, qualquer coisa que comece com ana
SELECT id, nome, cpf FROM estudantes WHERE nome LIKE '%ana%'; # % é um coringa, ou seja, qualquer coisa que tenha ana
SELECT id, nome, cpf FROM estudantes WHERE nome LIKE '%ana'; # % é um coringa, ou seja, qualquer coisa que termine com ana

SELECT id, nome, cpf FROM estudantes ORDER BY nome desc LIMIT 10; # por padrão se você não especificar a ordem é crescente

SELECT id, nome, cpf FROM estudantes ORDER BY nome LIMIT 10 OFFSET 2; # offset é o deslocamento

SELECT id, nome, data_nascimento as data FROM estudantes; # as é um alias, ou seja, cria um apelido para a coluna

#-----------------------------------------------------------------------------------------------------------------------
#SQL: Select com funções
SELECT count(*) FROM turmas WHERE periodo = 'NOTURNO'; # conta quantos registros tem na tabela turmas com o periodo noturno

SELECT min(turmas.data_inicio) FROM turmas; # pega a data de inicio mais antiga

select id, nome, cpf from estudantes where lower(nome) = 'RAFAEL GRANDO'; # lower converte a string para minusculo
select id, nome, cpf from estudantes where lower(nome) = lower('RAFAEL GRANDO');
SELECT * FROM estudantes;
SELECT * FROM turmas;

select * from turmas where year(data_inicio) = 2025; # pega o ano da data de inicio
select * from turmas where year(data_inicio) = 2023 and month(data_inicio) = 1 and day(data_inicio) = 10;
SELECT * FROM turmas WHERE data_inicio = str_to_date('10/01/2023', '%d/%m/%Y'); # converter usando uma máscara especifica

#     ----------------------------------------------
# Comando case no sql
desc estudantes;
select * from estudantes;
select id, nome, case when endereco is null then '(not registered)' else endereco end from estudantes;
select id, nome, case when endereco like '%Rua A%' then '(not registered)' else endereco end from estudantes;

# ------------------------------------------------------
# Consultas com JOIN no SQL
select * from cursos join turmas; #isso não é recomendado, pois não tem um critério de junção
select * from cursos join turmas on cursos.id = turmas.curso_id; # isso é o correto
select * from cursos inner join turmas on cursos.id = turmas.curso_id;  # inner join é o padrão do join voce usa o inner quando quer fazer a consulta de uma tabela juntando o registro da outra tabela mas só quer trazer os registros que batem a interseção
select * from cursos left join turmas on cursos.id = turmas.curso_id; #traga todos as cursos inclusive os que nao tem turmas
select * from cursos right join turmas on cursos.id = turmas.curso_id; #traga todos as turmas inclusive as que não tem cursos

select * from cursos left join turmas on cursos.id = turmas.curso_id where periodo = 'NOTURNO';
select cursos.codigo, turmas.data_inicio, turmas.data_fim from cursos left join turmas on cursos.id = turmas.curso_id where periodo = 'MATUTINO' order by data_inicio;