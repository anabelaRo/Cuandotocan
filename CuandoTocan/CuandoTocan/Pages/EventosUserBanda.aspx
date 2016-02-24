<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="EventosUserBanda.aspx.cs" Inherits="CuandoTocan.Pages.EventosUserBanda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    
    <script type="text/javascript">
        function mostrarCrearEvento() {
            document.getElementById('<%=crearE.ClientID %>').style.display = 'block';
            document.getElementById('<%=modificarE.ClientID %>').style.display = 'none';
        }

        function mostrarActualizarEvento(id, nombre, desc, fecha, lugar, tipo) {
            document.getElementById('<%=modificarE.ClientID %>').style.display = 'block';
            document.getElementById('<%=crearE.ClientID %>').style.display = 'none';

            document.getElementById("<%=idEvento.ClientID %>").value = id;
            document.getElementById("<%=txtNomE.ClientID %>").value = nombre;
            document.getElementById("<%=txtDescE.ClientID %>").value = desc;
            document.getElementById("<%=txtFechaE.ClientID %>").value = fecha;
            document.getElementById("<%=ddlLugarModif.ClientID %>").value = lugar;
            document.getElementById("<%=ddlTipoModif.ClientID %>").value = tipo;  
        }

        function btnCancelarE() {
            document.getElementById('<%=crearE.ClientID %>').style.display = 'none';
            document.getElementById('<%=modificarE.ClientID %>').style.display = 'none';
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
                            <div id="modificarE2">
                                <div class ="row">
                                    <div class ="col-md-4">
                                        <label for="lblNomE">Nombre:</label>
                                    </div>
                                    <div class ="col-md-8">
                                        <asp:TextBox ID="txtNomE" runat="server"  class="form-control"></asp:TextBox>
                                        <asp:HiddenField ID="idEvento" runat="server" />
                                        <asp:RequiredFieldValidator ID="valtxtNomE" ControlToValidate="txtNomE" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" ValidationGroup="modificarEvento" />
                                    </div>
                                </div>
                                <div class ="row">
                                    <div class ="col-md-4">
                                        <label for="lblDesc">Descripción:</label>
                                    </div>
                                    <div class ="col-md-8">
                                        <asp:TextBox ID="txtDescE" runat="server"  class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="valtxtDescE" ControlToValidate="txtDescE" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" ValidationGroup="modificarEvento" />
                                    </div>
                                </div>
                                <div class ="row">
                                    <div class ="col-md-4">
                                        <label for="lblfechaE">Fecha del evento:</label>
                                    </div>
                                    <div class ="col-md-8">
                                        <asp:TextBox ID="txtFechaE" runat="server"  class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="valtxtFechaE" ControlToValidate="txtFechaE" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" ValidationGroup="modificarEvento" />
                                    </div>
                                </div>
                                <div class ="row">
                                    <div class ="col-md-4">
                                        <label for="lblLugarE">Lugar del evento:</label>
                                    </div>
                                    <div class ="col-md-8">
                                        <asp:DropDownList ID="ddlLugarModif" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class ="row">
                                    <div class ="col-md-4">
                                        <label for="lvlTipoEv">Tipo de evento:</label>
                                    </div>
                                    <div class ="col-md-8">
                                        <asp:DropDownList ID="ddlTipoModif" runat="server" EnableViewState="true" class="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class ="row">
								    <div class ="col-md-4">
									    <label for="lblDiscograficaD">Eliminar Evento:</label>
								    </div>
								    <div class ="col-md-8">    
									    <asp:CheckBox ID="chkEli" runat="server"/>
									    <label class="text-danger">
										    (El Evento será eliminado permanentemente)
									    </label>
								    </div>
							    </div>
                                <div class="text-icenter">  
                                    <asp:Button ID="btnUpdate" runat="server" class='btn btn-default' Text="Confirmar" onclick="btnActualizarEvento_Click" ValidationGroup="modificarEvento"/>                    
                                    <button id="btnCancelarUpdateE" runat="server" class="btn btn-default" onclick="btnCancelarE();" type="button">Cancelar</button>                   
                                </div>
                            </div>
                        </div> 

                        <div id="crearE" runat="server" style="display:none">
                            <h3> Crear Evento</h3>
                            <div id="crearE2">
                                <div class ="row">
                                    <div class ="col-md-4">
                                        <label for="lblNameNuevo">Nombre:</label>
                                    </div>
                                    <div class ="col-md-8">
                                        <asp:TextBox ID="txtNameNuevo" runat="server" placeholder="Despedida del año" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="valtxtNameNuevo" ControlToValidate="txtNameNuevo" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" ValidationGroup="crearEvento" />
                                    </div>
                                </div>
                                <div class ="row">
                                    <div class ="col-md-4">
                                        <label for="lblDescNueva">Descripción:</label>
                                    </div>
                                    <div class ="col-md-8">
                                        <asp:TextBox ID="txtDescNueva" runat="server" placeholder="Cerramos en año en el teatro" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="valtxtDescNueva" ControlToValidate="txtDescNueva" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" ValidationGroup="crearEvento" />
                                    </div>
                                </div>
                                <div class ="row">
                                    <div class ="col-md-4">
                                        <label for="lblFechaNueva">Fecha del evento:</label>
                                    </div>
                                    <div class ="col-md-8">
                                        <asp:TextBox ID="txtFechaNueva" runat="server" placeholder="dd/mm/yyyy hh:mm" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="valtxtFechaNueva" ControlToValidate="txtFechaNueva" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" Display="Dynamic" ValidationGroup="crearEvento" />
                                    </div>
                                </div>
                                <div class ="row">
                                    <div class ="col-md-4">
                                        <label for="lblLugarNueva">Lugar del evento:</label>
                                    </div>
                                    <div class ="col-md-8">
                                        <asp:DropDownList ID="ddlLugarCrear" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class ="row">
                                    <div class ="col-md-4">
                                        <label for="lblTipoNuevo">Tipo de evento:</label>
                                    </div>
                                    <div class ="col-md-8">
                                        <asp:DropDownList ID="ddlTipoCrear" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="text-icenter">  
                                    <asp:Button ID="btnCrearEvento" runat="server" class='btn btn-default' Text="Crear" onclick="btnCrearEvento_Click" ValidationGroup="crearEvento" />     
                                    <button id="btnCancCrearEvento" runat="server" class="btn btn-default" onclick="btnCancelarE();" type="button">Cancelar</button>                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</asp:Content>
