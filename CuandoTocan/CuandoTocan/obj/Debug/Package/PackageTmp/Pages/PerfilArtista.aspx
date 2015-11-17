<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PerfilArtista.aspx.cs" Inherits="CuandoTocan.Pages.PerfilArtista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    <div id="divPerfilArtistas">
        <div id="divIzquierda">

            <div id="divImgArtista1" runat="server">
                <%--img class="img-responsive" alt="" src="../img/Galeria/system.png" /--%>
            </div>

            <div id="divBotones">
                <div class="col-md-3">
                    <button type="button" class="btn btn-success btn-lg">     Seguir    </button>
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
                            <div class="fb-share-button" data-href="http://localhost:63281/Pages/Evento.aspx" data-layout="button_count">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="divMenuArtistaVert">
                <div class="list-group">
                    <a href="#" class="list-group-item active">
                        <asp:Label ID="lblMenuArtista" runat="server"></asp:Label>
                    </a>
                    <a href="#" class="list-group-item">Biografía</a>
                    <a href="#" class="list-group-item">Discografía</a>
                    <a href="#" class="list-group-item">Eventos</a>
                    <%--a href="#" class="list-group-item">Música</a>
                    <a href="#" class="list-group-item">Videos</a>
                    <a href="#" class="list-group-item">Letras</a>
                    <a href="#" class="list-group-item">Noticias</a--%>
                </div>
            </div>
        </div>

        <div id="divDerecha">
            <div class="module">
                <h2 class="title">
                    <a href="#">Biografía de <asp:Label ID="lblBioArtista" runat="server"/></a>
                </h2>
                <div class="resume-body">
                    <%--<strong>Juan Luis Londoño Arias</strong>
                    mejor conocido en el medio artístico como
                    <strong>Maluma</strong>
                    nació en Medellín, Colombia, el 28 de enero de 1994. A Maluma siempre le gusto la música; aunque el fútbol también ha sido otra de sus grandes pasiones.
                    <h3> ¿Quién es Maluma? </h3>
                    Maluma cuenta con el apoyo total de su familia: Marlli, su mamá; Luis, su papá; y manuela, su hermana. Por eso, su nombre artístico, que lleva tatuado en el pie izquierdo, es un h ...--%>
                    <asp:Label ID="lblBiografiaArtista" runat="server" Text="Label"/>
                </div>
                <div class="text-icenter">
                    <a class="btn" style="font-size: 14px;" href="#">
                    [+] Seguir leyendo la biografía
                    <span class="hidden-sm-inline"> de Maluma </span>
                    </a>
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
                <div class="text-icenter">
                    <a class="btn" style="font-size: 14px;" href="#">
                    [+] Seguir leyendo la discografía
                    <span class="hidden-sm-inline"> de Maluma </span>
                    </a>
                </div>
            </div>

            <div class="module">
                <h2 class="title">
                    <a href="#">Eventos de <asp:Label ID="lblEveArtista" runat="server"/></a>
                </h2>
                <div class="resume-body">
                    <asp:Label ID="lbleventosArtista" runat="server" Text="Label"/>
                </div>
                <div class="text-icenter">
                    <a class="btn" style="font-size: 14px;" href="#">
                    [+] Seguir leyendo los Eventos
                    <span class="hidden-sm-inline"> de Maluma </span>
                    </a>
                </div>
            </div>

            <%--div class="module">
                <h2 class="title">
                    <a href="#">Música de System</a>
                </h2>
                <div class="resume-body">
                    <strong>Juan Luis Londoño Arias</strong>
                    mejor conocido en el medio artístico como
                    <strong>Maluma</strong>
                    nació en Medellín, Colombia, el 28 de enero de 1994. A Maluma siempre le gusto la música; aunque el fútbol también ha sido otra de sus grandes pasiones.
                    <h3> ¿Quién es Maluma? </h3>
                    Maluma cuenta con el apoyo total de su familia: Marlli, su mamá; Luis, su papá; y manuela, su hermana. Por eso, su nombre artístico, que lleva tatuado en el pie izquierdo, es un h ...
                </div>
                <div class="text-icenter">
                    <a class="btn" style="font-size: 14px;" href="#">
                    [+] Seguir leyendo la biografía
                    <span class="hidden-sm-inline"> de Maluma </span>
                    </a>
                </div>
            </div>

            <div class="module">
                <h2 class="title">
                    <a href="#">Videos de System</a>
                </h2>
                <div class="resume-body">
                    <strong>Juan Luis Londoño Arias</strong>
                    mejor conocido en el medio artístico como
                    <strong>Maluma</strong>
                    nació en Medellín, Colombia, el 28 de enero de 1994. A Maluma siempre le gusto la música; aunque el fútbol también ha sido otra de sus grandes pasiones.
                    <h3> ¿Quién es Maluma? </h3>
                    Maluma cuenta con el apoyo total de su familia: Marlli, su mamá; Luis, su papá; y manuela, su hermana. Por eso, su nombre artístico, que lleva tatuado en el pie izquierdo, es un h ...
                </div>
                <div class="text-icenter">
                    <a class="btn" style="font-size: 14px;" href="#">
                    [+] Seguir leyendo la biografía
                    <span class="hidden-sm-inline"> de Maluma </span>
                    </a>
                </div>
            </div>

            <div class="module">
                <h2 class="title">
                    <a href="#">Letras de System</a>
                </h2>
                <div class="resume-body">
                    <strong>Juan Luis Londoño Arias</strong>
                    mejor conocido en el medio artístico como
                    <strong>Maluma</strong>
                    nació en Medellín, Colombia, el 28 de enero de 1994. A Maluma siempre le gusto la música; aunque el fútbol también ha sido otra de sus grandes pasiones.
                    <h3> ¿Quién es Maluma? </h3>
                    Maluma cuenta con el apoyo total de su familia: Marlli, su mamá; Luis, su papá; y manuela, su hermana. Por eso, su nombre artístico, que lleva tatuado en el pie izquierdo, es un h ...
                </div>
                <div class="text-icenter">
                    <a class="btn" style="font-size: 14px;" href="#">
                    [+] Seguir leyendo la biografía
                    <span class="hidden-sm-inline"> de Maluma </span>
                    </a>
                </div>
            </div>

            <div class="module">
                <h2 class="title">
                    <a href="#">Discografía de System</a>
                </h2>
                <div class="resume-body">
                    <strong>Juan Luis Londoño Arias</strong>
                    mejor conocido en el medio artístico como
                    <strong>Maluma</strong>
                    nació en Medellín, Colombia, el 28 de enero de 1994. A Maluma siempre le gusto la música; aunque el fútbol también ha sido otra de sus grandes pasiones.
                    <h3> ¿Quién es Maluma? </h3>
                    Maluma cuenta con el apoyo total de su familia: Marlli, su mamá; Luis, su papá; y manuela, su hermana. Por eso, su nombre artístico, que lleva tatuado en el pie izquierdo, es un h ...
                </div>
                <div class="text-icenter">
                    <a class="btn" style="font-size: 14px;" href="#">
                    [+] Seguir leyendo la biografía
                    <span class="hidden-sm-inline"> de Maluma </span>
                    </a>
                </div>
            </div>

            <div class="module">
                <h2 class="title">
                    <a href="#">Conciertos de System</a>
                </h2>
                <div class="resume-body">
                    <strong>Juan Luis Londoño Arias</strong>
                    mejor conocido en el medio artístico como
                    <strong>Maluma</strong>
                    nació en Medellín, Colombia, el 28 de enero de 1994. A Maluma siempre le gusto la música; aunque el fútbol también ha sido otra de sus grandes pasiones.
                    <h3> ¿Quién es Maluma? </h3>
                    Maluma cuenta con el apoyo total de su familia: Marlli, su mamá; Luis, su papá; y manuela, su hermana. Por eso, su nombre artístico, que lleva tatuado en el pie izquierdo, es un h ...
                </div>
                <div class="text-icenter">
                    <a class="btn" style="font-size: 14px;" href="#">
                    [+] Seguir leyendo la biografía
                    <span class="hidden-sm-inline"> de Maluma </span>
                    </a>
                </div>
            </div>

            <div class="module">
                <h2 class="title">
                    <a href="#">Noticias de System</a>
                </h2>
                <div class="resume-body">
                    <strong>Juan Luis Londoño Arias</strong>
                    mejor conocido en el medio artístico como
                    <strong>Maluma</strong>
                    nació en Medellín, Colombia, el 28 de enero de 1994. A Maluma siempre le gusto la música; aunque el fútbol también ha sido otra de sus grandes pasiones.
                    <h3> ¿Quién es Maluma? </h3>
                    Maluma cuenta con el apoyo total de su familia: Marlli, su mamá; Luis, su papá; y manuela, su hermana. Por eso, su nombre artístico, que lleva tatuado en el pie izquierdo, es un h ...
                </div>
                <div class="text-icenter">
                    <a class="btn" style="font-size: 14px;" href="#">
                    [+] Seguir leyendo la biografía
                    <span class="hidden-sm-inline"> de Maluma </span>
                    </a>
                </div>
            </div--%>
        </div>
    </div>
</asp:Content>
