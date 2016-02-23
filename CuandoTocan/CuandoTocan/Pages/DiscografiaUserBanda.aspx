<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DiscografiaUserBanda.aspx.cs" Inherits="CuandoTocan.Pages.DiscografiaUserBanda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    
    <script type="text/javascript">
        function mostrarCrearDisco() {
            document.getElementById('<%=crearD.ClientID %>').style.display = 'block';
            document.getElementById('<%=modificarD.ClientID %>').style.display = 'none';
        }

        function mostrarActualizarDisco(id, titulo, fecha, discografica) {
            document.getElementById('<%=modificarD.ClientID %>').style.display = 'block';
            document.getElementById("<%=idDisco.ClientID %>").value = id;
            document.getElementById("<%=txtTituloD.ClientID %>").value = titulo;
            document.getElementById("<%=txtFechaD.ClientID %>").value = fecha;
            document.getElementById("<%=txtDiscograficaD.ClientID %>").value = discografica;

            document.getElementById('<%=crearD.ClientID %>').style.display = 'none';
        }

        function btnCancelarActualizarDisco_Click() {
            document.getElementById('<%=crearD.ClientID %>').style.display = 'none';
            document.getElementById('<%=modificarD.ClientID %>').style.display = 'none';
        }
    </script>

    <div id="divUsuarioBanda">
        <div id="divIzquierda">
            <div id="divImgUsuario1" runat="server"></div>
            <div id="divMenuArtistaVert" runat="server"></div>
        </div>
        <div id="divDerecha">
            <div id="divDiscografia" runat="server">
                <div class="module">
                    <h2 class="title">
                        <a href="#">Discografía<asp:Label ID="lblDisUsuario" runat="server"/></a>
                    </h2>
                    <div class="resume-body">
                        <div id="mostrarD" runat="server">
                            <div id="GrillaDiscosG" runat="server"></div>
                        </div>

                        <div id="divCrearDisco" class="text-icenter" runat="server">
                            <button id="btnNewDisco" runat="server" class="btn btn-default" onclick="mostrarCrearDisco();" type="button">Crear Nuevo Disco</button>
                        </div>

                        <div id="modificarD" runat="server" style="display:none">
                            <h3> Modificar Disco</h3>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblTituloD" runat="server" Text="Álbum: "></asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="txtTituloD" runat="server"  class="form-control" />
                                    <asp:HiddenField ID="idDisco" runat="server" />
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblFechaD" runat="server" Text="Fecha de lanzamiento: " > </asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="txtFechaD" runat="server"  class="form-control"/>
                                </div>
                            </div>
						    <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblDiscograficaD" runat="server" Text="Discográfica: " > </asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="txtDiscograficaD" runat="server"  class="form-control"/>
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-6">
                                    Eliminar Disco: 
                                    <asp:CheckBox ID="chkEliD" runat="server" />
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-12">
                                    Si chequea esta opción, el Disco será eliminado permanentemente.
                                    No hay vuelta atrás. 
                                </div>
                            </div>
                            <div class ="row">  
                                <div class ="col-md-6">
                                    <asp:Button ID="btnUpdateD" runat="server" class='btn btn-default' Text="Confirmar" onclick="btnActualizarDisco_Click" />                    
                                    <button id="btnCancelarUpdateD" runat="server" class="btn btn-default" onclick="btnCancelarActualizarDisco_Click();" type="button">Cancelar</button>                   
                                </div>
                            </div>
                        </div>   

                        <div id="crearD" runat="server" style="display:none">
                            <h3> Crear Disco</h3>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblTituloNuevo" runat="server" Text="Álbum: "></asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="txtTituloNuevo" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblFechaDNueva" runat="server" Text="Fecha de lanzamiento: "></asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="txtFechaDNueva" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblDiscograficaNueva" runat="server"  Text="Discográfica: "> </asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="txtDiscograficaNueva" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="text-icenter"> 
                                <asp:Button ID="btnNuevoDisco" runat="server" class='btn btn-default' Text="Crear" onclick="btnCrearDisco_Click"/>     
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
