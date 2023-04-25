create database "Final";

--Criação de Usuários para permissões no sistema
create user natalie with password '123456';
create user ricardo with password '123456';
create user duda with password '123456';

--Concessão de permissões para Usuários
create role comprador password '123';
create role vendedor password '123';

--Criação da Tabela Endereço
CREATE TABLE "endereco" (
  "end_cd_id" serial not null,
  "end_tx_rua" varchar (80) not null,
  "end_int_nm" integer not null,
  "end_tx_complem" varchar (50) not null,
  "end_tx_bairro" varchar (50) not null,
  "end_tx_municipio" varchar (30) not null,
  "end_tx_estado" varchar (30) not null,
  "end_tx_cep" char (9) not null,
  PRIMARY KEY ("end_cd_id")
);

CREATE TABLE "usuario" (
  "usu_cd_id" serial not null,
  "usu_tx_nome" varchar (20) not null,
  "usu_tx_nome_user" varchar (20) not null,
  "usu_tx_telefone" varchar (11),
  "usu_tx_email" varchar (30) not null,
  "usu_tx_cpf" varchar (11) not null,
  "usu_bl_compra" boolean default false,
  "usu_bl_venda" boolean default false,
  "fk_end_cd_id" int4,
  PRIMARY KEY ("usu_cd_id"),
  CONSTRAINT "FK_usuario.fk_end_cd_id"
    FOREIGN KEY ("fk_end_cd_id")
      REFERENCES "endereco"("end_cd_id")
);

--Criação de Grant para Comprador e Vendedor
grant update, insert, delete, select on pedido, item_pedido, endereco to comprador;

grant update, insert, delete, select on categoria, produto, endereco to vendedor;

grant comprador to cadu, gabriel, natalie, ricardo;

grant vendedor to duda, natalie, ricardo;

CREATE TABLE "pedido" (
  "ped_cd_id" serial not null,
  "ped_dt_data_hora" timestamp,
  "fk_item_cd_id" int4 not null,
  "fk_usu_cd_id" int4 not null,
  PRIMARY KEY ("ped_cd_id"),
  CONSTRAINT "FK_pedido.fk_usu_cd_id"
    FOREIGN KEY ("fk_usu_cd_id")
      REFERENCES "usuario"("usu_cd_id"),
      constraint "FK_pedido.fk_item_cd_id"
		FOREIGN KEY ("fk_item_cd_id")
			REFERENCES "item_pedido"("item_cd_id")
);
--Moni
 drop table pedido 

--Inclusão da FK Item Pedido e Pedido
alter table	pedido 
add constraint "FK_pedido.fk_item_cd_id"
FOREIGN KEY ("fk_item_cd_id")
REFERENCES "item_pedido"("item_cd_id");

CREATE TABLE "produto" (
  "prod_cd_id" serial not null,
  "prod_tx_nome" varchar (20) not null,
  "prod_tx_descricao" varchar (100) not null,
  "prod_int_qtd_estoque" integer not null,
  "prod_dt_fabricacao" timestamp,
  "prod_nm_valor_unitario" decimal not null,
  "fk_usu_cd_id" int4,
  "fk_cat_cd_id" int4,
  PRIMARY KEY ("prod_cd_id"),
  CONSTRAINT "FK_produto.fk_usu_cd_id"
    FOREIGN KEY ("fk_usu_cd_id")
      REFERENCES "usuario"("usu_cd_id"),
  CONSTRAINT "FK_produto.fk_cat_cd_id"
	FOREIGN KEY ("fk_cat_cd_id")
	  REFERENCES "categoria"("cat_cd_id")
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
--Adição de Soma de valores na tabela Item Pedido
alter table item_pedido
add column item_nm_valor_total decimal;
--Soma
alter table item_pedido 
add column
--Adição de coluna na Tabela Item Pedido
ALTER TABLE item_pedido 
ALTER COLUMN item_nm_valor_total TYPE NUMERIC(10,2);

CREATE TABLE "categoria" (
  "cat_cd_id" serial not null,
  "cat_tx_nome" varchar (20) not null,
  "cat_tx_descricao" varchar(100) not null,
  PRIMARY KEY ("cat_cd_id")
);

--Inserção em Endereço
insert into endereco 
values ('1', 'Rua Cristo', '10', 'A', 'Bingen', 'Petrópolis', 'RJ', '25555555'),
('2', 'Rua Redentor', '15555', '', 'Quitanda', 'Petrópolis', 'RJ', '25555555'),
('3', 'Rua Pão', '1555', 'Casa 2', 'Cascatinha', 'Petrópolis', 'RJ', '25555555'),
('4', 'Rua De', '155', '', 'Bingen', 'Centro', 'RJ', '25555555'),
('5', 'Rua Açúcar', '5', 'Bloco 1', 'Leme', 'São Paulo', 'SP', '25555555');

--Inserção em Usuário
insert into usuario 
values ('111', 'Cadu', 'Caduuu', '970707070', 'cadu@gmail.com', '70707070707', true, false),
('222', 'Natalie', 'NatalieMermo', '970707071', 'natalie@gmail.com', '71707070707', true, true),
('333', 'Maria Eduarda', 'DudinhaRivotril', '970707070', 'duda@gmail.com', '72707070707', false, true),
('444', 'Ricardo', 'McRicardinho', '970707070', 'ricardo@gmail.com', '73707070707', true, true),
('555', 'Gabriel', 'Gabriel', '970707070', 'gabriel@gmail.com', '74707070707', true, false);


--Inserção em Categoria
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

--Inserção em Produto
insert into produto (prod_cd_id, prod_tx_nome, prod_tx_descricao, prod_int_qtd_estoque, prod_dt_fabricacao, prod_nm_valor_unitario)
values ('11', 'Mouse', 'Mouse Logitech sem fio - Branco', '2', '2023-03-28 10:50:43.000', '89.90'), 
('21', 'Air Fryer', 'Fritadeira sem óleo Mondial - Preta', '15', current_timestamp, '399.90'), 
('31', 'Conjunto de Cama', 'Conjunto com 3 peças, sendo elas: Fronha, Lençol e Edredom', '7', current_timestamp, '199.90'), 
('41', 'Abajur', 'Abajur no estilo Neoclássico', '3', current_timestamp, '1099.90'), 
('51', 'Harry Potter', 'Box edição de colecionador da Saga', '300', current_timestamp, '9.90'),
('12', 'Teclado Redragon', 'Teclado mecânico Switche azul - Preto RGB', '15', current_timestamp, '289.99'),
('22', 'Micro-ondas', 'Micro-ondas samsung - Inox', '10', current_timestamp, '789.99'),
('32', 'Cobertor', 'Cobertor de lã aretesanal - Branco', '5', current_timestamp, '889.99'),
('42', 'Mesa Chique', 'Mesa de mármore e carvalho', '3', current_timestamp, '6899.99'),
('52', 'O príncipe', 'Manual político de Nicolau Maquiavel', '30', current_timestamp, '89.99'),
('13', 'Monitor LG', 'Monitor full hd HDR - Branco', '8', current_timestamp, '989.99'),
('23', 'Batedeira', 'Batedeira philips - Vermelha', '25', current_timestamp, '389.99'),
('33', 'Travesseiro', 'Travesseiro de penas artificiais - Branco', '20', current_timestamp, '99.99'),
('43', 'Escrivaninha', 'Mesa para escritório com desing minimalista', '35', current_timestamp, '179.99'),
('53', 'Para viver em paz', 'Um compilado de textos de Thich Nhât Hanh', '50', current_timestamp, '19.99'),
('14', 'Case Corsair', 'Gabinete Corsair - Preto', '25', current_timestamp, '459.99'),
('24', 'Geladeira', 'Geladeira samsaung - Inox', '5', current_timestamp, '3889.99'),
('34', 'Toalha', 'Toalha para banho 100% algodão - Branco', '30', current_timestamp, '89.99'),
('44', 'Armário clássico', 'Armário de carvalho com desing clássico', '10', current_timestamp, '89.90'),
('54', 'A Republica', 'Uma série de diálogos escritos por Platão', '30', current_timestamp, '29.99'),
('15', 'Radeon RX6700 xt', 'Placa de vídeo AMD - Preto com RGB', '9', current_timestamp, '2899.99'),
('25', 'Fogão', 'fogão por indução electrolux- inox', '10', current_timestamp, '2679.99'),
('35', 'Toalha de mesa', 'Toalha de mesa 100% algodão - Azul', '20', current_timestamp, '169.99'),
('45', 'Quadro', 'Quadro decorativo com arte estilo impressionista', '1', current_timestamp, '89.99'),
('55', 'A Gaia Ciência', '“brincadeira, astúcia e vingança”', '15', current_timestamp, '39.99')
;

--Inserção de Item Pedido
insert into item_pedido (item_cd_id, item_int_qtd, fk_prod_cd_id)
values ('1', '3', '51'),
('2', '3', '42'),
('3', '3', '35', sum(3 * 35)),
('4', '3', '35', sum(3 * 35));

update item_pedido
set item_int_qtd 
where item_cd_id = 1;

update item_pedido
set fk_prod_cd_id = 11
where item_cd_id = 1;

--insert Pedido
insert into pedido (ped_cd_id, ped_dt_data_hora, fk_item_cd_id, fk_usu_cd_id)
values ('1', current_timestamp, '1', '111')

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

update produto 
set fk_cat_cd_id = 1
where prod_cd_id = 12;

update produto 
set fk_cat_cd_id = 1
where prod_cd_id = 13;

update produto 
set fk_cat_cd_id = 1
where prod_cd_id = 14;

update produto 
set fk_cat_cd_id = 1
where prod_cd_id = 15;

update produto 
set fk_cat_cd_id = 2
where prod_cd_id = 22;

update produto 
set fk_cat_cd_id = 2
where prod_cd_id = 23;

update produto 
set fk_cat_cd_id = 2
where prod_cd_id = 24;

update produto 
set fk_cat_cd_id = 2
where prod_cd_id = 25;

update produto 
set fk_cat_cd_id = 3
where prod_cd_id = 32;

update produto 
set fk_cat_cd_id = 3
where prod_cd_id = 33;

update produto 
set fk_cat_cd_id = 3
where prod_cd_id = 34;

update produto 
set fk_cat_cd_id = 3
where prod_cd_id = 35;

update produto 
set fk_cat_cd_id = 4
where prod_cd_id = 42;

update produto 
set fk_cat_cd_id = 4
where prod_cd_id = 43;

update produto 
set fk_cat_cd_id = 4
where prod_cd_id = 44;

update produto 
set fk_cat_cd_id = 4
where prod_cd_id = 45;

update produto 
set fk_cat_cd_id = 5
where prod_cd_id = 52;

update produto 
set fk_cat_cd_id = 5
where prod_cd_id = 53;

update produto 
set fk_cat_cd_id = 5
where prod_cd_id = 54;

update produto 
set fk_cat_cd_id = 5
where prod_cd_id = 55;

--Link endereço dos Usuários
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

insert into pedido (ped_cd_d, ped_dt_data_hora)
values ('1', current_timestamp)

select * from item_pedido  

select prod_cd_id = 11, item_cd_id = 1, sum(item_int_qtd * prod_nm_valor_unitario) as item_nm_valor_total
from item_pedido 
join produto p ON item_cd_id = p.prod_cd_id
GROUP BY item_int_qtd, prod_nm_valor_unitario;

SELECT
  count(*)
FROM
  produto
where 
	prod_int_qtd_estoque < 15;
	
select distinct item_int_qtd, prod_nm_valor_unitario , SUM(item_int_qtd * prod_nm_valor_unitario) as item_nm_valor_total 
FROM item_pedido, produto p
where prod_cd_id = 11 and item_cd_id = 1 or prod_cd_id = 42 and item_cd_id = 2 or prod_cd_id = 35 and item_cd_id = 2
GROUP BY item_int_qtd, prod_nm_valor_unitario;


drop view nota_fiscal 


select * from usuario;

select * from produto;

select * from pedido;

select * from item_pedido;

select * from endereco;

create view nota_fiscal as 


select
	usuario.usu_tx_nome, 
	usuario.usu_tx_telefone,
	usuario.usu_tx_cpf,
	endereco.end_tx_rua,
	produto.prod_tx_nome,
	produto.prod_nm_valor_unitario, 
	item_pedido.item_int_qtd 
from
	item_pedido 
	inner join produto on item_pedido.fk_prod_cd_id = produto.prod_cd_id
	inner join usuario on produto.fk_usu_cd_id = usuario.usu_cd_id 
	inner join endereco on usuario.fk_end_cd_id = endereco.end_cd_id
	inner join pedido on pedido.fk_item_cd_id = item_pedido.item_cd_id ;

create view Informatica as
 select prod_tx_nome, prod_tx_descricao
 from produto 
 where prod_cd_id = 11 or prod_cd_id = 12 or prod_cd_id = 13 or prod_cd_id = 14 or prod_cd_id = 15
 ;
create view Eletrodomésticos as
 select prod_tx_nome, prod_tx_descricao
 from produto 
 where prod_cd_id = 21 or prod_cd_id = 22 or prod_cd_id = 23 or prod_cd_id =24 or prod_cd_id = 25
 ;
 create view Casa as
 select prod_tx_nome, prod_tx_descricao
 from produto 
 where prod_cd_id = 31 or prod_cd_id = 32 or prod_cd_id = 33 or prod_cd_id = 34 or prod_cd_id = 35
 ;
 create view Decoração as
 select prod_tx_nome, prod_tx_descricao
 from produto 
 where prod_cd_id = 41 or prod_cd_id = 42 or prod_cd_id = 43 or prod_cd_id = 44 or prod_cd_id = 45
 ;
create view Livros as
 select prod_tx_nome, prod_tx_descricao
 from produto 
 where prod_cd_id = 51 or prod_cd_id = 52 or prod_cd_id = 53 or prod_cd_id = 54 or prod_cd_id = 55
	;
update produto
set fk_usu_cd_id = 111

	
select
	*
from
	Livros
	
	
	
	select *
	from Informatica 
	
