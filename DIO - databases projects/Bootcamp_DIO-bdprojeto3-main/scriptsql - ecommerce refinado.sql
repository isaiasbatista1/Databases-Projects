-- criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente 

create table clients(
			idClient int auto_increment primary key,
            Fname varchar(10), 
            Minit char(3), 
            Lname varchar(20), 
            CPF char(11) not null,
            Address varchar(30), 
            constraint unique_cpf_client unique(CPF)
);            

desc clients;
-- size equivale a dimensão do produto

-- criar tabela produto 
create table product(
			idProduct int auto_increment primary key,
            Pname varchar(10), 
            classification_kids bool default false, 
            category enum('Eletrônico','Vestimenta','Brinquedos', 'Alimentos','Móveis') not null, 
			avaliação float default 0,
            size varchar(10)
);
desc product;            
  -- criar tabela pagamento  e continuar no desafio: terminar de implementar a tabela e criar a conexão com as tabelas necessárias 
  -- além disso refletir essa modificação no diagrama de esquema relacional.
  -- criar constraints relacionadas ao pagamento
  
create table paymnents(
		idClient int primary key,
        id_payment enum('Boleto','Cartão','Dois Cartões'),
        limitAvaliable float,
        primary key(idClient, id_payment)
);


-- criar tabela pedido
create table orders(
			idOrder int auto_increment primary key,
            idOrderClient int, 
			orderStatus enum('Cancelado','Confirmado','Em Processamento') default 'Em Processamento',
            orderDescription varchar (255),
			sandValue float default 10,
            paymentCash bool default false,
            constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);           
desc orders;
 
-- criar tabela estoque
create table productStorage(
			idProductStorage int auto_increment primary key,
			storageLocation varchar(255),
            quantity int default 0
);  
  
desc productStorage;
  
-- criar tabela fornecedor
create table supplier(
			idproductStorage int auto_increment primary key,
			SocialName varchar(255) not null,
            CNPJ char(15) not null,
            contact char(11) not null,
            constraint unique_supplier unique(CNPJ)
);         

desc supplier;
            
-- criar tabela vendedor   
create table seller(
			idSeller int auto_increment primary key,
			SocialName varchar(255) not null,
            AbstName varchar(255),
            CNPJ char(15) not null,
            CPF char(9),
            location varchar(255), 
            contact char(11) not null,
            constraint unique_cnpj_seller unique(CNPJ),
            constraint unique_scpf_seller unique(CPF)
);         

-- criar tabela produtos vendedor
create table productSeller(
	 idPseller int,
	 idPproduct int, 
	 prodQuantify int default 1,
	 primary key (idPseller, idPproduct),
	 constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
	 constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

desc productSeller;


-- criar tabela product order
create table productOrder(
		idPOproduct int,
        idPOorder int,
        poQuantify int default 1,
        poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
        primary key (idPOproduct, idPOorder),
        constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
        constraint fk_productorder_product foreign key (idPOorder) references orders (idOrder)
);

desc productOrder;

-- criar tabela storagelocation      
 
create table storageLocation(
	idLproduct int,
	idLstorage int,
	location varchar(255) not null,
	primary key (idLproduct, idLstorage),
	constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
	constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
); 

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key(idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key(idPsProduct) references product(idProduct)
);

desc productSupplier;

show tables;
         
show databases;         