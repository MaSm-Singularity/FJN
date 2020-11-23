-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE FUNCTION [dbo].[fnGetBitMaskDesc]
(
    @bitMask bigint
)
RETURNS nvarchar(4000)
AS
BEGIN
	declare @result nvarchar(4000) = ''

	if @bitMask & 0x00000000000001 <> 0 set @result += ' ID_DIM_IES_CURSO'
	if @bitMask & 0x00000000000002 <> 0 set @result += ' ID_DIM_PROFISSAO_BF'
	if @bitMask & 0x00000000000004 <> 0 set @result += ' ID_DIM_SEXO'
	if @bitMask & 0x00000000000008 <> 0 set @result += ' ID_DIM_NUTS2'
	if @bitMask & 0x00000000000010 <> 0 set @result += ' ID_DIM_NUTS3'
	if @bitMask & 0x00000000000020 <> 0 set @result += ' ID_DIM_ANO_LECTIVO'
	if @bitMask & 0x00000000000040 <> 0 set @result += ' ID_DIM_IDADE_TRABALHO'
	if @bitMask & 0x00000000000080 <> 0 set @result += ' ID_DIM_CONCELHO'
	if @bitMask & 0x00000000000100 <> 0 set @result += ' ID_DIM_TIPO_ENSINO'
	if @bitMask & 0x00000000000200 <> 0 set @result += ' ID_DIM_NIVEL_ENSINO'
	if @bitMask & 0x00000000000400 <> 0 set @result += ' ID_DIM_NIVEL_ENSINO_DGEEC'
	if @bitMask & 0x00000000000800 <> 0 set @result += ' ID_DIM_TIPO_CONTRATO'
	if @bitMask & 0x00000000001000 <> 0 set @result += ' ID_DIM_SIT_PROFISSIONAL'
	if @bitMask & 0x00000000002000 <> 0 set @result += ' ID_DIM_DIMENSAO_EMP'
	if @bitMask & 0x00000000004000 <> 0 set @result += ' ID_DIM_REGIME_TRAB'
	if @bitMask & 0x00000000008000 <> 0 set @result += ' ID_DIM_NACIONALIDADE'
	if @bitMask & 0x00000000010000 <> 0 set @result += ' ID_DIM_FREGUESIA'
	if @bitMask & 0x00000000020000 <> 0 set @result += ' ID_DIM_AREA_FORMACAO'
	if @bitMask & 0x00000000040000 <> 0 set @result += ' ID_DIM_DISTRITO'
	if @bitMask & 0x00000000080000 <> 0 set @result += ' ID_DIM_SECTOR_BF'
	if @bitMask & 0x00000000100000 <> 0 set @result += ' ID_DIM_SECTOR_BF_AGG'
	if @bitMask & 0x00000000200000 <> 0 set @result += ' ID_DIM_IDADE_CURSO'
	if @bitMask & 0x00000000400000 <> 0 set @result += ' ID_DIM_FORMA_INGRESSO'
	if @bitMask & 0x00000000800000 <> 0 set @result += ' ID_DIM_PERCURSO'
	if @bitMask & 0x00000001000000 <> 0 set @result += ' ID_DIM_COMPETENCIA_ONET_DET'
	if @bitMask & 0x00000002000000 <> 0 set @result += ' ID_DIM_COMPETENCIA_ONET_AGG'
	if @bitMask & 0x00000004000000 <> 0 set @result += ' ID_DIM_COMPETENCIA_BG_DET' 
	if @bitMask & 0x00000008000000 <> 0 set @result += ' ID_DIM_COMPETENCIA_BG_AGG'
	if @bitMask & 0x00000010000000 <> 0 set @result += ' ID_DIM_API_INE_SEXO'
	if @bitMask & 0x00000020000000 <> 0 set @result += ' ID_DIM_NUTSII_INE'
	if @bitMask & 0x00000040000000 <> 0 set @result += ' ID_DIM_API_INE_IDADE_TRABALHO'
	if @bitMask & 0x00000080000000 <> 0 set @result += ' ID_DIM_NIVEL_ENSINO_INE'
	if @bitMask & 0x00000100000000 <> 0 set @result += ' ID_DIM_API_INE_TIPO_CONTRATO'
	if @bitMask & 0x00000200000000 <> 0 set @result += ' ID_DIM_API_INE_PROFISSAO'
	if @bitMask & 0x00000400000000 <> 0 set @result += ' ID_DIM_API_INE_REGIME_TRAB'
	if @bitMask & 0x00000800000000 <> 0 set @result += ' ID_DIM_API_INE_SECTOR'
	if @bitMask & 0x00001000000000 <> 0 set @result += ' ID_DIM_PROFISSAO_BF2'
	if @bitMask & 0x00002000000000 <> 0 set @result += ' ID_DIM_PROF_BF_AGG'
	if @bitMask & 0x00004000000000 <> 0 set @result += ' ID_DIM_MEDIA_FINAL'
	if @bitMask & 0x00008000000000 <> 0 set @result += ' ID_DIM_NUTS3_2013'
	if @bitMask & 0x00010000000000 <> 0 set @result += ' ID_DIM_API_INE_NUTS3_2013'
	if @bitMask & 0x00020000000000 <> 0 set @result += ' ID_DIM_API_INE_NIVEL_ENSINO'

	set @result = replace(trim(@result),' ',',')

    RETURN @result
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGetBitMaskDesc] TO [PMg7sU]
    AS [dbo];

