create database oficina_projeto;
use oficina_projeto;


-- criando tabela cliente
create table cliente(
	idCliente int auto_increment primary key,
    CPF char(11) not null,
    Endereço varchar(30),
    Autoriza_serviço bool,
    constraint unique_cpf_cliente unique(CPF),
    Equipe_idEquipe int not null,
    Equipe_Serviço int not null,
    Pagamento_idPagamento int not null
);

desc cliente;

-- criando tabela pagamento
create table pagamento(
	idPagamento int auto_increment primary key not null,
    Dinheiro float,
    Cartão float,
    Pix  float
);

desc pagamento;


-- criando tabela peças
create table peças(
	idVeiculo int auto_increment primary key not null,
	codigo varchar(10),
    valor float 
);

desc peças;

-- criando tabela equipe
create table equipe(
	idEquipe int auto_increment primary key not null,
    avaliaServiço varchar (20),
    executaServiço varchar (20),
    ServiçoidServiço int not null,
    Os_idOs int not null
);

desc equipe;


-- criando tabela veículo
create table veiculo(
	id_Veiculo int auto_increment primary key not null,
    ano varchar (4),
    placa varchar(10),
    Cliente_idCliente  int not null,
    Cliente_Serviço_idServiço int not null,
    Cliente_Equipe_idEquipe int not null,
    Cliente_Equipe_Serviço_idServiço int not null,
    Mecânico_idMecanico int not null 
);

desc veiculo;

-- criando tabela serviço 
create table serviço(
	id_Serviço int auto_increment primary key not null,
    conserto varchar(20),
    revisão varchar (20)
);

desc serviço;

-- criando tabela OS
create table os(
	id_Os int auto_increment primary key not null,
    calcula_valor varchar(20),
    constlçta_tabela varchar(255),
    valor_peça float,
    número int not null,
    data_da_emissão date,
    valor_serviço float not null,
    status enum('Em Andamento','Concluído'),
    data_da_conclusão date not null    
);

desc os;

-- criando tabela mecânico
create table mecanico(
	id_mecanico int primary key not null,
    nome varchar(45),
    codigo char(10),
    endereço varchar(45),
    especialidade varchar(45) not null
);
desc mecanico;

-- criando tabela Relação OS e serviço
create table relacao_os_serviço(
	OS_idOS int auto_increment primary key not null,
    Serviço_idServiço int not null
);
desc relacao_os_serviço;

-- criando tabela Relação OS e Peças
create table relacao_os_peças(
	OS_idOs int auto_increment primary key not null, 
    Peça_idVeiculo  int not null 
);

desc relacao_os_peças;

-- exibindo todas as tabelas existentes no db oficina
show tables;



