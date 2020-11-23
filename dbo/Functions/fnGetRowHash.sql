CREATE   FUNCTION [dbo].[fnGetRowHash]
(
	@ID_DIM_IES_CURSO              int,
	@ID_DIM_PROFISSAO_BF           int,
	@ID_DIM_SEXO                   int,
	@ID_DIM_NUTS2                  varchar(5),
	@ID_DIM_NUTS3                  varchar(5),
	@ID_DIM_ANO_LECTIVO            int,
	@ID_DIM_IDADE_TRABALHO         int,
	@ID_DIM_CONCELHO               int,
	@ID_DIM_TIPO_ENSINO            int,
	@ID_DIM_NIVEL_ENSINO           int,
	@ID_DIM_NIVEL_ENSINO_DGEEC     int,
	@ID_DIM_TIPO_CONTRATO          int,
	@ID_DIM_SIT_PROFISSIONAL       int,
	@ID_DIM_DIMENSAO_EMP           int,
	@ID_DIM_REGIME_TRAB            int,
	@ID_DIM_NACIONALIDADE          int,
	@ID_DIM_FREGUESIA              int,
	@ID_DIM_AREA_FORMACAO          int,
	@ID_DIM_DISTRITO               int,
	@ID_DIM_SECTOR_BF              int,
	@ID_DIM_SECTOR_BF_AGG          int,
	@ID_DIM_IDADE_CURSO            int,
	@ID_DIM_FORMA_INGRESSO         int,
	@ID_DIM_PERCURSO               int,
	@ID_DIM_COMPETENCIA_ONET_DET   varchar(50),
	@ID_DIM_COMPETENCIA_ONET_AGG   varchar(5),
	@ID_DIM_COMPETENCIA_BG_DET     int,
	@ID_DIM_COMPETENCIA_BG_AGG     int,
	@ID_DIM_API_INE_SEXO           varchar(5),
	@ID_DIM_NUTSII_INE             int,
	@ID_DIM_API_INE_IDADE_TRABALHO varchar(5),
	@ID_DIM_NIVEL_ENSINO_INE       int,
	@ID_DIM_API_INE_TIPO_CONTRATO  varchar(5),
	@ID_DIM_API_INE_PROFISSAO      varchar(5),
	@ID_DIM_API_INE_REGIME_TRAB    varchar(50),
	@ID_DIM_API_INE_SECTOR         varchar(50),
	@ID_DIM_PROFISSAO_BF2          int,
	@ID_DIM_PROF_BF_AGG            int,
	@ID_DIM_MEDIA_FINAL            int,
	@ID_DIM_NUTS3_2013             varchar(5),
	@ID_DIM_API_INE_NUTS3_2013     varchar(5),
	@ID_DIM_API_INE_NIVEL_ENSINO   varchar(50)
)
RETURNS varbinary(128)
AS
BEGIN

return cast(hashbytes('SHA2_256'
	,isnull(cast(@ID_DIM_IES_CURSO              as varchar(8000)),'')
	+isnull(cast(@ID_DIM_PROFISSAO_BF           as varchar(8000)),'')
	+isnull(cast(@ID_DIM_SEXO                   as varchar(8000)),'')
	+isnull(cast(@ID_DIM_NUTS2                  as varchar(8000)),'')
	+isnull(cast(@ID_DIM_NUTS3                  as varchar(8000)),'')
	+isnull(cast(@ID_DIM_ANO_LECTIVO            as varchar(8000)),'')
	+isnull(cast(@ID_DIM_IDADE_TRABALHO         as varchar(8000)),'')
	+isnull(cast(@ID_DIM_CONCELHO               as varchar(8000)),'')
	+isnull(cast(@ID_DIM_TIPO_ENSINO            as varchar(8000)),'')
	+isnull(cast(@ID_DIM_NIVEL_ENSINO           as varchar(8000)),'')
	+isnull(cast(@ID_DIM_NIVEL_ENSINO_DGEEC     as varchar(8000)),'')
	+isnull(cast(@ID_DIM_TIPO_CONTRATO          as varchar(8000)),'')
	+isnull(cast(@ID_DIM_SIT_PROFISSIONAL       as varchar(8000)),'')
	+isnull(cast(@ID_DIM_DIMENSAO_EMP           as varchar(8000)),'')
	+isnull(cast(@ID_DIM_REGIME_TRAB            as varchar(8000)),'')
	+isnull(cast(@ID_DIM_NACIONALIDADE          as varchar(8000)),'')
	+isnull(cast(@ID_DIM_FREGUESIA              as varchar(8000)),'')
	+isnull(cast(@ID_DIM_AREA_FORMACAO          as varchar(8000)),'')
	+isnull(cast(@ID_DIM_DISTRITO               as varchar(8000)),'')
	+isnull(cast(@ID_DIM_SECTOR_BF              as varchar(8000)),'')
	+isnull(cast(@ID_DIM_SECTOR_BF_AGG          as varchar(8000)),'')
	+isnull(cast(@ID_DIM_IDADE_CURSO            as varchar(8000)),'')
	+isnull(cast(@ID_DIM_FORMA_INGRESSO         as varchar(8000)),'')
	+isnull(cast(@ID_DIM_PERCURSO               as varchar(8000)),'')
	+isnull(cast(@ID_DIM_COMPETENCIA_ONET_DET   as varchar(8000)),'')
	+isnull(cast(@ID_DIM_COMPETENCIA_ONET_AGG   as varchar(8000)),'')
	+isnull(cast(@ID_DIM_COMPETENCIA_BG_DET     as varchar(8000)),'')
	+isnull(cast(@ID_DIM_COMPETENCIA_BG_AGG     as varchar(8000)),'')
	+isnull(cast(@ID_DIM_API_INE_SEXO           as varchar(8000)),'')
	+isnull(cast(@ID_DIM_NUTSII_INE             as varchar(8000)),'')
	+isnull(cast(@ID_DIM_API_INE_IDADE_TRABALHO as varchar(8000)),'')
	+isnull(cast(@ID_DIM_NIVEL_ENSINO_INE       as varchar(8000)),'')
	+isnull(cast(@ID_DIM_API_INE_TIPO_CONTRATO  as varchar(8000)),'')
	+isnull(cast(@ID_DIM_API_INE_PROFISSAO      as varchar(8000)),'')
	+isnull(cast(@ID_DIM_API_INE_REGIME_TRAB    as varchar(8000)),'')
	+isnull(cast(@ID_DIM_API_INE_SECTOR         as varchar(8000)),'')
	+isnull(cast(@ID_DIM_PROFISSAO_BF2          as varchar(8000)),'')
	+isnull(cast(@ID_DIM_PROF_BF_AGG            as varchar(8000)),'')
	+isnull(cast(@ID_DIM_MEDIA_FINAL            as varchar(8000)),'')
	+isnull(cast(@ID_DIM_NUTS3_2013             as varchar(8000)),'')
	+isnull(cast(@ID_DIM_API_INE_NUTS3_2013     as varchar(8000)),'')
	+isnull(cast(@ID_DIM_API_INE_NIVEL_ENSINO   as varchar(8000)),''))as varbinary(128)); 

END
