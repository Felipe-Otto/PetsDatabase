-- INSERT
INSERT ALL 
    INTO tb_estado VALUES('SP', 'São Paulo')
    INTO tb_estado VALUES('RJ', 'Rio De Janeiro')
SELECT * FROM dual;

INSERT ALL 
    INTO tb_cidade(uf, nm_cidade) VALUES('SP', 'São Paulo')
    INTO tb_cidade(uf, nm_cidade) VALUES('RJ', 'Rio De Janeiro')
SELECT * FROM dual;    

INSERT ALL 
    INTO tb_cliente(nm_cliente, email, logradouro, complemento, cep, id_cidade, uf, tp_cliente, comentario) 
    VALUES('Sergio Rota', 'profsergiorota@fiap.com.br', 'Av. Lins de Vasconselos, 1222', NULL, '01538-001', 1, 'SP', 0, NULL)
    INTO tb_cliente(nm_cliente, email, logradouro, complemento, cep, id_cidade, uf, tp_cliente, comentario)  
    VALUES('Ricargo Sabo', 'profricardos@fiap.com.br', 'R. Fidêncio Ramos 308', NULL, '04551-902', 1, 'SP', 0, NULL)
    INTO tb_cliente(nm_cliente, email, logradouro, complemento, cep, id_cidade, uf, tp_cliente, comentario) 
    VALUES('Marcos Selmini', 'selmini@fiap.com.br', 'Av. Lins de Vasconselos, 1264', 'Apt. 37', '01538-001', 1, 'SP', 0, NULL)
    INTO tb_cliente(nm_cliente, email, logradouro, complemento, cep, id_cidade, uf, tp_cliente, comentario) 
    VALUES('Nivaldo Zafalon', 'profnivaldo@fiap.com.br', 'Avenida Engenheiro Caetano Álvares, 358', NULL, '02540-005', 1, 'SP', 0, NULL)
    INTO tb_cliente(nm_cliente, email, logradouro, complemento, cep, id_cidade, uf, tp_cliente, comentario) 
    VALUES('Israel Marques', 'profisrael.copi@fiap.com.br', 'Estrada Dois, 181', 'Apt. 84 Bloco A', '04893-120', 1, 'SP', 0, NULL)
    INTO tb_cliente(nm_cliente, email, logradouro, complemento, cep, id_cidade, uf, tp_cliente, comentario) 
    VALUES('Reinaldo Belizario', 'profreinaldo@fiap.com.br', 'Rua Maria Urbano, 81', NULL, '02208-020', 1, 'SP', 1, NULL)
    INTO tb_cliente(nm_cliente, email, logradouro, complemento, cep, id_cidade, uf, tp_cliente, comentario)  
    VALUES('Junior Freitas', 'profjunior.amaral@fiap.com.br', 'Rua Gustave Doret,  76', 'Apt. 46', '02930-100', 1, 'SP', 1, NULL)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_tipo_animal(nm_tipo) VALUES('Cachorro')
    INTO tb_tipo_animal(nm_tipo) VALUES('Gato')
    INTO tb_tipo_animal(nm_tipo) VALUES('Roedor')
    INTO tb_tipo_animal(nm_tipo) VALUES('Ave')
SELECT * FROM dual;

INSERT ALL 
    INTO tb_raca_animal(nm_raca,id_tipo) VALUES('Chihuahua', 1)
    INTO tb_raca_animal(nm_raca,id_tipo) VALUES('Husky', 1)
    INTO tb_raca_animal(nm_raca,id_tipo) VALUES('Persa', 2)
    INTO tb_raca_animal(nm_raca,id_tipo) VALUES('Papagaio', 4)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_animal(nm_animal, dt_nascimento, id_raca, id_tipo, id_cliente) 
    VALUES('Jobair', TO_DATE('17/08/2016','DD/MM/YYYY'), 4, 4, 1)
    INTO tb_animal(nm_animal, dt_nascimento, id_raca, id_tipo, id_cliente) 
    VALUES('Rex', TO_DATE('28/11/2011','DD/MM/YYYY'), 2, 1, 4)
    INTO tb_animal(nm_animal, dt_nascimento, id_raca, id_tipo, id_cliente) 
    VALUES('Eclesio', TO_DATE('04/06/2021','DD/MM/YYYY'), 3, 2, 2)
    INTO tb_animal(nm_animal, dt_nascimento, id_raca, id_tipo, id_cliente) 
    VALUES('Anya', TO_DATE('11/01/2022','DD/MM/YYYY'), 2, 1, 5)
    INTO tb_animal(nm_animal, dt_nascimento, id_raca, id_tipo, id_cliente) 
    VALUES('Carlos', TO_DATE('09/03/2018','DD/MM/YYYY'), 1, 1, 3)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_fornecedor(nm_fornecedor) VALUES('Petz')
    INTO tb_fornecedor(nm_fornecedor) VALUES('Cobasi')
SELECT * FROM dual;

INSERT ALL 
    INTO tb_unidade_produto(ds_unidade) VALUES('10 Kilogramas')
    INTO tb_unidade_produto(ds_unidade) VALUES('7.5 Kilogramas')
    INTO tb_unidade_produto(ds_unidade) VALUES('5 Kilogramas')
SELECT * FROM dual;

INSERT ALL 
    INTO tb_status_produto(ds_status) VALUES('Em Estoque')
    INTO tb_status_produto(ds_status) VALUES('Sem Estoque')
SELECT * FROM dual;

INSERT ALL 
    INTO tb_produto(nm_produto, vl_unitario, id_unidade, id_status) VALUES('Ração Gatos Filhotes', 275.00, 2, 1)
    INTO tb_produto(nm_produto, vl_unitario, id_unidade, id_status) VALUES('Ração Gatos Adultos', 200.00, 3, 1)
    INTO tb_produto(nm_produto, vl_unitario, id_unidade, id_status) VALUES('Ração Cachorros Filhotes', 200.00, 2, 1)
    INTO tb_produto(nm_produto, vl_unitario, id_unidade, id_status) VALUES('Ração Cachorros Adultos', 350.00, 1, 1)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_fornecedor_produto(id_produto, id_fornecedor) VALUES(1, 1)
    INTO tb_fornecedor_produto(id_produto, id_fornecedor) VALUES(2, 1)
    INTO tb_fornecedor_produto(id_produto, id_fornecedor) VALUES(3, 2)
    INTO tb_fornecedor_produto(id_produto, id_fornecedor) VALUES(4, 2)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_vendedor(nm_vendedor, dt_admissao, dt_demissao, id_vend_aprov_item) 
    VALUES('Luciano Inácio', TO_DATE('12/01/2022','DD/MM/YYYY'), NULL, 1)
    INTO tb_vendedor(nm_vendedor, dt_admissao, dt_demissao, id_vend_aprov_item)
    VALUES('Patrícia Magna', TO_DATE('23/07/2022','DD/MM/YYYY'), NULL, 1)
    INTO tb_vendedor(nm_vendedor, dt_admissao, dt_demissao, id_vend_aprov_item) 
    VALUES('Mauro Cesar', TO_DATE('30/04/2022','DD/MM/YYYY'), NULL, 1)
    INTO tb_vendedor(nm_vendedor, dt_admissao, dt_demissao, id_vend_aprov_item) 
    VALUES('Ismael Araújo', TO_DATE('08/03/2022','DD/MM/YYYY'), NULL, 1)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_loja(nm_loja, nr_telefone) VALUES('Wild Pet', '(11) 2850-7239')
    INTO tb_loja(nm_loja, nr_telefone) VALUES('Free Pet', '(11) 3762-4872')
SELECT * FROM dual;    

INSERT ALL 
    INTO tb_estoque_produto(id_loja, id_produto, qtd_estoque) VALUES(1, 1, 100)
    INTO tb_estoque_produto(id_loja, id_produto, qtd_estoque) VALUES(1, 2, 97)
    INTO tb_estoque_produto(id_loja, id_produto, qtd_estoque) VALUES(2, 3, 58)
    INTO tb_estoque_produto(id_loja, id_produto, qtd_estoque) VALUES(2, 4, 64)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_venda(dt_venda, id_cliente, id_vendedor, id_loja)
    VALUES(TO_DATE('01/09/2022','DD/MM/YYYY'), 1, 1, 1)
    INTO tb_venda(dt_venda, id_cliente, id_vendedor, id_loja) 
    VALUES(TO_DATE('01/09/2022','DD/MM/YYYY'), 2, 1, 1)
    INTO tb_venda(dt_venda, id_cliente, id_vendedor, id_loja) 
    VALUES(TO_DATE('01/09/2022','DD/MM/YYYY'), 3, 1, 1)
    INTO tb_venda(dt_venda, id_cliente, id_vendedor, id_loja) 
    VALUES(TO_DATE('01/09/2022','DD/MM/YYYY'), 6, 4, 2)
    INTO tb_venda(dt_venda, id_cliente, id_vendedor, id_loja) 
    VALUES(TO_DATE('01/09/2022','DD/MM/YYYY'), 7, 2, 2)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_itens_venda(id_venda, qtd, vl_unit_venda, id_vendedor, id_produto) 
    VALUES(1, 1, 275.00, 1, 1)
    INTO tb_itens_venda(id_venda, qtd, vl_unit_venda, id_vendedor, id_produto) 
    VALUES(1, 1, 400.00, 1, 2)
    INTO tb_itens_venda(id_venda, qtd, vl_unit_venda, id_vendedor, id_produto) 
    VALUES(2, 2, 400.00, 1, 3)
    INTO tb_itens_venda(id_venda, qtd, vl_unit_venda, id_vendedor, id_produto) 
    VALUES(2, 1, 350.00, 1, 4)
    INTO tb_itens_venda(id_venda, qtd, vl_unit_venda, id_vendedor, id_produto) 
    VALUES(3, 2, 550.00, 1, 1)
    INTO tb_itens_venda(id_venda, qtd, vl_unit_venda, id_vendedor, id_produto) 
    VALUES(3, 2, 400.00, 1, 3)
    INTO tb_itens_venda(id_venda, qtd, vl_unit_venda, id_vendedor, id_produto) 
    VALUES(4, 2, 400.00, 4, 2)
    INTO tb_itens_venda(id_venda, qtd, vl_unit_venda, id_vendedor, id_produto) 
    VALUES(4, 2, 700.00, 4, 4)
    INTO tb_itens_venda(id_venda, qtd, vl_unit_venda, id_vendedor, id_produto) 
    VALUES(5, 1, 275.00, 2, 1)
    INTO tb_itens_venda(id_venda, qtd, vl_unit_venda, id_vendedor, id_produto) 
    VALUES(5, 2, 700.00, 2, 4)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_cliente_pf(cpf, dt_nascimento, id_cliente) 
    VALUES('765.716.778-57', TO_DATE('02/01/1985','DD/MM/YYYY'), 1)
    INTO tb_cliente_pf(cpf, dt_nascimento, id_cliente) 
    VALUES('251.221.838-48', TO_DATE('21/07/1978','DD/MM/YYYY'), 2)
    INTO tb_cliente_pf(cpf, dt_nascimento, id_cliente) 
    VALUES('054.663.878-35', TO_DATE('24/09/1991','DD/MM/YYYY'), 3)
    INTO tb_cliente_pf(cpf, dt_nascimento, id_cliente) 
    VALUES('873.267.758-85', TO_DATE('08/02/1991','DD/MM/YYYY'), 4)
    INTO tb_cliente_pf(cpf, dt_nascimento, id_cliente) 
    VALUES('857.718.778-08', TO_DATE('10/05/1979','DD/MM/YYYY'), 5)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_cliente_pj(cnpj, id_cliente) VALUES('32.804.304/0001-06', 6)
    INTO tb_cliente_pj(cnpj, id_cliente) VALUES('76.487.464/0001-36', 7)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_devolucao(dt_devolucao, id_cliente_pf) VALUES(TO_DATE('03/09/2022','DD/MM/YYYY'), 1)
    INTO tb_devolucao(dt_devolucao, id_cliente_pf) VALUES(TO_DATE('07/09/2022','DD/MM/YYYY'), 2)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_reserva(dt_reserva, dt_retirada, id_cliente_pj) 
    VALUES(TO_DATE('01/09/2022','DD/MM/YYYY'), TO_DATE('15/09/2022','DD/MM/YYYY'), 1)
    INTO tb_reserva(dt_reserva, dt_retirada, id_cliente_pj) 
    VALUES(TO_DATE('01/09/2022','DD/MM/YYYY'), TO_DATE('20/09/2022','DD/MM/YYYY'), 2)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_reserva_produtos(id_produto, id_reserva, qtd) VALUES(1, 1, 35)
    INTO tb_reserva_produtos(id_produto, id_reserva, qtd) VALUES(2, 2, 50)
SELECT * FROM dual;

INSERT ALL 
    INTO tb_devolucao_produtos(id_venda, id_produto, id_devolucao, qtd) VALUES(1, 2, 1, 1)
    INTO tb_devolucao_produtos(id_venda, id_produto, id_devolucao, qtd) VALUES(2, 4, 1, 1)
SELECT * FROM dual;

COMMIT;

-- UPDATE 
UPDATE tb_cliente 
SET nm_cliente = 'Ricardo Rota'
WHERE id_cliente = 1;

UPDATE tb_estoque_produto 
SET qtd_estoque = 98
WHERE id_loja = 1 AND id_produto = 1;

-- DELETE 
DELETE FROM tb_itens_venda 
WHERE id_venda = 3;
DELETE FROM tb_venda
WHERE id_venda = 3;

COMMIT;


