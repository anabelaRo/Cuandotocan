<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ResultadosBusq.aspx.cs" Inherits="CuandoTocan.Pages.ResultadosBusq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHomeCenterMed" runat="server">
    <div id="divPerfilArtistas">
        <div id="divIzquierda">

        </div>

        <div id="divDerecha">
			<div class="module">
                <h2 class="title">
                    <a href="#">Resultados de búsqueda para "<asp:Label ID="lblQuery" runat="server"/>"</a>
                </h2>
                <div class="resume-body">
                    <div id="divEventArtista1" runat="server">
                        
                    </div>
                </div>
                <div class="text-icenter">
                    <a class="btn" style="font-size: 14px;" href="#">
                    [+] Seguir leyendo
                    </a>
                </div>
            </div>
			
        </div>
    </div>
</asp:Content>
