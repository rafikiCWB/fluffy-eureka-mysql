create table estudandes
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
desc estudandes; # mostra as colunas e linhas da tabela
alter table estudandes add column endereco varchar(200); # adiciona uma nova coluna

drop table estudandes; # apagar tabela referenciando o nome da tabela


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

create table if not exists  turmas
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
