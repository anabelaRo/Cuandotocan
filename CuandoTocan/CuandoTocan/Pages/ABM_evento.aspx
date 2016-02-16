<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ABM_evento.aspx.cs" Inherits="CuandoTocan.ABM_evento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    <h2>Mis Eventos - Administrar</h2>
    <div id="contenedor">
        <script type="text/javascript">
            function hola(id, nombre, desc, fecha, lugar, tipo  ) {
                document.getElementById('<%=modificarE.ClientID %>').style.display = 'block';
                document.getElementById("<%=txtNomE.ClientID %>").value = nombre;
                document.getElementById("<%=txtFechaE.ClientID %>").value = fecha;
                document.getElementById("<%=idEvento.ClientID %>").value = id;
                document.getElementById("<%=txtDescE.ClientID %>").value = desc;
            }
        </script>
        <div id="GrillaEventosG" runat="server">
            <h3> <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h3>
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
    <div id="modificarE" runat="server" style="display:none" >
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
                <asp:Label ID="lblfechaE" runat="server" Text="Fecha: " ></asp:Label>
            </div>
            <div class ="col-md-3">
                <asp:TextBox ID="txtFechaE" runat="server"  class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class ="row">
            <div class ="col-md-1">
                <asp:Label ID="lblLugarE" runat="server" Text="Lugar: "></asp:Label>
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
                Eliminar evento: <asp:CheckBox ID="chkEli" runat="server" />
            </div>
        </div>
        <div class ="row">
            <div class ="col-md-6">
                Si chequea esta opción, el evento será eliminado permanentemente. No hay vuelta atrás-.         
            </div>
        </div>
        <div class ="row">  
            <div class ="col-md-6">
                <asp:Button ID="btnUpdate" runat="server" class='btn btn-default' Text="Confirmar" onclick="btnUpdate_Click" />
            </div>
        </div>
    </div>       
    <div id="divCrearEvento" runat="server">
        <div class="row">
            <h3>    
                <asp:Button ID="btnNewEvent" runat="server" Text="Crear Nuevo Evento" class='btn btn-default' onclick="btnNewEvent_Click" />
            </h3>
        </div>
    </div>
    <div id="crearEvento1" runat="server">
        <h3>Crear Evento</h3>
        <div class ="row">
            <div class ="col-md-1">
                <asp:Label ID="lblNameNuevo" runat="server" Text="Nombre: "/>
            </div>
            <div class ="col-md-3">
                <asp:TextBox ID="txtNameNuevo" type="text" runat="server" placeholder="Despedida del año" class="form-control" required />
            </div>
        </div>
        <div class ="row">
            <div class ="col-md-1">
                <asp:Label ID="lblDescNueva" runat="server" Text="Descripción: "/>
            </div>
            <div class ="col-md-3">
                <asp:TextBox ID="tvtDescNueva" type="text" runat="server" placeholder="Cerramos en año en el teatro" class="form-control" required />
            </div>
        </div>
        <div class ="row">
            <div class ="col-md-1">
                <asp:Label ID="lblFechaNueva" runat="server"  Text="Fecha: "/>
            </div>
            <div class ="col-md-3">
                <asp:TextBox ID="txtFechaNueva" type="text" runat="server" placeholder="dd/mm/yyyy hh:mm" class="form-control" required />
            </div>
        </div>
        <div class ="row">
            <div class ="col-md-1">
                <asp:Label ID="lblLugarNueva" runat="server" Text="Lugar: "/>
            </div>
            <div class ="col-md-3">
                <asp:DropDownList ID="ddlLugar2" type="text" runat="server" class="form-control" required />
            </div>
        </div>
        <div class ="row">
            <div class ="col-md-1">
                <asp:Label ID="lblTipoNuevo" runat="server" Text="Tipo: "/ >
            </div>
            <div class ="col-md-3">
                <asp:DropDownList ID="ddlTIpo2" type="text" runat="server" class="form-control" required />
            </div>
        </div>
        <div class ="row">  
            <div class ="col-md-6">
                <asp:Button ID="btnCrearNuevo" runat="server" class='btn btn-default' Text="Crear" onclick="btnCrearNuevo_Click"/>
            </div>
        </div>
    </div>
</asp:Content>