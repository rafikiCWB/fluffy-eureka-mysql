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

SELECT * FROM turmas WHERE data_inicio = str_to_date('10/01/2023', '%d/%m/%Y'); # converter usando uma máscara especifica