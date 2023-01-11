-- DROP TABLE
DROP TABLE TB_ESTADO CASCADE CONSTRAINTS;
DROP TABLE TB_CIDADE CASCADE CONSTRAINTS;
DROP TABLE TB_ANIMAL;
DROP TABLE TB_RACA_ANIMAL;
DROP TABLE TB_TIPO_ANIMAL;
DROP TABLE TB_CLIENTE CASCADE CONSTRAINTS;
DROP TABLE TB_CLIENTE_PJ CASCADE CONSTRAINTS;
DROP TABLE TB_CLIENTE_PF CASCADE CONSTRAINTS;
DROP TABLE TB_VENDA CASCADE CONSTRAINTS;
DROP TABLE TB_VENDEDOR CASCADE CONSTRAINTS;
DROP TABLE TB_DEVOLUCAO CASCADE CONSTRAINTS;
DROP TABLE TB_RESERVA CASCADE CONSTRAINTS;
DROP TABLE TB_LOJA CASCADE CONSTRAINTS;
DROP TABLE TB_ESTOQUE_PRODUTO;
DROP TABLE TB_PRODUTO CASCADE CONSTRAINTS;
DROP TABLE TB_ITENS_VENDA;
DROP TABLE TB_UNIDADE_PRODUTO CASCADE CONSTRAINTS;
DROP TABLE TB_STATUS_PRODUTO CASCADE CONSTRAINTS;
DROP TABLE TB_FORNECEDOR_PRODUTO CASCADE CONSTRAINTS;
DROP TABLE TB_FORNECEDOR;
DROP TABLE TB_DEVOLUCAO_PRODUTOS;
DROP TABLE TB_RESERVA_PRODUTOS;

-- CREATE TABLE
CREATE TABLE TB_ESTADO (
    uf VARCHAR2(2) NOT NULL, 
    nm_estado VARCHAR2(30) NOT NULL,
    CONSTRAINT estado_pk PRIMARY KEY(uf));

CREATE TABLE TB_CIDADE (
    id_cidade NUMBER(5) NOT NULL,
    uf VARCHAR2(2) NOT NULL,
    nm_cidade VARCHAR2(30) NOT NULL,
    CONSTRAINT cidade_pk PRIMARY KEY(id_cidade));
    
CREATE TABLE TB_CLIENTE (
    id_cliente NUMBER(5) NOT NULL,
    nm_cliente VARCHAR2(60) DEFAULT 'Cliente' NOT NULL , -- DEFAULT 1 (1c)
    email VARCHAR2(120) NOT NULL,
    logradouro VARCHAR2(50),
    complemento VARCHAR2(20),
    cep VARCHAR2(20),
    id_cidade NUMBER(5),
    uf VARCHAR2(2),
    tp_cliente NUMBER(1) NOT NULL,
    CONSTRAINT cliente_id_cliente_pk PRIMARY KEY(id_cliente),
    CONSTRAINT cliente_uk UNIQUE (email));

CREATE TABLE TB_ANIMAL (
    id_animal NUMBER(5) NOT NULL,
    nm_animal VARCHAR2(100) NOT NULL,
    dt_nascimento DATE,
    id_raca NUMBER(5) NOT NULL,
    id_tipo VARCHAR2(5) NOT NULL,
    id_cliente NUMBER(5) NOT NULL,
    CONSTRAINT animal_pk PRIMARY KEY(id_animal));

CREATE TABLE TB_RACA_ANIMAL (
    id_raca NUMBER(5) NOT NULL,
    nm_raca VARCHAR2(50) NOT NULL,
    id_tipo NUMBER(5) NOT NULL,
    CONSTRAINT raca_animal_pk PRIMARY KEY(id_raca));
    
CREATE TABLE TB_TIPO_ANIMAL (
    id_tipo NUMBER(5) NOT NULL,
    nm_tipo VARCHAR2(50),
    CONSTRAINT tipo_animal_pk PRIMARY KEY(id_tipo));

CREATE TABLE TB_CLIENTE_PJ(
    id_cliente_pj NUMBER(5) NOT NULL,
    cnpj VARCHAR2(14) NOT NULL,
    id_cliente NUMBER(5) NOT NULL,
    CONSTRAINT cliente_pj_pk PRIMARY KEY(id_cliente_pj));
    
CREATE TABLE TB_CLIENTE_PF(
    id_cliente_pf NUMBER(5) NOT NULL,
    cpf VARCHAR2(14),
    dt_nascimento DATE,
    id_cliente NUMBER(5) NOT NULL,
    CONSTRAINT cliente_pf_pk PRIMARY KEY(id_cliente_pf),
    CONSTRAINT cliente_pf_uk UNIQUE (cpf));
    
CREATE TABLE TB_VENDA (
    id_venda NUMBER(8) NOT NULL,
    dt_venda DATE NOT NULL,
    id_cliente NUMBER(5) NOT NULL,
    id_vendedor NUMBER(5) NOT NULL,
    id_loja NUMBER(5) NOT NULL,
    CONSTRAINT venda_pk PRIMARY KEY(id_venda));
    
CREATE TABLE TB_VENDEDOR (
    id_vendedor NUMBER(5) NOT NULL,
    nm_vendedor VARCHAR2(60) DEFAULT 'Vendador' NOT NULL , -- DEFAULT 2 (1c)
    dt_admissao DATE,
    dt_demissao DATE,
    id_vend_aprov_item NUMBER(5),
    CONSTRAINT vendedor_pk PRIMARY KEY(id_vendedor));

CREATE TABLE TB_ITENS_VENDA (
    id_venda NUMBER(8) NOT NULL,
    qtd NUMBER(8,2) NOT NULL,
    vl_unit_venda NUMBER(10,2),
    id_vendedor NUMBER(5),
    id_produto NUMBER(5) NOT NULL,
    CONSTRAINT itens_venda_pk PRIMARY KEY(id_produto, id_venda));

CREATE TABLE TB_DEVOLUCAO (
    id_devolucao NUMBER(5) NOT NULL,
    dt_devolucao DATE NOT NULL,
    id_cliente_pf NUMBER(5) NOT NULL, 
    CONSTRAINT devolucao_pk PRIMARY KEY(id_devolucao));
    
CREATE TABLE TB_RESERVA (
    id_reserva NUMBER(5) NOT NULL,
    dt_reserva DATE NOT NULL,
    dt_retirada DATE NOT NULL,
    id_cliente_pj NUMBER(5) NOT NULL,
    CONSTRAINT reserva_pk PRIMARY KEY(id_reserva));
    
CREATE TABLE TB_LOJA (
    id_loja NUMBER(3) NOT NULL,
    nm_loja VARCHAR2(30) NOT NULL,
    nr_telefone NUMBER(15),
    CONSTRAINT loja_pk PRIMARY KEY(id_loja));
    
CREATE TABLE TB_ESTOQUE_PRODUTO (
    id_loja NUMBER(5) NOT NULL,
    id_produto NUMBER(5) NOT NULL,
    qtd_estoque NUMBER(10,2) NOT NULL,
    CONSTRAINT estoque_produto_pk PRIMARY KEY(id_loja, id_produto));   
    
CREATE TABLE TB_DEVOLUCAO_PRODUTOS (
    id_venda NUMBER(8) NOT NULL,
    id_produto NUMBER(5) NOT NULL,
    id_devolucao NUMBER(5) NOT NULL,
    qtd NUMBER(8,2) NOT NULL,
    CONSTRAINT devolucao_produto_pk PRIMARY KEY(id_venda, id_produto, id_devolucao));  
    
CREATE TABLE TB_PRODUTO (
    id_produto NUMBER(6) NOT NULL,
    nm_produto VARCHAR2(60) NOT NULL,
    vl_unitario NUMBER(10,2) NOT NULL,
    id_unidade VARCHAR2(5) NOT NULL,
    id_status NUMBER(5) NOT NULL,
    CONSTRAINT produto_pk PRIMARY KEY(id_produto)); 
    
CREATE TABLE TB_UNIDADE_PRODUTO (
    id_unidade VARCHAR2(50) NOT NULL,
    ds_unidade VARCHAR2(20),
    CONSTRAINT unidade_produto_pk PRIMARY KEY(id_unidade)); 
    
CREATE TABLE TB_STATUS_PRODUTO (
    id_status NUMBER(5) NOT NULL,
    ds_status VARCHAR2(60) NOT NULL, 
    CONSTRAINT status_produto_pk PRIMARY KEY(id_status)); 

CREATE TABLE TB_FORNECEDOR_PRODUTO (
    id_produto NUMBER(5) NOT NULL,
    id_fornecedor NUMBER(5) NOT NULL, 
    CONSTRAINT fornecedor_produto_pk PRIMARY KEY(id_produto, id_fornecedor));     

CREATE TABLE TB_FORNECEDOR (
    id_fornecedor NUMBER(2) NOT NULL,
    nm_fornecedor VARCHAR2(60) NOT NULL,
    CONSTRAINT fornecedor_pk PRIMARY KEY (id_fornecedor));
    
CREATE TABLE TB_RESERVA_PRODUTOS (
    id_produto NUMBER(5) NOT NULL,
    id_reserva NUMBER(5) NOT NULL,
    qtd NUMBER(8,2) NOT NULL,
    CONSTRAINT reserva_produtos_pk PRIMARY KEY (id_produto, id_reserva));

-- FOREINGN KEY's
ALTER TABLE TB_CIDADE
ADD CONSTRAINT cidade_uf_fk FOREIGN KEY(uf) REFERENCES TB_ESTADO(uf);

ALTER TABLE TB_CLIENTE 
ADD CONSTRAINT cliente_cidade_fk FOREIGN KEY (id_cidade) REFERENCES TB_CIDADE(id_cidade);

ALTER TABLE TB_CLIENTE 
ADD CONSTRAINT cliente_uf_fk FOREIGN KEY (uf) REFERENCES TB_ESTADO(uf);

ALTER TABLE TB_RACA_ANIMAL
ADD CONSTRAINT raca_animal_fk FOREIGN KEY (id_tipo) REFERENCES TB_TIPO_ANIMAL(id_tipo);

ALTER TABLE TB_ANIMAL
ADD CONSTRAINT animal_raca_fk FOREIGN KEY (id_raca) REFERENCES TB_RACA_ANIMAL(id_raca);

ALTER TABLE TB_ANIMAL
ADD CONSTRAINT animal_cliente_fk FOREIGN KEY (id_cliente) REFERENCES TB_CLIENTE(id_cliente);

ALTER TABLE TB_CLIENTE_PJ
ADD CONSTRAINT pj_cliente_fk FOREIGN KEY (id_cliente) REFERENCES TB_CLIENTE(id_cliente);

ALTER TABLE TB_CLIENTE_PF
ADD CONSTRAINT pf_cliente_fk FOREIGN KEY (id_cliente) REFERENCES TB_CLIENTE(id_cliente);

ALTER TABLE TB_DEVOLUCAO
ADD CONSTRAINT devolucao_pf_fk FOREIGN KEY (id_cliente_pf) REFERENCES TB_CLIENTE_PF(id_cliente_pf);

ALTER TABLE TB_RESERVA
ADD CONSTRAINT reserva_pj_fk FOREIGN KEY (id_cliente_pj) REFERENCES TB_CLIENTE_PJ(id_cliente_pj);

ALTER TABLE TB_DEVOLUCAO_PRODUTOS
ADD CONSTRAINT devol_prod_devol_fk FOREIGN KEY (id_devolucao) REFERENCES TB_DEVOLUCAO(id_devolucao);

ALTER TABLE TB_DEVOLUCAO_PRODUTOS
ADD CONSTRAINT devol_prod_vend_fk FOREIGN KEY (id_venda) REFERENCES TB_VENDA(id_venda); 

ALTER TABLE TB_DEVOLUCAO_PRODUTOS
ADD CONSTRAINT devol_prod_prod_fk FOREIGN KEY (id_produto) REFERENCES TB_PRODUTO(id_produto); 

ALTER TABLE TB_VENDA
ADD CONSTRAINT venda_cliente_fk FOREIGN KEY (id_cliente) REFERENCES TB_CLIENTE(id_cliente);

ALTER TABLE TB_VENDA
ADD CONSTRAINT venda_vendedor_fk FOREIGN KEY (id_vendedor) REFERENCES TB_VENDEDOR(id_vendedor);

ALTER TABLE TB_VENDA
ADD CONSTRAINT venda_loja_fk FOREIGN KEY (id_loja) REFERENCES TB_LOJA(id_loja);

ALTER TABLE TB_VENDEDOR
ADD CONSTRAINT vendedor_vendedor_fk FOREIGN KEY (id_vend_aprov_item) REFERENCES TB_VENDEDOR(id_vendedor);

ALTER TABLE TB_ESTOQUE_PRODUTO
ADD CONSTRAINT estoq_prod_loja_fk FOREIGN KEY (id_loja) REFERENCES TB_LOJA(id_loja);

ALTER TABLE TB_ESTOQUE_PRODUTO
ADD CONSTRAINT estoq_prod_prod_fk FOREIGN KEY (id_produto) REFERENCES TB_PRODUTO(id_produto);

ALTER TABLE TB_PRODUTO
ADD CONSTRAINT produto_unidade_fk FOREIGN KEY (id_unidade) REFERENCES TB_UNIDADE_PRODUTO(id_unidade);

ALTER TABLE TB_PRODUTO
ADD CONSTRAINT produto_status_fk FOREIGN KEY (id_status) REFERENCES TB_STATUS_PRODUTO(id_status);

ALTER TABLE TB_FORNECEDOR_PRODUTO
ADD CONSTRAINT fornec_prod_prod_fk FOREIGN KEY (id_produto) REFERENCES TB_PRODUTO(id_produto);

ALTER TABLE TB_FORNECEDOR_PRODUTO
ADD CONSTRAINT fornec_prod_fornec_fk FOREIGN KEY (id_fornecedor) REFERENCES TB_FORNECEDOR(id_fornecedor);

ALTER TABLE TB_RESERVA_PRODUTOS
ADD CONSTRAINT reserv_prod_prod_fk FOREIGN KEY (id_produto) REFERENCES TB_PRODUTO(id_produto);

ALTER TABLE TB_RESERVA_PRODUTOS
ADD CONSTRAINT reserv_prod_reserv_fk FOREIGN KEY (id_reserva) REFERENCES TB_RESERVA(id_reserva);

ALTER TABLE TB_ITENS_VENDA
ADD CONSTRAINT itens_venda_venda_fk FOREIGN KEY (id_venda) REFERENCES TB_VENDA(id_venda);

ALTER TABLE TB_ITENS_VENDA
ADD CONSTRAINT itens_venda_prod_fk FOREIGN KEY (id_produto) REFERENCES TB_PRODUTO(id_produto);

ALTER TABLE TB_ITENS_VENDA
ADD CONSTRAINT itens_venda_vendedor_fk FOREIGN KEY (id_vendedor) REFERENCES TB_VENDEDOR(id_vendedor);

-- INDÍCES 
CREATE INDEX nm_cliente_idx ON TB_CLIENTE(nm_cliente); 
CREATE INDEX qtd_estoque_idx ON TB_ESTOQUE_PRODUTO(qtd_estoque); 
CREATE INDEX cnpj_cliente_idx ON TB_CLIENTE_PJ(cnpj); 
CREATE INDEX nm_vendedor_idx ON TB_VENDEDOR(nm_vendedor); 
CREATE INDEX nm_animal_idx ON TB_ANIMAL(nm_animal);    
CREATE INDEX nm_produto_idx ON TB_PRODUTO(nm_produto);    
CREATE INDEX nm_loja_idx ON TB_LOJA(nm_loja); 
CREATE INDEX nm_fornecedor_idx ON TB_FORNECEDOR(nm_fornecedor); 
CREATE INDEX nm_cidade_idx ON TB_CIDADE(nm_cidade); 
CREATE INDEX nm_estado_idx ON TB_ESTADO(nm_estado); 

-- INDÍCES 
CREATE INDEX inform_vendedor_idx ON TB_VENDEDOR(nm_vendedor, dt_admissao, dt_demissao); 
CREATE INDEX inform_loja_idx ON TB_LOJA(nm_loja, nr_telefone); 

-- INDÍCES 
CREATE INDEX contato_cliente_idx ON TB_CLIENTE(nm_cliente, email); 


-- ALTER TABLE 
ALTER TABLE TB_CLIENTE ADD comentario VARCHAR2(500);
ALTER TABLE TB_CLIENTE MODIFY comentario VARCHAR2(800);
