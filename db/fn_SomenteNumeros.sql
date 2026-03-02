CREATE FUNCTION dbo.fn_SomenteNumeros(@Sentenca VARCHAR(1000))
RETURNS VARCHAR(1000) AS
BEGIN
	DECLARE @Resultado VARCHAR (1000) = '',
			@Cont INT = 1

	IF @Sentenca IS NULL
	BEGIN
		SET @Resultado = NULL
	END
	ELSE
	BEGIN
		WHILE @Cont <= LEN(@Sentenca)
		BEGIN
			IF SUBSTRING(@Sentenca, @Cont, 1) IN ('0','1','2','3','4','5','6','7','8','9')
			BEGIN
				SET @Resultado = @Resultado + SUBSTRING(@Sentenca, @Cont, 1)
			END
			SET @Cont = @Cont + 1
		END
	END

	RETURN @Resultado
END
