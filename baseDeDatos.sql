USE [master]
GO
/****** Object:  Database [PreguntadOrt]    Script Date: 5/10/2025 18:25:00 ******/
CREATE DATABASE [PreguntadOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadOrt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadOrt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadOrt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadOrt] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadOrt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PreguntadOrt] SET QUERY_STORE = OFF
GO
USE [PreguntadOrt]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 5/10/2025 18:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fotoCategoria] [varchar](50) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 5/10/2025 18:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[multiplicador] [decimal](2, 1) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 5/10/2025 18:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[idDificultad] [int] NOT NULL,
	[enunciado] [varchar](100) NOT NULL,
	[foto] [varchar](50) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Records]    Script Date: 5/10/2025 18:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Records](
	[IdRecord] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Puntaje] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Records] PRIMARY KEY CLUSTERED 
(
	[IdRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 5/10/2025 18:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[contenido] [varchar](50) NOT NULL,
	[correcta] [bit] NOT NULL,
	[fotoRes] [varchar](50) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([idDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Preguntas] ([idPregunta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
/****** Object:  StoredProcedure [dbo].[AgregarTop]    Script Date: 5/10/2025 18:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AgregarTop]
	-- Add the parameters for the stored procedure here
	@puntaje int,
	@username varchar(50)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @total int;
	SET @total=(SELECT COUNT(*)as total FROM (SELECT TOP 10 * FROM Records order by Puntaje ASC)as sub )
	IF @total=0 or @total<10
	BEGIN
	INSERT INTO Records VALUES (@username,@puntaje,CAST(GETDATE() AS datetime)) 
	return 1
	end
	IF( @puntaje > (SELECT TOP 1 Puntaje FROM Records ORDER BY Puntaje ASC))
	BEGIN	
	if @total= 10
	BEGIN
				DELETE FROM Records where IdRecord=(SELECT TOP 1 IdRecord FROM Records ORDER BY Puntaje ASC)
				
	END
		INSERT INTO Records VALUES (@username,@puntaje,CAST(GETDATE() AS datetime)) 
		RETURN SELECT 1
	END
	ELSE
	BEGIN		
		RETURN SELECT 0
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[levantarPreguntitas]    Script Date: 5/10/2025 18:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[levantarPreguntitas]
@IdDif int ,
@IdCate int
AS
BEGIN
   IF @IdDif = -1 AND  @IdCate = -1
   BEGIN
    SELECT * FROM Preguntas
	RETURN
	END
	ELSE
	 IF @IdDif = -1
   BEGIN
    SELECT * FROM Preguntas WHERE idCategoria=@IdCate
	RETURN
	end
	IF @IdCate = -1
	BEGIN
   SELECT * FROM Preguntas WHERE idDificultad=@IdDif
   RETURN
   END
   SELECT * FROM Preguntas WHERE idDificultad=@IdDif AND idCategoria=@IdCate
   	SET NOCOUNT ON;

END
GO
/****** Object:  StoredProcedure [dbo].[levantarTop]    Script Date: 5/10/2025 18:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[levantarTop]
AS
BEGIN
SELECT TOP 10 * FROM Records ORDER BY puntaje desc, fecha asc 
END
GO
USE [master]
GO
ALTER DATABASE [PreguntadOrt] SET  READ_WRITE 
GO


USE [PreguntadOrt];
GO
-- =============================================
-- Insertar categorías iniciales
-- =============================================
INSERT INTO Categorias (nombre, fotoCategoria)
VALUES 
('Cultura General', 'cultura.png'),
('Historia', 'historia.png'),
('Entretenimiento y Música', 'entretenimiento.png'),
('Países y Banderas', 'banderas.png'),
('ORT', 'ort.png');
GO

-- =============================================
-- Insertar dificultades iniciales
-- =============================================
INSERT INTO Dificultades (Nombre, multiplicador)
VALUES 
('Fácil', 1.0),
('Medio', 1.5),
('Difícil', 2.0);
GO

USE [PreguntadOrt];
GO
DBCC CHECKIDENT ('Preguntas', RESEED, 1);

-- Preguntas Cultura General
INSERT INTO Preguntas (idCategoria, idDificultad, enunciado, foto)
VALUES
(1,1,'¿Cuál es el metal más ligero?',NULL),
(1,1,'¿Qué gas respiramos los humanos para vivir?',NULL),
(1,1,'¿Qué instrumento musical tiene teclas blancas y negras?',NULL),
(1,1,'¿Cuál es el planeta más cercano al Sol?',NULL),
(1,2,'¿Quién pintó la Mona Lisa?',NULL),
(1,2,'¿Qué invento es atribuido a Alexander Graham Bell?',NULL),
(1,2,'¿Cuál es la capital de Australia?',NULL),
(1,2,'¿Qué país es famoso por los tulipanes y molinos?',NULL),
(1,3,'¿En qué año cayó el Muro de Berlín?',NULL),
(1,3,'¿Qué civilización construyó Machu Picchu?',NULL),
(1,3,'¿Qué científico propuso la teoría de la relatividad?',NULL),
(1,3,'¿Cuál es el río más largo del mundo?',NULL),
(1,1,'¿Qué alimento es típico de Italia y se hace con masa y tomate?',NULL),
(1,2,'¿Quién escribió Don Quijote de la Mancha?',NULL),
(1,2,'¿Qué metal es más conductor de electricidad?',NULL),
(1,2,'¿Cuál es el océano más grande del mundo?',NULL),
(1,3,'¿Qué ciudad es conocida como la ciudad de la luz?',NULL),
(1,3,'¿Qué obra famosa pintó Vincent van Gogh?',NULL),
(1,1,'¿Cuál es el símbolo químico del agua?',NULL),
(1,1,'¿Qué país es conocido como la cuna del sushi?',NULL);
GO

USE [PreguntadOrt];
GO
-- Respuestas Cultura General con opciones mezcladas
INSERT INTO Respuestas (idPregunta, Opcion, contenido, correcta, fotoRES)
VALUES
-- Pregunta 1
(1,1,'Oro',0, NULL),(1,2,'Litio',1, NULL),(1,3,'Hierro',0, NULL),(1,4,'Plata',0, NULL),
-- Pregunta 2
(2,1,'Dióxido de carbono',0, NULL),(2,2,'Hidrógeno',0, NULL),(2,3,'Oxígeno',1, NULL),(2,4,'Nitrógeno',0, NULL),
-- Pregunta 3
(3,1,'Violín',0, NULL),(3,2,'Piano',1, NULL),(3,3,'Batería',0, NULL),(3,4,'Guitarra',0, NULL),
-- Pregunta 4
(4,1,'Tierra',0, NULL),(4,2,'Marte',0, NULL),(4,3,'Mercurio',1, NULL),(4,4,'Venus',0, NULL),
-- Pregunta 5
(5,1,'Miguel Ángel',0, NULL),(5,2,'Picasso',0, NULL),(5,3,'Leonardo da Vinci',1, NULL),(5,4,'Van Gogh',0, NULL),
-- Pregunta 6
(6,1,'Bombilla',0, NULL),(6,2,'Teléfono',1, NULL),(6,3,'Reloj',0, NULL),(6,4,'Avión',0, NULL),
-- Pregunta 7
(7,1,'Sídney',0, NULL),(7,2,'Perth',0, NULL),(7,3,'Melbourne',0, NULL),(7,4,'Canberra',1, NULL),
-- Pregunta 8
(8,1,'Alemania',0, NULL),(8,2,'Países Bajos',1, NULL),(8,3,'Dinamarca',0, NULL),(8,4,'Bélgica',0, NULL),
-- Pregunta 9
(9,1,'1995',0, NULL),(9,2,'1989',1, NULL),(9,3,'1991',0, NULL),(9,4,'1987',0, NULL),
-- Pregunta 10
(10,1,'Mayas',0, NULL),(10,2,'Aztecas',0, NULL),(10,3,'Incas',1, NULL),(10,4,'Egipcios',0, NULL),
-- Pregunta 11
(11,1,'Nikola Tesla',0, NULL),(11,2,'Albert Einstein',1, NULL),(11,3,'Galileo Galilei',0, NULL),(11,4,'Isaac Newton',0, NULL),
-- Pregunta 12
(12,1,'Yangtsé',0, NULL),(12,2,'Misisipi',0, NULL),(12,3,'Nilo',1, NULL),(12,4,'Amazonas',0, NULL),
-- Pregunta 13
(13,1,'Empanada',0, NULL),(13,2,'Pizza',1, NULL),(13,3,'Sushi',0, NULL),(13,4,'Pan',0, NULL),
-- Pregunta 14
(14,1,'Gabriel García Márquez',0, NULL),(14,2,'J.K. Rowling',0, NULL),(14,3,'Homer',0, NULL),(14,4,'Miguel de Cervantes',1, NULL),
-- Pregunta 15
(15,1,'Cobre',1, NULL),(15,2,'Oro',0, NULL),(15,3,'Plata',0, NULL),(15,4,'Hierro',0, NULL), -- ya estaba mezclada
-- Pregunta 16
(16,1,'Índico',0, NULL),(16,2,'Ártico',0, NULL),(16,3,'Pacífico',1, NULL),(16,4,'Atlántico',0, NULL),
-- Pregunta 17
(17,1,'Berlín',0, NULL),(17,2,'París',1, NULL),(17,3,'Londres',0, NULL),(17,4,'Roma',0, NULL),
-- Pregunta 18
(18,1,'La noche estrellada',1, NULL),(18,2,'Guernica',0, NULL),(18,3,'La última cena',0, NULL),(18,4,'El grito',0, NULL), -- ya mezclada
-- Pregunta 19
(19,1,'CO2',0, NULL),(19,2,'H2O',1, NULL),(19,3,'O2',0, NULL),(19,4,'NaCl',0, NULL),
-- Pregunta 20
(20,1,'Tailandia',0, NULL),(20,2,'Japón',1, NULL),(20,3,'China',0, NULL),(20,4,'Corea',0, NULL);
GO

USE [PreguntadOrt];
GO

-- =============================================
-- PREGUNTAS Y RESPUESTAS: HISTORIA
-- =============================================

-- Preguntas Historia
INSERT INTO Preguntas (idCategoria, idDificultad, enunciado, foto)
VALUES
(2,1,'¿Quién fue el primer presidente de Estados Unidos?',NULL),
(2,1,'¿En qué año comenzó la Segunda Guerra Mundial?',NULL),
(2,1,'¿Qué imperio construyó la Gran Muralla China?',NULL),
(2,1,'¿Quién lideró la Revolución Francesa?',NULL),
(2,2,'¿Qué civilización antigua inventó la escritura cuneiforme?',NULL),
(2,2,'¿En qué año cayó el Imperio Romano de Occidente?',NULL),
(2,2,'¿Quién fue Napoleón Bonaparte?',NULL),
(2,2,'¿Qué guerra enfrentó a Norteamérica y Gran Bretaña entre 1812-1815?',NULL),
(2,3,'¿Qué evento inició la Edad Moderna?',NULL),
(2,3,'¿Quién fue el líder del Imperio Mongol más famoso?',NULL),
(2,3,'¿Cuál fue la causa principal de la Revolución Industrial?',NULL),
(2,3,'¿Qué tratado puso fin a la Primera Guerra Mundial?',NULL),
(2,1,'¿Quién descubrió América en 1492?',NULL),
(2,1,'¿Qué imperio construyó las pirámides de Giza?',NULL),
(2,2,'¿Qué rey francés fue ejecutado en la guillotina?',NULL),
(2,2,'¿Quién fue Mahatma Gandhi?',NULL),
(2,3,'¿Qué imperio dominó gran parte de Europa antes de 1800?',NULL),
(2,3,'¿Cuál fue la principal causa de la Guerra de los Cien Años?',NULL),
(2,3,'¿Qué conflicto enfrentó a Estados Unidos y la Unión Soviética tras la Segunda Guerra Mundial?',NULL),
(2,3,'¿Quién fue el último emperador de Rusia antes de la revolución de 1917?',NULL);
GO
USE [PreguntadOrt];
GO

-- Respuestas Historia (opciones mezcladas)
INSERT INTO Respuestas (idPregunta, Opcion, contenido, correcta)
VALUES
-- Pregunta 21
(21,1,'Thomas Jefferson',0),(21,2,'Abraham Lincoln',0),(21,3,'John Adams',0),(21,4,'George Washington',1),
-- Pregunta 22
(22,1,'1914',0),(22,2,'1945',0),(22,3,'1929',0),(22,4,'1939',1),
-- Pregunta 23
(23,1,'Imperio Romano',0),(23,2,'Imperio Otomano',0),(23,3,'Imperio Mongol',0),(23,4,'Imperio Chino',1),
-- Pregunta 24
(24,1,'Napoleón Bonaparte',0),(24,2,'Luis XVI',0),(24,3,'Carlos V',0),(24,4,'Maximilien Robespierre',1),
-- Pregunta 25
(25,1,'Egipcios',0),(25,2,'Mayas',0),(25,3,'Romanos',0),(25,4,'Sumerios',1),
-- Pregunta 26
(26,1,'410',0),(26,2,'500',0),(26,3,'395',0),(26,4,'476',1),
-- Pregunta 27
(27,1,'Rey inglés',0),(27,2,'General romano',0),(27,3,'Explorador español',0),(27,4,'Emperador francés y líder militar',1),
-- Pregunta 28
(28,1,'Guerra Civil Americana',0),(28,2,'Guerra de los Siete Años',0),(28,3,'Guerra de Secesión',0),(28,4,'Guerra de 1812',1),
-- Pregunta 29
(29,1,'Caída de Roma',0),(29,2,'Revolución Industrial',0),(29,3,'Revolución Francesa',0),(29,4,'Descubrimiento de América',1),
-- Pregunta 30
(30,1,'Kublai Kan',0),(30,2,'Tamerlán',0),(30,3,'Hulagu',0),(30,4,'Gengis Kan',1),
-- Pregunta 31
(31,1,'Descubrimiento de América',0),(31,2,'Caída del Muro de Berlín',0),(31,3,'Revolución Francesa',0),(31,4,'Revolución Industrial por la máquina de vapor',1),
-- Pregunta 32
(32,1,'Tratado de París',0),(32,2,'Tratado de Roma',0),(32,3,'Tratado de Viena',0),(32,4,'Tratado de Versalles',1),
-- Pregunta 33
(33,1,'Fernando de Magallanes',0),(33,2,'Américo Vespucio',0),(33,3,'Hernán Cortés',0),(33,4,'Cristóbal Colón',1),
-- Pregunta 34
(34,1,'Sumerios',0),(34,2,'Mayas',0),(34,3,'Romanos',0),(34,4,'Egipcios',1),
-- Pregunta 35
(35,1,'Luis XIV',0),(35,2,'Napoleón',0),(35,3,'Carlos I',0),(35,4,'Luis XVI',1),
-- Pregunta 36
(36,1,'Rey de Inglaterra',0),(36,2,'Emperador romano',0),(36,3,'General francés',0),(36,4,'Líder pacifista y político indio',1),
-- Pregunta 37
(37,1,'Imperio Mongol',0),(37,2,'Imperio Bizantino',0),(37,3,'Imperio Otomano',0),(37,4,'Imperio Romano',1),
-- Pregunta 38
(38,1,'Guerra de Secesión',0),(38,2,'Guerras Púnicas',0),(38,3,'Revolución Francesa',0),(38,4,'Conflictos por herencia y territorios entre Francia e Inglaterra',1),
-- Pregunta 39
(39,1,'Primera Guerra Mundial',0),(39,2,'Segunda Guerra Mundial',0),(39,3,'Revolución Industrial',0),(39,4,'Guerra Fría',1),
-- Pregunta 40
(40,1,'Pedro el Grande',0),(40,2,'Alejandro II',0),(40,3,'Lenin',0),(40,4,'Nicolás II',1);
GO

USE [PreguntadOrt];
GO

-- =============================================
-- PREGUNTAS Y RESPUESTAS: ENTRETENIMIENTO Y MÚSICA
-- =============================================

-- Preguntas Entretenimiento y Música
INSERT INTO Preguntas (idCategoria, idDificultad, enunciado, foto)
VALUES
(3,1,'¿Quién canta la canción "Shape of You"?',NULL),
(3,1,'¿En qué serie aparece el personaje Walter White?',NULL),
(3,1,'¿Qué superhéroe es interpretado por Robert Downey Jr.?',NULL),
(3,1,'¿Quién dirigió la película "Titanic"?',NULL),
(3,2,'¿Qué banda británica compuso "Hey Jude"?',NULL),
(3,2,'¿En qué año se estrenó la película "Matrix"?',NULL),
(3,2,'¿Quién interpreta a Jack Sparrow?',NULL),
(3,2,'¿Qué cantante es conocido como "El Rey del Pop"?',NULL),
(3,3,'¿Cuál fue la primera película de Harry Potter?',NULL),
(3,3,'¿Qué serie tiene como protagonista a Eleven?',NULL),
(3,3,'¿Quién dirigió "El Señor de los Anillos"?',NULL),
(3,3,'¿Qué banda lanzó el álbum "Abbey Road"?',NULL),
(3,1,'¿Qué cantante es famoso por la canción "Rolling in the Deep"?',NULL),
(3,1,'¿En qué serie se encuentra el personaje Daenerys Targaryen?',NULL),
(3,2,'¿Qué actor interpreta a Tony Stark/Iron Man?',NULL),
(3,2,'¿Quién dirigió la película "Inception"?',NULL),
(3,3,'¿Qué serie animada tiene a Homero Simpson como protagonista?',NULL),
(3,3,'¿Qué banda tocaba en Woodstock 1969?',NULL),
(3,2,'¿Qué cantante británico lanzó el álbum "Divide"?',NULL),
(3,2,'¿En qué película aparece el personaje Forrest Gump?',NULL);
GO
USE [PreguntadOrt];
GO

-- Respuestas Entretenimiento y Música (opciones mezcladas)
INSERT INTO Respuestas (idPregunta, Opcion, contenido, correcta)
VALUES
-- Pregunta 41
(41,1,'Justin Bieber',0),(41,2,'Ed Sheeran',1),(41,3,'Bruno Mars',0),(41,4,'Shawn Mendes',0),
-- Pregunta 42
(42,1,'Friends',0),(42,2,'The Office',0),(42,3,'Breaking Bad',1),(42,4,'Better Call Saul',0),
-- Pregunta 43
(43,1,'Batman',0),(43,2,'Superman',0),(43,3,'Iron Man',1),(43,4,'Spider-Man',0),
-- Pregunta 44
(44,1,'Christopher Nolan',0),(44,2,'James Cameron',1),(44,3,'Peter Jackson',0),(44,4,'Steven Spielberg',0),
-- Pregunta 45
(45,1,'The Beatles',1),(45,2,'Pink Floyd',0),(45,3,'Queen',0),(45,4,'Rolling Stones',0),
-- Pregunta 46
(46,1,'2000',0),(46,2,'1997',0),(46,3,'1939',0),(46,4,'1999',1),
-- Pregunta 47
(47,1,'Orlando Bloom',0),(47,2,'Johnny Depp',1),(47,3,'Leonardo DiCaprio',0),(47,4,'Tom Cruise',0),
-- Pregunta 48
(48,1,'Freddie Mercury',0),(48,2,'Michael Jackson',1),(48,3,'Elvis Presley',0),(48,4,'Prince',0),
-- Pregunta 49
(49,1,'Harry Potter y la cámara secreta',0),(49,2,'Harry Potter y la piedra filosofal',1),(49,3,'Harry Potter y el prisionero de Azkaban',0),(49,4,'Harry Potter y el cáliz de fuego',0),
-- Pregunta 50
(50,1,'Dark',0),(50,2,'Breaking Bad',0),(50,3,'Stranger Things',1),(50,4,'The Witcher',0),
-- Pregunta 51
(51,1,'Christopher Nolan',0),(51,2,'James Cameron',0),(51,3,'Peter Jackson',1),(51,4,'Steven Spielberg',0),
-- Pregunta 52
(52,1,'Pink Floyd',0),(52,2,'The Rolling Stones',0),(52,3,'Queen',0),(52,4,'The Beatles',1),
-- Pregunta 53
(53,1,'Beyoncé',0),(53,2,'Adele',1),(53,3,'Taylor Swift',0),(53,4,'Rihanna',0),
-- Pregunta 54
(54,1,'The Witcher',0),(54,2,'Stranger Things',0),(54,3,'Vikings',0),(54,4,'Game of Thrones',1),
-- Pregunta 55
(55,1,'Mark Ruffalo',0),(55,2,'Chris Hemsworth',0),(55,3,'Robert Downey Jr.',1),(55,4,'Chris Evans',0),
-- Pregunta 56
(56,1,'Christopher Nolan',1),(56,2,'James Cameron',0),(56,3,'Peter Jackson',0),(56,4,'Steven Spielberg',0),
-- Pregunta 57
(57,1,'Futurama',0),(57,2,'Rick and Morty',0),(57,3,'Los Simpson',1),(57,4,'Family Guy',0),
-- Pregunta 58
(58,1,'Led Zeppelin',0),(58,2,'The Doors',0),(58,3,'The Who',0),(58,4,'Jimi Hendrix',1),
-- Pregunta 59
(59,1,'Shawn Mendes',0),(59,2,'Adele',0),(59,3,'Ed Sheeran',1),(59,4,'Justin Bieber',0),
-- Pregunta 60
(60,1,'Titanic',0),(60,2,'El Padrino',0),(60,3,'Forrest Gump',1),(60,4,'La La Land',0);
GO

USE [PreguntadOrt];
GO

-- Preguntas Países y Banderas
INSERT INTO Preguntas (idCategoria, idDificultad, enunciado, foto)
VALUES
(4,1,'¿Cuál es la capital de Francia?',NULL),
(4,1,'¿Cuál es la capital de Japón?',NULL),
(4,1,'¿Cuál es la capital de Egipto?',NULL),
(4,1,'¿Cuál es la capital de Argentina?',NULL),
(4,2,'¿A qué país pertenece esta bandera?', 'francia.jpg'),
(4,2,'¿A qué país pertenece esta bandera?', 'japon.jpg'),
(4,2,'¿A qué país pertenece esta bandera?', 'egipto.jpg'),
(4,2,'¿A qué país pertenece esta bandera?', 'argentina.jpg'),
(4,3,'¿Cuál es la capital de Canadá?',NULL),
(4,3,'¿Cuál es la capital de Australia?',NULL),
(4,3,'¿A qué país pertenece esta bandera?', 'brasil.jpg'),
(4,3,'¿A qué país pertenece esta bandera?', 'alemania.jpg'),
(4,1,'¿Cuál es la capital de México?',NULL),
(4,1,'¿Cuál es la capital de España?',NULL),
(4,2,'¿A qué país pertenece esta bandera?', 'mexico.jpg'),
(4,2,'¿A qué país pertenece esta bandera?', 'españa.jpg'),
(4,3,'¿Cuál es la capital de Rusia?',NULL),
(4,3,'¿A qué país pertenece esta bandera?', 'rusia.jpg'),
(4,3,'¿Cuál es la capital de Italia?',NULL),
(4,3,'¿A qué país pertenece esta bandera?', 'italia.jpg');
GO
USE [PreguntadOrt];
GO

-- Respuestas Países y Banderas (opciones mezcladas)
INSERT INTO Respuestas (idPregunta, Opcion, contenido, correcta)
VALUES
-- Pregunta 61
(61,1,'Marsella',0),(61,2,'Burdeos',0),(61,3,'Lyon',0),(61,4,'París',1),
-- Pregunta 62
(62,1,'Osaka',0),(62,2,'Tokio',1),(62,3,'Kioto',0),(62,4,'Hiroshima',0),
-- Pregunta 63
(63,1,'Luxor',0),(63,2,'El Cairo',1),(63,3,'Giza',0),(63,4,'Alejandría',0),
-- Pregunta 64
(64,1,'Mendoza',0),(64,2,'Rosario',0),(64,3,'Buenos Aires',1),(64,4,'Córdoba',0),
-- Pregunta 65
(65,1,'España',0),(65,2,'Francia',1),(65,3,'Portugal',0),(65,4,'Italia',0),
-- Pregunta 66
(66,1,'Corea del Sur',0),(66,2,'Japón',1),(66,3,'Tailandia',0),(66,4,'China',0),
-- Pregunta 67
(67,1,'Marruecos',0),(67,2,'Egipto',1),(67,3,'Libia',0),(67,4,'Sudáfrica',0),
-- Pregunta 68
(68,1,'Perú',0),(68,2,'Uruguay',0),(68,3,'Chile',0),(68,4,'Argentina',1),
-- Pregunta 69
(69,1,'Vancouver',0),(69,2,'Ottawa',1),(69,3,'Montreal',0),(69,4,'Toronto',0),
-- Pregunta 70
(70,1,'Melbourne',0),(70,2,'Canberra',1),(70,3,'Perth',0),(70,4,'Sídney',0),
-- Pregunta 71
(71,1,'Perú',0),(71,2,'Colombia',0),(71,3,'Brasil',1),(71,4,'Argentina',0),
-- Pregunta 72
(72,1,'Suiza',0),(72,2,'Países Bajos',0),(72,3,'Alemania',1),(72,4,'Austria',0),
-- Pregunta 73
(73,1,'Guadalajara',0),(73,2,'Monterrey',0),(73,3,'Ciudad de México',1),(73,4,'Puebla',0),
-- Pregunta 74
(74,1,'Valencia',0),(74,2,'Madrid',1),(74,3,'Sevilla',0),(74,4,'Barcelona',0),
-- Pregunta 75
(75,1,'Argentina',0),(75,2,'México',1),(75,3,'Perú',0),(75,4,'España',0),
-- Pregunta 76
(76,1,'Francia',0),(76,2,'España',1),(76,3,'Portugal',0),(76,4,'Italia',0),
-- Pregunta 77
(77,1,'San Petersburgo',0),(77,2,'Novosibirsk',0),(77,3,'Moscú',1),(77,4,'Sochi',0),
-- Pregunta 78
(78,1,'Polonia',0),(78,2,'Ucrania',0),(78,3,'Rusia',1),(78,4,'Bielorrusia',0),
-- Pregunta 79
(79,1,'Venecia',0),(79,2,'Milán',0),(79,3,'Roma',1),(79,4,'Florencia',0),
-- Pregunta 80
(80,1,'Francia',0),(80,2,'Italia',1),(80,3,'España',0),(80,4,'Grecia',0);
GO

USE [PreguntadOrt];
GO

-- Preguntas ORT Almagro (15 preguntas)
INSERT INTO Preguntas (idCategoria, idDificultad, enunciado, foto)
VALUES
(5,1,'¿En qué año se creó ORT Argentina?',NULL),
(5,1,'¿Cuántos edificios tiene la sede Almagro de ORT?',NULL),
(5,1,'¿Quién es el mejor profe de programación?',NULL),
(5,3,'¿Cuántos alumnos llegó a tener 4iD en su primer año?',NULL),
(5,2,'¿Cuántos sancionados hubo gracias al famosísimo "caso Bernstein"?',NULL),
(5,2,'¿Cuántas salidas tuvimos este año como máximo?',NULL),
(5,1,'¿Qué profesor da clases en 4iD de física?',NULL),
(5,1,'¿Cuántas materias de informática hay en cuarto año?',NULL),
(5,2,'¿Cuántos grupos de EFSI hay en 4iD?',NULL),
(5,2,'¿Con qué empresa de Bariloche se va 4iD?',NULL),
(5,2,'¿Qué actividad extracurricular tuvo más participación este año?',NULL);
GO
USE [PreguntadOrt];
GO

-- Respuestas ORT Almagro (opciones mezcladas)
INSERT INTO Respuestas (idPregunta, Opcion, contenido, correcta)
VALUES
-- Pregunta 81
(81,1,'1945',0),(81,2,'1936',1),(81,3,'1962',0),(81,4,'1950',0),
-- Pregunta 82
(82,1,'3',0),(82,2,'4',1),(82,3,'6',0),(82,4,'5',0),
-- Pregunta 83
(83,1,'Iara',0),(83,2,'Binker',1),(83,3,'Stanca',0),(83,4,'Jana',0),
-- Pregunta 84
(84,1,'32',0),(84,2,'25',0),(84,3,'29',1),(84,4,'27',0),
-- Pregunta 85
(85,1,'2',0),(85,2,'3',1),(85,3,'5',0),(85,4,'4',0),
-- Pregunta 86
(86,1,'4',0),(86,2,'5',0),(86,3,'3',1),(86,4,'2',0),
-- Pregunta 87
(87,1,'Lucas Longo',0),(87,2,'Gabo',1),(87,3,'El Profe Rubio',0),(87,4,'Lula',0),
-- Pregunta 88
(88,1,'3',0),(88,2,'6',0),(88,3,'4',0),(88,4,'5',1),
-- Pregunta 89
(89,1,'5',0),(89,2,'6',1),(89,3,'4',0),(89,4,'7',0),
-- Pregunta 90
(90,1,'SkyHigh',0),(90,2,'Baxxter',0),(90,3,'Maxdream',1),(90,4,'BarilocheFun',0),
-- Pregunta 91
(91,1,'Fútbol',0),(91,2,'Taller de Robótica',1),(91,3,'Club de Teatro',0),(91,4,'Ensamble',0);
GO