<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="UsuarioBanda.aspx.cs" Inherits="CuandoTocan.Pages.UsuarioBanda" %>

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

        //************************************************************************************//

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
        </div>
        <div id="divDerecha">
            <%----------------------------------------------------------------------------------------------------------------%>
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
                                <asp:TextBox ID="regUser" runat="server"  disabled class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <label for="imputUser">E-Mail</label>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="regMail" runat="server"  disabled class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">                             
                            <div class="col-sm-2">
                                <label for="lblNombre">Nombre</label>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtNombreA" type="text" runat="server" disabled class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <label for="lblgenero">Género</label>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtGeneroAct" type="text" runat="server" placeholder="HeavyRock" class="form-control" required/>
                                <%--asp:RequiredFieldValidator ID="txtGeneroAVal" ControlToValidate="txtGeneroAct" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio"></asp:RequiredFieldValidator--%>
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
                                <label for="lvlDescripA">Breve descripción</label>
                            </div>
                            <div class="col-sm-10">
                                <asp:TextBox id="txtDescrip" TextMode="multiline" Columns="160" Rows="3" runat="server"  placeholder="Formada en 1982..." class="form-control" required/>
                            </div>
                        </div>
                    </div> 
                </div>
                <div class="text-icenter">
                    <asp:Button ID="Button1" runat="server" Text="Actualizar"  class="btn btn-default" onclick="btnActDatosUser_Click"/>
                </div>
            </div>

            <%----------------------------------------------------------------------------------------------------------------%>
            <div class="module">
                <h2 class="title">
                    <a href="#">Discografía<asp:Label ID="lblDisUsuario" runat="server"/></a>
                </h2>

                <div class="resume-body">
                    <div id="divDiscArtista1" runat="server"></div>
                    
                    <div id="mostrarD" runat="server">
                        <div id="GrillaDiscosG" runat="server">
                            <div id="GrillaD" runat="server">
                                <div class ="row">
                                    <div class ="col-md-3">
                                     <strong>    Titulo</strong>
                                    </div>
                                    <div class ="col-md-3">
                                     <strong>    Fecha de Publicación</strong>
                                    </div>
                                    <div class ="col-md-4">
                                     <strong>    Discografica</strong>
                                    </div>
                                    <div class ="col-md-1">
                                     <strong>    Editar</strong>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                            <div class ="col-md-6">
                                Si chequea esta opción, el Disco será eliminado permanentemente.
                                No hay vuelta atrás. 
                            </div>
                        </div>
                        <div class ="row">  
                            <div class ="col-md-6">
                                <asp:Button ID="btnUpdateD" runat="server" class='btn btn-default' Text="Confirmar" onclick="btnActualizarDisco_Click" />                    
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

            <%----------------------------------------------------------------------------------------------------------------%>
            <div class="module">
                <h2 class="title">
                    <a href="#">Eventos<asp:Label ID="lblEveUsuario" runat="server"/></a>
                </h2>

                <div class="resume-body">
                    <div id="contenedor">
                        <div id="GrillaEventosG" runat="server">
                            <div id="Grilla" runat="server">
                                <div class ="row">
                                    <div class ="col-md-2">Nombre</div>
                                    <div class ="col-md-2">Descripción</div>
                                    <div class ="col-md-2">Fecha</div>
                                    <div class ="col-md-2">Lugar</div>
                                    <div class ="col-md-2">Tipo Evento</div>
                                    <div class ="col-md-2">Editar</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="divCrearEvento" class="text-icenter" runat="server">
                        <%-- asp:Button ID="btnNewEvent" runat="server" Text="Crear Nuevo Evento" class='btn btn-default' onclick="btnNewEvent_Click" /--%>   
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
</asp:Content>
