<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PerfilArtista.aspx.cs" Inherits="CuandoTocan.Pages.PerfilArtista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    <div id="divPerfilArtistas">
        <div id="divIzquierda">
            <div id="divImgArtista1" runat="server"></div>
            <div id="divBotones">
                <div id="divSeguir" runat="server">
                    <asp:Button ID="Button1" class="btn btn-success btn-lg" runat="server" Text="Seguir" onclick="btnSeguir_Art" />
                </div>
                <div id="divDejarSeguir" runat="server">
                    <asp:Button ID="Button2" class="btn btn-success btn-lg" runat="server" Text="Dejar de Seguir" onclick="btnDejarSeguir_Art" />
                </div>

                <div class="col-md-3">
                    <div class="row">
                        <%--Twitter--%>
                        <div class="col-md-5">
                            <a href="https://twitter.com/share" class="twitter-share-button" data-text="Echa un vistazo a este artista" data-lang="es" data-size="large" data-hashtags="CuandoTocan">Twittear</a>
                            <script type="text/javascript">
                                !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } } (document, 'script', 'twitter-wjs');
                            </script>
                        </div>
                        <%--Facebook--%>
                        <div class="col-md-5">
                            <div id="fb-root">
                            </div>
                            <script type="text/javascript">        
                                (function (d, s, id) {
                                    var js, fjs = d.getElementsByTagName(s)[0];
                                    if (d.getElementById(id)) return;
                                    js = d.createElement(s); js.id = id;
                                    js.src = "//connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v2.5";
                                    fjs.parentNode.insertBefore(js, fjs);
                                } (document, 'script', 'facebook-jssdk'));
                            </script>
                            <div class="fb-share-button" data-href="http://localhost:63281/Pages/PerfilArtista.aspx" data-layout="button_count">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="divMenuArtistaVert"> </div>
        </div>

        <div id="divDerecha">
            <div class="module">
                <h2 class="title">
                    <a href="#">Biografía de <asp:Label ID="lblBioArtista" runat="server"/></a>
                </h2>
                <div class="resume-body">
                    <asp:Label ID="lblBiografiaArtista" runat="server" Text="Label"/>
                </div>
            </div>

            <div class="module">
                <h2 class="title">
                    <a href="#">Discografía de <asp:Label ID="lblDisArtista" runat="server"/></a>
                </h2>
                <div class="resume-body">
                    <div id="divDiscArtista1" runat="server">
                        <%--asp:Label ID="lblDiscografiaArtista" runat="server" Text="Label"/--%>
                    </div>
                </div>
            </div>

            <div class="module">
                <h2 class="title">
                    <a href="#">Eventos de <asp:Label ID="lblEveArtista" runat="server"/></a>
                </h2>
                <div class="resume-body">
                    <div id="divEventArtista1" runat="server">
                        <%--asp:Label ID="lblDiscografiaArtista" runat="server" Text="Label"/--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
