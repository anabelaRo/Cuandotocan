<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="RecuperarPassword.aspx.cs" Inherits="CuandoTocan.Pages.RecuperarPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    <div id="divCambioPassword" runat="server">
        
            <h2 class="title">
                <label id="Label1">Cambio de contraseña</label>
            </h2>
   
                <div id="divUsuarioActPassword">
                    <div class="row">
                        <div class="col-md-13">
                            <div class="form-group">
                                <label class="control-label control-label required" for="change_password_validatePassword">Código, recibido por mail:</label>
                                <asp:TextBox ID="txtPasswordActual" type="text" runat="server" class="form-control" />
                                <asp:Label ID="lblCodigoErroneo" runat="server" class="text-danger" Text=""></asp:Label>
                                <asp:RequiredFieldValidator ID="valPasswordActual" ControlToValidate="txtPasswordActual" runat="server" class="text-danger" ErrorMessage="Campo Obligatorio" Display="Dynamic"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-13">
                            <div class="form-group">
                                <label class="control-label control-label required" for="change_password_new_password">Nueva contraseña:</label>
                                <asp:TextBox ID="txtPasswordNueva" type="password" runat="server" class="form-control" />
                                <asp:RequiredFieldValidator ID="valPasswordNueva" ControlToValidate="txtPasswordNueva" runat="server" class="text-danger" ErrorMessage="Campo Obligatorio" Display="Dynamic"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-13">
                            <div class="form-group">
                                <label class="control-label control-label required" for="change_password_check_password">Repetir nueva contraseña:</label>
                                <asp:TextBox ID="txtRePasswordNueva" type="password" runat="server" class="form-control" />
                                <asp:RequiredFieldValidator ID="valRePasswordNueva" ControlToValidate="txtRePasswordNueva" runat="server" class="text-danger" ErrorMessage="Campo Obligatorio" Display="Dynamic"/>
                                <asp:CompareValidator ID="valCompPasswordNueva" ControlToValidate="txtRePasswordNueva" ControlToCompare="txtPasswordNueva" class="text-danger" runat="server" ErrorMessage="Las contraseñas no coinciden" Display="Dynamic"/>
                            </div>
                        </div>
                    </div>
                </div>
      
            <div class="text-icenter">
                <asp:Button ID="Button1" runat="server" Text="Actualizar"  class="btn btn-default" onclick="btnActPassword_Click" />
            </div>

    </div>
</asp:Content>
