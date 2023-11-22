--Implementação física 

DROP DATABASE IF EXISTS garagem;

CREATE DATABASE garagem;

\c garagem;

CREATE TABLE endereco (
    id serial primary key,
    rua character varying(128) not null,
    bairro character varying(128) not null,
    complemento character varying(64) not null,
    numero integer not null
);

CREATE TABLE cliente (
    cpf character(11) primary key,
    nome character varying(128) not null,
    data_nascimento date not null,
    cliente_endereco integer references endereco (id)
);

CREATE TABLE modelo (
    id serial primary key,
    descricao character varying(512) not null,
    ano character(4) not null
);

CREATE TABLE veiculo (
    id serial primary key,
    chassi character(17) not null,
    placa character(7) not null,
    cor character varying(32) not null,
    ano character(4) not null,
    dono char(11) references cliente (cpf),
    modelo_id integer references modelo (id)
);

CREATE TABLE vaga (
    id serial primary key,
    andar character(2) not null
);

CREATE TABLE veiculo_vaga (
    id serial primary key,
    data_hora_entrada timestamp DEFAULT CURRENT_TIMESTAMP,
    data_hora_saida timestamp not null,
    pagamento money not null,
    veiculo_id integer references veiculo (id),
    vaga_id integer references vaga (id)
);

--Placa e o ano do veículo de um determinado veículo



--Placa, o ano do veículo do veículo, se ele possuir ano a partir de 2000



--Liste todos os carros do modelo 1



--Liste todos os estacionamentos de um veículo



--Quanto tempo um veículo ficou em uma determinada vaga?



--Quantidade de veículos de um determinado modelo



--Média de idade dos clientes



--Se cada hora custa 2 reais, quanto cada veículo pagou? Obs:Somente horas inteiras valem para o cálculo