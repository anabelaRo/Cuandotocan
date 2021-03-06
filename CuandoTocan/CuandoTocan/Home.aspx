﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CuandoTocan.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">

    <div id="divSlider">
        <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 1024px; height: 320px; overflow: hidden; visibility: hidden;">
	        <!-- Loading Screen -->
	        <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
		        <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
		        <div style="position:absolute;display:block;background:url('img/Slider/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
	        </div>
	        <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 1024px; height: 320px; overflow: hidden;">
		        <div style="display: none;">
			       <a href="Pages/Evento.aspx?id_evento=16">  <img data-u="image" src="img/Slider/abelpintos.jpg" /></a> 
		        </div>
		        <div style="display: none;">
			       <a href="Pages/Evento.aspx?id_evento=19"><img data-u="image" src="img/Slider/simply.jpg" /></a> 
		        </div>
		        <div style="display: none;">
			        <a href="Pages/Evento.aspx?id_evento=15"> <img data-u="image" src="img/Slider/Artista_Noel_Gallaghers.jpg" /></a> 
		        </div>
		        <div style="display: none;">
			        <a href="Pages/Evento.aspx?id_evento=20"> <img data-u="image" src="img/Slider/MAROON5.png" /></a> 
		        </div>
	        </div>
	        <!-- Bullet Navigator -->
	        <div data-u="navigator" class="jssorb05" style="bottom:16px;right:6px;" data-autocenter="1">
		        <!-- bullet navigator item prototype -->
		        <div data-u="prototype" style="width:16px;height:16px;"></div>
	        </div>
	        <!-- Arrow Navigator -->
	        <span data-u="arrowleft" class="jssora12l" style="top:123px;left:0px;width:30px;height:46px;" data-autocenter="2"></span>
	        <span data-u="arrowright" class="jssora12r" style="top:123px;right:0px;width:30px;height:46px;" data-autocenter="2"></span>
        </div>
        <script>
            jssor_1_slider_init();
        </script>
    </div>

    <div id="divCentro">
        <div id="divCuerpoTopIzq">
            <asp:Label ID="lblProxEventos" runat="server" Text="Próximos eventos:"/>
        </div>
        <div id="divCuerpoTopDer">
            <asp:Label ID="lblArtDestacados" runat="server" Text="Artistas destacados:"/>
        </div>

        <div id="proximos" runat="server">
            <%--div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="Pages/Evento.aspx">
                    <img class="img-responsive" src="img/Galeria/system.png" alt=""/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="Pages/Evento.aspx">
                    <img class="img-responsive" src="img/Galeria/eruca.png" alt=""/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="Pages/Evento.aspx">
                    <img class="img-responsive" src="img/Galeria/kevin.png" alt=""/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="Pages/Evento.aspx">
                    <img class="img-responsive" src="img/Galeria/muse.png" alt=""/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="Pages/Evento.aspx">
                    <img class="img-responsive" src="img/Galeria/katy.png" alt=""/>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="Pages/Evento.aspx">
                    <img class="img-responsive" src="img/Galeria/slipknot.png" alt=""/>
                </a>
            </div--%>
    <%--        <div class="divImagen">
                <a class="imgA" href="Pages/Evento.aspx">
                    <img class="imgGallery" src="img/Galeria/system.png" alt=""/>
                </a>
            </div>
            <div class="divImagen">
                <a class="imgA" href="Pages/Evento.aspx">
                    <img class="imgGallery" src="img/Galeria/eruca.png" alt=""/>
                </a>
            </div>
            <div class="divImagen">
                <a class="imgA" href="Pages/Evento.aspx">
                    <img class="imgGallery" src="img/Galeria/kevin.png" alt=""/>
                </a>
            </div>
            <div class="divImagen">
                <a class="imgA" href="Pages/Evento.aspx">
                    <img class="imgGallery" src="img/Galeria/muse.png" alt=""/>
                </a>
            </div>
            <div class="divImagen">
                <a class="imgA" href="Pages/Evento.aspx">
                    <img class="imgGallery" src="img/Galeria/katy.png" alt=""/>
                </a>
            </div>
            <div class="divImagen">
                <a class="imgA" href="Pages/Evento.aspx">
                    <img class="imgGallery" src="img/Galeria/slipknot.png" alt=""/>
                </a>
            </div>--%>
        </div>

        <div id="divDestacados1" runat="server">
            <%--div id="divDescatados">
                <div class="row">
                    <div class="col-md-7">
                        <a href="Pages/PerfilArtista.aspx">
                            <img class="img-responsive" src="img/Destacados/artic.png" alt=""/>
                        </a>
                    </div>
                    <div class="col-md-5">
                        <a class="h4" href="Pages/PerfilArtista.aspx">1. Arctic Monkeys</a>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-7">
                        <a href="Pages/PerfilArtista.aspx">
                            <img class="img-responsive" src="img/Destacados/codplay.png" alt=""/>
                        </a>
                    </div>
                    <div class="col-md-5">
                        <a class="h4" href="Pages/PerfilArtista.aspx">2. Coldplay</a>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-7">
                        <a href="Pages/PerfilArtista.aspx">
                            <img class="img-responsive" src="img/Destacados/david.png" alt=""/>
                        </a>
                    </div>
                    <div class="col-md-5">
                        <a class="h4" href="Pages/PerfilArtista.aspx">3. David Guetta</a>
                    </div>
                </div>
                <hr/>
                <div class="row">

                    <div class="col-md-7">
                        <a href="Pages/PerfilArtista.aspx">
                            <img class="img-responsive" src="img/Destacados/ed.png" alt=""/>
                        </a>
                    </div>
                    <div class="col-md-5">
                        <a class="h4" href="Pages/PerfilArtista.aspx">4. Ed Sheeran</a>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-7">
                        <a href="Pages/PerfilArtista.aspx">
                            <img class="img-responsive" src="img/Destacados/maroon.png" alt=""/>
                        </a>
                    </div>
                    <div class="col-md-5">
                        <a class="h4" href="Pages/PerfilArtista.aspx">5. Maroon 5</a>
                    </div>
                </div>
            </div--%>
        </div>
    </div>

</asp:Content>
