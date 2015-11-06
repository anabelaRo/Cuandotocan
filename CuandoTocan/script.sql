USE [CuandoTocan]
GO
/****** Object:  Table [dbo].[artista]    Script Date: 06/11/2015 13:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artista](
	[id_artista] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[genero] [nvarchar](50) NULL,
	[descripcion] [nvarchar](500) NULL,
	[mbid] [nvarchar](20) NULL,
	[spotify_id] [nvarchar](20) NULL,
	[estado] [nvarchar](10) NULL,
	[pais_origen] [nvarchar](50) NULL,
	[fecha_alta] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
 CONSTRAINT [PK_artista] PRIMARY KEY CLUSTERED 
(
	[id_artista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[discografia]    Script Date: 06/11/2015 13:31:02 ******/
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
/****** Object:  Table [dbo].[enlace_artista]    Script Date: 06/11/2015 13:31:02 ******/
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
/****** Object:  Table [dbo].[evento]    Script Date: 06/11/2015 13:31:02 ******/
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
/****** Object:  Table [dbo].[locacion]    Script Date: 06/11/2015 13:31:02 ******/
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
/****** Object:  Table [dbo].[tipo_enlace]    Script Date: 06/11/2015 13:31:02 ******/
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
/****** Object:  Table [dbo].[tipo_evento]    Script Date: 06/11/2015 13:31:02 ******/
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
/****** Object:  Table [dbo].[tipo_usuario]    Script Date: 06/11/2015 13:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_usuario](
	[id_tipo_usuario] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_tipo_usuario_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_tipo_usuario_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_tipo_usuario] PRIMARY KEY CLUSTERED 
(
	[id_tipo_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ubicacion_evento]    Script Date: 06/11/2015 13:31:02 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 06/11/2015 13:31:02 ******/
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
	[fecha_alta] [datetime] NULL CONSTRAINT [DF_usuario_fecha_alta]  DEFAULT (getdate()),
	[fecha_modificacion] [datetime] NULL CONSTRAINT [DF_uusuario_fecha_modificacion]  DEFAULT (getdate()),
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario_artista]    Script Date: 06/11/2015 13:31:02 ******/
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
/****** Object:  Table [dbo].[usuario_evento]    Script Date: 06/11/2015 13:31:02 ******/
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

INSERT [dbo].[artista] ([id_artista], [nombre], [genero], [descripcion], [mbid], [spotify_id], [estado], [pais_origen], [fecha_alta], [fecha_modificacion]) VALUES (1, N'Divididos', N'Rock', N'Banda formada en 1988 en Hurlingham', NULL, NULL, N'Activa', N'Argentina', NULL, NULL)
INSERT [dbo].[artista] ([id_artista], [nombre], [genero], [descripcion], [mbid], [spotify_id], [estado], [pais_origen], [fecha_alta], [fecha_modificacion]) VALUES (2, N'Sumo', N'Rock', N'Banda oriunda Hurlingham liderada por el italiano Luca Prodan', NULL, NULL, N'Inactiva', N'Argentina', NULL, NULL)
INSERT [dbo].[artista] ([id_artista], [nombre], [genero], [descripcion], [mbid], [spotify_id], [estado], [pais_origen], [fecha_alta], [fecha_modificacion]) VALUES (3, N'Soda Stereo', N'Rock', N'Trío de rock argentino', NULL, NULL, N'Inactiva', N'Argentina', NULL, NULL)
INSERT [dbo].[artista] ([id_artista], [nombre], [genero], [descripcion], [mbid], [spotify_id], [estado], [pais_origen], [fecha_alta], [fecha_modificacion]) VALUES (4, N'No Te Va Gustar', N'Rock', N'Exponentes del rock uruguayo', NULL, NULL, N'Activa', N'Uruguay', NULL, NULL)
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
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (4, 5, 7, 1, N'NTVG en Vorterix', N'Lorem ipsum', CAST(N'2015-11-11 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:16:31.710' AS DateTime), CAST(N'2015-11-06 13:16:31.710' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (5, 4, 8, 1, N'XXX en Luna Park', N'Lorem ipsum', CAST(N'2015-11-20 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:17:01.840' AS DateTime), CAST(N'2015-11-06 13:17:01.840' AS DateTime))
INSERT [dbo].[evento] ([id_evento], [id_artista], [id_locacion], [tipo_evento], [titulo], [descripcion], [fecha_evento], [fecha_alta], [fecha_modificacion]) VALUES (6, 3, 9, 2, N'Presentación de "El tesoro de los inocentes', N'Lorem ipsum', CAST(N'2015-12-12 00:00:00.000' AS DateTime), CAST(N'2015-11-06 13:17:57.663' AS DateTime), CAST(N'2015-11-06 13:17:57.663' AS DateTime))
SET IDENTITY_INSERT [dbo].[evento] OFF
SET IDENTITY_INSERT [dbo].[locacion] ON 

INSERT [dbo].[locacion] ([id_locacion], [nombre], [ciudad], [direccion], [coordenada_x], [coordenada_y], [sitio_oficial], [capacidad], [fecha_alta], [fecha_modificacion]) VALUES (6, N'El Teatro Flores', N'CABA', N'Av. Rivadavia 7800', NULL, NULL, N'elteatroonline.com', 1800, CAST(N'2015-11-06 12:30:52.467' AS DateTime), CAST(N'2015-11-06 12:30:52.467' AS DateTime))
INSERT [dbo].[locacion] ([id_locacion], [nombre], [ciudad], [direccion], [coordenada_x], [coordenada_y], [sitio_oficial], [capacidad], [fecha_alta], [fecha_modificacion]) VALUES (7, N'Teatro Vorterix', N'CABA', N'Av. Federico Lacroze 999', NULL, NULL, N'elteatroonline.com', 1500, CAST(N'2015-11-06 12:33:43.567' AS DateTime), CAST(N'2015-11-06 12:33:43.567' AS DateTime))
INSERT [dbo].[locacion] ([id_locacion], [nombre], [ciudad], [direccion], [coordenada_x], [coordenada_y], [sitio_oficial], [capacidad], [fecha_alta], [fecha_modificacion]) VALUES (8, N'Estadio Luna Park', N'CABA', N'Lavalle y Bouchard', NULL, NULL, N'lunapark.com.ar', 7000, CAST(N'2015-11-06 12:34:46.130' AS DateTime), CAST(N'2015-11-06 12:34:46.130' AS DateTime))
INSERT [dbo].[locacion] ([id_locacion], [nombre], [ciudad], [direccion], [coordenada_x], [coordenada_y], [sitio_oficial], [capacidad], [fecha_alta], [fecha_modificacion]) VALUES (9, N'Quality Espacio', N'Córdoba', N'xxx 000', NULL, NULL, N'xyz.com', NULL, CAST(N'2015-11-06 12:35:14.863' AS DateTime), CAST(N'2015-11-06 12:35:14.863' AS DateTime))
INSERT [dbo].[locacion] ([id_locacion], [nombre], [ciudad], [direccion], [coordenada_x], [coordenada_y], [sitio_oficial], [capacidad], [fecha_alta], [fecha_modificacion]) VALUES (10, N'Estadio Atenas', N'La Plata', N'xxx 000', NULL, NULL, N'xyz.com', NULL, CAST(N'2015-11-06 12:35:38.647' AS DateTime), CAST(N'2015-11-06 12:35:38.647' AS DateTime))
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

INSERT [dbo].[usuario] ([id_usuario], [tipo_usuario], [nickname], [email], [password], [nombre_completo], [fecha_nacimiento], [biografia], [fecha_alta], [fecha_modificacion]) VALUES (1, 1, N'arossi', N'usr@gmail.com', N'asdfg', N'Anabela Rossi', NULL, N'Lorem ipsum', NULL, NULL)
INSERT [dbo].[usuario] ([id_usuario], [tipo_usuario], [nickname], [email], [password], [nombre_completo], [fecha_nacimiento], [biografia], [fecha_alta], [fecha_modificacion]) VALUES (2, 1, N'jsobrile', N'usr2@gmail.com', N'querty', N'Juan Sobrile', NULL, N'Lorem ipsum', NULL, NULL)
INSERT [dbo].[usuario] ([id_usuario], [tipo_usuario], [nickname], [email], [password], [nombre_completo], [fecha_nacimiento], [biografia], [fecha_alta], [fecha_modificacion]) VALUES (3, 1, N'ezambrano', N'usr3@gmail.com', N'password1', N'Emiliano Zambrano', NULL, N'Lorem ipsum', NULL, NULL)
SET IDENTITY_INSERT [dbo].[usuario] OFF
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (1, 2, CAST(N'2015-11-06 13:18:18.787' AS DateTime), CAST(N'2015-11-06 13:18:18.787' AS DateTime))
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (1, 3, CAST(N'2015-11-06 13:18:21.480' AS DateTime), CAST(N'2015-11-06 13:18:21.480' AS DateTime))
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (2, 1, CAST(N'2015-11-06 13:18:48.013' AS DateTime), CAST(N'2015-11-06 13:18:48.013' AS DateTime))
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (2, 2, CAST(N'2015-11-06 13:18:49.610' AS DateTime), CAST(N'2015-11-06 13:18:49.610' AS DateTime))
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (2, 4, CAST(N'2015-11-06 13:18:34.923' AS DateTime), CAST(N'2015-11-06 13:18:34.923' AS DateTime))
INSERT [dbo].[usuario_artista] ([id_usuario], [id_artista], [fecha_alta], [fecha_modificacion]) VALUES (3, 3, CAST(N'2015-11-06 13:18:43.873' AS DateTime), CAST(N'2015-11-06 13:18:43.873' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [fecha_alta], [fecha_modificacion]) VALUES (1, 3, N'S', N'Villa Devoto', NULL, CAST(N'2015-11-06 13:23:13.413' AS DateTime), CAST(N'2015-11-06 13:23:13.413' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [fecha_alta], [fecha_modificacion]) VALUES (1, 5, N'N', N'Microcentro', N'S', CAST(N'2015-11-06 13:23:52.467' AS DateTime), CAST(N'2015-11-06 13:23:52.467' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [fecha_alta], [fecha_modificacion]) VALUES (2, 3, N'N', NULL, NULL, CAST(N'2015-11-06 13:23:19.287' AS DateTime), CAST(N'2015-11-06 13:23:19.287' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [fecha_alta], [fecha_modificacion]) VALUES (3, 3, N'N', N'Morón', N'S', CAST(N'2015-11-06 13:24:31.507' AS DateTime), CAST(N'2015-11-06 13:24:31.507' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [fecha_alta], [fecha_modificacion]) VALUES (3, 4, N'N', N'Villa Devoto', N'S', CAST(N'2015-11-06 13:23:43.277' AS DateTime), CAST(N'2015-11-06 13:23:43.277' AS DateTime))
INSERT [dbo].[usuario_evento] ([id_usuario], [id_evento], [flag_ofrece_carpooling], [origen_carpooling], [flag_usa_carpooling], [fecha_alta], [fecha_modificacion]) VALUES (3, 6, N'N', NULL, N'N', CAST(N'2015-11-06 13:24:00.033' AS DateTime), CAST(N'2015-11-06 13:24:00.033' AS DateTime))
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
