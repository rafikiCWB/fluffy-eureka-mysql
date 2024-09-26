rename table estudantes TO estudantes; # renomear tabela

create table if not exists estudantes
(
    id              bigint       not null auto_increment,
    nome            varchar(100) not null,
    data_nascimento date         not null,
    email           varchar(100) not null unique,
    cpf             char(11)     not null unique,
    telefone        char(11)     not null,

    primary key (id)
);
show tables; # mostrar as tabelas no banco de dados
desc estudantes; # mostra as colunas e linhas da tabela
alter table estudantes
    add column endereco varchar(200); # adiciona uma nova coluna
drop table estudantes; # apagar tabela referenciando o nome da tabela

insert into estudantes(nome, data_nascimento, email, cpf, telefone, estudantes.endereco)
values ('Rafael Grando', '1996-06-21', 'rafael@email.com', 12345678910, '12345678910', 'Rua xpto numero 123');

select *
from estudantes; # mostra os dados inseridos na tabela

create table if not exists cursos
(
    id      bigint                                       not null auto_increment,
    codigo  varchar(10)                                  not null unique,
    nome    varchar(100)                                 not null,
    duracao int                                          not null,
    nivel   enum ('BASICO', 'INTERMEDIÁRIO', 'AVANÇADO') not null,

    primary key (id)

);
desc cursos;

create table if not exists turmas
(
    id          bigint                                               not null auto_increment,
    codigo      varchar(10)                                          not null unique,
    data_inicio date                                                 not null,
    data_fim    date                                                 not null,
    periodo     enum ('MATUTINO', 'VESPERTINO', 'NOTURNO', 'SÁBADO') not null,
    curso_id    bigint                                               not null,

    primary key (id),
    foreign key (curso_id) references cursos (id)
);
desc turmas;

insert into cursos(codigo, nome, duracao, nivel)
values ('001', 'Java Básico', 40, 'BASICO'),
       ('002', 'Python Intermediário', 60, 'INTERMEDIÁRIO'),
       ('003', 'JavaScript Avançado', 80, 'AVANÇADO'),
       ('004', 'HTML e CSS Básico', 30, 'BASICO'),
       ('005', 'Banco de Dados com MySQL', 50, 'INTERMEDIÁRIO'),
       ('006', 'Desenvolvimento Web com Django', 70, 'AVANÇADO'),
       ('007', 'Introdução ao Machine Learning', 45, 'BASICO'),
       ('008', 'Administração de Sistemas Linux', 55, 'INTERMEDIÁRIO'),
       ('009', 'Redes de Computadores', 65, 'AVANÇADO'),
       ('010', 'Gestão de Projetos com Scrum', 35, 'BASICO'),
       ('011', 'Marketing Digital', 40, 'INTERMEDIÁRIO'),
       ('012', 'Segurança da Informação', 75, 'AVANÇADO'),
       ('013', 'Desenvolvimento Mobile com Flutter', 60, 'INTERMEDIÁRIO'),
       ('014', 'Big Data e Análise de Dados', 80, 'AVANÇADO'),
       ('015', 'Fundamentos de DevOps', 50, 'BASICO'),
       ('016', 'Inteligência Artificial', 70, 'AVANÇADO'),
       ('017', 'Gerenciamento de Redes Sociais', 45, 'INTERMEDIÁRIO'),
       ('018', 'E-commerce e Vendas Online', 55, 'BASICO'),
       ('019', 'Programação Funcional com Haskell', 65, 'AVANÇADO'),
       ('020', 'Design de Interfaces', 40, 'INTERMEDIÁRIO');

select *
from cursos;

insert into turmas(codigo, data_inicio, data_fim, periodo, curso_id)
values ('T001', '2023-01-10', '2023-03-10', 'MATUTINO', 1),
       ('T002', '2023-02-15', '2023-04-15', 'VESPERTINO', 1),
       ('T003', '2023-03-20', '2023-05-20', 'NOTURNO', 2),
       ('T004', '2023-04-25', '2023-06-25', 'SÁBADO', 2),
       ('T005', '2023-05-30', '2023-07-30', 'MATUTINO', 3),
       ('T006', '2023-06-05', '2023-08-05', 'VESPERTINO', 3),
       ('T007', '2023-07-10', '2023-09-10', 'NOTURNO', 4),
       ('T008', '2023-08-15', '2023-10-15', 'SÁBADO', 4),
       ('T009', '2023-09-20', '2023-11-20', 'MATUTINO', 5),
       ('T010', '2023-10-25', '2023-12-25', 'VESPERTINO', 5),
       ('T011', '2023-11-30', '2024-01-30', 'NOTURNO', 6),
       ('T012', '2024-01-05', '2024-03-05', 'SÁBADO', 6),
       ('T013', '2024-02-10', '2024-04-10', 'MATUTINO', 7),
       ('T014', '2024-03-15', '2024-05-15', 'VESPERTINO', 7),
       ('T015', '2024-04-20', '2024-06-20', 'NOTURNO', 8),
       ('T016', '2024-05-25', '2024-07-25', 'SÁBADO', 8),
       ('T017', '2024-06-30', '2024-08-30', 'MATUTINO', 9),
       ('T018', '2024-07-05', '2024-09-05', 'VESPERTINO', 9),
       ('T019', '2024-08-10', '2024-10-10', 'NOTURNO', 10),
       ('T020', '2024-09-15', '2024-11-15', 'SÁBADO', 10),
       ('T021', '2024-10-20', '2024-12-20', 'MATUTINO', 11),
       ('T022', '2024-11-25', '2025-01-25', 'VESPERTINO', 11),
       ('T023', '2025-01-30', '2025-03-30', 'NOTURNO', 12),
       ('T024', '2025-02-05', '2025-04-05', 'SÁBADO', 12),
       ('T025', '2025-03-10', '2025-05-10', 'MATUTINO', 13),
       ('T026', '2025-04-15', '2025-06-15', 'VESPERTINO', 13),
       ('T027', '2025-05-20', '2025-07-20', 'NOTURNO', 14),
       ('T028', '2025-06-25', '2025-08-25', 'SÁBADO', 14),
       ('T029', '2025-07-30', '2025-09-30', 'MATUTINO', 15),
       ('T030', '2025-08-05', '2025-10-05', 'VESPERTINO', 15),
       ('T031', '2025-09-10', '2025-11-10', 'NOTURNO', 16),
       ('T032', '2025-10-15', '2025-12-15', 'SÁBADO', 16),
       ('T033', '2025-11-20', '2026-01-20', 'MATUTINO', 17),
       ('T034', '2025-12-25', '2026-02-25', 'VESPERTINO', 17),
       ('T035', '2026-01-30', '2026-03-30', 'NOTURNO', 18),
       ('T036', '2026-02-05', '2026-04-05', 'SÁBADO', 18),
       ('T037', '2026-03-10', '2026-05-10', 'MATUTINO', 19),
       ('T038', '2026-04-15', '2026-06-15', 'VESPERTINO', 19),
       ('T039', '2026-05-20', '2026-07-20', 'NOTURNO', 20),
       ('T040', '2026-06-25', '2026-08-25', 'SÁBADO', 20),
       ('T041', '2026-07-30', '2026-09-30', 'MATUTINO', 1),
       ('T042', '2026-08-05', '2026-10-05', 'VESPERTINO', 2),
       ('T043', '2026-09-10', '2026-11-10', 'NOTURNO', 3),
       ('T044', '2026-10-15', '2026-12-15', 'SÁBADO', 4),
       ('T045', '2026-11-20', '2027-01-20', 'MATUTINO', 5),
       ('T046', '2026-12-25', '2027-02-25', 'VESPERTINO', 6),
       ('T047', '2027-01-30', '2027-03-30', 'NOTURNO', 7),
       ('T048', '2027-02-05', '2027-04-05', 'SÁBADO', 8),
       ('T049', '2027-03-10', '2027-05-10', 'MATUTINO', 9),
       ('T050', '2027-04-15', '2027-06-15', 'VESPERTINO', 10);

insert into estudantes(nome, data_nascimento, email, cpf, telefone, endereco)
values ('Ana Silva', '1990-01-01', 'ana.silva@email.com', '12345678901', '12345678901', 'Rua A, 123'),
       ('Bruno Souza', '1991-02-02', 'bruno.souza@email.com', '12345678902', '12345678902', 'Rua B, 456'),
       ('Carlos Pereira', '1992-03-03', 'carlos.pereira@email.com', '12345678903', '12345678903', 'Rua C, 789'),
       ('Daniela Costa', '1993-04-04', 'daniela.costa@email.com', '12345678904', '12345678904', 'Rua D, 101'),
       ('Eduardo Lima', '1994-05-05', 'eduardo.lima@email.com', '12345678905', '12345678905', 'Rua E, 202'),
       ('Fernanda Alves', '1995-06-06', 'fernanda.alves@email.com', '12345678906', '12345678906', 'Rua F, 303'),
       ('Gabriel Martins', '1996-07-07', 'gabriel.martins@email.com', '12345678907', '12345678907', 'Rua G, 404'),
       ('Helena Rodrigues', '1997-08-08', 'helena.rodrigues@email.com', '12345678908', '12345678908', 'Rua H, 505'),
       ('Igor Fernandes', '1998-09-09', 'igor.fernandes@email.com', '12345678909', '12345678909', 'Rua I, 606'),
       ('Lucas Santos', '2000-11-11', 'lucas.santos@email.com', '12345678911', '12345678911', 'Rua K, 808'),
       ('Mariana Ribeiro', '2001-12-12', 'mariana.ribeiro@email.com', '12345678912', '12345678912', 'Rua L, 909'),
       ('Nicolas Cardoso', '2002-01-13', 'nicolas.cardoso@email.com', '12345678913', '12345678913', 'Rua M, 1010'),
       ('Olivia Almeida', '2003-02-14', 'olivia.almeida@email.com', '12345678914', '12345678914', 'Rua N, 1111'),
       ('Pedro Araujo', '2004-03-15', 'pedro.araujo@email.com', '12345678915', '12345678915', 'Rua O, 1212'),
       ('Quintino Barros', '2005-04-16', 'quintino.barros@email.com', '12345678916', '12345678916', 'Rua P, 1313'),
       ('Rafaela Batista', '2006-05-17', 'rafaela.batista@email.com', '12345678917', '12345678917', 'Rua Q, 1414'),
       ('Samuel Freitas', '2007-06-18', 'samuel.freitas@email.com', '12345678918', '12345678918', 'Rua R, 1515'),
       ('Tatiana Gomes', '2008-07-19', 'tatiana.gomes@email.com', '12345678919', '12345678919', 'Rua S, 1616'),
       ('Ursula Dias', '2009-08-20', 'ursula.dias@email.com', '12345678920', '12345678920', 'Rua T, 1717'),
       ('Victor Mendes', '2010-09-21', 'victor.mendes@email.com', '12345678921', '12345678921', 'Rua U, 1818'),
       ('Wesley Nunes', '2011-10-22', 'wesley.nunes@email.com', '12345678922', '12345678922', 'Rua V, 1919'),
       ('Ximena Teixeira', '2012-11-23', 'ximena.teixeira@email.com', '12345678923', '12345678923', 'Rua W, 2020'),
       ('Yasmin Vieira', '2013-12-24', 'yasmin.vieira@email.com', '12345678924', '12345678924', 'Rua X, 2121'),
       ('Zeca Moreira', '2014-01-25', 'zeca.moreira@email.com', '12345678925', '12345678925', 'Rua Y, 2222'),
       ('Arthur Silva', '2015-02-26', 'arthur.silva@email.com', '12345678926', '12345678926', 'Rua Z, 2323'),
       ('Beatriz Souza', '2016-03-27', 'beatriz.souza@email.com', '12345678927', '12345678927', 'Rua AA, 2424'),
       ('Caio Pereira', '2017-04-28', 'caio.pereira@email.com', '12345678928', '12345678928', 'Rua BB, 2525'),
       ('Diana Costa', '2018-05-29', 'diana.costa@email.com', '12345678929', '12345678929', 'Rua CC, 2626'),
       ('Eduarda Lima', '2019-06-30', 'eduarda.lima@email.com', '12345678930', '12345678930', 'Rua DD, 2727'),
       ('Felipe Alves', '2020-07-31', 'felipe.alves@email.com', '12345678931', '12345678931', 'Rua EE, 2828'),
       ('Giovana Martins', '2021-08-01', 'giovana.martins@email.com', '12345678932', '12345678932', 'Rua FF, 2929'),
       ('Hugo Rodrigues', '2022-09-02', 'hugo.rodrigues@email.com', '12345678933', '12345678933', 'Rua GG, 3030'),
       ('Isabela Fernandes', '2023-10-03', 'isabela.fernandes@email.com', '12345678934', '12345678934', 'Rua HH, 3131'),
       ('João Oliveira', '2024-11-04', 'joao.oliveira@email.com', '12345678935', '12345678935', 'Rua II, 3232'),
       ('Karen Santos', '2025-12-05', 'karen.santos@email.com', '12345678936', '12345678936', 'Rua JJ, 3333'),
       ('Leonardo Ribeiro', '2026-01-06', 'leonardo.ribeiro@email.com', '12345678937', '12345678937', 'Rua KK, 3434'),
       ('Marina Cardoso', '2027-02-07', 'marina.cardoso@email.com', '12345678938', '12345678938', 'Rua LL, 3535'),
       ('Nathalia Almeida', '2028-03-08', 'nathalia.almeida@email.com', '12345678939', '12345678939', 'Rua MM, 3636'),
       ('Otávio Araujo', '2029-04-09', 'otavio.araujo@email.com', '12345678940', '12345678940', 'Rua NN, 3737'),
       ('Paula Barros', '2030-05-10', 'paula.barros@email.com', '12345678941', '12345678941', 'Rua OO, 3838'),
       ('Quirino Batista', '2031-06-11', 'quirino.batista@email.com', '12345678942', '12345678942', 'Rua PP, 3939'),
       ('Renata Freitas', '2032-07-12', 'renata.freitas@email.com', '12345678943', '12345678943', 'Rua QQ, 4040'),
       ('Sérgio Gomes', '2033-08-13', 'sergio.gomes@email.com', '12345678944', '12345678944', 'Rua RR, 4141'),
       ('Tereza Dias', '2034-09-14', 'tereza.dias@email.com', '12345678945', '12345678945', 'Rua SS, 4242'),
       ('Ulisses Mendes', '2035-10-15', 'ulisses.mendes@email.com', '12345678946', '12345678946', 'Rua TT, 4343'),
       ('Valéria Nunes', '2036-11-16', 'valeria.nunes@email.com', '12345678947', '12345678947', 'Rua UU, 4444'),
       ('William Teixeira', '2037-12-17', 'william.teixeira@email.com', '12345678948', '12345678948', 'Rua VV, 4545'),
       ('Xavier Vieira', '2038-01-18', 'xavier.vieira@email.com', '12345678949', '12345678949', 'Rua WW, 4646'),
       ('Yuri Moreira', '2039-02-19', 'yuri.moreira@email.com', '12345678950', '12345678950', 'Rua XX, 4747');
select *
from estudantes;