<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Layout.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LivFlow.Site.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home - LivFlow</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" runat="server">

    <div class="site-section site-section-sm site-blocks-1">
        <div class="container">
            <div class="row">

                <% if (Session["usuario_codigo"] != null)
                    {
                        %>
                        
                        logado

                        <%
                    } else { 
                        %>
                        
                        não tem login

                        <%
                    }
                %>

            </div>
        </div>
    </div>

</asp:Content>

