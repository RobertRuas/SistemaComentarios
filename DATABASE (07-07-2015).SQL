USE [SisComentarios]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 10/07/2015 00:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStatus](
	[IDStatus] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[IDStatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPrevilegio]    Script Date: 10/07/2015 00:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrevilegio](
	[IDPrevilegio] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [nvarchar](100) NOT NULL,
	[Valor] [bit] NOT NULL,
 CONSTRAINT [PK_tblPrevilegio] PRIMARY KEY CLUSTERED 
(
	[IDPrevilegio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 10/07/2015 00:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[Sexo] [bit] NOT NULL,
	[DataNascimento] [datetime] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[UsuarioNome] [nvarchar](100) NOT NULL,
	[UsuarioSenha] [nvarchar](100) NOT NULL,
	[IDPrevilegios] [int] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IDStatus] [int] NOT NULL,
 CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[uspUsuarioInserir]    Script Date: 10/07/2015 00:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	PROCEDIMENTOS PARA TABELA CLIENTE	*/

CREATE PROCEDURE [dbo].[uspUsuarioInserir]

	@Nome VARCHAR(100), 
	@Sexo BIT, 
	@DataNascimento DATETIME, 
	@Email VARCHAR(100), 
	@UsuarioNome VARCHAR(100), 
	@UsuarioSenha VARCHAR(100), 
	@IDPrevilegios INT, 
	@DataCadastro DATETIME, 
	@IDStatus INT
	
AS
BEGIN

	INSERT INTO tblUsuario
	(
		NOME,
		Sexo,
		DataNascimento,
		Email,
		UsuarioNome,
		UsuarioSenha,
		IDPrevilegios,
		DataCadastro,
		IDStatus
	)
	VALUES
	(
		@NOME,
		@Sexo,
		@DataNascimento,
		@Email,
		@UsuarioNome,
		@UsuarioSenha,
		@IDPrevilegios,
		@DataCadastro,
		@IDStatus
	)
	
	SELECT @@IDENTITY AS Retorno
	
END
GO
/****** Object:  StoredProcedure [dbo].[uspUsuarioExcluir]    Script Date: 10/07/2015 00:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	PROCEDIMENTOS PARA TABELA CLIENTE	*/

CREATE PROCEDURE [dbo].[uspUsuarioExcluir]

	@IDUsuario INT
AS
BEGIN
	DELETE 
		tblUsuario
	WHERE 
		IDUsuario = @IDUsuario
	
	SELECT @IDUsuario AS Retorno
	
END
GO
/****** Object:  StoredProcedure [dbo].[uspUsuarioConsultarPorNome]    Script Date: 10/07/2015 00:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	PROCEDIMENTOS PARA TABELA CLIENTE	*/

CREATE PROCEDURE [dbo].[uspUsuarioConsultarPorNome]

	@Nome VARCHAR(100)
	
AS
BEGIN

	SELECT
		IDUsuario, 
		Nome, 
		Sexo, 
		DataNascimento, 
		Email, 
		UsuarioNome, 
		UsuarioSenha, 
		IDPrevilegios, 
		DataCadastro, 
		IDStatus
	FROM
		tblUsuario
	WHERE
		Nome LIKE '%' + @Nome + '%'
		
END
GO
/****** Object:  StoredProcedure [dbo].[uspUsuarioConsultarPorID]    Script Date: 10/07/2015 00:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	PROCEDIMENTOS PARA TABELA CLIENTE	*/

CREATE PROCEDURE [dbo].[uspUsuarioConsultarPorID]

	@IDUsuario INT
	
AS
BEGIN

	SELECT
		IDUsuario, 
		Nome, 
		Sexo, 
		DataNascimento, 
		Email, 
		UsuarioNome, 
		UsuarioSenha, 
		IDPrevilegios, 
		DataCadastro, 
		IDStatus
	FROM
		tblUsuario
	WHERE
		IDUsuario = @IDUsuario
		
END
GO
/****** Object:  StoredProcedure [dbo].[uspUsuarioAlterar]    Script Date: 10/07/2015 00:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	PROCEDIMENTOS PARA TABELA CLIENTE	*/

CREATE PROCEDURE [dbo].[uspUsuarioAlterar]

	@IDUsuario INT,
	@Nome VARCHAR(100), 
	@Sexo BIT, 
	@DataNascimento DATETIME, 
	@Email VARCHAR(100), 
	@UsuarioNome VARCHAR(100), 
	@UsuarioSenha VARCHAR(100), 
	@IDPrevilegios INT, 
	@IDStatus INT
	
AS
BEGIN
	UPDATE tblUsuario
	SET
		Nome = @Nome,
		Sexo = @Sexo,
		DataNascimento = @DataNascimento,
		Email = @Email,
		UsuarioNome = @UsuarioNome,
		UsuarioSenha = @UsuarioSenha,
		IDPrevilegios = @IDPrevilegios,
		IDStatus = @IDStatus
	WHERE IDUsuario = @IDUsuario
	
	SELECT @IDUsuario AS Retorno
	
END
GO
/****** Object:  ForeignKey [FK_tblUsuario_tblPrevilegio]    Script Date: 10/07/2015 00:43:05 ******/
ALTER TABLE [dbo].[tblUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuario_tblPrevilegio] FOREIGN KEY([IDPrevilegios])
REFERENCES [dbo].[tblPrevilegio] ([IDPrevilegio])
GO
ALTER TABLE [dbo].[tblUsuario] CHECK CONSTRAINT [FK_tblUsuario_tblPrevilegio]
GO
/****** Object:  ForeignKey [FK_tblUsuario_tblStatus]    Script Date: 10/07/2015 00:43:05 ******/
ALTER TABLE [dbo].[tblUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuario_tblStatus] FOREIGN KEY([IDStatus])
REFERENCES [dbo].[tblStatus] ([IDStatus])
GO
ALTER TABLE [dbo].[tblUsuario] CHECK CONSTRAINT [FK_tblUsuario_tblStatus]
GO
