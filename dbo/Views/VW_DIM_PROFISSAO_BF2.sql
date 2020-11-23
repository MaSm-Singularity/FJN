


CREATE   VIEW [dbo].[VW_DIM_PROFISSAO_BF2] AS 
SELECT D.ID_DIM_PROFISSAO_BF2
	, D.DSC_PROFISSAO_BF2
	  ,O.[prof_2d_cod]
      ,O.[prof_2d]
      ,O.[prof_3d_cod]
      ,O.[prof_3d]
      ,O.[prof_bf_cod]
      ,O.[prof_bf]
      ,O.[prof_bf_descricao]
      ,O.[prof_bf_tarefas]
      ,O.[prof_relacionadas]
      ,O.[work_styles]
      ,O.[technology_skills]
      ,O.[autoridade_competente1]
      ,O.[link1]
      ,O.[autoridade_competente2]
      ,O.[link2]
      ,O.[asset]
      ,O.[visual_bg]
FROM [dbo].[DIM_PROFISSAO_BF2] D LEFT JOIN [STG].[TBL_O_PROFISSAO] O ON TRIM(D.DSC_PROFISSAO_BF2)=TRIM(O.PROF_BF)
