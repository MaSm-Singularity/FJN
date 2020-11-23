
--drop PROCEDURE [dbo].[spAddDIM_VAL]
CREATE    PROCEDURE [dbo].[spAddDIM_VAL]
(
	 @table dbo.ttDIM_VAL readonly
	,@FileName nvarchar(200)
)
AS
BEGIN
    SET NOCOUNT ON

--declare @table as ttDIM_VAL
--declare @fileName nvarchar(200) = 'F1'

--insert into @table
--SELECT top 10 convert(float,valor) as valor
--	  ,ano as ano
--	  ,NULL as trimestre
--	  ,NULL as mes

--      ,NULL            as ID_DIM_IES_CURSO           
--      ,prof_bf         as ID_DIM_PROFISSAO_BF        
--      ,sexo            as ID_DIM_SEXO                
--      ,nuts_ii         as ID_DIM_NUTS2               
--      ,nuts_iii        as ID_DIM_NUTS3               
--      ,NULL            as ID_DIM_ANO_LECTIVO         
--      ,idade_categ     as ID_DIM_IDADE_TRABALHO      
--      ,concelho        as ID_DIM_CONCELHO            
--      ,NULL            as ID_DIM_TIPO_ENSINO         
--      ,nivel_ensino    as ID_DIM_NIVEL_ENSINO        
--      ,NULL            as ID_DIM_NIVEL_ENSINO_DGEEC  
--      ,tipo_contrato   as ID_DIM_TIPO_CONTRATO       
--      ,NULL            as ID_DIM_SIT_PROFISSIONAL    
--      ,dimensao_categ  as ID_DIM_DIMENSAO_EMP        
--      ,regime_trab     as ID_DIM_REGIME_TRAB         
--      ,NULL            as ID_DIM_NACIONALIDADE       
--      ,NULL            as ID_DIM_FREGUESIA           
--      ,area_formacao   as ID_DIM_AREA_FORMACAO       
--      ,NULL            as ID_DIM_DISTRITO            
--      ,setor_bf        as ID_DIM_SECTOR_BF           
--      ,NULL            as ID_DIM_SECTOR_BF_AGG       
--      ,NULL            as ID_DIM_IDADE_CURSO         
--      ,NULL            as ID_DIM_FORMA_INGRESSO      
--      ,NULL            as ID_DIM_PERCURSO            
--      ,NULL            as ID_DIM_COMPETENCIA_ONET_DET
--      ,NULL            as ID_DIM_COMPETENCIA_ONET_AGG
--      ,NULL            as ID_DIM_COMPETENCIA_BG_DET  
--      ,NULL            as ID_DIM_COMPETENCIA_BG_AGG  
--      ,NULL            as ID_DIM_SEXO_INE            
--      ,NULL            as ID_DIM_NUTSII_INE          
--      ,NULL            as ID_DIM_IDADE_TRABALHO_INE  
--      ,NULL            as ID_DIM_NIVEL_ENSINO_INE    
--      ,NULL            as ID_DIM_SIT_PROFISSIONAL_INE
--      ,NULL            as ID_DIM_PROFISSAO_INE       
--      ,NULL            as ID_DIM_REGIME_TRAB_INE     
--      ,NULL            as ID_DIM_SETOR_INE           
--      ,NULL            as ID_DIM_PROFISSAO_BF2       
--      ,NULL            as ID_DIM_PROF_BF_AGG

--  FROM stg.tbl_F_1

--where FileName = @fileName
--and FileKey = '19900101000000'

	--------testes------------
	--select * from @table

	--truncate table stg.testes

	insert into stg.testes(cnt)
		select count(*) from @table
	--------------------------

	declare @idKpi int = (select ID_DIM_KPI from ETL_FCT where DSC_FILE = @FileName)

	declare
	    @valor                         float,
	    @bitMask					   bigint,
	    @rowHash		               varbinary(128),
		@ano						   int,
		@trimestre			           nvarchar(50),
		@mes				           nvarchar(50),
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

	declare c1 cursor for
	 select 
	    valor,
	    dbo.fnGetBitMask(		
			   ID_DIM_IES_CURSO
			  ,ID_DIM_PROFISSAO_BF
			  ,ID_DIM_SEXO
			  ,ID_DIM_NUTS2
			  ,ID_DIM_NUTS3
			  ,ID_DIM_ANO_LECTIVO
			  ,ID_DIM_IDADE_TRABALHO
			  ,ID_DIM_CONCELHO
			  ,ID_DIM_TIPO_ENSINO
			  ,ID_DIM_NIVEL_ENSINO
			  ,ID_DIM_NIVEL_ENSINO_DGEEC
			  ,ID_DIM_TIPO_CONTRATO
			  ,ID_DIM_SIT_PROFISSIONAL
			  ,ID_DIM_DIMENSAO_EMP
			  ,ID_DIM_REGIME_TRAB
			  ,ID_DIM_NACIONALIDADE
			  ,ID_DIM_FREGUESIA
			  ,ID_DIM_AREA_FORMACAO
			  ,ID_DIM_DISTRITO
			  ,ID_DIM_SECTOR_BF
			  ,ID_DIM_SECTOR_BF_AGG
			  ,ID_DIM_IDADE_CURSO
			  ,ID_DIM_FORMA_INGRESSO
			  ,ID_DIM_PERCURSO
			  ,ID_DIM_COMPETENCIA_ONET_DET
			  ,ID_DIM_COMPETENCIA_ONET_AGG
			  ,ID_DIM_COMPETENCIA_BG_DET
			  ,ID_DIM_COMPETENCIA_BG_AGG
			  ,ID_DIM_API_INE_SEXO
			  ,ID_DIM_NUTSII_INE
			  ,ID_DIM_API_INE_IDADE_TRABALHO
			  ,ID_DIM_NIVEL_ENSINO_INE
			  ,ID_DIM_API_INE_TIPO_CONTRATO
			  ,ID_DIM_API_INE_PROFISSAO
			  ,ID_DIM_API_INE_REGIME_TRAB
			  ,ID_DIM_API_INE_SECTOR
			  ,ID_DIM_PROFISSAO_BF2
			  ,ID_DIM_PROF_BF_AGG
			  ,ID_DIM_MEDIA_FINAL
			  ,ID_DIM_NUTS3_2013
			  ,ID_DIM_API_INE_NUTS3_2013
			  ,ID_DIM_API_INE_NIVEL_ENSINO ) bitMask,
	   dbo.fnGetRowHash(		
			ID_DIM_IES_CURSO
			  ,ID_DIM_PROFISSAO_BF
			  ,ID_DIM_SEXO
			  ,ID_DIM_NUTS2
			  ,ID_DIM_NUTS3
			  ,ID_DIM_ANO_LECTIVO
			  ,ID_DIM_IDADE_TRABALHO
			  ,ID_DIM_CONCELHO
			  ,ID_DIM_TIPO_ENSINO
			  ,ID_DIM_NIVEL_ENSINO
			  ,ID_DIM_NIVEL_ENSINO_DGEEC
			  ,ID_DIM_TIPO_CONTRATO
			  ,ID_DIM_SIT_PROFISSIONAL
			  ,ID_DIM_DIMENSAO_EMP
			  ,ID_DIM_REGIME_TRAB
			  ,ID_DIM_NACIONALIDADE
			  ,ID_DIM_FREGUESIA
			  ,ID_DIM_AREA_FORMACAO
			  ,ID_DIM_DISTRITO
			  ,ID_DIM_SECTOR_BF
			  ,ID_DIM_SECTOR_BF_AGG
			  ,ID_DIM_IDADE_CURSO
			  ,ID_DIM_FORMA_INGRESSO
			  ,ID_DIM_PERCURSO
			  ,ID_DIM_COMPETENCIA_ONET_DET
			  ,ID_DIM_COMPETENCIA_ONET_AGG
			  ,ID_DIM_COMPETENCIA_BG_DET
			  ,ID_DIM_COMPETENCIA_BG_AGG
			  ,ID_DIM_API_INE_SEXO
			  ,ID_DIM_NUTSII_INE
			  ,ID_DIM_API_INE_IDADE_TRABALHO
			  ,ID_DIM_NIVEL_ENSINO_INE
			  ,ID_DIM_API_INE_TIPO_CONTRATO
			  ,ID_DIM_API_INE_PROFISSAO
			  ,ID_DIM_API_INE_REGIME_TRAB
			  ,ID_DIM_API_INE_SECTOR
			  ,ID_DIM_PROFISSAO_BF2
			  ,ID_DIM_PROF_BF_AGG
			  ,ID_DIM_MEDIA_FINAL
			  ,ID_DIM_NUTS3_2013
			  ,ID_DIM_API_INE_NUTS3_2013
			  ,ID_DIM_API_INE_NIVEL_ENSINO ) rowHash,
		ano,
		trimestre,
		mes,
		ID_DIM_IES_CURSO                     ,
		ID_DIM_PROFISSAO_BF					 ,
		ID_DIM_SEXO							 ,
		ID_DIM_NUTS2						 ,
		ID_DIM_NUTS3						 ,
		ID_DIM_ANO_LECTIVO					 ,
		ID_DIM_IDADE_TRABALHO				 ,
		ID_DIM_CONCELHO						 ,
		ID_DIM_TIPO_ENSINO					 ,
		ID_DIM_NIVEL_ENSINO					 ,
		ID_DIM_NIVEL_ENSINO_DGEEC			 ,
		ID_DIM_TIPO_CONTRATO				 ,
		ID_DIM_SIT_PROFISSIONAL				 ,
		ID_DIM_DIMENSAO_EMP					 ,
		ID_DIM_REGIME_TRAB					 ,
		ID_DIM_NACIONALIDADE				 ,
		ID_DIM_FREGUESIA					 ,
		ID_DIM_AREA_FORMACAO				 ,
		ID_DIM_DISTRITO						 ,
		ID_DIM_SECTOR_BF					 ,
		ID_DIM_SECTOR_BF_AGG				 ,
		ID_DIM_IDADE_CURSO					 ,
		ID_DIM_FORMA_INGRESSO				 ,
		ID_DIM_PERCURSO						 ,
		ID_DIM_COMPETENCIA_ONET_DET			 ,
		ID_DIM_COMPETENCIA_ONET_AGG			 ,
		ID_DIM_COMPETENCIA_BG_DET			 ,
		ID_DIM_COMPETENCIA_BG_AGG			 ,
		ID_DIM_API_INE_SEXO					 ,
		ID_DIM_NUTSII_INE					 ,
		ID_DIM_API_INE_IDADE_TRABALHO		 ,
		ID_DIM_NIVEL_ENSINO_INE				 ,
		ID_DIM_API_INE_TIPO_CONTRATO		 ,
		ID_DIM_API_INE_PROFISSAO			 ,
		ID_DIM_API_INE_REGIME_TRAB			 ,
		ID_DIM_API_INE_SECTOR				 ,
		ID_DIM_PROFISSAO_BF2				 ,
		ID_DIM_PROF_BF_AGG					 ,
		ID_DIM_MEDIA_FINAL					 ,
		ID_DIM_NUTS3_2013					 ,
		ID_DIM_API_INE_NUTS3_2013			 ,
		ID_DIM_API_INE_NIVEL_ENSINO 
	  from @table
	open c1
	fetch next from c1 into
	     @valor
		,@bitMask
		,@rowHash
		,@ano
		,@trimestre
		,@mes
	    ,@ID_DIM_IES_CURSO              
	    ,@ID_DIM_PROFISSAO_BF           
	    ,@ID_DIM_SEXO                   
	    ,@ID_DIM_NUTS2                  
	    ,@ID_DIM_NUTS3                  
	    ,@ID_DIM_ANO_LECTIVO            
	    ,@ID_DIM_IDADE_TRABALHO         
	    ,@ID_DIM_CONCELHO               
	    ,@ID_DIM_TIPO_ENSINO            
	    ,@ID_DIM_NIVEL_ENSINO           
	    ,@ID_DIM_NIVEL_ENSINO_DGEEC     
	    ,@ID_DIM_TIPO_CONTRATO          
	    ,@ID_DIM_SIT_PROFISSIONAL       
	    ,@ID_DIM_DIMENSAO_EMP           
	    ,@ID_DIM_REGIME_TRAB            
	    ,@ID_DIM_NACIONALIDADE          
	    ,@ID_DIM_FREGUESIA              
	    ,@ID_DIM_AREA_FORMACAO          
	    ,@ID_DIM_DISTRITO               
	    ,@ID_DIM_SECTOR_BF              
	    ,@ID_DIM_SECTOR_BF_AGG          
	    ,@ID_DIM_IDADE_CURSO            
	    ,@ID_DIM_FORMA_INGRESSO         
	    ,@ID_DIM_PERCURSO               
	    ,@ID_DIM_COMPETENCIA_ONET_DET   
	    ,@ID_DIM_COMPETENCIA_ONET_AGG   
	    ,@ID_DIM_COMPETENCIA_BG_DET     
	    ,@ID_DIM_COMPETENCIA_BG_AGG     
	    ,@ID_DIM_API_INE_SEXO           
	    ,@ID_DIM_NUTSII_INE             
	    ,@ID_DIM_API_INE_IDADE_TRABALHO 
	    ,@ID_DIM_NIVEL_ENSINO_INE       
	    ,@ID_DIM_API_INE_TIPO_CONTRATO  
	    ,@ID_DIM_API_INE_PROFISSAO      
	    ,@ID_DIM_API_INE_REGIME_TRAB    
	    ,@ID_DIM_API_INE_SECTOR        
	    ,@ID_DIM_PROFISSAO_BF2          
	    ,@ID_DIM_PROF_BF_AGG            
	    ,@ID_DIM_MEDIA_FINAL            
	    ,@ID_DIM_NUTS3_2013             
	    ,@ID_DIM_API_INE_NUTS3_2013     
	    ,@ID_DIM_API_INE_NIVEL_ENSINO   
		declare @params nvarchar(max) =N'@idDIM_VAL int OUTPUT,@bitMask bigint,@rowHash varbinary(128),@ID_DIM_IES_CURSO int,@ID_DIM_PROFISSAO_BF int,@ID_DIM_SEXO int,@ID_DIM_NUTS2 varchar(5),@ID_DIM_NUTS3 varchar(5),@ID_DIM_ANO_LECTIVO int'
		set @params += N',@ID_DIM_IDADE_TRABALHO int,@ID_DIM_CONCELHO int,@ID_DIM_TIPO_ENSINO int'
		set @params += N',@ID_DIM_NIVEL_ENSINO int,@ID_DIM_NIVEL_ENSINO_DGEEC int,@ID_DIM_TIPO_CONTRATO int,@ID_DIM_SIT_PROFISSIONAL int,@ID_DIM_DIMENSAO_EMP int,@ID_DIM_REGIME_TRAB int,@ID_DIM_NACIONALIDADE int,@ID_DIM_FREGUESIA int'
		set @params += N',@ID_DIM_AREA_FORMACAO int,@ID_DIM_DISTRITO int,@ID_DIM_SECTOR_BF int,@ID_DIM_SECTOR_BF_AGG int,@ID_DIM_IDADE_CURSO int,@ID_DIM_FORMA_INGRESSO int,@ID_DIM_PERCURSO int,@ID_DIM_COMPETENCIA_ONET_DET varchar(50)'
		set @params += N',@ID_DIM_COMPETENCIA_ONET_AGG varchar(5),@ID_DIM_COMPETENCIA_BG_DET int,@ID_DIM_COMPETENCIA_BG_AGG int,@ID_DIM_API_INE_SEXO varchar(5),@ID_DIM_NUTSII_INE int,@ID_DIM_API_INE_IDADE_TRABALHO varchar(5),@ID_DIM_NIVEL_ENSINO_INE int'
		set @params += N',@ID_DIM_API_INE_TIPO_CONTRATO varchar(5),@ID_DIM_API_INE_PROFISSAO varchar(5),@ID_DIM_API_INE_REGIME_TRAB varchar(50),@ID_DIM_API_INE_SECTOR varchar(50),@ID_DIM_PROFISSAO_BF2 int,@ID_DIM_PROF_BF_AGG int,@ID_DIM_MEDIA_FINAL int'
		set @params += N',@ID_DIM_NUTS3_2013 varchar(5),@ID_DIM_API_INE_NUTS3_2013 varchar(5),@ID_DIM_API_INE_NIVEL_ENSINO varchar(50)'

		while @@FETCH_STATUS = 0
		begin
			declare @idDIM_VAL int = null;

			declare @stmt nvarchar(max)

			set @stmt ='select @idDIM_VAL=ID_DIM_VAL from DIM_VAL where   BITMASK = @bitMask and hshDIM = @rowHash'
			if @bitMask & 0x00000000000001 <> 0 set @stmt += ' AND ID_DIM_IES_CURSO = @ID_DIM_IES_CURSO'
			if @bitMask & 0x00000000000002 <> 0 set @stmt += ' AND ID_DIM_PROFISSAO_BF = @ID_DIM_PROFISSAO_BF'
			if @bitMask & 0x00000000000004 <> 0 set @stmt += ' AND ID_DIM_SEXO = @ID_DIM_SEXO'
			if @bitMask & 0x00000000000008 <> 0 set @stmt += ' AND ID_DIM_NUTS2 = @ID_DIM_NUTS2'
			if @bitMask & 0x00000000000010 <> 0 set @stmt += ' AND ID_DIM_NUTS3 = @ID_DIM_NUTS3'
			if @bitMask & 0x00000000000020 <> 0 set @stmt += ' AND ID_DIM_ANO_LECTIVO = @ID_DIM_ANO_LECTIVO'
			if @bitMask & 0x00000000000040 <> 0 set @stmt += ' AND ID_DIM_IDADE_TRABALHO = @ID_DIM_IDADE_TRABALHO'
			if @bitMask & 0x00000000000080 <> 0 set @stmt += ' AND ID_DIM_CONCELHO = @ID_DIM_CONCELHO'
			if @bitMask & 0x00000000000100 <> 0 set @stmt += ' AND ID_DIM_TIPO_ENSINO = @ID_DIM_TIPO_ENSINO'
			if @bitMask & 0x00000000000200 <> 0 set @stmt += ' AND ID_DIM_NIVEL_ENSINO = @ID_DIM_NIVEL_ENSINO'
			if @bitMask & 0x00000000000400 <> 0 set @stmt += ' AND ID_DIM_NIVEL_ENSINO_DGEEC = @ID_DIM_NIVEL_ENSINO_DGEEC'
			if @bitMask & 0x00000000000800 <> 0 set @stmt += ' AND ID_DIM_TIPO_CONTRATO = @ID_DIM_TIPO_CONTRATO'
			if @bitMask & 0x00000000001000 <> 0 set @stmt += ' AND ID_DIM_SIT_PROFISSIONAL = @ID_DIM_SIT_PROFISSIONAL'
			if @bitMask & 0x00000000002000 <> 0 set @stmt += ' AND ID_DIM_DIMENSAO_EMP = @ID_DIM_DIMENSAO_EMP'
			if @bitMask & 0x00000000004000 <> 0 set @stmt += ' AND ID_DIM_REGIME_TRAB = @ID_DIM_REGIME_TRAB'
			if @bitMask & 0x00000000008000 <> 0 set @stmt += ' AND ID_DIM_NACIONALIDADE = @ID_DIM_NACIONALIDADE'
			if @bitMask & 0x00000000010000 <> 0 set @stmt += ' AND ID_DIM_FREGUESIA = @ID_DIM_FREGUESIA'
			if @bitMask & 0x00000000020000 <> 0 set @stmt += ' AND ID_DIM_AREA_FORMACAO = @ID_DIM_AREA_FORMACAO'
			if @bitMask & 0x00000000040000 <> 0 set @stmt += ' AND ID_DIM_DISTRITO = @ID_DIM_DISTRITO'
			if @bitMask & 0x00000000080000 <> 0 set @stmt += ' AND ID_DIM_SECTOR_BF = @ID_DIM_SECTOR_BF'
			if @bitMask & 0x00000000100000 <> 0 set @stmt += ' AND ID_DIM_SECTOR_BF_AGG = @ID_DIM_SECTOR_BF_AGG'
			if @bitMask & 0x00000000200000 <> 0 set @stmt += ' AND ID_DIM_IDADE_CURSO = @ID_DIM_IDADE_CURSO'
			if @bitMask & 0x00000000400000 <> 0 set @stmt += ' AND ID_DIM_FORMA_INGRESSO = @ID_DIM_FORMA_INGRESSO'
			if @bitMask & 0x00000000800000 <> 0 set @stmt += ' AND ID_DIM_PERCURSO = @ID_DIM_PERCURSO'
			if @bitMask & 0x00000001000000 <> 0 set @stmt += ' AND ID_DIM_COMPETENCIA_ONET_DET = @ID_DIM_COMPETENCIA_ONET_DET'
			if @bitMask & 0x00000002000000 <> 0 set @stmt += ' AND ID_DIM_COMPETENCIA_ONET_AGG = @ID_DIM_COMPETENCIA_ONET_AGG'
			if @bitMask & 0x00000004000000 <> 0 set @stmt += ' AND ID_DIM_COMPETENCIA_BG_DET = @ID_DIM_COMPETENCIA_BG_DET'
			if @bitMask & 0x00000008000000 <> 0 set @stmt += ' AND ID_DIM_COMPETENCIA_BG_AGG = @ID_DIM_COMPETENCIA_BG_AGG'
			if @bitMask & 0x00000010000000 <> 0 set @stmt += ' AND ID_DIM_API_INE_SEXO = @ID_DIM_API_INE_SEXO'
			if @bitMask & 0x00000020000000 <> 0 set @stmt += ' AND ID_DIM_NUTSII_INE = @ID_DIM_NUTSII_INE'
			if @bitMask & 0x00000040000000 <> 0 set @stmt += ' AND ID_DIM_API_INE_IDADE_TRABALHO = @ID_DIM_API_INE_IDADE_TRABALHO'
			if @bitMask & 0x00000080000000 <> 0 set @stmt += ' AND ID_DIM_NIVEL_ENSINO_INE = @ID_DIM_NIVEL_ENSINO_INE'
			if @bitMask & 0x00000100000000 <> 0 set @stmt += ' AND ID_DIM_API_INE_TIPO_CONTRATO = @ID_DIM_API_INE_TIPO_CONTRATO'
			if @bitMask & 0x00000200000000 <> 0 set @stmt += ' AND ID_DIM_API_INE_PROFISSAO = @ID_DIM_API_INE_PROFISSAO'
			if @bitMask & 0x00000400000000 <> 0 set @stmt += ' AND ID_DIM_API_INE_REGIME_TRAB = @ID_DIM_API_INE_REGIME_TRAB'
			if @bitMask & 0x00000800000000 <> 0 set @stmt += ' AND ID_DIM_API_INE_SECTOR = @ID_DIM_API_INE_SECTOR'
			if @bitMask & 0x00001000000000 <> 0 set @stmt += ' AND ID_DIM_PROFISSAO_BF2 = @ID_DIM_PROFISSAO_BF2'
			if @bitMask & 0x00002000000000 <> 0 set @stmt += ' AND ID_DIM_PROF_BF_AGG = @ID_DIM_PROF_BF_AGG'
			if @bitMask & 0x00004000000000 <> 0 set @stmt += ' AND ID_DIM_MEDIA_FINAL = @ID_DIM_MEDIA_FINAL'
			if @bitMask & 0x00008000000000 <> 0 set @stmt += ' AND ID_DIM_NUTS3_2013 = @ID_DIM_NUTS3_2013'
			if @bitMask & 0x00010000000000 <> 0 set @stmt += ' AND ID_DIM_API_INE_NUTS3_2013 = @ID_DIM_API_INE_NUTS3_2013'
			if @bitMask & 0x00020000000000 <> 0 set @stmt += ' AND ID_DIM_API_INE_NIVEL_ENSINO = @ID_DIM_API_INE_NIVEL_ENSINO'

			exec sp_executesql @stmt,@params
			                  ,@idDIM_VAL OUTPUT
							  ,@bitMask
							  ,@rowHash
	    ,@ID_DIM_IES_CURSO              
	    ,@ID_DIM_PROFISSAO_BF           
	    ,@ID_DIM_SEXO                   
	    ,@ID_DIM_NUTS2                  
	    ,@ID_DIM_NUTS3                  
	    ,@ID_DIM_ANO_LECTIVO            
	    ,@ID_DIM_IDADE_TRABALHO         
	    ,@ID_DIM_CONCELHO               
	    ,@ID_DIM_TIPO_ENSINO            
	    ,@ID_DIM_NIVEL_ENSINO           
	    ,@ID_DIM_NIVEL_ENSINO_DGEEC     
	    ,@ID_DIM_TIPO_CONTRATO          
	    ,@ID_DIM_SIT_PROFISSIONAL       
	    ,@ID_DIM_DIMENSAO_EMP           
	    ,@ID_DIM_REGIME_TRAB            
	    ,@ID_DIM_NACIONALIDADE          
	    ,@ID_DIM_FREGUESIA              
	    ,@ID_DIM_AREA_FORMACAO          
	    ,@ID_DIM_DISTRITO               
	    ,@ID_DIM_SECTOR_BF              
	    ,@ID_DIM_SECTOR_BF_AGG          
	    ,@ID_DIM_IDADE_CURSO            
	    ,@ID_DIM_FORMA_INGRESSO         
	    ,@ID_DIM_PERCURSO               
	    ,@ID_DIM_COMPETENCIA_ONET_DET   
	    ,@ID_DIM_COMPETENCIA_ONET_AGG   
	    ,@ID_DIM_COMPETENCIA_BG_DET     
	    ,@ID_DIM_COMPETENCIA_BG_AGG     
	    ,@ID_DIM_API_INE_SEXO           
	    ,@ID_DIM_NUTSII_INE             
	    ,@ID_DIM_API_INE_IDADE_TRABALHO 
	    ,@ID_DIM_NIVEL_ENSINO_INE       
	    ,@ID_DIM_API_INE_TIPO_CONTRATO  
	    ,@ID_DIM_API_INE_PROFISSAO      
	    ,@ID_DIM_API_INE_REGIME_TRAB    
	    ,@ID_DIM_API_INE_SECTOR        
	    ,@ID_DIM_PROFISSAO_BF2          
	    ,@ID_DIM_PROF_BF_AGG            
	    ,@ID_DIM_MEDIA_FINAL            
	    ,@ID_DIM_NUTS3_2013             
	    ,@ID_DIM_API_INE_NUTS3_2013     
	    ,@ID_DIM_API_INE_NIVEL_ENSINO   
			--print @idDIM_VAL

			if @idDIM_VAL is null
			begin
				insert into DIM_VAL
			              ([BITMASK]
						  ,ID_DIM_IES_CURSO              
						  ,ID_DIM_PROFISSAO_BF           
						  ,ID_DIM_SEXO                   
						  ,ID_DIM_NUTS2                  
						  ,ID_DIM_NUTS3                  
						  ,ID_DIM_ANO_LECTIVO            
						  ,ID_DIM_IDADE_TRABALHO         
						  ,ID_DIM_CONCELHO               
						  ,ID_DIM_TIPO_ENSINO            
						  ,ID_DIM_NIVEL_ENSINO           
						  ,ID_DIM_NIVEL_ENSINO_DGEEC     
						  ,ID_DIM_TIPO_CONTRATO          
						  ,ID_DIM_SIT_PROFISSIONAL       
						  ,ID_DIM_DIMENSAO_EMP           
						  ,ID_DIM_REGIME_TRAB            
						  ,ID_DIM_NACIONALIDADE          
						  ,ID_DIM_FREGUESIA              
						  ,ID_DIM_AREA_FORMACAO          
						  ,ID_DIM_DISTRITO               
						  ,ID_DIM_SECTOR_BF              
						  ,ID_DIM_SECTOR_BF_AGG          
						  ,ID_DIM_IDADE_CURSO            
						  ,ID_DIM_FORMA_INGRESSO         
						  ,ID_DIM_PERCURSO               
						  ,ID_DIM_COMPETENCIA_ONET_DET   
						  ,ID_DIM_COMPETENCIA_ONET_AGG   
						  ,ID_DIM_COMPETENCIA_BG_DET     
						  ,ID_DIM_COMPETENCIA_BG_AGG     
						  ,ID_DIM_API_INE_SEXO           
						  ,ID_DIM_NUTSII_INE             
						  ,ID_DIM_API_INE_IDADE_TRABALHO 
						  ,ID_DIM_NIVEL_ENSINO_INE       
						  ,ID_DIM_API_INE_TIPO_CONTRATO  
						  ,ID_DIM_API_INE_PROFISSAO      
						  ,ID_DIM_API_INE_REGIME_TRAB    
						  ,ID_DIM_API_INE_SECTOR        
						  ,ID_DIM_PROFISSAO_BF2          
						  ,ID_DIM_PROF_BF_AGG            
						  ,ID_DIM_MEDIA_FINAL            
						  ,ID_DIM_NUTS3_2013             
						  ,ID_DIM_API_INE_NUTS3_2013     
						  ,ID_DIM_API_INE_NIVEL_ENSINO)
				values
					(@bitMask
					,@ID_DIM_IES_CURSO              
					,@ID_DIM_PROFISSAO_BF           
					,@ID_DIM_SEXO                   
					,@ID_DIM_NUTS2                  
					,@ID_DIM_NUTS3                  
					,@ID_DIM_ANO_LECTIVO            
					,@ID_DIM_IDADE_TRABALHO         
					,@ID_DIM_CONCELHO               
					,@ID_DIM_TIPO_ENSINO            
					,@ID_DIM_NIVEL_ENSINO           
					,@ID_DIM_NIVEL_ENSINO_DGEEC     
					,@ID_DIM_TIPO_CONTRATO          
					,@ID_DIM_SIT_PROFISSIONAL       
					,@ID_DIM_DIMENSAO_EMP           
					,@ID_DIM_REGIME_TRAB            
					,@ID_DIM_NACIONALIDADE          
					,@ID_DIM_FREGUESIA              
					,@ID_DIM_AREA_FORMACAO          
					,@ID_DIM_DISTRITO               
					,@ID_DIM_SECTOR_BF              
					,@ID_DIM_SECTOR_BF_AGG          
					,@ID_DIM_IDADE_CURSO            
					,@ID_DIM_FORMA_INGRESSO         
					,@ID_DIM_PERCURSO               
					,@ID_DIM_COMPETENCIA_ONET_DET   
					,@ID_DIM_COMPETENCIA_ONET_AGG   
					,@ID_DIM_COMPETENCIA_BG_DET     
					,@ID_DIM_COMPETENCIA_BG_AGG     
					,@ID_DIM_API_INE_SEXO           
					,@ID_DIM_NUTSII_INE             
					,@ID_DIM_API_INE_IDADE_TRABALHO 
					,@ID_DIM_NIVEL_ENSINO_INE       
					,@ID_DIM_API_INE_TIPO_CONTRATO  
					,@ID_DIM_API_INE_PROFISSAO      
					,@ID_DIM_API_INE_REGIME_TRAB    
					,@ID_DIM_API_INE_SECTOR        
					,@ID_DIM_PROFISSAO_BF2          
					,@ID_DIM_PROF_BF_AGG            
					,@ID_DIM_MEDIA_FINAL            
					,@ID_DIM_NUTS3_2013             
					,@ID_DIM_API_INE_NUTS3_2013     
					,@ID_DIM_API_INE_NIVEL_ENSINO)

				select @idDIM_VAL = SCOPE_IDENTITY()
			end
			if @mes is not null 
			begin
				insert into FCT_KPI_MES([ID_DIM_KPI],[ID_DIM_VAL],[CD_ANO_MES],[VAL_KPI])
				values(@idKpi,@idDIM_VAL,cast(@ano as varchar(50))+'M'+right('0'+cast(@mes as varchar(50)),2),@valor)
			end
			else if @trimestre is not null
			begin
				insert into FCT_KPI_TRIMESTRE([ID_DIM_KPI],[ID_DIM_VAL],[CD_ANO_TRIMESTRE],[VAL_KPI])
				values(@idKpi,@idDIM_VAL,cast(@ano as varchar(50))+'Q'+@trimestre,@valor)
			end
			else if @ano is not null
			begin
				insert into FCT_KPI_ANO([ID_DIM_KPI],[ID_DIM_VAL],[CD_ANO],[VAL_KPI])
				values(@idKpi,@idDIM_VAL,@ano,@valor)
			end
			else
			begin
				insert into FCT_KPI([ID_DIM_KPI],[ID_DIM_VAL],[VAL_KPI])
				values(@idKpi,@idDIM_VAL,@valor)
			end

			--
			fetch next from c1 into
			     @valor
				,@bitMask
				,@rowHash
				,@ano
				,@trimestre
				,@mes
				,@ID_DIM_IES_CURSO              
				,@ID_DIM_PROFISSAO_BF           
				,@ID_DIM_SEXO                   
				,@ID_DIM_NUTS2                  
				,@ID_DIM_NUTS3                  
				,@ID_DIM_ANO_LECTIVO            
				,@ID_DIM_IDADE_TRABALHO         
				,@ID_DIM_CONCELHO               
				,@ID_DIM_TIPO_ENSINO            
				,@ID_DIM_NIVEL_ENSINO           
				,@ID_DIM_NIVEL_ENSINO_DGEEC     
				,@ID_DIM_TIPO_CONTRATO          
				,@ID_DIM_SIT_PROFISSIONAL       
				,@ID_DIM_DIMENSAO_EMP           
				,@ID_DIM_REGIME_TRAB            
				,@ID_DIM_NACIONALIDADE          
				,@ID_DIM_FREGUESIA              
				,@ID_DIM_AREA_FORMACAO          
				,@ID_DIM_DISTRITO               
				,@ID_DIM_SECTOR_BF              
				,@ID_DIM_SECTOR_BF_AGG          
				,@ID_DIM_IDADE_CURSO            
				,@ID_DIM_FORMA_INGRESSO         
				,@ID_DIM_PERCURSO               
				,@ID_DIM_COMPETENCIA_ONET_DET   
				,@ID_DIM_COMPETENCIA_ONET_AGG   
				,@ID_DIM_COMPETENCIA_BG_DET     
				,@ID_DIM_COMPETENCIA_BG_AGG     
				,@ID_DIM_API_INE_SEXO           
				,@ID_DIM_NUTSII_INE             
				,@ID_DIM_API_INE_IDADE_TRABALHO 
				,@ID_DIM_NIVEL_ENSINO_INE       
				,@ID_DIM_API_INE_TIPO_CONTRATO  
				,@ID_DIM_API_INE_PROFISSAO      
				,@ID_DIM_API_INE_REGIME_TRAB    
				,@ID_DIM_API_INE_SECTOR        
				,@ID_DIM_PROFISSAO_BF2          
				,@ID_DIM_PROF_BF_AGG            
				,@ID_DIM_MEDIA_FINAL            
				,@ID_DIM_NUTS3_2013             
				,@ID_DIM_API_INE_NUTS3_2013     
				,@ID_DIM_API_INE_NIVEL_ENSINO   
		end

		close c1
		deallocate c1
END
