﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ActDatosUserBanda.aspx.cs" Inherits="CuandoTocan.Pages.ActDatosUserBanda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    <div id="divUsuarioBanda">
        <div id="divIzquierda">
            <div id="divImgUsuario1" runat="server"></div>
            <div id="divMenuArtistaVert" runat="server"></div>
        </div>
        <div id="divDerecha">
            <div id="divActualizarDatos" runat="server">
                <div class="module">
                    <h2 class="title">
                        <a href="#">Actualizar datos<asp:Label ID="lblBioUsuario" runat="server"/></a>
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
                                    <label for="lblgenero">Género</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txtGeneroAct" type="text" runat="server" placeholder="HeavyRock" class="form-control"/>
                                    <asp:RequiredFieldValidator ID="valGeneroAct" ControlToValidate="txtGeneroAct" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" />
                                </div>
                            </div>
                            <div class="row">                             
                                <div class="col-sm-2">
                                    <label for="lblNombre">MusicBrainz ID</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txtMBrainz" type="text" runat="server" placeholder="1848" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-sm-2">
                                    <label for="lblgenero">Spotify ID</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txtSpotify" type="text" runat="server" placeholder="4987" class="form-control"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <label for="inputFoto">Imagen: </label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <label for="lvlDescripA">Biografía</label>
                                </div>
                                <div class="col-sm-10">
                                    <asp:TextBox id="txtDescrip" TextMode="multiline" Columns="170" Rows="5" runat="server"  placeholder="Formada en 1982..." class="form-control" />
                                    <asp:RequiredFieldValidator ID="valDescrip" ControlToValidate="txtDescrip" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" />
                                </div>
                            </div>
                        </div> 
                    </div>
                    <div class="text-icenter">
                        <asp:Button ID="btnActDatosUser" runat="server" Text="Actualizar"  class="btn btn-default" onclick="btnActDatosUser_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
