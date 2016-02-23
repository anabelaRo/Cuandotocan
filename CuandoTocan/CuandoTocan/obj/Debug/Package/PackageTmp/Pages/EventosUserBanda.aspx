<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="EventosUserBanda.aspx.cs" Inherits="CuandoTocan.Pages.EventosUserBanda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    
    <script type="text/javascript">
        function mostrarCrearEvento() {
            document.getElementById('<%=crearE.ClientID %>').style.display = 'block';
            document.getElementById('<%=modificarE.ClientID %>').style.display = 'none';
        }

        function mostrarActualizarEvento(id, nombre, desc, fecha, lugar, tipo) {
            document.getElementById('<%=modificarE.ClientID %>').style.display = 'block';
            document.getElementById("<%=txtNomE.ClientID %>").value = nombre;
            document.getElementById("<%=txtFechaE.ClientID %>").value = fecha;
            document.getElementById("<%=idEvento.ClientID %>").value = id;
            document.getElementById("<%=txtDescE.ClientID %>").value = desc;

            document.getElementById('<%=crearE.ClientID %>').style.display = 'none';
        }
    </script>

    <div id="divUsuarioBanda">
        <div id="divIzquierda">
            <div id="divImgUsuario1" runat="server"></div>
            <div id="divMenuArtistaVert" runat="server"></div>
        </div>
        <div id="divDerecha">
            <div id="divEventos" runat="server">
                <div class="module">
                    <h2 class="title">
                        <a href="#">Eventos<asp:Label ID="lblEveUsuario" runat="server"/></a>
                    </h2>

                    <div class="resume-body">
                        <div id="mostrarE" runat="server">
                            <div id="GrillaEventosG" runat="server"></div>
                        </div>

                        <div id="divCrearEvento" class="text-icenter" runat="server">
                            <button id="btnNewEvent" runat="server" class="btn btn-default" onclick="mostrarCrearEvento();" type="button">Crear Nuevo Evento</button>
                        </div>

                        <div id="modificarE" runat="server" style="display:none">
                            <h3> Modificar evento</h3>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblNomE" runat="server" Text="Nombre: "></asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="txtNomE" runat="server"  class="form-control"></asp:TextBox>
                                    <asp:HiddenField ID="idEvento" runat="server" />
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblDesc" runat="server" Text="Descripción: "></asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="txtDescE" runat="server"  class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblfechaE" runat="server" Text="Fecha: " > </asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="txtFechaE" runat="server"  class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblLugarE" runat="server" Text="Lugar: ">  </asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:DropDownList ID="ddlLugar" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lvlTipoEv" runat="server" Text="Tipo: ">  </asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:DropDownList ID="ddlTipo" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-6">
                                    Eliminar evento: 
                                    <asp:CheckBox ID="chkEli" runat="server" />
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-6">
                                    Si chequea esta opción, el evento será eliminado permanentemente.
                                    No hay vuelta atrás. 
                                </div>
                            </div>
                            <div class="text-icenter">  
                                <asp:Button ID="btnUpdate" runat="server" class='btn btn-default' Text="Confirmar" onclick="btnActualizarEvento_Click" />                    
                            </div>
                        </div> 

                        <div id="crearE" runat="server" style="display:none">
                            <h3> Crear Evento</h3>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblNameNuevo" runat="server" Text="Nombre: "></asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="txtNameNuevo" runat="server" placeholder="Despedida del año" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblDescNueva" runat="server" Text="Descripción: "></asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="tvtDescNueva" runat="server" placeholder="Cerramos en año en el teatro" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblFechaNueva" runat="server"  Text="Fecha: "> </asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:TextBox ID="txtFechaNueva" runat="server" placeholder="dd/mm/yyyy hh:mm" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblLugarNueva" runat="server" Text="Lugar: ">  </asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:DropDownList ID="ddlLugar2" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class ="row">
                                <div class ="col-md-1">
                                    <asp:Label ID="lblTipoNuevo" runat="server" Text="Tipo: ">  </asp:Label>
                                </div>
                                <div class ="col-md-3">
                                    <asp:DropDownList ID="ddlTIpo2" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="text-icenter">  
                                <asp:Button ID="Button2" runat="server" class='btn btn-default' Text="Crear" onclick="btnCrearEvento_Click"/>     
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</asp:Content>
