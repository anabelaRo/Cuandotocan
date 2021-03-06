﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ActPassUserBanda.aspx.cs" Inherits="CuandoTocan.Pages.ActPassUserBanda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    <div id="divUsuarioBanda">
        <div id="divIzquierda">
            <div id="divImgUsuario1" runat="server"/>
            <div id="divMenuArtistaVert" runat="server"/>
        </div>
        <div id="divDerecha">
            <div id="divCambioContraseña" runat="server">
                <div class="module">
                    <h2 class="title">
                        <a href="#">Cambio de contraseña<asp:Label ID="Label1" runat="server"/></a>
                    </h2>
                    <div class="resume-body">
                        <div id="divUsuarioBandActContraseña">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label control-label required" for="change_password_validatePassword">Contraseña actual</label>
                                        <asp:TextBox ID="txtPassActual" type="password" runat="server" class="form-control" />
                                        <asp:Label ID="passErronea" runat="server" class="text-danger" Text=""></asp:Label>
                                        <asp:RequiredFieldValidator ID="valPassActual" ControlToValidate="txtPassActual" runat="server" class="text-danger" ErrorMessage="Campo Obligatorio" Display="Dynamic"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label control-label required" for="change_password_new_password">Nueva contraseña</label>
                                        <asp:TextBox ID="txtPassNueva" type="password" runat="server" class="form-control" />
                                        <asp:RequiredFieldValidator ID="valPassNueva" ControlToValidate="txtPassNueva" runat="server" class="text-danger" ErrorMessage="Campo Obligatorio" Display="Dynamic"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label control-label required" for="change_password_check_password">Repetir nueva contraseña</label>
                                        <asp:TextBox ID="txtRePassNueva" type="password" runat="server" class="form-control" />
                                        <asp:RequiredFieldValidator ID="valRePassNueva" ControlToValidate="txtRePassNueva" runat="server" class="text-danger" ErrorMessage="Campo Obligatorio" Display="Dynamic"/>
                                        <asp:CompareValidator ID="valCompPassNueva" ControlToValidate="txtRePassNueva" ControlToCompare="txtPassNueva" class="text-danger" runat="server" ErrorMessage="Las contraseñas no coinciden" Display="Dynamic"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-icenter">
                        <asp:Button ID="Button1" runat="server" Text="Actualizar"  class="btn btn-default" onclick="btnActPassUser_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
