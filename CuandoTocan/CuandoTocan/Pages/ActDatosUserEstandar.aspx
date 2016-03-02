<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ActDatosUserEstandar.aspx.cs" Inherits="CuandoTocan.Pages.ActDatosUserEstandar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    <div id="divUsuarioEstandar">
        <div id="divIzquierda">
            <div id="divImgUsuario1" runat="server"></div>
            <div id="divMenuEstandarVert" runat="server"></div>
        </div>
        <div id="divDerecha">
            <div id="divActualizarDatos" runat="server">
                <div class="module">
                    <h2 class="title">
                        <a href="#">Actualizar datos<asp:Label ID="lblBioUsuario" runat="server"/></a>
                    </h2>
                    <div class="resume-body">
                        <div id="divUsuarioEstandarActualizar">    
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
                                    <label for="lblNombre">Nombre completo</label>
                                </div>
                                <div class="col-sm-4">
									<asp:TextBox ID="txtNombreComp" type="text" runat="server" placeholder="nombre completo aqui" class="form-control"></asp:TextBox>
									<asp:RequiredFieldValidator ID="valNombreComp" ControlToValidate="txtNombreComp" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" />
                                </div>
                                <div class="col-sm-2">
                                    <label for="lblgenero">Fecha de nacimiento</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txtFechaNac" runat="server" placeholder="ingrese fecha en [DD/MM/YYYY]" class="form-control"></asp:TextBox>
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
                                    <asp:TextBox id="txtBiografia" TextMode="multiline" Columns="160" Rows="3" runat="server"  placeholder="Nací el xx/xx/xxxx..." class="form-control" />
                                    <asp:RequiredFieldValidator ID="valDescrip" ControlToValidate="txtBiografia" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" />
                                </div>
                            </div>
                        </div> 
                    </div>
                    <div class="text-icenter">
                        <asp:Button ID="btnActDatosUser" runat="server" Text="Actualizar" class="btn btn-default" onclick="btnActDatosUser_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
