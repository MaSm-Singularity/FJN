CREATE   FUNCTION [dbo].[fnGetBitMask]
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
RETURNS bigint
AS
BEGIN
    DECLARE @ResultVar bigint = 0

	if @ID_DIM_IES_CURSO              is not null set @resultVar += 0x00000000000001
	if @ID_DIM_PROFISSAO_BF           is not null set @resultVar += 0x00000000000002
	if @ID_DIM_SEXO                   is not null set @resultVar += 0x00000000000004
	if @ID_DIM_NUTS2                  is not null set @resultVar += 0x00000000000008
	if @ID_DIM_NUTS3                  is not null set @resultVar += 0x00000000000010
	if @ID_DIM_ANO_LECTIVO            is not null set @resultVar += 0x00000000000020
	if @ID_DIM_IDADE_TRABALHO         is not null set @resultVar += 0x00000000000040
	if @ID_DIM_CONCELHO               is not null set @resultVar += 0x00000000000080
	if @ID_DIM_TIPO_ENSINO            is not null set @resultVar += 0x00000000000100
	if @ID_DIM_NIVEL_ENSINO           is not null set @resultVar += 0x00000000000200
	if @ID_DIM_NIVEL_ENSINO_DGEEC     is not null set @resultVar += 0x00000000000400
	if @ID_DIM_TIPO_CONTRATO          is not null set @resultVar += 0x00000000000800
	if @ID_DIM_SIT_PROFISSIONAL       is not null set @resultVar += 0x00000000001000
	if @ID_DIM_DIMENSAO_EMP           is not null set @resultVar += 0x00000000002000
	if @ID_DIM_REGIME_TRAB            is not null set @resultVar += 0x00000000004000
	if @ID_DIM_NACIONALIDADE          is not null set @resultVar += 0x00000000008000
	if @ID_DIM_FREGUESIA              is not null set @resultVar += 0x00000000010000
	if @ID_DIM_AREA_FORMACAO          is not null set @resultVar += 0x00000000020000
	if @ID_DIM_DISTRITO               is not null set @resultVar += 0x00000000040000
	if @ID_DIM_SECTOR_BF              is not null set @resultVar += 0x00000000080000
	if @ID_DIM_SECTOR_BF_AGG          is not null set @resultVar += 0x00000000100000
	if @ID_DIM_IDADE_CURSO            is not null set @resultVar += 0x00000000200000
	if @ID_DIM_FORMA_INGRESSO         is not null set @resultVar += 0x00000000400000
	if @ID_DIM_PERCURSO               is not null set @resultVar += 0x00000000800000
	if @ID_DIM_COMPETENCIA_ONET_DET   is not null set @resultVar += 0x00000001000000
	if @ID_DIM_COMPETENCIA_ONET_AGG   is not null set @resultVar += 0x00000002000000
	if @ID_DIM_COMPETENCIA_BG_DET     is not null set @resultVar += 0x00000004000000
	if @ID_DIM_COMPETENCIA_BG_AGG     is not null set @resultVar += 0x00000008000000
	if @ID_DIM_API_INE_SEXO           is not null set @resultVar += 0x00000010000000
	if @ID_DIM_NUTSII_INE             is not null set @resultVar += 0x00000020000000
	if @ID_DIM_API_INE_IDADE_TRABALHO is not null set @resultVar += 0x00000040000000
	if @ID_DIM_NIVEL_ENSINO_INE       is not null set @resultVar += 0x00000080000000
	if @ID_DIM_API_INE_TIPO_CONTRATO  is not null set @resultVar += 0x00000100000000
	if @ID_DIM_API_INE_PROFISSAO      is not null set @resultVar += 0x00000200000000
	if @ID_DIM_API_INE_REGIME_TRAB    is not null set @resultVar += 0x00000400000000
	if @ID_DIM_API_INE_SECTOR         is not null set @resultVar += 0x00000800000000
	if @ID_DIM_PROFISSAO_BF2          is not null set @resultVar += 0x00001000000000
	if @ID_DIM_PROF_BF_AGG            is not null set @resultVar += 0x00002000000000
	if @ID_DIM_MEDIA_FINAL            is not null set @resultVar += 0x00004000000000
	if @ID_DIM_NUTS3_2013             is not null set @resultVar += 0x00008000000000
	if @ID_DIM_API_INE_NUTS3_2013     is not null set @resultVar += 0x00010000000000
	if @ID_DIM_API_INE_NIVEL_ENSINO   is not null set @resultVar += 0x00020000000000


    RETURN @ResultVar
END
