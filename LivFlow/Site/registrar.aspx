<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Layout.Master" AutoEventWireup="true" CodeBehind="registrar.aspx.cs" Inherits="LivFlow.Site.registrar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" runat="server">

    
    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-black">Criar conta</h2>
                </div>
                <div class="col-md-7">


                        <div class="p-3 p-lg-5 border">
                            <div class="form-group row">
                                <div class="col-md-12 mb-3">
                                    <label for="c_fname" class="text-black">Nome<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtNome" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label for="c_fname" class="text-black">Sobrenome<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtSobrenome" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label for="c_fname" class="text-black">E-mail<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label for="c_lname" class="text-black">Senha<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtSenha" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                    <small id="passwordHelpBlock" class="form-text text-muted">
                                      Sua senha deve ter entre 8 e 20 caracteres, os quais devem ser letras e números.
                                    </small>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label for="c_lname" class="text-black">Confirme a senha<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtConfrimacaoSenha" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                    <div id="senhaFeedback" class="feedback"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <asp:CheckBox ID="cbTermos"  runat="server"  Text="Aceito os <a href='teste.html'>Termos de uso e privacidade</a>"/>
                                      
                                    <asp:Button ID="btnRegistrar" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
                                </div>
                            </div>
                        </div>


                </div>
                <div class="col-md-5 ml-auto">
                    <div class="p-4 border mb-3">
                        <span class="d-block text-primary h6 text-uppercase">Já tem uma conta</span>
                        <p class="mb-0">Ótimo! É só entrar e aproveitar todas as nossas promoções.</p>
                        <a href="login.aspx" class="btn btn-outline-primary btn-sm btn-block">Entrar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
