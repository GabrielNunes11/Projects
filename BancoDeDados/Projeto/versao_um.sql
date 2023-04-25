--Criação de Tabelas
CREATE TABLE "endereco" (
  "end_cd_id" serial not null,
  "end_tx_rua" varchar (20) not null,
  "end_int_nm" integer not null,
  "end_tx_complem" varchar (10) not null,
  "end_tx_bairro" varchar (10) not null,
  "end_tx_municipio" varchar (10) not null,
  "end_tx_estado" varchar (2) not null,
  "end_tx_cep" char (9) not null,
  PRIMARY KEY ("end_cd_id")
);

CREATE TABLE "usuario" (
  "usu_cd_id" serial not null,
  "usu_tx_nome" varchar (20) not null,
  "usu_tx_nome_user" varchar (20) not null,
  "usu_int_telefone" integer,
  "usu_tx_email" varchar (30) not null,
  "usu_int_cpf" integer not null,
  "usu_bl_tipo" varchar (10) not null,
  "fk_end_cd_id" int4,
  PRIMARY KEY ("usu_cd_id"),
  CONSTRAINT "FK_usuario.fk_end_cd_id"
    FOREIGN KEY ("fk_end_cd_id")
      REFERENCES "endereco"("end_cd_id")
);

CREATE TABLE "pedido" (
  "ped_cd_d" serial not null,
  "ped_dt_data_hora" timestamp,
  "fk_item_cd_id" int4,
  "fk_usu_cd_id" int4,
  PRIMARY KEY ("ped_cd_d"),
  CONSTRAINT "FK_pedido.fk_usu_cd_id"
    FOREIGN KEY ("fk_usu_cd_id")
      REFERENCES "usuario"("usu_cd_id"),
  CONSTRAINT "FK_pedido.fk_item_cd_id"
    FOREIGN KEY ("fk_item_cd_id")
      REFERENCES "item_pedido"("item_cd_id")
);

CREATE TABLE "item_pedido" (
  "item_cd_id" serial not null,
  "item_int_qtd" integer not null,
  "fk_prod_cd_id" int4,
  PRIMARY KEY ("item_cd_id"),
  CONSTRAINT "FK_item_pedido.fk_prod_cd_id"
    FOREIGN KEY ("fk_prod_cd_id")
      REFERENCES "produto"("prod_cd_id")
);

CREATE TABLE "produto" (
  "prod_cd_id" serial not null,
  "prod_tx_nome" varchar (20) not null,
  "prod_tx_descricao" varchar (100) not null,
  "prod_int_qtd_estoque" integer not null,
  "prod_dt_fabricacao" timestamp,
  "prod_nm_valor_unitario" decimal not null,
  "fk_ven_cd_id" int4,
  "fk_cat_cd_id" int4,
  PRIMARY KEY ("prod_cd_id"),
  CONSTRAINT "FK_produto.fk_ven_cd_id"
    FOREIGN KEY ("fk_ven_cd_id")
      REFERENCES "usuario"("usu_cd_id")
);
begin transaction;
alter table	produto
add constraint "FK_produto.fk_usu_cd_id"
FOREIGN KEY ("fk_usu_cd_id")
REFERENCES "usuario"("usu_cd_id");
rollback transaction;

CREATE TABLE "categoria" (
  "cat_cd_id" serial not null,
  "cat_tx_nome" varchar (20) not null,
  "cat_tx_descricao" varchar(100) not null,
  PRIMARY KEY ("cat_cd_id")
);
--Inclusão de Chave Estrangeira na Tabela Produtos

alter table	produto
add constraint "FK_produto.fk_cat_cd_id"
FOREIGN KEY ("fk_cat_cd_id")
REFERENCES "categoria"("cat_cd_id");

--Inclusão de Chave Estrangeira na Tabela Pedidos
alter table	pedido 
add constraint "FK_pedido.fk_item_cd_id"
FOREIGN KEY ("fk_item_cd_id")
REFERENCES "item_pedido"("item_cd_id");

--Alteração do nome e tipo do telefone em Usuario
alter table usuario 
rename column usu_int_cpf to usu_tx_cpf
alter column usu_tx_cpf type varchar(11)
rename column usu_int_telefone to usu_tx_telefone
alter column usu_tx_telefone type varchar(11);

--Testes de Inserção
insert into usuario
values ('1', 'Zé', 'Zézin', '970707070', 'zezin@gmail.com', '00000000078', TRUE);

insert into usuario (usu_cd_id, usu_tx_nome, usu_tx_nome_user, usu_tx_email, usu_tx_cpf, usu_bl_tipo)
values ('2', 'Maria', 'MariaDoce', 'marizinha@gmail.com', '00000000071', false);

insert into usuario (usu_cd_id, usu_tx_nome, usu_tx_nome_user, usu_tx_email, usu_tx_cpf, usu_bl_tipo)
values ('3', 'Maria', 'MariaDoce', 'marizinha@gmail.com', '00000000071', false);

--Testes de Inserção em Categoria
insert into categoria (cat_cd_id, cat_tx_nome, cat_tx_descricao)
values ('1', 'Informática', 'Produtos de Informática em geral');

insert into categoria (cat_cd_id, cat_tx_nome, cat_tx_descricao)
values ('2', 'Eletrodomésticos', 'Eletrodomésticos em geral');

insert into categoria (cat_cd_id, cat_tx_nome, cat_tx_descricao)
values ('3', 'Cama, mesa e Banho ', 'Tudo para seu conforto');

insert into categoria (cat_cd_id, cat_tx_nome, cat_tx_descricao)
values ('4', 'Móveis e Decoração', 'Deixe seu ambiente ainda mais charmoso');

insert into categoria (cat_cd_id, cat_tx_nome, cat_tx_descricao)
values ('5', 'Livros', 'Livros diversos');

--Testes de Inserção em Produto
insert into produto (prod_cd_id, prod_tx_nome, prod_tx_descricao, prod_int_qtd_estoque, prod_dt_fabricacao, prod_nm_valor_unitario)
values ('11', 'Mouse', 'Mouse Logitech sem fio - Branco', '2', '2023-03-28 10:50:43.000', '89.90'), 
('21', 'Air Fryer', 'Fritadeira sem óleo Mondial - Preta', '15', current_timestamp, '399.90'), 
('31', 'Conjunto de Cama', 'Conjunto com 3 peças, sendo elas: Fronha, Lençol e Edredom', '7', current_timestamp, '199.90'), 
('41', 'Abajur', 'Abajur no estilo Neoclássico', '3', current_timestamp, '1099.90'), 
('51', 'Harry Potter', 'Box edição de colecionador da Saga', '300', current_timestamp, '9.90');

--Links de Produtos com Categorias
update produto 
set fk_cat_cd_id = 1
where prod_cd_id = 11;

update produto 
set fk_cat_cd_id = 2
where prod_cd_id = 21;

update produto 
set fk_cat_cd_id = 3
where prod_cd_id = 31;

update produto 
set fk_cat_cd_id = 4
where prod_cd_id = 41;

update produto 
set fk_cat_cd_id = 5
where prod_cd_id = 51;

--Link Itens com Produtos
update item_pedido 
set item_int_qtd = 2
where item_cd_id= 1;

update item_pedido 
set fk_prod_cd_id = 11
where item_cd_id  = 1;

update item_pedido 
set item_int_qtd = 15
where item_cd_id= 2;

update item_pedido 
set fk_prod_cd_id = 21
where item_cd_id  = 2;

update item_pedido 
set item_int_qtd = 7
where item_cd_id= 3;

update item_pedido 
set fk_prod_cd_id = 31
where item_cd_id  = 3;

update item_pedido 
set item_int_qtd = 3
where item_cd_id= 4;

update item_pedido 
set fk_prod_cd_id = 41
where item_cd_id  = 4;

update item_pedido 
set item_int_qtd = 200
where item_cd_id= 5;

update item_pedido 
set fk_prod_cd_id = 51
where item_cd_id  = 5;

--Realização de Pedido
insert into pedido 
values ('1', current_timestamp);

--Testes de Inserção em Usuario
insert into usuario 
values ('111', 'Cadu', 'Caduuu', '970707070', 'cadu@gmail.com', '70707070707', true),
('222', 'Natalie', 'NatalieMermo', '970707071', 'natalie@gmail.com', '71707070707', true),
('333', 'Maria Eduarda', 'DudinhaRivotril', '970707070', 'duda@gmail.com', '72707070707', true),
('444', 'Ricardo', 'McRicardinho', '970707070', 'ricardo@gmail.com', '73707070707', true),
('555', 'Gabriel', 'Gabriel', '970707070', 'gabriel@gmail.com', '74707070707', true),

--Testes de Inserção em Endereço
insert into endereco 
values ('1', 'Rua Cristo', '10', 'A', 'Bingen', 'Petrópolis', 'RJ', '25555555'),
('2', 'Rua Redentor', '15555', '', 'Quitanda', 'Petrópolis', 'RJ', '25555555'),
('3', 'Rua Pão', '1555', 'Casa 2', 'Cascatinha', 'Petrópolis', 'RJ', '25555555'),
('4', 'Rua De', '155', '', 'Bingen', 'Centro', 'RJ', '25555555'),
('5', 'Rua Açúcar', '5', 'Bloco 1', 'Leme', 'São Paulo', 'SP', '25555555');

--Atualizar endereço dos Usuários
update usuario 
set fk_end_cd_id = 1
where usu_cd_id = 111;

update usuario 
set fk_end_cd_id = 2
where usu_cd_id = 222;

update usuario 
set fk_end_cd_id = 3
where usu_cd_id = 333;

update usuario 
set fk_end_cd_id = 4
where usu_cd_id = 444;

update usuario 
set fk_end_cd_id = 5
where usu_cd_id = 555;

--Atualizar endereço dos Usuários
update produto 
set fk_end_cd_id = 1
where usu_cd_id = 111;

--Testes de Item Pedido
insert into item_pedido 
values ('1', '0'), ('2', '0'), ('3', '0'), ('4', '0'), ('5', '0');
update item_pedido
set item_int_qtd = 2
where item_cd_id = 1;

update item_pedido
set fk_prod_cd_id = 11
where item_cd_id = 1;

--Testes de Pedido
insert into item_pedido 
values ('1', '0'), ('2', '0'), ('3', '0'), ('4', '0'), ('5', '0');
update item_pedido
set item_int_qtd = 2
where item_cd_id = 1;

--Tentativa falha de atualizar o valor de uma das colunas após trocar o tipo dela
update usuario 
set usu_tx_cpf = 00000000079
where usu_cd_id = 1

--Delete de valores 
delete from usuario where usu_cd_id = 1
delete from usuario where usu_cd_id = 2;

select * from produto