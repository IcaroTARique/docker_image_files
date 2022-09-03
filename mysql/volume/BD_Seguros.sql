/***************************************************************************************************************/
/* Tabela de Clientes de Seguros                                                                               */
/* Data: 22/10/2021                                                                                            */
/* Autor: Mauricio Xavier - act digital                                                                        */
/***************************************************************************************************************/
CREATE TABLE CLIENTES
(
	CPF_CLIENTE          VARCHAR(11) NOT NULL,
	VALR_SCORE           INTEGER NULL,
	NOME_CLIENTE         VARCHAR(120) NULL
);



ALTER TABLE CLIENTES
ADD PRIMARY KEY (CPF_CLIENTE);



/***************************************************************************************************************/
/* Tabela de Formas de Pagamento habilitadas para o Cliente                                                    */
/* Data: 22/10/2021                                                                                            */
/* Autor: Mauricio Xavier - act digital                                                                        */
/***************************************************************************************************************/
CREATE TABLE CLIENTES_FORMAS_PAGTO
(
	ID_CLIENTES_FORMAS_PAGTO BIGINT NOT NULL,
	CPF_CLIENTE          VARCHAR(11) NULL,
	IDENT_FORMA_PAGAMENTO CHAR(3) NULL
);



ALTER TABLE CLIENTES_FORMAS_PAGTO
ADD PRIMARY KEY (ID_CLIENTES_FORMAS_PAGTO);



/***************************************************************************************************************/
/* Tabela de Contratos de Seguros                                                                              */
/* Data: 22/10/2021                                                                                            */
/* Autor: Mauricio Xavier - act digital                                                                        */
/***************************************************************************************************************/
CREATE TABLE CONTRATOS_SEGUROS
(
	ID_CONTRATO_SEGURO   BIGINT NOT NULL,
	ID_PRODUTO_SEGURO    BIGINT NULL,
	DATA_CONTRATACAO     DATETIME NULL,
	VALR_PLANO           NUMERIC(15,2) NULL,
	IDENT_ATIVO          CHAR(1) NULL,
	DATA_CANCELAMENTO    DATETIME NULL,
	CODG_LOGO            INTEGER NULL,
	ID_PLANO_PRODUTO     BIGINT NULL,
	NUME_DIA_VENCIMENTO  INTEGER NULL,
	CPF_CLIENTE          VARCHAR(11) NULL,
	ID_CLIENTES_FORMAS_PAGTO BIGINT NULL,
	ID_MOTIVO_CANCELAMENTO INTEGER NULL,
	DESC_PLANO           VARCHAR(120) NULL,
	VALR_PERCENTUAL      NUMERIC(15,2) NULL,
	IDENT_PLANO_PRODUTO  VARCHAR(10) NULL
);



ALTER TABLE CONTRATOS_SEGUROS
ADD PRIMARY KEY (ID_CONTRATO_SEGURO);



/***************************************************************************************************************/
/* Tabela de Eventos de Contrato                                                                               */
/* Data: 22/10/2021                                                                                            */
/* Autor: Mauricio Xavier - act digital                                                                        */
/***************************************************************************************************************/
CREATE TABLE EVENTOS_CONTRATOS
(
	ID_EVENTO_CONTRATO   BIGINT NOT NULL,
	DATA_EVENTO          DATETIME NULL,
	DESC_EVENTO          VARCHAR(200) NULL,
	ID_CONTRATO_SEGURO   BIGINT NULL,
	ID_TIPO_EVENTO_CONTRATO INTEGER NULL
);



ALTER TABLE EVENTOS_CONTRATOS
ADD PRIMARY KEY (ID_EVENTO_CONTRATO);



/***************************************************************************************************************/
/* Tabela de Formas de Pagamento                                                                               */
/* Data: 22/10/2021                                                                                            */
/* Autor: Mauricio Xavier - act digital                                                                        */
/***************************************************************************************************************/
CREATE TABLE FORMAS_PAGAMENTO
(
	IDENT_FORMA_PAGAMENTO CHAR(3) NOT NULL,
	DESC_FORMA_PAGAMENTO VARCHAR(120) NULL,
	IDENT_ATIVO          CHAR(1) NULL
);



ALTER TABLE FORMAS_PAGAMENTO
ADD PRIMARY KEY (IDENT_FORMA_PAGAMENTO);



/***************************************************************************************************************/
/* Tabela de Motivos de Cancelamento                                                                           */
/* Data: 22/10/2021                                                                                            */
/* Autor: Mauricio Xavier - act digital                                                                        */
/***************************************************************************************************************/
CREATE TABLE MOTIVOS_CANCELAMENTO
(
	ID_MOTIVO_CANCELAMENTO INTEGER NOT NULL,
	DESC_MOTIVO_CANCELAMENTO VARCHAR(120) NULL,
	IDENT_ATIVO          CHAR(1) NULL
);



ALTER TABLE MOTIVOS_CANCELAMENTO
ADD PRIMARY KEY (ID_MOTIVO_CANCELAMENTO);



/***************************************************************************************************************/
/* Tabela de Planos de Produtos                                                                                */
/* Data: 22/10/2021                                                                                            */
/* Autor: Mauricio Xavier - act digital                                                                        */
/***************************************************************************************************************/
CREATE TABLE PLANOS_PRODUTOS
(
	ID_PLANO_PRODUTO     BIGINT NOT NULL,
	ID_PRODUTO_SEGURO    BIGINT NULL,
	IDENT_PLANO_PRODUTO  VARCHAR(10) NULL,
	DESC_PLANO           VARCHAR(120) NULL,
	VLR_PLANO            NUMERIC(15,2) NULL,
	IDENT_ATIVO          CHAR(1) NULL,
	VALR_PERCENTUAL      NUMERIC(15,2) NULL
);



ALTER TABLE PLANOS_PRODUTOS
ADD PRIMARY KEY (ID_PLANO_PRODUTO);



/***************************************************************************************************************/
/* Tabela de Produtos de Seguros                                                                               */
/* Data: 22/10/2021                                                                                            */
/* Autor: Mauricio Xavier - act digital                                                                        */
/***************************************************************************************************************/
CREATE TABLE PRODUTO_SEGUROS
(
	ID_PRODUTO_SEGURO    BIGINT NOT NULL,
	DESC_PRODUTO_SEGURO  VARCHAR(120) NULL,
	ABREV_PROD_SEGURO    VARCHAR(30) NULL,
	IDENT_ATIVO          CHAR(1) NULL,
	DATA_ATIVACAO        DATETIME NULL,
	DATA_DESATIVACAO     DATETIME NULL
);



ALTER TABLE PRODUTO_SEGUROS
ADD PRIMARY KEY (ID_PRODUTO_SEGURO);



/***************************************************************************************************************/
/* Tabela de Tipos de Eventos de Contrato                                                                      */
/* Data: 22/10/2021                                                                                            */
/* Autor: Mauricio Xavier - act digital                                                                        */
/***************************************************************************************************************/
CREATE TABLE TIPOS_EVENTO_CONTRATO
(
	ID_TIPO_EVENTO_CONTRATO INTEGER NOT NULL,
	DESC_TIPO_EVENTO_CONTRATO VARCHAR(120) NULL,
	IDENT_ATIVO          CHAR(1) NULL
);



ALTER TABLE TIPOS_EVENTO_CONTRATO
ADD PRIMARY KEY (ID_TIPO_EVENTO_CONTRATO);



/***************************************************************************************************************/
/* Adicionando as Foreign Keys                                                                                 */
/* Data: 22/10/2021                                                                                            */
/* Autor: Mauricio Xavier - act digital                                                                        */
/***************************************************************************************************************/

ALTER TABLE CLIENTES_FORMAS_PAGTO
ADD FOREIGN KEY R_7 (CPF_CLIENTE) REFERENCES CLIENTES (CPF_CLIENTE);



ALTER TABLE CLIENTES_FORMAS_PAGTO
ADD FOREIGN KEY R_8 (IDENT_FORMA_PAGAMENTO) REFERENCES FORMAS_PAGAMENTO (IDENT_FORMA_PAGAMENTO);



ALTER TABLE CONTRATOS_SEGUROS
ADD FOREIGN KEY R_1 (ID_PRODUTO_SEGURO) REFERENCES PRODUTO_SEGUROS (ID_PRODUTO_SEGURO);



ALTER TABLE CONTRATOS_SEGUROS
ADD FOREIGN KEY R_4 (ID_PLANO_PRODUTO) REFERENCES PLANOS_PRODUTOS (ID_PLANO_PRODUTO);



ALTER TABLE CONTRATOS_SEGUROS
ADD FOREIGN KEY R_5 (CPF_CLIENTE) REFERENCES CLIENTES (CPF_CLIENTE);



ALTER TABLE CONTRATOS_SEGUROS
ADD FOREIGN KEY R_9 (ID_CLIENTES_FORMAS_PAGTO) REFERENCES CLIENTES_FORMAS_PAGTO (ID_CLIENTES_FORMAS_PAGTO);



ALTER TABLE CONTRATOS_SEGUROS
ADD FOREIGN KEY R_10 (ID_MOTIVO_CANCELAMENTO) REFERENCES MOTIVOS_CANCELAMENTO (ID_MOTIVO_CANCELAMENTO);



ALTER TABLE EVENTOS_CONTRATOS
ADD FOREIGN KEY R_2 (ID_CONTRATO_SEGURO) REFERENCES CONTRATOS_SEGUROS (ID_CONTRATO_SEGURO);



ALTER TABLE EVENTOS_CONTRATOS
ADD FOREIGN KEY R_11 (ID_TIPO_EVENTO_CONTRATO) REFERENCES TIPOS_EVENTO_CONTRATO (ID_TIPO_EVENTO_CONTRATO);



ALTER TABLE PLANOS_PRODUTOS
ADD FOREIGN KEY R_3 (ID_PRODUTO_SEGURO) REFERENCES PRODUTO_SEGUROS (ID_PRODUTO_SEGURO);