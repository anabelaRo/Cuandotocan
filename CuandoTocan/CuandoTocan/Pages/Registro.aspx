<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="CuandoTocan.Pages.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    <div id="divPerfilRegistracion">
     <div class="moduleR">
         <h2 class="title">
                    <a href="#">Crear cuenta</a>
         </h2>
          <div class="resume-body">    
              <div class="row">
                 <div class="col-sm-2">
                   <label for="imputUser">Usuario</label>
                 </div>
                 <div class="col-sm-4">
                    <asp:TextBox ID="regUser" runat="server" placeholder="JuanPerez90" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="regUserVal" ControlToValidate="regUser" runat="server" ErrorMessage="Campo Obligatorio" ValidationGroup="registro" class="text-danger"></asp:RequiredFieldValidator>
                    <asp:Label ID="Label1" runat="server" class="text-danger" Text=""></asp:Label>
                
                </div>
                <div class="col-sm-2">
                    <label for="imputUser">E-Mail</label>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="regMail" runat="server" placeholder="JuanPerez90@gmail.com" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="regMailVal" ControlToValidate="regMail" runat="server" ErrorMessage="Campo Obligatorio" ValidationGroup="registro" class="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Email inválido" class="text-danger" ControlToValidate="regMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ValidationGroup="registro" />
                </div>
              </div>
              <div class="row">
                    <div class="col-sm-2">
                       <label for="inputPassword">Password</label>
                    </div>
                    <div class="col-sm-4">
                       <asp:TextBox ID="regPassword" type="password" TextMode="password"  runat="server" placeholder="Password123" class="form-control"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="regPasswordVal" ControlToValidate="regPassword" runat="server" ErrorMessage="Campo Obligatorio" class="text-danger" ValidationGroup="registro"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-sm-2">
                       <label for="inputRePassword">Re-Password</label>
                    </div>
                    <div class="col-sm-4">
                      <asp:TextBox ID="regRePassword" type="password" TextMode="password"  runat="server" placeholder="Password123" class="form-control"></asp:TextBox>
                      <asp:CompareValidator ID="regRePasswordVal" ControlToValidate="regRePassword" ControlToCompare="regPassword" class="text-danger" runat="server" ErrorMessage="Los password no coinciden"  ValidationGroup="registro"></asp:CompareValidator>
                    </div>
               </div>
               <div class="row">
                    <div class="col-sm-2">
                         <label for="ddlTiUsua">Tipo de Usuario</label>
                    </div>
                    <div class="col-sm-4">
                        <%-- <asp:DropDownList ID="ddlTiUsua" runat="server" class="form-control"  onchange="javascript:test();" onselectedindexchanged="ddlTiUsua_SelectedIndexChanged">   
                          --%>   <asp:DropDownList ID="ddlTiUsua" runat="server" class="form-control"  onchange="javascript:tipousuDiv();" >   
                             <asp:ListItem Enabled="true" Text="Elija Tipo de usuario" Value="0"></asp:ListItem>
                             <asp:ListItem Text="Usuario" Value="1"></asp:ListItem>
                             <asp:ListItem Text="Artista" Value="2"></asp:ListItem> 
                         </asp:DropDownList>

                         <script type="text/javascript">
                              
                             function tipousuDiv() {
                                 var ddl = document.getElementById('<%=ddlTiUsua.ClientID%>');
                                 var ddlSel = ddl.options[ddl.selectedIndex].value;

                                 if (ddlSel == 1) {
                                     document.getElementById('<%=altaUsuarioU.ClientID %>').style.display = 'block';
                                     document.getElementById('<%=altaUsuarioA.ClientID %>').style.display = 'none';
                                 }
                                 else if (ddlSel == 2) {
                                     document.getElementById('<%=altaUsuarioU.ClientID %>').style.display = 'none';
                                     document.getElementById('<%=altaUsuarioA.ClientID %>').style.display = 'block';
                                 }
                                 else {
                                     alert("elija tipo de usuario");
                                     document.getElementById('<%=altaUsuarioU.ClientID %>').style.display = 'none';
                                     document.getElementById('<%=altaUsuarioA.ClientID %>').style.display = 'none';
                                 }
                             }
                        </script>
                     
                    </div>     
                </div>
            <div id ="altaUsuarioU" style="display:none" runat="server">
                      <div class="row">
                          <div class="col-sm-2">
                               <label for="inputNombre">Nombre Completo</label>
                          </div>
                          <div class="col-sm-4">
                               <asp:TextBox ID="regNombre" type="text" runat="server" placeholder="Juan Perez" class="form-control"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="regNombreVal" ControlToValidate="regNombre" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio"  ValidationGroup="registroU"></asp:RequiredFieldValidator>
                           </div>
                           <div class="col-sm-2">
                               <label for="calendarFNac">Fecha de nacimiento:</label>
                           </div>
                           <div class="col-sm-4">
                               <asp:TextBox ID="regFNac" type="text" runat="server" placeholder="dd-mm-aaaa" class="form-control"/>
                               <asp:RequiredFieldValidator ID="regFNacVal" ControlToValidate="regFNac" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" ValidationGroup="registroU" ></asp:RequiredFieldValidator>
                         </div>
                       </div>
                       <div class="row">
                           <div class="col-sm-2">
                               <label for="TextAreaBio">Acerca de vos:</label>
                           </div>
                          <div class="col-sm-10">
                            <asp:TextBox id="TextAreaBio" TextMode="multiline" Columns="150" Rows="3" runat="server"  placeholder="Me gusta..." class="form-control" />
                       </div>
                      </div>
                   </div>
            <div id ="altaUsuarioA" style="display:none" runat="server">
                    <div class="row">                             
                        <div class="col-sm-2">
                               <label for="lblNombre">Nombre</label>
                        </div>
                        <div class="col-sm-4">
                          <asp:TextBox ID="txtNombreA" type="text" runat="server" placeholder="Metallica" class="form-control"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="txtNombreAVal" ControlToValidate="txtNombreA" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio"  ValidationGroup="registroA" ></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-2">
                          <label for="lblgenero">Género</label>
                        </div>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtGeneroA" type="text" runat="server" placeholder="HeavyRock" class="form-control"/>
                            <asp:RequiredFieldValidator ID="txtGeneroAVal" ControlToValidate="txtGeneroA" class="text-danger" runat="server" ErrorMessage="Campo Obligatorio" ValidationGroup="registroA" ></asp:RequiredFieldValidator>
                       </div>
                     </div>
                     <div class="row">                             
                        <div class="col-sm-2">
                               <label for="lblNombre">MusicBrainz ID</label>
                        </div>
                        <div class="col-sm-4">
                          <asp:TextBox ID="txtMBrainz" type="text" runat="server" placeholder="1848" class="form-control"></asp:TextBox>
                         <%-- <asp:RequiredFieldValidator ID="txtMBrainzval" ControlToValidate="txtMBrainz" runat="server" ErrorMessage="Campo Obligatorio"  ValidationGroup="registroA"></asp:RequiredFieldValidator>--%>
                        </div>
                        <div class="col-sm-2">
                          <label for="lblgenero">Spotify ID</label>
                        </div>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtSpotify" type="text" runat="server" placeholder="4987" class="form-control"/>
                         <%--   <asp:RequiredFieldValidator ID="txtSpotifyVal" ControlToValidate="txtSpotify" runat="server" ErrorMessage="Campo Obligatorio" ValidationGroup="registroA" ></asp:RequiredFieldValidator>--%>
                       </div>
                     </div>
                     <div class="row">
                          <div class="col-sm-2">
                               <label for="lvlDescrip">País de Origen</label>
                          </div>
                          <div class="col-sm-4">
                                       <asp:DropDownList ID="DropDownPais" runat="server" class="form-control" >   
                                         <asp:ListItem Enabled="true" Text="Elija País de Origen" Value="0"></asp:ListItem>
                                         <asp:ListItem Text="Argentina" Value="1"></asp:ListItem>
                                         <asp:ListItem Text="Estados Unidos" Value="2"></asp:ListItem> 
                                         <asp:ListItem Text="Inglaterra" Value="3"></asp:ListItem> 
                                     </asp:DropDownList>
                        </div>
                     </div>
           </div>

                                                        
          <asp:Button ID="btnReg" runat="server" Text="Registrar"  class="btn btn-default" onclick="btnReg_Click"/>
                                                       
             </div>                                       
      </div>                                        
 </div>                                        
</asp:Content>
