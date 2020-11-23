


CREATE   VIEW [dbo].[VW_DIM_COMPETENCIA_BG_DET] AS 
SELECT D.ID_DIM_COMPETENCIA_BG_DET, D.DSC_COMPETENCIA_BG_DET,
O.tipo_competencia,
O.competencia_bg_agr,
O.comp_bg_detalhada_desig_en,
O.skill_pt,
O.competencia_bg_detalhada_desc,
O.linktoESCO,
O.competencia_onet_agr,
O.competencia_onet_detalhada,
O.asset,
O.comp_bf
FROM [dbo].[DIM_COMPETENCIA_BG_DET] D LEFT JOIN [stg].[tbl_O_COMPETENCIAS_BG] O ON D.DSC_COMPETENCIA_BG_DET=O.COMPETENCIA_BG_DETALHADA
where O.comp_bf=1
