/*populada*/
create table membro(
	matricula bigint,
	nome varchar(150) not null,
	cpf bigint not null unique,
	curso varchar(30) not null,
	modalidade varchar not null,
	alergia_condicao varchar(150),
	endereco varchar(100) not null,
	telefone bigint not null,
	email varchar(30),
	primary key (matricula)
);
/*populada*/
create table telefone(
	membro_matricula bigint,
	telefone bigint unique,
	foreign key(membro_matricula) references membro(matricula)
);

alter table membro add constraint telefone foreign key (telefone) references telefone(telefone);

/*populada*/
create table administrador(
	id int,
	nome varchar not null,
	funcao varchar not null,
	senha varchar not null,
	email varchar not null,
	primary key (id)
);

/*populada*/
create table produto(
	id int,
	nome varchar not null,
	descricao varchar not null,
	tamanho varchar not null,
	cor varchar not null,
	modelo varchar not null,
	valor float not null,
	primary key(id)
);

/*populada*/
create table estoque(
	id int,
	id_prod int,
	qtde int not null,
	data_compra date not null,
	primary key (id),
	foreign key(id_prod) references produto(id)
);
/*populada*/
create table membro_produto(
	id int,
	id_prod int not null,
	membro_matricula int not null,
	data_pedido date not null,
	data_pagamento date not null,
	data_entrega date not null,
	tipo_pagamento varchar not null,
	comprovante varchar not null,
	primary key (id),
	foreign key(id_prod) references produto(id),
	foreign key(membro_matricula) references membro(matricula)
);
/*populada*/
create table contato(
	id int,
	nome varchar not null,
	email varchar not null,
	assunto varchar not null,
	texto varchar not null,
	anexo varchar not null,
	data_receb date not null,
	primary key (id)
);

/*populada*/
create table evento(
	id int,
	nome varchar not null,
	descricao varchar not null,
	tipo varchar not null,
	modalidade varchar not null,
	valor float not null,
	data_e date not null,
	id_adm int not null,
	primary key (id),
	foreign key(id_adm) references administrador(id)
);

/*populada*/
create table membro_evento(
	id_evento int not null,
	membro_matricula int not null,
	foreign key(id_evento) references evento(id),
	foreign key(membro_matricula) references membro(matricula)
);

/*populada*/
create table carteirinha(
	id int,
	membro_matricula int not null,
	validade date not null,
	primary key(id),
	foreign key(membro_matricula) references membro(matricula)
);

/*Populada*/
create table blog(
	id int,
	titulo varchar not null,
	subtitulo varchar not null,
	texto varchar not null,
	id_adm int not null,
	imagem varchar not null,
	primary key(id),
	foreign key(id_adm) references administrador(id)
);

/*populada*/
create table publicacao(
	id_blog int not null,
	id_adm int not null,
	foreign key(id_adm) references administrador(id),
	foreign key(id_blog) references blog(id)
);

INSERT INTO membro(matricula, nome, cpf, curso, modalidade, alergia_condicao, endereco, telefone, email)
VALUES
(123456789, 'João da Silva', 12345678901, 'Engenharia Ambiental', 'Atleta', null, 'Rua A, 123', 11987654321, 'joao.silva@gmail.com'),
(234567890, 'Maria dos Santos', 23456789012, 'Medicina', 'Membro', NULL, 'Avenida B, 456', 11976543210, 'maria.santos@yahoo.com.br'),
(345678901, 'José Oliveira', 34567890123, 'Enfermagem', 'Treinante', 'Intolerância a lactose', 'Rua C, 789', 11965432109, 'jose.oliveira@hotmail.com'),
(456789012, 'Ana Pereira', 45678901234, 'Ciência da Computação', 'Atleta', NULL, 'Rua D, 1011', 11954321098, 'ana.pereira@outlook.com'),
(567890123, 'Pedro Rodrigues', 56789012345, 'Administração', 'Membro', NULL, 'Avenida E, 1213', 11943210987, 'pedro.rodrigues@gmail.com'),
(678901234, 'Julia da Costa', 67890123456, 'Ciência da Computação', 'Treinante', 'Asma', 'Rua F, 1415', 11932109876, 'julia.costa@hotmail.com'),
(789012345, 'Carlos Santos', 78901234567, 'Ciência da Computação', 'Atleta', NULL, 'Avenida G, 1617', 11921098765, 'carlos.santos@uol.com.br'),
(890123456, 'Mariana Lima', 89012345678, 'Ciência da Computação', 'Membro', 'Amendoim', 'Rua H, 1819', 11910987654, 'mariana.lima@gmail.com'),
(901234567, 'Rafaela Oliveira', 90123456789, 'Ciência da Computação', 'Treinante', NULL, 'Avenida I, 2021', 11809876543, 'rafaela.oliveira@yahoo.com'),
(123450987, 'Lucas Mendes', 12345098765, 'Geografia', 'Atleta', 'Alergia ao pólen', 'Rua J, 2223', 11987654321, 'lucas.mendes@outlook.com');

SELECT * FROM membro;

DELETE FROM membro WHERE matricula = 890123456;

INSERT INTO membro(matricula, nome, cpf, curso, modalidade, alergia_condicao, endereco, telefone, email)
VALUES (890123456, 'Mariana Lima', 89012345678, 'Ciência da Computação', 'Membro', 'Amendoim', 'Rua H, 1819', 11910987654, 'mariana.lima@gmail.com');

INSERT INTO telefone(membro_matricula, telefone) VALUES (123456789, 11987654321);
INSERT INTO telefone(membro_matricula, telefone) VALUES (234567890, 11976543210);
INSERT INTO telefone(membro_matricula, telefone) VALUES (345678901, 11965432109);
INSERT INTO telefone(membro_matricula, telefone) VALUES (456789012, 11954321098);
INSERT INTO telefone(membro_matricula, telefone) VALUES (567890123, 11943210987);
INSERT INTO telefone(membro_matricula, telefone) VALUES (678901234, 11932109876);
INSERT INTO telefone(membro_matricula, telefone) VALUES (789012345, 11921098765);
INSERT INTO telefone(membro_matricula, telefone) VALUES (890123456, 11910987655);
INSERT INTO telefone(membro_matricula, telefone) VALUES (901234567, 11809876543);
INSERT INTO telefone(membro_matricula, telefone) VALUES (123450987, 11987654322);

SELECT * FROM telefone;

INSERT INTO administrador(id, nome, funcao, senha, email) VALUES (1, 'Daniele', 'Diretora de Eventos', '321123', 'Dani@adm.com');
INSERT INTO administrador(id, nome, funcao, senha, email) VALUES (2, 'Rafaelle', 'Presidente', '159753', 'Rafa@adm.com');

INSERT INTO produto(id, nome, descricao, tamanho, cor, modelo, valor) VALUES (1, 'Caneca Chavosa', 'Caneca sublimada com elementos da AAACCN', 'Roxo', 'Caneca Chavosa', 45,00);
INSERT INTO produto(id, nome, descricao, tamanho, cor, modelo, valor) VALUES (2, 'Caneca Chavosa 2.0', 'Caneca sublimada com elementos da AAACCN, volume 2', 'Preto', 'Caneca Chavosa', 45,00);
INSERT INTO produto(id, nome, descricao, tamanho, cor, modelo, valor) VALUES (3, 'Camiseta Navegadores', 'Camiseta Dry Fit', 'Roxo', 'Camiseta', 55,00);
INSERT INTO produto(id, nome, descricao, tamanho, cor, modelo, valor) VALUES (4, 'Camiseta Navegadores 2,0', 'Camiseta Dry Fit', 'Roxo', 'Camiseta 2', 55,00);
INSERT INTO produto(id, nome, descricao, tamanho, cor, modelo, valor) VALUES (5, 'Regata Navegadores', 'Regata Dry Fit', 'Preto', 'Regata', 55,00);
INSERT INTO produto(id, nome, descricao, tamanho, cor, modelo, valor) VALUES (6, 'Moletom Navegadores', 'Moletom inverno', 'Preto', 'Moletom', 55,00);
INSERT INTO produto(id, nome, descricao, tamanho, cor, modelo, valor) VALUES (7, 'Chaveiro Navegadores', 'Chaveiro de mão', 'Laranja', 'Chaveiro', 55,00);
INSERT INTO produto(id, nome, descricao, tamanho, cor, modelo, valor) VALUES (8, 'Copo Navegadores', 'Copo Eco', 'Roxo', 'Copo', 55,00);
INSERT INTO produto(id, nome, descricao, tamanho, cor, modelo, valor) VALUES (9, 'Cropped Navegadores', 'Cropped Raposinha', 'Preto', 'Cropped', 55,00);
INSERT INTO produto(id, nome, descricao, tamanho, cor, modelo, valor) VALUES (10, 'Short Navegadores', 'Shortinho Chavoso', 'Laranja', 'Short', 55,00);

INSERT INTO contato(id, nome, email, assunto, texto, anexo, data_receb) VALUES (1, 'Alexandre Souza', 'alexandre@gmail.com', 'Lorem ipsum', 'Lorem ipsum dolor sit amt...', 'comprovante.pdf', '10/02/2023');
INSERT INTO contato(id, nome, email, assunto, texto, anexo, data_receb) VALUES (2, 'Bruno Dutra', 'bruno@gmail.com', 'Lorem ipsum', 'Lorem ipsum dolor sit amt...', 'comprovante.jpg', '05/01/2023');
INSERT INTO contato(id, nome, email, assunto, texto, anexo, data_receb) VALUES (3, 'Cristiano Pereira', 'cristiano@gmail.com', 'Lorem ipsum', 'Lorem ipsum dolor sit amt...', 'proposta.jpg', '08/03/2023');
INSERT INTO contato(id, nome, email, assunto, texto, anexo, data_receb) VALUES (4, 'Ana Roza', 'ana@gmail.com', 'Lorem ipsum', 'Lorem ipsum dolor sit amt...', 'design.jpg', '15/10/2023');

INSERT INTO evento(id, nome, descricao, tipo, modalidade, valor, data_e, id_adm) VALUES(1, 'Campeonato de LoL', 'Lorem ipsum dolor sit ame...', 'Jogos', 'Online', 0.0, '10/03/2023', 1);
INSERT INTO evento(id, nome, descricao, tipo, modalidade, valor, data_e, id_adm) VALUES(2, 'Calourada', 'Lorem ipsum dolor sit ame...', 'Festa', 'Presencial', 0.0, '15/04/2023', 1);

INSERT INTO blog(id, titulo, subtitulo, texto, id_adm, imagem) VALUES (1, 'AAACCN: Como surgiu?', 'Fique por dentro de como as coisas surgiram!', 'Lorem Ipsum dolor sit am...', 1, 'aaaccn.jpg');
INSERT INTO blog(id, titulo, subtitulo, texto, id_adm, imagem) VALUES (2, 'AAACCN', 'AAACCN', 'Lorem Ipsum dolor sit am...', 2, 'aaaccn.jpg');

INSERT INTO estoque(id, id_prod, qtde, data_compra) VALUES (1, 1, 30, '10/12/2022');
INSERT INTO estoque(id, id_prod, qtde, data_compra) VALUES (2, 2, 20, '01/02/2023');
INSERT INTO estoque(id, id_prod, qtde, data_compra) VALUES (3, 3, 20, '15/02/2023');

INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (1, 1, 123456789, '15/11/2022', '20/11/2022', '20/12/2022', 'Pix', 'comprovante.jpg');
INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (2, 2, 234567890, '10/12/2022', '20/12/2022', '10/01/2023', 'Pix', 'comprovante.jpg');
INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (3, 1, 345678901, '15/01/2023', '20/01/2023', '20/02/2023', 'Dinheiro', 'comprovante.jpg');
INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (4, 3, 345678901, '15/01/2023', '20/01/2023', '20/02/2023', 'Dinheiro', 'comprovante.jpg');
INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (5, 3, 456789012, '05/01/2023', '15/01/2023', '25/02/2023', 'Pix', 'comprovante.jpg');
INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (5, 3, 456789012, '05/01/2023', '20/01/2023', '25/02/2023', 'Pix', 'comprovante.jpg');
INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (6, 2, 901234567, '19/08/2023', '23/01/2023', '30/08/2023', 'Pix', 'comprovante.jpg');
INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (7, 1, 901234567, '13/07/2023', '13/01/2023', '12/08/2023', 'Pix', 'comprovante.jpg');
INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (8, 1, 456789012, '15/05/2023', '05/01/2023', '29/06/2023', 'Pix', 'comprovante.jpg');
INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (9, 2, 890123456, '05/09/2023', '18/01/2023', '25/01/2023', 'Pix', 'comprovante.jpg');
INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (10, 3, 456789012, '05/12/2023', '12/01/2023', '25/01/2023', 'Pix', 'comprovante.jpg');
INSERT INTO membro_produto(id, id_prod, membro_matricula, data_pedido, data_pagamento, data_entrega, tipo_pagamento, comprovante) VALUES (11, 3, 890123456, '07/04/2023', '10/01/2023', '25/05/2023', 'Pix', 'comprovante.jpg');

INSERT INTO membro_evento(membro_matricula, id_evento) VALUES (123456789, 1);
INSERT INTO membro_evento(membro_matricula, id_evento) VALUES (123456789, 2);
INSERT INTO membro_evento(membro_matricula, id_evento) VALUES (789012345, 2);
INSERT INTO membro_evento(membro_matricula, id_evento) VALUES (789012345, 1);

INSERT INTO carteirinha(id, membro_matricula, validade) VALUES (1, 789012345, '10/10/2023');
INSERT INTO carteirinha(id, membro_matricula, validade) VALUES (2, 123456789, '30/12/2022');
INSERT INTO carteirinha(id, membro_matricula, validade) VALUES (3, 567890123, '20/05/2023');
INSERT INTO carteirinha(id, membro_matricula, validade) VALUES (4, 890123456, '28/02/2023');
INSERT INTO carteirinha(id, membro_matricula, validade) VALUES (5, 901234567, '15/02/2024');
INSERT INTO carteirinha(id, membro_matricula, validade) VALUES (6, 345678901, '01/11/2023');
INSERT INTO carteirinha(id, membro_matricula, validade) VALUES (7, 456789012, '01/05/2023');
INSERT INTO carteirinha(id, membro_matricula, validade) VALUES (8, 123450987, '30/07/2023');
INSERT INTO carteirinha(id, membro_matricula, validade) VALUES (9, 234567890, '19/07/2023');
INSERT INTO carteirinha(id, membro_matricula, validade) VALUES (10,678901234, '03/03/2023');

INSERT INTO publicacao(id_blog, id_adm) VALUES (1, 2);
INSERT INTO publicacao(id_blog, id_adm) VALUES (2, 1);

SELECT * FROM membro;
SELECT * FROM produto;
SELECT * FROM blog;
SELECT * FROM estoque;
SELECT * FROM membro_produto;
SELECT * FROM membro_evento;
SELECT * FROM carteirinha;

--membros sem alergias e condições
SELECT m.matricula, m.nome, m.email FROM membro m WHERE alergia_condicao is null;
--membro e carteirinha
SELECT m.nome, m.matricula, c.id, c.validade FROM carteirinha c INNER JOIN membro m ON membro_matricula = matricula;
--membros que pagaram no pix
SELECT m.nome, mp.* FROM membro_produto mp INNER JOIN membro m ON membro_matricula = matricula WHERE tipo_pagamento = 'Pix';
--membros que nunca compraram nada
SELECT * FROM membro WHERE matricula NOT IN(SELECT membro_matricula FROM membro_produto);
