USE [master]
GO
/****** Object:  Database [CuandoTocan]    Script Date: 06/11/2015 15:23:49 ******/
CREATE DATABASE [CuandoTocan] ON  PRIMARY 
( NAME = N'CuandoTocan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\CuandoTocan.mdf' , SIZE = 5072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CuandoTocan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\CuandoTocan_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CuandoTocan] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CuandoTocan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CuandoTocan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CuandoTocan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CuandoTocan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CuandoTocan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CuandoTocan] SET ARITHABORT OFF 
GO
ALTER DATABASE [CuandoTocan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CuandoTocan] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CuandoTocan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CuandoTocan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CuandoTocan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CuandoTocan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CuandoTocan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CuandoTocan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CuandoTocan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CuandoTocan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CuandoTocan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CuandoTocan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CuandoTocan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CuandoTocan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CuandoTocan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CuandoTocan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CuandoTocan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CuandoTocan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CuandoTocan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CuandoTocan] SET  MULTI_USER 
GO
ALTER DATABASE [CuandoTocan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CuandoTocan] SET DB_CHAINING OFF 
GO
USE [CuandoTocan]
GO
/****** Object:  Table [dbo].[artista]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artista](
	[id_artista] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[genero] [nvarchar](50) NULL,
	[descripcion] [nvarchar](4000) NULL,
	[mbid] [nvarchar](20) NULL,
	[spotify_id] [nvarchar](20) NULL,
	[estado] [nvarchar](10) NULL,
	[pais_origen] [nvarchar](50) NULL,
	[image_path] [nvarchar](100) NULL,
	[fecha_alta] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
 CONSTRAINT [PK_artista] PRIMARY KEY CLUSTERED 
(
	[id_artista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[discografia]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discografia](
	[id_disco] [int] IDENTITY(1,1) NOT NULL,
	[id_artista] [int] NOT NULL,
	[titulo] [nvarchar](100) NOT NULL,
	[fecha_publicacion] [date] NULL,
	[discografica] [nvarchar](50) NULL,
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_discografia_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_discografia_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_discografia] PRIMARY KEY CLUSTERED 
(
	[id_disco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[enlace_artista]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enlace_artista](
	[id_enlace_artista] [int] IDENTITY(1,1) NOT NULL,
	[id_artista] [int] NOT NULL,
	[tipo_enlace] [int] NOT NULL,
	[url_enlace] [nvarchar](50) NULL,
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_enlace_artista_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_enlace_artista_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_enlace_artista] PRIMARY KEY CLUSTERED 
(
	[id_enlace_artista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[evento]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evento](
	[id_evento] [int] IDENTITY(1,1) NOT NULL,
	[id_artista] [int] NOT NULL,
	[id_locacion] [int] NOT NULL,
	[tipo_evento] [int] NOT NULL,
	[titulo] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](500) NULL,
	[fecha_evento] [datetime] NOT NULL,
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_evento_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_evento_artista_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_evento] PRIMARY KEY CLUSTERED 
(
	[id_evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[locacion]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locacion](
	[id_locacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[ciudad] [nvarchar](50) NULL,
	[direccion] [nvarchar](100) NULL,
	[coordenada_x] [numeric](20, 10) NULL,
	[coordenada_y] [numeric](20, 10) NULL,
	[sitio_oficial] [nvarchar](50) NULL,
	[capacidad] [int] NULL,
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_locacion_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_locacion_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_locacion] PRIMARY KEY CLUSTERED 
(
	[id_locacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipo_enlace]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_enlace](
	[id_tipo_enlace] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
	[url_enlace] [nvarchar](100) NULL,
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_tipo_enlace_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_tipo_enlace_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_tipo_enlace] PRIMARY KEY CLUSTERED 
(
	[id_tipo_enlace] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipo_evento]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_evento](
	[id_tipo_evento] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](100) NULL,
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_tipo_evento_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_tipo_evento_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_tipo_evento] PRIMARY KEY CLUSTERED 
(
	[id_tipo_evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipo_usuario]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_usuario](
	[id_tipo_usuario] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
	[id_artista] [int] NULL,
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_tipo_usuario_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_tipo_usuario_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_tipo_usuario] PRIMARY KEY CLUSTERED 
(
	[id_tipo_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ubicacion_evento]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ubicacion_evento](
	[id_ubicacion_evento] [int] IDENTITY(1,1) NOT NULL,
	[id_evento] [int] NOT NULL,
	[descripcion] [nvarchar](50) NULL,
	[precio] [numeric](6, 2) NULL,
	[fecha_alta] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
 CONSTRAINT [PK_ubicacion_evento] PRIMARY KEY CLUSTERED 
(
	[id_ubicacion_evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[tipo_usuario] [int] NOT NULL,
	[nickname] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](20) NULL,
	[nombre_completo] [nvarchar](50) NULL,
	[fecha_nacimiento] [date] NULL,
	[biografia] [nvarchar](500) NULL,
	[id_artista] [int] NULL,
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_usuario_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_uusuario_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario_artista]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_artista](
	[id_usuario] [int] NOT NULL,
	[id_artista] [int] NOT NULL,
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_usuario_artista_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_usuario_artista_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_usuario_artista] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_artista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario_evento]    Script Date: 06/11/2015 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario_evento](
	[id_usuario] [int] NOT NULL,
	[id_evento] [int] NOT NULL,
	[flag_ofrece_carpooling] [char](1) NOT NULL,
	[origen_carpooling] [nvarchar](50) NULL,
	[flag_usa_carpooling] [char](1) NULL,
	[flag_notif_carpooling] [char](1) NULL,
	[flag_asist_fav] [char](1) NULL,
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_usuario_evento_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_usuario_evento_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_usuario_evento] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[artista] ON 

INSERT [dbo].[artista] ([id_artista], [nombre], [genero], [descripcion], [mbid], [spotify_id], [estado], [pais_origen], [image_path], [fecha_alta], [fecha_modificacion]) VALUES (1, N'Divididos', N'Rock', N'Divididos es una banda argentina de rock, fundada en 1988 por Ricardo Mollo y Diego Arnedo, ex-integrantes de Sumo, cuando ésta se disolvió por la muerte de su líder, Luca Prodan. En sus trabajos han incursionado en estilos musicales locales como el folklore. Ha sido galardonada en múltiples ocasiones tanto de forma grupal como individual. En el 2011 fue hacedora del Premio Gardel de Oro (la distinción más destacada de la música nacional) en reconocimiento a su exitosa trayectoria, premio que ha sido entregado solo catorce veces a distintos artistas tales como Charly García, León Gieco, Mercedes Sosa y Gustavo Cerati, entre otros.', NULL, NULL, N'Activa', N'Argentina', 'img/galeria/divididos.jpg', NULL, NULL)
INSERT [dbo].[artista] ([id_artista], [nombre], [genero], [descripcion], [mbid], [spotify_id], [estado], [pais_origen], [image_path], [fecha_alta], [fecha_modificacion]) VALUES (2, N'Sumo', N'Rock', N'Sumo fue una banda argentina de rock y reggae formada en el año 1981 en la ciudad de Mina Clavero, en la provincia de Córdoba y disuelta a principios de 1988. Con el pasar de los años, el éxito de su trayectoria hizo que se convierta en uno de los grupos más influyentes del rock argentino, de la talla de bandas como Los Abuelos de la Nada, Almendra, Pescado Rabioso, Manal, La Renga, Patricio Rey y sus Redonditos de Ricota, Charly García, Serú Girán, Soda Stereo, Sueter y Virus.', NULL, NULL, N'Inactiva', N'Argentina', 'img/galeria/sumo.jpg', NULL, NULL)
INSERT [dbo].[artista] ([id_artista], [nombre], [genero], [descripcion], [mbid], [spotify_id], [estado], [pais_origen], [image_path], [fecha_alta], [fecha_modificacion]) VALUES (3, N'Soda Stereo', N'Rock', N'Soda Stereo fue un trío de rock argentina, considerada como una de las más influyentes e importantes bandas iberoamericanas de todos los tiempos y una leyenda de la música latina. Ha llegado incluso a ser considerada como la mejor banda de rock en español de toda la historia. 	Fue formada en Buenos Aires en el año 1982 por Gustavo Cerati (voz, guitarra), Héctor «Zeta» Bosio (bajo) y Carlos Alberto Ficicchia «Charly Alberti» (batería). Ellos desempeñaron un papel muy importante en el desarrollo y la difusión del rock latino e iberoamericano. Fueron el primer grupo de rock latino en lograr éxito en toda América del Sur, Central, parte de América del Norte (principalmente tanto en México como la población latina de Estados Unidos) e incluso en España.[cita requerida] Ellos ayudaron a popularizar el rock en español, rock iberoamericano, y los géneros de rock latino a un público general. La banda estableció lo que sería el modelo para muchos otros grupos populares de habla hispana.[cita requerida] Soda Stereo ha encabezado las listas de todos los tiempos en gran parte de América Latina y en su nativa Argentina, donde se establecieron varios récords de ventas de discos y asistencias a conciertos.', NULL, NULL, N'Inactiva', N'Argentina', 'img/galeria/sodaStereo.jpg', NULL, NULL)
INSERT [dbo].[artista] ([id_artista], [nombre], [genero], [descripcion], [mbid], [spotify_id], [estado], [pais_origen], [image_path], [fecha_alta], [fecha_modificacion]) VALUES (4, N'No Te Va Gustar', N'Rock', N'No Te Va Gustar, popularmente abreviada como NTVG, es una banda uruguaya de rock formada el 25 de junio de 1994 en Montevideo. Está integrada por Emiliano Brancciari (voz y guitarra), Guzmán Silveira (bajo y coros), Diego Bartaburu (batería), Gonzalo Castex (percusión), Martín Gil (trompeta y coros), Denis Ramos (trombón), Mauricio Ortiz (saxo barítono y tenor), Pablo Coniberti (guitarra) y Francisco Nasser (teclados).', NULL, NULL, N'Activa', N'Uruguay', 'img/galeria/ntvg.jpg', NULL, NULL)



SET IDENTITY_INSERT [dbo].[artista] OFF
SET IDENTITY_INSERT [dbo].[discografia] ON 

INSERT [dbo].[discografia] ([id_disco], [id_artista], [titulo], [fecha_publicacion], [discografica], [fecha_alta], [fecha_modificacion]) VALUES (1, 1, N'Narigón del siglo', CAST(N'2001-01-01' AS Date), N'Sony Music', NULL, NULL)
INSERT [dbo].[discografia] ([id_disco], [id_artista], [titulo], [fecha_publicacion], [discografica], [fecha_alta], [fecha_modificacion]) VALUES (2, 1, N'Amapola del 66', CAST(N'2010-06-01' AS Date), N'DBN', NULL, NULL)
INSERT [dbo].[discografia] ([id_disco], [id_artista], [titulo], [fecha_publicacion], [discografica], [fecha_alta], [fecha_modificacion]) VALUES (3, 2, N'After Chabón', CAST(N'1987-01-01' AS Date), N'EMI', NULL, NULL)
INSERT [dbo].[discografia] ([id_disco], [id_artista], [titulo], [fecha_publicacion], [discografica], [fecha_alta], [fecha_modificacion]) VALUES (4, 3, N'Canción Animal', CAST(N'1993-01-01' AS Date), N'Soy BMG', NULL, NULL)
SET IDENTITY_INSERT [dbo].[discografia] OFF
SET IDENTITY_INSERT [dbo].[enlace_artista] ON 

INSERT [dbo].[enlace_artista] ([id_enlace_artista], [id_artista], [tipo_enlace], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (1, 1, 1, N'dvd2oficial', NULL, NULL)
INSERT [dbo].[enlace_artista] ([id_enlace_artista], [id_artista], [tipo_enlace], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (2, 1, 2, N'divididos', NULL, NULL)
INSERT [dbo].[enlace_artista] ([id_enlace_artista], [id_artista], [tipo_enlace], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (3, 2, 1, N'sumooficial', NULL, NULL)
INSERT [dbo].[enlace_artista] ([id_enlace_artista], [id_artista], [tipo_enlace], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (4, 2, 4, N'sumomusic', NULL, NULL)
INSERT [dbo].[enlace_artista] ([id_enlace_artista], [id_artista], [tipo_enlace], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (5, 3, 5, N'sodastereo_ok', NULL, NULL)
INSERT [dbo].[enlace_artista] ([id_enlace_artista], [id_artista], [tipo_enlace], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (6, 3, 1, N'soda.stereo', NULL, NULL)
INSERT [dbo].[enlace_artista] ([id_enlace_artista], [id_artista], [tipo_enlace], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (7, 3, 2, N'soda.stereo', NULL, NULL)
SET IDENTITY_INSERT [dbo].[enlace_artista] OFF
SET IDENTITY_INSERT [dbo].[evento] ON 

INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (3, 1, 6, 1, N'Divididos en Flores', N'Lorem ipsum', CAST(N'2015-12-11 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:16:03.060' AS DateTime), CAST(N'2015-11-06 13:16:03.060' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (4, 5, 7, 1, N'NTVG en Vorterix', N'Lorem ipsum', CAST(N'2016-12-11 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:16:31.710' AS DateTime), CAST(N'2015-11-06 13:16:31.710' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (5, 4, 8, 1, N'XXX en Luna Park', N'Lorem ipsum', CAST(N'2015-12-12 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:17:01.840' AS DateTime), CAST(N'2015-11-06 13:17:01.840' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (6, 3, 9, 2, N'Presentación de "El tesoro de los inocentes', N'Lorem ipsum', CAST(N'2015-12-12 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:17:57.663' AS DateTime), CAST(N'2015-11-06 13:17:57.663' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (7, 1, 8, 1, N'Divididos en el Luna', N'Lorem ipsum', CAST(N'2015-12-27 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:16:03.060' AS DateTime), CAST(N'2015-11-06 13:16:03.060' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (8, 5, 6, 1, N'NTVG en el Tearo!', N'Lorem ipsum', CAST(N'2016-12-29 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:16:31.710' AS DateTime), CAST(N'2015-11-06 13:16:31.710' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (9, 4, 8, 1, N'XXX en Luna Park', N'Lorem ipsum', CAST(N'2015-12-31 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:17:01.840' AS DateTime), CAST(N'2015-11-06 13:17:01.840' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (10, 3, 9, 2, N'Presentación de "El tesoro de los inocentes', N'Lorem ipsum', CAST(N'2015-12-12 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:17:57.663' AS DateTime), CAST(N'2015-11-06 13:17:57.663' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (11, 1, 7, 1, N'Divididos en el Votretix', N'Lorem ipsum', CAST(N'2016-02-27 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:16:03.060' AS DateTime), CAST(N'2015-11-06 13:16:03.060' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (12, 5, 6, 1, N'NTVG en el Tearo!', N'Lorem ipsum', CAST(N'2016-03-29 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:16:31.710' AS DateTime), CAST(N'2015-11-06 13:16:31.710' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (13, 4, 8, 1, N'XXX en Luna Park', N'Lorem ipsum', CAST(N'2016-04-20 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:17:01.840' AS DateTime), CAST(N'2015-11-06 13:17:01.840' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (14, 3, 9, 1, N'Presentación de "El tesoro de los inocentes', N'Lorem ipsum', CAST(N'2015-12-31 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:17:57.663' AS DateTime), CAST(N'2015-11-06 13:17:57.663' AS DateTime))

SET IDENTITY_INSERT [dbo].[evento] OFF
SET IDENTITY_INSERT [dbo].[locacion] ON 

INSERT [dbo].[locacion] ([id_locacion], [nombre], [ciudad], [direccion], [coordenada_x], [coordenada_y], [sitio_oficial], [capacidad], [fecha_alta], [fecha_modificacion]) VALUES (6, N'El Teatro Flores', N'CABA', N'Av. Rivadavia 7800', -34.632096, -58.474983, N'elteatroonline.com', 1800, CAST(N'2015-11-06 12:30:52.467' AS DateTime), CAST(N'2015-11-06 12:30:52.467' AS DateTime))
INSERT [dbo].[locacion] ([id_locacion], [nombre], [ciudad], [direccion], [coordenada_x], [coordenada_y], [sitio_oficial], [capacidad], [fecha_alta], [fecha_modificacion]) VALUES (7, N'Teatro Vorterix', N'CABA', N'Av. Federico Lacroze 999', -34.579513, -58.450685, N'elteatroonline.com', 1500, CAST(N'2015-11-06 12:33:43.567' AS DateTime), CAST(N'2015-11-06 12:33:43.567' AS DateTime))
INSERT [dbo].[locacion] ([id_locacion], [nombre], [ciudad], [direccion], [coordenada_x], [coordenada_y], [sitio_oficial], [capacidad], [fecha_alta], [fecha_modificacion]) VALUES (8, N'Estadio Luna Park', N'CABA', N'Lavalle y Bouchard', -34.602295, -58.368721, N'lunapark.com.ar', 7000, CAST(N'2015-11-06 12:34:46.130' AS DateTime), CAST(N'2015-11-06 12:34:46.130' AS DateTime))
INSERT [dbo].[locacion] ([id_locacion], [nombre], [ciudad], [direccion], [coordenada_x], [coordenada_y], [sitio_oficial], [capacidad], [fecha_alta], [fecha_modificacion]) VALUES (9, N'Quality Espacio', N'Córdoba', N'xxx 000', -31.444422, -64.195713, N'xyz.com', NULL, CAST(N'2015-11-06 12:35:14.863' AS DateTime), CAST(N'2015-11-06 12:35:14.863' AS DateTime))
INSERT [dbo].[locacion] ([id_locacion], [nombre], [ciudad], [direccion], [coordenada_x], [coordenada_y], [sitio_oficial], [capacidad], [fecha_alta], [fecha_modificacion]) VALUES (10, N'Estadio Atenas', N'La Plata', N'xxx 000', -34.925553, -57.949851, N'xyz.com', NULL, CAST(N'2015-11-06 12:35:38.647' AS DateTime), CAST(N'2015-11-06 12:35:38.647' AS DateTime))
SET IDENTITY_INSERT [dbo].[locacion] OFF
SET IDENTITY_INSERT [dbo].[tipo_enlace] ON 
 
INSERT [dbo].[tipo_enlace] ([id_tipo_enlace], [descripcion], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (1, N'Facebook', NULL, CAST(N'2015-11-06 12:03:27.007' AS DateTime), CAST(N'2015-11-06 12:03:27.007' AS DateTime))
INSERT [dbo].[tipo_enlace] ([id_tipo_enlace], [descripcion], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (2, N'Twitter', NULL, CAST(N'2015-11-06 12:04:02.003' AS DateTime), CAST(N'2015-11-06 12:04:02.003' AS DateTime))
INSERT [dbo].[tipo_enlace] ([id_tipo_enlace], [descripcion], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (3, N'YouTube', NULL, CAST(N'2015-11-06 12:04:05.303' AS DateTime), CAST(N'2015-11-06 12:04:05.303' AS DateTime))
INSERT [dbo].[tipo_enlace] ([id_tipo_enlace], [descripcion], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (4, N'Bandcamp', NULL, CAST(N'2015-11-06 12:04:10.480' AS DateTime), CAST(N'2015-11-06 12:04:10.480' AS DateTime))
INSERT [dbo].[tipo_enlace] ([id_tipo_enlace], [descripcion], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (5, N'Spotify', NULL, CAST(N'2015-11-06 12:04:13.927' AS DateTime), CAST(N'2015-11-06 12:04:13.927' AS DateTime))
INSERT [dbo].[tipo_enlace] ([id_tipo_enlace], [descripcion], [url_enlace], [fecha_alta], [fecha_modificacion]) VALUES (6, N'Last.fm', NULL, CAST(N'2015-11-06 12:04:22.103' AS DateTime), CAST(N'2015-11-06 12:04:22.103' AS DateTime))
SET IDENTITY_INSERT [dbo].[tipo_enlace] OFF
SET IDENTITY_INSERT [dbo].[tipo_evento] ON 

INSERT [dbo].[tipo_evento] ([id_tipo_evento], [descripcion], [fecha_alta], [fecha_modificacion]) VALUES (1, N'Recital', CAST(N'2015-11-06 11:30:59.693' AS DateTime), CAST(N'2015-11-06 11:30:59.693' AS DateTime))
INSERT [dbo].[tipo_evento] ([id_tipo_evento], [descripcion], [fecha_alta], [fecha_modificacion]) VALUES (2, N'Presentación de disco', CAST(N'2015-11-06 11:32:16.500' AS DateTime), CAST(N'2015-11-06 11:32:16.500' AS DateTime))
INSERT [dbo].[tipo_evento] ([id_tipo_evento], [descripcion], [fecha_alta], [fecha_modificacion]) VALUES (3, N'Proyección de recital en vivo', CAST(N'2015-11-06 11:32:41.007' AS DateTime), CAST(N'2015-11-06 11:32:41.007' AS DateTime))
INSERT [dbo].[tipo_evento] ([id_tipo_evento], [descripcion], [fecha_alta], [fecha_modificacion]) VALUES (4, N'Firma de autógrafos', CAST(N'2015-11-06 11:32:46.157' AS DateTime), CAST(N'2015-11-06 11:32:46.157' AS DateTime))
SET IDENTITY_INSERT [dbo].[tipo_evento] OFF
SET IDENTITY_INSERT [dbo].[tipo_usuario] ON 

INSERT [dbo].[tipo_usuario] ([id_tipo_usuario], [descripcion], [fecha_alta], [fecha_modificacion]) VALUES (1, N'Usuario estandar', CAST(N'2015-11-06 11:30:39.707' AS DateTime), CAST(N'2015-11-06 11:30:39.707' AS DateTime))
INSERT [dbo].[tipo_usuario] ([id_tipo_usuario], [descripcion], [fecha_alta], [fecha_modificacion]) VALUES (2, N'Artista', CAST(N'2015-11-06 11:30:43.117' AS DateTime), CAST(N'2015-11-06 11:30:43.117' AS DateTime))
SET IDENTITY_INSERT [dbo].[tipo_usuario] OFF
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id_usuario], [tipo_usuario], [nickname], [email], [password], [nombre_completo], [fecha_nacimiento], [biografia], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (1, 1, N'arossi', N'usr@gmail.com', N'asdfg', N'Anabela Rossi', NULL, N'Lorem ipsum', NULL, NULL, NULL)
INSERT [dbo].[usuario] ([id_usuario], [tipo_usuario], [nickname], [email], [password], [nombre_completo], [fecha_nacimiento], [biografia], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (2, 1, N'jsobrile', N'usr2@gmail.com', N'querty', N'Juan Sobrile', NULL, N'Lorem ipsum', NULL, NULL, NULL)
INSERT [dbo].[usuario] ([id_usuario], [tipo_usuario], [nickname], [email], [password], [nombre_completo], [fecha_nacimiento], [biografia], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (3, 1, N'ezambrano', N'usr3@gmail.com', N'password1', N'Emiliano Zambrano', NULL, N'Lorem ipsum', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[usuario] OFF
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (1, 2, CAST(N'2015-11-06 13:18:18.787' AS DateTime), CAST(N'2015-11-06 13:18:18.787' AS DateTime))
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (1, 3, CAST(N'2015-11-06 13:18:21.480' AS DateTime), CAST(N'2015-11-06 13:18:21.480' AS DateTime))
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (2, 1, CAST(N'2015-11-06 13:18:48.013' AS DateTime), CAST(N'2015-11-06 13:18:48.013' AS DateTime))
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (2, 2, CAST(N'2015-11-06 13:18:49.610' AS DateTime), CAST(N'2015-11-06 13:18:49.610' AS DateTime))
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (2, 4, CAST(N'2015-11-06 13:18:34.923' AS DateTime), CAST(N'2015-11-06 13:18:34.923' AS DateTime))
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (3, 3, CAST(N'2015-11-06 13:18:43.873' AS DateTime), CAST(N'2015-11-06 13:18:43.873' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [flag_notif_carpooling], [flag_asist_fav], [fecha_alta], [fecha_modificacion]) VALUES (1, 3, N'S', N'Villa Devoto', NULL, NULL, N'A', CAST(N'2015-11-06 13:23:13.413' AS DateTime), CAST(N'2015-11-06 13:23:13.413' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [flag_notif_carpooling], [flag_asist_fav], [fecha_alta], [fecha_modificacion]) VALUES (1, 5, N'N', N'Microcentro', N'S', N'S', N'A', CAST(N'2015-11-06 13:23:52.467' AS DateTime), CAST(N'2015-11-06 13:23:52.467' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [flag_notif_carpooling], [flag_asist_fav], [fecha_alta], [fecha_modificacion]) VALUES (2, 3, N'N', NULL, NULL, NULL, NULL, CAST(N'2015-11-06 13:23:19.287' AS DateTime), CAST(N'2015-11-06 13:23:19.287' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [flag_notif_carpooling], [flag_asist_fav], [fecha_alta], [fecha_modificacion]) VALUES (3, 3, N'N', N'Morón', N'S', N'S', N'A', CAST(N'2015-11-06 13:24:31.507' AS DateTime), CAST(N'2015-11-06 13:24:31.507' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [flag_notif_carpooling], [flag_asist_fav], [fecha_alta], [fecha_modificacion]) VALUES (3, 4, N'N', N'Villa Devoto', N'S', N'S', N'A', CAST(N'2015-11-06 13:23:43.277' AS DateTime), CAST(N'2015-11-06 13:23:43.277' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [flag_notif_carpooling], [flag_asist_fav], [fecha_alta], [fecha_modificacion]) VALUES (3, 6, N'N', NULL, N'N', N'N', N'F', CAST(N'2015-11-06 13:24:00.033' AS DateTime), CAST(N'2015-11-06 13:24:00.033' AS DateTime))
/****** Object:  Index [IX_tipo_usuario]    Script Date: 06/11/2015 15:23:49 ******/
CREATE NONCLUSTERED INDEX [IX_tipo_usuario] ON [dbo].[tipo_usuario]
(
	[id_tipo_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ubicacion_evento] ADD  CONSTRAINT [DF_ubicacion_evento_fecha_alta]  DEFAULT (getdate()) FOR [fecha_alta]
GO
ALTER TABLE [dbo].[ubicacion_evento] ADD  CONSTRAINT [DF_ubicacion_evento_fecha_modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[discografia]  WITH CHECK ADD  CONSTRAINT [FK_discografia_artista] FOREIGN KEY([id_artista])
REFERENCES [dbo].[artista] ([id_artista])
GO
ALTER TABLE [dbo].[discografia] CHECK CONSTRAINT [FK_discografia_artista]
GO
ALTER TABLE [dbo].[enlace_artista]  WITH CHECK ADD  CONSTRAINT [FK_enlace_artista_artista] FOREIGN KEY([id_artista])
REFERENCES [dbo].[artista] ([id_artista])
GO
ALTER TABLE [dbo].[enlace_artista] CHECK CONSTRAINT [FK_enlace_artista_artista]
GO
ALTER TABLE [dbo].[enlace_artista]  WITH CHECK ADD  CONSTRAINT [FK_enlace_artista_tipo_enlace] FOREIGN KEY([tipo_enlace])
REFERENCES [dbo].[tipo_enlace] ([id_tipo_enlace])
GO
ALTER TABLE [dbo].[enlace_artista] CHECK CONSTRAINT [FK_enlace_artista_tipo_enlace]
GO
ALTER TABLE [dbo].[evento]  WITH CHECK ADD  CONSTRAINT [FK_evento_locacion] FOREIGN KEY([id_locacion])
REFERENCES [dbo].[locacion] ([id_locacion])
GO
ALTER TABLE [dbo].[evento] CHECK CONSTRAINT [FK_evento_locacion]
GO
ALTER TABLE [dbo].[evento]  WITH CHECK ADD  CONSTRAINT [FK_evento_tipo_evento] FOREIGN KEY([tipo_evento])
REFERENCES [dbo].[tipo_evento] ([id_tipo_evento])
GO
ALTER TABLE [dbo].[evento] CHECK CONSTRAINT [FK_evento_tipo_evento]
GO
ALTER TABLE [dbo].[ubicacion_evento]  WITH CHECK ADD  CONSTRAINT [FK_ubicacion_evento_evento] FOREIGN KEY([id_evento])
REFERENCES [dbo].[locacion] ([id_locacion])
GO
ALTER TABLE [dbo].[ubicacion_evento] CHECK CONSTRAINT [FK_ubicacion_evento_evento]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_tipo_usuario] FOREIGN KEY([tipo_usuario])
REFERENCES [dbo].[tipo_usuario] ([id_tipo_usuario])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_tipo_usuario]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_artista] FOREIGN KEY([id_artista])
REFERENCES [dbo].[artista] ([id_artista])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_artista]
GO
ALTER TABLE [dbo].[usuario_artista]  WITH CHECK ADD  CONSTRAINT [FK_usuario_artista_artista] FOREIGN KEY([id_artista])
REFERENCES [dbo].[artista] ([id_artista])
GO
ALTER TABLE [dbo].[usuario_artista] CHECK CONSTRAINT [FK_usuario_artista_artista]
GO
ALTER TABLE [dbo].[usuario_artista]  WITH CHECK ADD  CONSTRAINT [FK_usuario_artista_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[usuario_artista] CHECK CONSTRAINT [FK_usuario_artista_usuario]
GO
ALTER TABLE [dbo].[usuario_evento]  WITH CHECK ADD  CONSTRAINT [FK_usuario_evento_evento] FOREIGN KEY([id_evento])
REFERENCES [dbo].[evento] ([id_evento])
GO
ALTER TABLE [dbo].[usuario_evento] CHECK CONSTRAINT [FK_usuario_evento_evento]
GO
ALTER TABLE [dbo].[usuario_evento]  WITH CHECK ADD  CONSTRAINT [FK_usuario_evento_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[usuario_evento] CHECK CONSTRAINT [FK_usuario_evento_usuario]
GO
USE [master]
GO
ALTER DATABASE [CuandoTocan] SET  READ_WRITE 
GO
USE [CuandoTocan]
GO
/****** Object:  View [dbo].[EventosProximos]   Script Date: 11/18/2015 12:24:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[EventosProximos]
AS
select top 6 id_evento, image_path, e.titulo, e.fecha_evento, l.nombre 
from evento e, artista a, locacion l
where e.id_artista = a.id_artista
and e.id_locacion = l.id_locacion
and fecha_evento >= CURRENT_TIMESTAMP
and tipo_evento = 1
order by fecha_evento asc

