<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Layout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LivFlow.Site.Login" ClientIDMode="Inherit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" runat="server">


    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-black">Entrar</h2>
                </div>
                <div class="col-md-7">


                        <div class="p-3 p-lg-5 border">
                            <div class="row">
                                <div class="col-md-12 form-group mb-3">
                                    <label for="c_fname" class="text-black">E-mail<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox>
                                    <div id="emailFeedback" class="feedback"></div>
                                </div>
                                <div class="col-md-12 form-group mb-3">
                                    <label for="c_lname" class="text-black">Senha<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtSenha" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                    <div id="senhaFeedback" class="feedback"></div>
                                    <a href="#">Esqueceu sua senha?</a>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <asp:Button ID="btnEntrar" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Entrar" OnClick="btnEntrar_Click" />
                                </div>
                            </div>
                        </div>


                </div>
                <div class="col-md-5 ml-auto">
                    <div class="p-4 border mb-3">
                        <span class="d-block text-primary h6 text-uppercase">Não tem uma conta?!</span>
                        <p class="mb-0">Crie sua conta agora mesmo e aproveite todas nossas promoções.</p>
                        <a href="registrar.aspx" class="btn btn-outline-primary btn-sm btn-block">Criar Conta</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="js/login.js"></script>
</asp:Content>