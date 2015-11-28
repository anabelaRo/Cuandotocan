<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Evento.aspx.cs" Inherits="CuandoTocan.Evento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">


  <div id="divPerfilEvento">
    <asp:HiddenField ID="lat" runat="server"  ClientIDMode="Static" />
    <asp:HiddenField ID="lon" runat="server"  ClientIDMode="Static" />

  <%--  cuando se dirija de la busqueda de evento al detalle, se tiene que recibir el ID del evento, la latitud y la longitud--%>

        <div id="divIzquierdaE">
            <div class="col-md-4">
             <asp:HyperLink ID="linkarti2" runat="server">   
                <img id="imgArtista" runat="server" class="img-responsive" alt="" src="../img/Galeria/muse.png" />
             </asp:HyperLink>
                
            <br />
            <div class="row">
            <div class="col-md-6" id="voy" runat="server">
                  <%-- <asp:CheckBox ID="CheckBox2" CssClass="custom_check" checked runat="Server" data-off-text="False" data-on-text="True" OnCheckedChanged="CheckBox2_CheckedChanged" />--%>
                  <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModalE">     Voy!    </button>
                
                  <script type="text/javascript">

                      function desde() {
                         document.getElementById('desdeCa').style.display = 'block';
                      }
                      function sinauto() {

                          document.getElementById('desdeCa').style.display = 'none';
                      }
                   </script>

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                           <div class="modal fade" id="myModalE" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button ID="Button2" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                            <h4 class="modal-title" id="myModalLabel">  ¿Vas en auto al evento?</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            Desde <span>CuandoTocan</span>, queremos que todos puedan ir a los eventos.
                                                            <br />
                                                            Si vas en auto, podes compartir el viaje con otros usuarios, para conocer gente y abaratar costos
                                                            <strong>Animate!</strong><br />
                                                           <br />

                                                           <div class="row">
                                                             Ok, deseo compartir mi auto: 
                                                               <asp:RadioButton ID="radConAuto" GroupName="carpooling" runat="server" OnClick="javascript:desde();" />
                                                            </div>
                                                            

                                                             <div id="desdeCa" style="display:none";>
                                                            <div class="row">
                                                            
                                                            Salgo en auto desde:
                                                            </div>
                                                            <div class="row">
                                                            <div class="col-sm-10">
                                                            <asp:TextBox ID="txtCarpooling" runat="server" placeholder="Av. Rivadavia 8875, Morón, Buenos Aires"  class="form-control" />
                                                              <%--  <asp:RequiredFieldValidator ID="valCP" runat="server" ControlToValidate="txtCarpooling" class="text-danger" ErrorMessage="Si ofrece Carpooling debe indicar desde donde"></asp:RequiredFieldValidator>--%>
                                                           </div>
                                                           </div>
                                                            </div>
                                                            <div class="row">

                                                           Quiero recibir notificaciones de usuarios que asistan en auto
                                                           <asp:RadioButton ID="radSinAuto" GroupName="carpooling" runat="server" OnClick="javascript:sinauto();" />

                                                            </div>
                                                            
                                                          <asp:Button ID="btnEvento" runat="server" Text="Confirmar" class="btn btn-default" 
          onclick="btnEvento_Click" />
                                                          </div>
                                                          
                                                          </div>
                                                        <div class="modal-footer">
                                                          
                                                        </div>
                                                    </div>
                                                </div>
                                           
                                            
                                       </ContentTemplate>
                                    </asp:UpdatePanel>




                </div>
                  </div>
                   <div class="row">
                    <div id="asistencia"  runat="server">
                    
                        <asp:Button ID="btnNoVoy" class="btn btn-success" runat="server" 
                            Text="No voy" onclick="btnNoVoy_Click" />
                        <%--<asp:Label ID="lblAsiste" class="btn btn-success" runat="server" Text=""></asp:Label>--%>
                        </div>
                   </div>
            <div class="row">
                <div class="col-md-5">
                        <%--Twitter--%>
            <a href="https://twitter.com/share" class="twitter-share-button" data-text="Asistiré al evento:" data-lang="es" data-size="large" data-hashtags="CuandoTocan">Twittear</a>
            <script>    !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } } (document, 'script', 'twitter-wjs');</script>
            </div>
            <%--Facebook--%>
            <div class="col-md-5">
              <div id="fb-root"></div>
    <script>    (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v2.5";
            fjs.parentNode.insertBefore(js, fjs);
        } (document, 'script', 'facebook-jssdk'));</script>
            
            <div class="fb-share-button" data-href="http://localhost:63281/Pages/Evento.aspx" data-layout="button_count"></div>
            </div>
            </div>
            </div>
            
    </div>
    <br />
           <div id="divDerechaE">
            <div class="moduleE">
                <h2 class="title">
                    <asp:Label ID="lblTitulo" runat="server" Text=""></asp:Label>
                </h2>
                <div class="resume-body">
              
                   <h3>  <strong>    
                  <asp:HyperLink ID="linkArti" runat="server">   
                   <asp:Label ID="lblArti" runat="server" Text=""></asp:Label> 
                  </asp:HyperLink>
                  </strong><br />
                      <asp:Label ID="lvlDesc" runat="server" Text=""></asp:Label>   <br />
                   El 
                       <asp:Label ID="lblFecha" runat="server" Text=""></asp:Label>
                   En    <asp:Label ID="lblLugar" runat="server" Text=""></asp:Label></h3>
                    <asp:Label ID="lblDireccion" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lblCiudad" runat="server" Text=""></asp:Label><br />
                      Capacidad: <asp:Label ID="lblCapacidad" runat="server" Text=""></asp:Label><br />
                     Consultas:   <asp:Label ID="lblContacto" runat="server" Text="Label"></asp:Label>
                  </div>
             
            </div>

      


        </div>

         <div id="map_canvas" >
    </div>
    


    </div>

    
   
<%--<script async defer  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAzQgis4x77FBxoDPawUOFvt0c_D06vkM0&callback=initMap" > </script>--%>


    
</asp:Content>

