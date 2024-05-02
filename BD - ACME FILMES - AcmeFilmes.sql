use db_acme_filmes;

create schema db_acme_filmes;

drop schema db_acme_filmes;

show tables;

create table tbl_classificacao(

id_classificacao integer primary key auto_increment not null,
faixa_etaria varchar(2) not null,
classificacao varchar(35) not null,
caracteristicas text not null
);


insert into tbl_classificacao(faixa_etaria, classificacao, caracteristicas) values
("12","Não recomendado para menores de 12 anos","As cenas podem conter agressão física,
consumo de drogas e insinuação sexual");

show tables;

select * from tbl_ator;

select * from tbl_ator where tbl_ator.nome LIKE "Adam Sandler";

insert into tbl_ator(id_sexoa, nome, biografia, data_nascimento, foto) values 
(1,
"Adam Sandler",
 "Adam Richard Sandler é um ator, comediante, produtor, roteirista, dublador e músico norte-americano, de origem judaica.",
 "1966-09-09",
 "https://i.pinimg.com/564x/ce/ba/49/ceba49962dcd53efacd6369b4402d463.jpg");

select * from tbl_classificacao where id_classificacao = 3;

drop table tbl_filme;



update tbl_classificacao set  faixa_etaria =  14,
       classificacao = "Não recomendado para menores de 14 anos",
       caracteristicas = "Conteúdos mais acentuados com a violencia e ou a linguagem sexual"
       where id_classificacao = 7;

insert into tbl_ator(
                                    id_sexoa,
                                    nome,
                                    biografia,
                                    data_nascimento,
                                    foto
) values (

'1',
'The Rock',
'Dwayne Douglas Johnson, também conhecido pelo seu nome no ringue The Rock, é um ator americano, ex-lutador profissional e ex-jogador de futebol americano universitário pela Universidade de Miami, vencendo o campeonato nacional em 1991 pelo Miami Hurricanes.',
'1972-05-02',
'https://i.pinimg.com/564x/1b/d6/71/1bd671eeb2ab172e8b8fa0f80ad9722b.jpg'

);
create table tbl_filme(
id_filme integer primary key auto_increment not null,
id_classificacao integer not null,
titulo varchar(45) not null,
sinopse text not null,
duracao time not null,
data_lancamento date not null,
data_relancamento date,
foto_capa varchar(100) not null,
valor_unitario varchar(10) not null,

constraint FK_CLASSIFICACAO_FILME
foreign key(id_classificacao) 
references tbl_classificacao(id_classificacao)
);

select * from tbl_classificacao;

select cast(last_insert_id() as decimal) as id from tbl_classificacao limit 1;
create table tbl_diretor(
id_diretor integer primary key auto_increment not null,
id_sexod integer not null,
foto varchar(100) not null,
biografia text not null,
nome varchar(50) not null,
data_nascimento date not null,

constraint FK_SEXO_DIRETOR
foreign key (id_sexod)
references tbl_sexod(id_sexod)
);

alter table tbl_diretor 
change column titulo titulo_filme varchar(150);  

alter table tbl_filme 
drop foreign key FK_SEXO_DIRETOR;   
insert into tbl_diretor(id_sexod, foto, biografia, nome, data_nascimento) values
(1, 
'https://i.pinimg.com/564x/32/1f/27/321f2715b91d4d946e924b99c9159a06.jpg',
'Todd Phillips é um roteirista e diretor de cinema estadunidense. 
Ele é mais conhecido pelo super sucesso Joker que lhe rendeu indicações ao Óscar por Melhor Filme, 
Melhor Diretor e Melhor Roteiro Adaptado.',
'Todd Phillips',
'1970-12-20'
);

SELECT * from tbl_diretor;

drop table tbl_sexod;
create table tbl_sexod(
id_sexod integer primary key auto_increment not null,
sexualidade varchar(10) not null
);

create table nacionalidade(
id_nacionalidade integer primary key auto_increment not null,
pais varchar(45) not null

);

create table tbl_nacionalidade_diretor(
id integer primary key auto_increment not null,
id_nacionalidade integer not null,
id_diretor integer not null,

constraint FK_NACIONALIDADE_NACIONALIDADEDIRETOR
foreign key (id_nacionalidade)
references tbl_nacionalidade(id_nacionalidade),

constraint FK_DIRETOR_NACIONALIDADEDIRETOR
foreign key (id_diretor)
references tbl_diretor(id_diretor)
);

create table tbl_diretor_filme(
id integer primary key auto_increment not null,
id_diretor integer not null,
id_filme integer not null,

constraint FK_DIRETOR_DIRETORFILME
foreign key (id_diretor)
references tbl_diretor(id_diretor),

constraint FK_FILME_DIRETORFILME
foreign key (id_filme)
references tbl_filme(id_filme)
);   

create table tbl_genero(
id_genero integer primary key auto_increment not null,
nome varchar(45) not null
);

create table tbl_genero_filme(
id integer primary key auto_increment not null,
id_filme integer not null,
id_genero integer not null,

constraint FK_FILME_GENEROFILME
foreign key (id_filme)
references tbl_filme(id_filme),

constraint FK_GENERO_GENEROFILME
foreign key (id_genero)
references tbl_genero(id_genero)

);

rename table sexoa to tbl_sexoa;
create table tbl_sexoa(
id_sexoa integer primary key auto_increment not null,
sexualidade varchar(10) not null

);

insert into tbl_sexoa(sexualidade) values
("Masculino"),
("Feminino");

drop table tbl_sexoa;

create table tbl_ator(
id_ator integer primary key auto_increment not null,
id_sexoa integer not null,
nome varchar(45) not null,
biografia text not null,
data_nascimento date not null,
foto varchar(100) not null,

constraint FK_SEXO_ATOR
foreign key (id_sexoa)
references tbl_sexoa(id_sexoa)
);
UPDATE tbl_ator

SET id_sexoa = '1',
nome = 'Silvio Santos',
biografia = 'Dwayne Douglas Johnson, também conhecido pelo seu nome no ringue The Rock, é um ator americano, ex-lutador profissional e ex-jogador de futebol americano universitário pela Universidade de Miami, vencendo o campeonato nacional em 1991 pelo Miami Hurricanes.',
data_nascimento = '1952-05-02',
foto = 'https://i.pinimg.com/564x/1b/d6/71/1bd671eeb2ab172e8b8fa0f80ad9722b.jpg'

where id_ator = 12;

SET id_sexoa = 1,
nome = "Silvio Santos",
biograia = "Dwayne Douglas Johnson, também conhecido pelo seu nome no ringue The Rock, é um ator americano, ex-lutador profissional e ex-jogador de futebol americano universitário pela Universidade de Miami, vencendo o campeonato nacional em 1991 pelo Miami Hurricanes.",
data_nascimento = "1980-05-02",
foto = "https://i.pinimg.com/564x/1b/d6/71/1bd671eeb2ab172e8b8fa0f80ad9722b.jpg"
where id_ator = 12;

create table tbl_ator_filme(
id integer primary key auto_increment not null,
id_filme integer not null,
id_ator integer not null,

constraint FK_FILME_ATORFILME
foreign key (id_filme)
references tbl_filme(id_filme),

constraint FK_ATOR_ATORFILME
foreign key (id_ator)
references tbl_ator(id_ator)
);



create table tbl_nacionalidade(
id_nacionalidade integer primary key auto_increment not null,
pais varchar(45) not null
);

create table tbl_nacionalidade_ator(
id integer primary key auto_increment not null,
id_nacionalidade integer not null,
id_ator integer not null,

constraint FK_NACIONALIDADE_NACIONALIDADEATOR
foreign key (id_nacionalidade)
references tbl_nacionalidade(id_nacionalidade),

constraint FK_ATOR_NACIONALIDADEATOR
foreign key (id_ator)
references tbl_ator(id_ator)

);
                             
/*Seleciona os elementos presentes na tabela*/
select * from tbl_filme;

insert into tbl_filme (
          
        titulo,
        sinopse,
        duracao,
        data_lancamento,
        data_relancamento,
        foto_capa,
        valor_unitario

) values (

        'O Segredo do Vale',
    'Um drama emocionante que explora os segredos de uma pequena cidade no interior.',
        '02:15:00',
        '2022-08-25',
        null,
        'https://exemplo.com/foto_vale.jpg',
        '29.99'

),
(
        ' "Kung Fu Panda 4',
        ' "Depois de três aventuras arriscando sua própria vida para derrotar os mais poderosos vilões, Po, o Grande Dragão Guerreiro( Jack Black) é escolhido para se tornar o Líder Espiritual do Vale da Paz.',
        '01:34:00',
        '2024-03-21',
         null,
        'https://i.pinimg.com/736x/fc/41/5d/fc415d3e447f60a8829045bef1866ba9.jpg',
        ' 29.99'

     );

/*Atualizar table e o que deseja ser atualizado, puxando pelo ID*/
update tbl_filme
 set 
        nome = 'Vingadores: Ultimato',
        sinopse = 'Em Vingadores: Ultimato, após Thanos eliminar metade das criaturas vivas em Vingadores: Guerra Infinita, os heróis precisam lidar com a dor da perda de amigos e seus entes queridos.',
        duracao =  '03:01:00',
        data_lancamento = '2019-04-25',
        data_relancamento = null,
        foto_capa = 'https://i.pinimg.com/564x/cd/b3/b6/cdb3b63eb3ac1cf8faab32770c6dc3b5.jpg',
        valor_unitario = 29.99

     
 where id = 22;

