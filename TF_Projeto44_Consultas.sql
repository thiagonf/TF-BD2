-- ------------------------------------------------------
-- Projeto Final - Banco MySQL
-- Aluno: Thiago Nogueira Freire
-- Matricula: 15/0047142
-- Base de Dados = TF_PRONATEC
--   01 = Base de Dados
--   04 = Tabelas
-- ------------------------------------------------------
USE tf_pronatec;

CREATE INDEX CONCLUINTES_ANO_ININICIO_CURSO ON CONCLUINTES (ANO_INICIO_CURSO);
CREATE INDEX CONCLUINTES_NOME_MODALIDADE ON CONCLUINTES (NOME_MODALIDADE);

-- Essa consulta seria pertinente para o usuário que deseja saber a quantidade de alunos foram matriculado 
-- em cada estado de em um intervalo período de tempo.
SELECT U.SIGLA_UF_UNIDADE, M.ANO_INICIO_CURSO, M.ANO_PREVISTO_TERMINO_CURSO, COUNT(U.SIGLA_UF_UNIDADE) 
	FROM MATRICULADOS M, UNIDADES U  
		WHERE M.CODIGO_UNIDADE = U.CODIGO_UNIDADE 
			GROUP BY U.SIGLA_UF_UNIDADE, M.ANO_INICIO_CURSO, M.ANO_PREVISTO_TERMINO_CURSO 
				ORDER BY U.SIGLA_UF_UNIDADE ASC;

-- Essa consulta seria pertinente para o usuário que deseja saber a quantidade de alunos que concluiram 
-- o curso no ano de 2014 em cada estado agrupando-os por modalidade do curso.                
SELECT U.SIGLA_UF_UNIDADE, C.ANO_INICIO_CURSO, C.NOME_MODALIDADE, COUNT(C.NOME_MODALIDADE) AS QUANTIDADE 
	FROM CONCLUINTES C, UNIDADES U 
		WHERE C.CODIGO_UNIDADE = U.CODIGO_UNIDADE AND C.ANO_INICIO_CURSO = 2014 
			GROUP BY U.SIGLA_UF_UNIDADE, C.NOME_MODALIDADE 
				ORDER BY U.SIGLA_UF_UNIDADE ASC;

-- Essa consulta seria pertinente para saber nome, e localização das unidades que tiveram alunos que concluiram
-- curso de modalidade de ensino a distância.                
SELECT U.NOME_UNIDADE, U.SIGLA_UF_UNIDADE, U.NOME_MUNICIPIO_UNIDADE 
	FROM UNIDADES U, CONCLUINTES C 
		WHERE C.CODIGO_UNIDADE = U.CODIGO_UNIDADE AND C.NOME_MODALIDADE = 'Ensino a Distância' 
			GROUP BY U.NOME_UNIDADE, U.SIGLA_UF_UNIDADE, U.NOME_MUNICIPIO_UNIDADE;