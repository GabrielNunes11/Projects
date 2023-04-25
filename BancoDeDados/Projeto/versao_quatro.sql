create database "Trabalho";

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
  "fk_end_cd_id" int4 not null,
  PRIMARY KEY ("usu_cd_id"),
  CONSTRAINT "FK_usuario.fk_end_cd_id"
    FOREIGN KEY ("fk_end_cd_id")
      REFERENCES "endereco"("end_cd_id")
);

--Criação de Grant para conceder permissões de Comprador e Vendedor
grant update, insert, delete, select on pedido, item_pedido, endereco to comprador;
grant update, insert, delete, select on categoria, produto, endereco to vendedor;

--Criação de Grant para encaminhar aos usuários suas permissões
grant comprador to cadu, gabriel, natalie, ricardo;
grant vendedor to duda, natalie, ricardo;

CREATE TABLE "produto" (
  "prod_cd_id" serial not null,
  "prod_tx_nome" varchar (20) not null,
  "prod_tx_descricao" varchar (100) not null,
  "prod_int_qtd_estoque" integer not null,
  "prod_dt_fabricacao" timestamp,
  "prod_nm_valor_unitario" decimal not null,
  "fk_usu_cd_id" int4 not null,
  "fk_cat_cd_id" int4 not null,
  PRIMARY KEY ("prod_cd_id"),
  CONSTRAINT "FK_produto.fk_usu_cd_id"
    FOREIGN KEY ("fk_usu_cd_id")
      REFERENCES "usuario"("usu_cd_id")
);
--Inclusão de Chave Estrangeira na Tabela Produto
alter table	produto 
add CONSTRAINT "FK_produto.fk_cat_cd_id"
	FOREIGN KEY ("fk_cat_cd_id")
	  REFERENCES "categoria"("cat_cd_id");

CREATE TABLE "categoria" (
  "cat_cd_id" serial not null,
  "cat_tx_nome" varchar (20) not null,
  "cat_tx_descricao" varchar(100) not null,
  PRIMARY KEY ("cat_cd_id")
);

CREATE TABLE "item_pedido" (
  "item_cd_id" serial not null,
  "item_int_qtd" integer not null,
  "fk_prod_cd_id" int4 not null,
  PRIMARY KEY ("item_cd_id"),
  CONSTRAINT "FK_item_pedido.fk_prod_cd_id"
    FOREIGN KEY ("fk_prod_cd_id")
      REFERENCES "produto"("prod_cd_id")
);
--Inserção de soma na Tabela Item Pedido
ALTER TABLE item_pedido 
ADD COLUMN item_nm_valor_total numeric(10,2);

CREATE TABLE "pedido" (
  "ped_cd_id" serial not null,
  "ped_dt_data_hora" timestamp,
  "fk_item_cd_id" int4 not null,
  "fk_usu_cd_id" int4 not null,
  PRIMARY KEY ("ped_cd_id"),
  CONSTRAINT "FK_pedido.fk_usu_cd_id"
    FOREIGN KEY ("fk_usu_cd_id")
      REFERENCES "usuario"("usu_cd_id")
);
--Inclusão de Chave Estrangeira na Tabela Pedido
alter table	pedido 
add constraint "FK_pedido.fk_item_cd_id"
	FOREIGN KEY ("fk_item_cd_id")
		REFERENCES "item_pedido"("item_cd_id");
		
--Inserção em Endereço
insert into endereco 
values ('1', 'Rua Cristo', '10', 'A', 'Bingen', 'Petrópolis', 'RJ', '25555555'),
('2', 'Rua Redentor', '15555', '', 'Quitanda', 'Petrópolis', 'RJ', '25555555'),
('3', 'Rua Pão', '1555', 'Casa 2', 'Cascatinha', 'Petrópolis', 'RJ', '25555555'),
('4', 'Rua De', '155', '', 'Bingen', 'Centro', 'RJ', '25555555'),
('5', 'Rua Açúcar', '5', 'Bloco 1', 'Leme', 'São Paulo', 'SP', '25555555');

--Inserção em Usuário
insert into usuario 
values ('111', 'Cadu', 'Caduuu', '970707070', 'cadu@gmail.com', '70707070707', true, false, '1'),
('222', 'Natalie', 'NatalieMermo', '970707071', 'natalie@gmail.com', '71707070707', true, true, '2'),
('333', 'Maria Eduarda', 'DudinhaRivotril', '970707070', 'duda@gmail.com', '72707070707', false, true, '3'),
('444', 'Ricardo', 'McRicardinho', '970707070', 'ricardo@gmail.com', '73707070707', true, true, '4'),
('555', 'Gabriel', 'Gabriel', '970707070', 'gabriel@gmail.com', '74707070707', true, false, '5')
;


--Inserção em Categoria
insert into categoria (cat_cd_id, cat_tx_nome, cat_tx_descricao)
values ('1', 'Informática', 'Produtos de Informática em geral'),
('2', 'Eletrodomésticos', 'Eletrodomésticos em geral'),
('3', 'Cama, mesa e Banho ', 'Tudo para seu conforto'),
('4', 'Móveis e Decoração', 'Deixe seu ambiente ainda mais charmoso'),
('5', 'Livros', 'Livros diversos');

--Inserção em Produto
insert into produto (prod_cd_id, prod_tx_nome, prod_tx_descricao, prod_int_qtd_estoque, prod_dt_fabricacao, prod_nm_valor_unitario, fk_usu_cd_id, fk_cat_cd_id)
values ('11', 'Mouse', 'Mouse Logitech sem fio - Branco', '2', '2023-03-28 10:50:43.000', '89.90', '222', '1'), 
('21', 'Air Fryer', 'Fritadeira sem óleo Mondial - Preta', '15', current_timestamp, '399.90', '333', '2'), 
('31', 'Conjunto de Cama', 'Conjunto com 3 peças, sendo elas: Fronha, Lençol e Edredom', '7', current_timestamp, '199.90', '444', '3'), 
('41', 'Abajur', 'Abajur no estilo Neoclássico', '3', current_timestamp, '1099.90', '222', '4'), 
('51', 'Harry Potter', 'Box edição de colecionador da Saga', '300', current_timestamp, '9.90', '333', '5'),
('12', 'Teclado Redragon', 'Teclado mecânico Switche azul - Preto RGB', '15', current_timestamp, '289.99', '444', '1'),
('22', 'Micro-ondas', 'Micro-ondas samsung - Inox', '10', current_timestamp, '789.99', '222', '2'),
('32', 'Cobertor', 'Cobertor de lã aretesanal - Branco', '5', current_timestamp, '889.99', '333', '3'),
('42', 'Mesa Chique', 'Mesa de mármore e carvalho', '3', current_timestamp, '6899.99', '444', '4'),
('52', 'O príncipe', 'Manual político de Nicolau Maquiavel', '30', current_timestamp, '89.99', '222', '5'),
('13', 'Monitor LG', 'Monitor full hd HDR - Branco', '8', current_timestamp, '989.99', '333', '1'),
('23', 'Batedeira', 'Batedeira philips - Vermelha', '25', current_timestamp, '389.99', '222', '2'),
('33', 'Travesseiro', 'Travesseiro de penas artificiais - Branco', '20', current_timestamp, '99.99', '222', '3'),
('43', 'Escrivaninha', 'Mesa para escritório com desing minimalista', '35', current_timestamp, '179.99', '333', '4'),
('53', 'Para viver em paz', 'Um compilado de textos de Thich Nhât Hanh', '50', current_timestamp, '19.99', '444', '5'),
('14', 'Case Corsair', 'Gabinete Corsair - Preto', '25', current_timestamp, '459.99', '222', '1'),
('24', 'Geladeira', 'Geladeira samsaung - Inox', '5', current_timestamp, '3889.99', '444', '2'),
('34', 'Toalha', 'Toalha para banho 100% algodão - Branco', '30', current_timestamp, '89.99', '333', '3'),
('44', 'Armário clássico', 'Armário de carvalho com desing clássico', '10', current_timestamp, '89.90', '222', '4'),
('54', 'A Republica', 'Uma série de diálogos escritos por Platão', '30', current_timestamp, '29.99', '222', '5'),
('15', 'Radeon RX6700 xt', 'Placa de vídeo AMD - Preto com RGB', '9', current_timestamp, '2899.99', '333', '1'),
('25', 'Fogão', 'fogão por indução electrolux- inox', '10', current_timestamp, '2679.99', '222', '2'),
('35', 'Toalha de mesa', 'Toalha de mesa 100% algodão - Azul', '20', current_timestamp, '169.99', '333', '3'),
('45', 'Quadro', 'Quadro decorativo com arte estilo impressionista', '1', current_timestamp, '89.99', '333', '4'),
('55', 'A Gaia Ciência', '“brincadeira, astúcia e vingança”', '15', current_timestamp, '39.99', '222', '5')
;

update produto 
set prod_int_qtd_estoque = 21
where prod_cd_id  = 11;

SELECT
  count(*)
FROM
  produto
where 
	prod_nm_valor_unitario < 100;

--Inclusão em Item Pedido
insert into item_pedido (item_cd_id, item_int_qtd, fk_prod_cd_id)
values ('4', '2', '11');

--Inclusão para Pedidos
insert into pedido (ped_cd_id, ped_dt_data_hora, fk_item_cd_id)
values ('1', current_timestamp, '');

select distinct item_int_qtd, prod_nm_valor_unitario , SUM(item_int_qtd * prod_nm_valor_unitario) as item_nm_valor_total 
FROM item_pedido, produto p
where prod_cd_id = 11 and item_cd_id = 1 or prod_cd_id = 42 and item_cd_id = 2 or prod_cd_id = 35 and item_cd_id = 2
GROUP BY item_int_qtd, prod_nm_valor_unitario;

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
	inner join pedido on pedido.fk_item_cd_id = item_pedido.item_cd_id 

create view Informática as
 select prod_tx_nome, prod_tx_descricao
 from produto 
 where prod_cd_id = 11 or prod_cd_id = 12 or prod_cd_id = 13 or prod_cd_id = 14 or prod_cd_id = 15
	
select * from nota_fiscal nf 
	
