<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="UsuarioPpal.aspx.cs" Inherits="CuandoTocan.Pages.UsuarioPpal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    <div id="divUsuarioBanda">
        <div id="divIzquierda">
            <div id="divImgUsuario1" runat="server"></div>
            <%-- <div id="divMenuArtistaVert">
                <div class="list-group">
                    <a class="list-group-item" href="#" onclick="mostrarActualizarDatos();">Biografía</a>
                    <a class="list-group-item" href="#">Discografía</a>
                    <a class="list-group-item" href="#">Eventos</a>
                </div>
            </div> --%>
            <div id="divMenuUsuarioVert" runat="server">
                
            </div>
        </div>
        <div id="divDerecha">
            <%----------------------------------------------------------------------------------------------------------------%>
            <div id="divActualizarDatos" runat="server">
                <div class="module">
                    <h2 class="title">
                        <a href="#">Datos del usuario<asp:Label ID="lblBioUsuario" runat="server"/></a>
                    </h2>
                    <div class="resume-body">
                        <div id="divUsuarioBandActualizar">    
                            <div class="row">
                                <div class="col-sm-2">
                                    <label for="imputUser">Usuario</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="regUser" runat="server"  disabled="disabled" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-sm-2">
                                    <label for="imputUser">E-Mail</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="regMail" runat="server"  disabled="disabled" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">                             
                                <div class="col-sm-2">
                                    <label for="lblNombre">Nombre</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txtNombreA" type="text" runat="server" disabled="disabled" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-sm-2">
                                    <label for="lblgenero">Fecha de nacimiento</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txtFechaNac" type="text" runat="server" disabled="disabled" class="form-control"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <label for="lvlDescripA">Biografía</label>
                                </div>
                                <div class="col-sm-10">
                                    <asp:TextBox id="txtBiografia" TextMode="multiline" Columns="160" Rows="3" runat="server" disabled="disabled" class="form-control" />
                                </div>
                            </div>
                        </div> 
                    </div>
                    <div class="text-icenter">
<%--                        <asp:Button ID="btnActDatosUser" runat="server" Text="Actualizar" class="btn btn-default" onclick="btnActDatosUser_Click"/>--%>
                    </div>
                </div>
            </div>

            <%----------------------------------------------------------------------------------------------------------------%>

            <div id="divDiscografia" runat="server">
                <div class="module">
                    <h2 class="title">
                        <a href="#">Artistas seguidos<asp:Label ID="lblDisUsuario" runat="server"/></a>
                    </h2>

                    <%--table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Rocky</td>
                                <td>Balboa</td>
                                <td>rockybalboa@mail.com</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Peter</td>
                                <td>Parker</td>
                                <td>peterparker@mail.com</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>John</td>
                                <td>Rambo</td>
                                <td>johnrambo@mail.com</td>
                            </tr>
                        </tbody>
                    </table--%>

                    <div class="resume-body">
                        <div id="mostrarA" runat="server">
                            <div id="GrillaArtistasS" runat="server"></div>
                        </div>
                    </div>
                </div>
            </div>

            <%----------------------------------------------------------------------------------------------------------------%>
            <div id="divEventos" runat="server">
                <div class="module">
                    <h2 class="title">
                        <a href="#">Eventos seguidos<asp:Label ID="lblEveUsuario" runat="server"/></a>
                    </h2>

                    <div class="resume-body">
                        <div id="mostrarE" runat="server">
                            <div id="GrillaEventosG" runat="server"></div>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</asp:Content>
