



CREATE   VIEW [dbo].[VW_DIM_IES_CURSO] AS 
select ID_DIM_IES_CURSO
	  ,DSC_IES_CURSO
	  ,[estabelecimento_cod]
      ,[estabelecimento]
      ,[unidade_organica_cod]
      ,[unidade_organica]
      ,[tipo_ensino]
      ,[natureza_ensino]
      ,[subsistema_ensino]
      ,[nuts_ii]
      ,[nuts_iii_rev2013]
      ,[distrito]
      ,[concelho]
      ,[ies_curso]
      ,[curso_cod]
      ,[curso]
	,CASE
		    WHEN nivel_ensino_dgeec='Curso Técnico Superior Profissional' THEN 'CTeSP'
		    ELSE nivel_ensino_dgeec
	END as nivel_ensino_dgeec
      ,[ects]
      ,[duracao]
      ,[concurso]
      ,[pre_requisitos]
      ,[vagas]
      ,[vagas_label]
      ,[provas_ingresso]
      ,[nota_ultimo_cont_geral]
      ,[nota_ultimo_cont_geral_label]
      ,[media_colocados]
      ,[min_nota_concurso]
      ,[min_nota_prova_ingresso]
      ,[peso_notas_secund]
      ,[peso_notas_provas_ing]
      ,[url]
      ,[CITEF2013_1d_cod]
      ,[CITEF2013_1d]
      ,[CITEF2013_2d_cod]
      ,[CITEF2013_2d]
      ,[CITEF2013_3d_cod]
      ,[CITEF2013_3d]
      ,[area_formacao_cod]
      ,[area_formacao]
      ,[asset]
      ,[propinas]
      ,[descricao]
      ,[morada]
      ,[telefone]
      ,[regime]
      ,[visual_inscritos]
      ,[visual_diplomados]
      ,[visual_desemprego]
      ,[visual_vagas]
from [dbo].[DIM_IES_CURSO] D left join [stg].[tbl_O_IES_CURSO] O on d.DSC_IES_CURSO=O.ies_curso
