CREATE PROCEDURE [stg].[spCheckinFileDD]
(
    @fileFullName nvarchar(2000),
	@fileKey nvarchar(50) output,
	@fileType nchar(1) output,
	@fileTemplate int output,
	@fileName nvarchar(2000) output
)
AS
BEGIN
    SET NOCOUNT ON
	declare @altFileName nvarchar(2000)
	select @fileType = null

	declare @i1 int = (select charindex(N'_', @fileFullName))+1
	declare @i2 int = (select charindex(N'_', substring(@fileFullName,@i1,4000)))+@i1
	declare @i3 int = (select charindex(N'.', substring(@fileFullName,@i2,4000)))+@i2
    SELECT @fileKey = (substring(@fileFullName,1,@i1-2)), 
		   @fileName = (substring(@fileFullName,@i2,@i3-@i2-1))


	declare @i2a int = (select charindex(N'_', substring(@fileFullName,@i2,4000)))+@i2
	declare @i3a int = (select charindex(N'.', substring(@fileFullName,@i2a,4000)))+@i2a
	select @altFileName = substring(@fileFullName,@i2a,@i3-@i2a-1)


--TODO: valores a seguir serão retirados de bd
-- no caso de dimensão o nome será substring(@fileFullName,@i2a,@i3-@i2a-1) 

		   select @fileType = case @altFileName 
		                      when N'area_formacao_lbl' then N'D' 
							  --when N'XXX' then N'D'
							  end,
				  @fileTemplate = case @altFileName 
		                          when N'area_formacao_lbl' then 1 
							      end

		   if @fileType is null
		   begin
			   select @fileType = case @fileName 
								  when N'onet_emprego_total' then N'F' 
								  --when N'XXX' then N'D'
								  else N'U' end,
					  @fileTemplate = case @fileName 
									  when N'TCO' then 1 
									  else -1 end
			end
			else
			begin
				select @fileName = @altFileName
			end
END
