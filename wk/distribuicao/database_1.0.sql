/** mysql-5.7.29-win32 **/

create database bd_wk;
use bd_wk;

create table cliente (
  id_cliente int not null auto_increment comment 'cód. cliente',
  nome varchar(255) not null comment 'nome',
  cidade varchar(100) comment 'cidade',
  uf char(2) comment 'uf',
  primary key (id_cliente),
  unique key nome (nome),
  key id_cliente (id_cliente)
) comment='Cadastro de Cliente';

create table produto (
  id_produto int not null auto_increment comment 'cód. produto',
  descricao varchar(255) comment 'descrição',
  valor_unitario decimal(11,2) not null comment 'valor unitário',
  primary key (id_produto),
  unique key descricao (descricao),
  key id_produto (id_produto)
) comment='Cadastro de Produto';

create table pedido (
	id_pedido int not null auto_increment comment 'número pedido',
	data_emissao date not null comment 'data de emissão',
	id_cliente int not null comment 'cód. cliente',
	primary key (id_pedido),
	index id_pedido (id_pedido),
	index fk_pedido_cliente (id_cliente),
	constraint fk_pedido_cliente foreign key (id_cliente) references cliente (id_cliente) on update no action on delete no action
) comment='Pedidos de Venda';

create table pedido_item (
	id_item int not null auto_increment comment 'cód. item',
	id_pedido int not null comment 'número do pedido',
	id_produto int not null comment 'cód. produto',
	quantidade decimal(11,2) not null comment 'quantidade',
	valor_unitario decimal(11,2) not null comment 'valor unitário',
	valor_total decimal(11,2) not null comment 'valor total',
	primary key (id_item),
	index id_itembd_wk (id_item),
	index fk_pedido_produto_pedido (id_pedido),
	index fk_pedido_produto_produto (id_produto),
	constraint fk_pedido_produto_pedido foreign key (id_pedido) references pedido (id_pedido) on update no action on delete cascade,
	constraint fk_pedido_produto_produto foreign key (id_produto) references produto (id_produto) on update no action on delete no action
) comment='Itens do Pedido';

create table keys_increment (
	ultimo_id int(11) not null comment 'útimo sequencial',
	tabela varchar(50) not null comment 'tabela'
) comment='Tabela de Sequenciais';

insert into cliente (nome, cidade, uf) values
	('João Silva', 'São Paulo', 'SP'),
	('Maria Oliveira', 'Rio de Janeiro', 'RJ'),
	('Pedro Souza', 'Belo Horizonte', 'MG'),
	('Ana Costa', 'Curitiba', 'PR'),
	('Carlos Ferreira', 'Salvador', 'BA'),
	('Luciana Lima', 'Fortaleza', 'CE'),
	('Felipe Santos', 'Manaus', 'AM'),
	('Juliana Rocha', 'Recife', 'PE'),
	('Bruno Almeida', 'Porto Alegre', 'RS'),
	('Camila Mendes', 'Florianópolis', 'SC'),
	('Rafael Pereira', 'Goiânia', 'GO'),
	('Fernanda Carvalho', 'Brasília', 'DF'),
	('Rodrigo Barbosa', 'Natal', 'RN'),
	('Patrícia Martins', 'Cuiabá', 'MT'),
	('Gustavo Andrade', 'Vitória', 'ES'),
	('Isabela Neves', 'Maceió', 'AL'),
	('Ricardo Monteiro', 'João Pessoa', 'PB'),
	('Mariana Borges', 'Campo Grande', 'MS'),
	('Thiago Araujo', 'São Luís', 'MA'),
	('Gabriela Pires', 'Teresina', 'PI');
	
insert into produto (descricao, valor_unitario) values
	('Smartphone', 1500.00),
	('Notebook', 3200.00),
	('Tablet', 800.00),
	('Teclado', 120.00),
	('Mouse', 80.00),
	('Monitor', 600.00),
	('Impressora', 850.00),
	('Fone de Ouvido', 150.00),
	('Câmera', 2200.00),
	('Microfone', 300.00),
	('Headset Gamer', 350.00),
	('Cadeira Gamer', 900.00),
	('HD Externo', 400.00),
	('Pen Drive', 50.00),
	('Carregador Portátil', 100.00),
	('Caixa de Som', 200.00),
	('Projetor', 1800.00),
	('Smartwatch', 900.00),
	('Roteador Wi-Fi', 250.00),
	('Placa de Vídeo', 3200.00);
	
