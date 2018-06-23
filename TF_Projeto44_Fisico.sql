-- ------------------------------------------------------
-- Projeto Final - Banco MySQL
-- Aluno: Thiago Nogueira Freire
-- Matricula: 15/0047142
-- Base de Dados = TF_PRONATEC
--   01 = Base de Dados
--   04 = Tabelas
-- ------------------------------------------------------

--
-- Create database tf_pronatec
--

CREATE DATABASE IF NOT EXISTS TF_PRONATEC;

USE TF_PRONATEC;


CREATE TABLE `unidades` (
  `CODIGO_UNIDADE` int(11) NOT NULL,
  `NOME_UNIDADE` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `DT_AUTORIZA_FUNCIONA_UNID` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `NOME_REGIAO_UNIDADE` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `SIGLA_UF_UNIDADE` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `NOME_MUNICIPIO_UNIDADE` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `NOME_MESORREGIAO_UNIDADE` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `NOME_MICRORREGIAO_UNIDADE` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`CODIGO_UNIDADE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `concluintes` (
  `ANO_INICIO_CURSO` int(11) NOT NULL,
  `ANO_PREVISTO_TERMINO_CURSO` int(11) NOT NULL,
  `CODIGO_IDENTIFICACAO_MEC` int(11) NOT NULL,
  `CPF_ALUNO` varchar(11) NOT NULL,
  `CODIGO_UNIDADE` int(11) NOT NULL,
  `TIPO_OFERTA` varchar(50) NOT NULL,
  `NOME_CURSO` varchar(200) NOT NULL,
  `TIPO_CURSO` varchar(50) NOT NULL,
  `NOME_MODALIDADE` varchar(50) NOT NULL,
  PRIMARY KEY (`CODIGO_IDENTIFICACAO_MEC`),
  KEY `FK_UNIDADES_CONCLUINTES` (`CODIGO_UNIDADE`),
  CONSTRAINT `FK_UNIDADES_CONCLUINTES` FOREIGN KEY (`CODIGO_UNIDADE`) REFERENCES `unidades` (`codigo_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `matriculados` (
  `ANO_INICIO_CURSO` int(11) NOT NULL,
  `ANO_PREVISTO_TERMINO_CURSO` int(11) NOT NULL,
  `CODIGO_IDENTIFICACAO_MEC` int(11) NOT NULL,
  `CPF_ALUNO` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `CODIGO_UNIDADE` int(11) NOT NULL,
  `TIPO_OFERTA` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `NOME_CURSO` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `TIPO_CURSO` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `NOME_MODALIDADE` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`CODIGO_IDENTIFICACAO_MEC`),
  KEY `FK_UNIDADES_MATRICULADOS` (`CODIGO_UNIDADE`),
  CONSTRAINT `FK_UNIDADES_MATRICULADOS` FOREIGN KEY (`CODIGO_UNIDADE`) REFERENCES `unidades` (`codigo_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `dados_errados` (
  `CODIGO_UNIDADE` int(11) DEFAULT NULL,
  `QUANTIDADE` int(11) DEFAULT NULL,
  `TIPO` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  KEY `FK_UNIDADES_ERRADOS_idx` (`CODIGO_UNIDADE`),
  CONSTRAINT `FK_UNIDADES_ERRADOS` FOREIGN KEY (`CODIGO_UNIDADE`) REFERENCES `unidades` (`codigo_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

