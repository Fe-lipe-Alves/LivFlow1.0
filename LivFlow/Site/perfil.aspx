<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Layout.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="LivFlow.Site.perfil" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        <% if (usuario != null) {%>
           <%= usuario.nome + " " + usuario.sobrenome %>
         <% } else { %>
            Perfil
        <%} %>
    </title>
        <link href="css/perfil.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" runat="server">

    <div class="site-section">
        <div class="container">

            <% if (usuario != null)
                { %>

            <div class="row">
                <div class="col-md-8 offset-md-2 border">
                    <div id="exibicao" class="p-3 p-lg-5">
                        <div class="block-38 text-center">
                            <div class="block-38-img">
                                <div class="block-38-header">
                                    <img src="images/person_1.jpg" alt="Image placeholder" class="mb-4">
                                    <h3 class="block-38-heading h4"><%= usuario.nome + " " + usuario.sobrenome %></h3>
                                </div>
                                <div class="block-38-body">
                                    <p><%= usuario.resumo%></p>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-5 mb-3">
                            <div class="col">
                                <small>E-mail</small>
                                <p><%= usuario.email %></p>
                            </div>
                            <div class="col">
                                <small>Desde de</small>
                                <p><%= usuario.criado_em.ToString() %></p>
                            </div>
                        </div>
                        <div class="row">
                            <% if (Session["usuario_codigo"] != null)
                                {
                                    if (usuario.codigo == (int)Session["usuario_codigo"])
                                    { %>
                            <%-- A tela de edição só é exibida quando clicar no botão editar --%>
                            <button type="button" id="btnEditarPerfil" class="btn btn-sm" value="Editar perfil">Editar perfil</button>
                            <% }
                                } %>
                        </div>
                    </div>

                    <% if (Session["usuario_codigo"] != null)
                       {
                            if (usuario.codigo == (int)Session["usuario_codigo"])
                            { %>
                                <%-- A tela de edição só é exibida quando clicar no botão editar --%>
                                <div id="edicao" class="p-3 p-lg-5 d-none">
                                    <div class="block-38 text-center">
                                        <div class="block-38-img">
                                            <div class="block-38-header">
                                                <div class="d-flex justify-content-center align-items-center">
                                                    <%--<div class="imgPerfil" style="background-image: url(<%= usuario.perfil %>)"></div>--%>
                                                    <div id="novaImagem" class="imgPerfil editar" style="background-image: url('images/person_1.jpg') "></div>
                                                    <asp:FileUpload ID="fileNovaImagem" CssClass="d-none" runat="server" />
                                                </div>
                                                <div class="form-group">
                                                    <small>Nome</small>
                                                    <asp:TextBox ID="txtNovoNome" CssClass="form-control text-center h4" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="block-38-body form-group">
                                                <small class="">Resumo sobre você</small>
                                                <asp:TextBox ID="txtNovoResumo" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-5 mb-3">
                                        <div class="col form-group">
                                            <small>E-mail</small>
                                            <asp:TextBox ID="txtNovoEmail" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12 form-group">
                                            <asp:Button ID="btnSalvar" CssClass="btn btn-sm btn-primary" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
                                        </div>
                                    </div>
                                </div>
                        <% }
                       } %>

                        <hr/>

                        <%--<div class="row">
                            <div class="col-12 mt-1">
                                <h5 class="text-dark">Avaliações</h5>
                            </div>
                        </div>--%>
                </div>
            </div>

            <% }
                else
                { %>
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-black">Usuário não encontrado</h2>
                </div>
                <div class="col-md-12">
                    <div class="p-3 p-lg-5">
                        Olha, não achamos o usuário que você está procurando.
                        <br />
                        Mas já que está aqui, dá uma olhada nesses produtos abaixo ...
                    </div>
                </div>
            </div>
            <%--<div class="row mb-5">

                <div class="col-sm-6 col-lg-4 mb-4 aos-init aos-animate" data-aos="fade-up">
                    <div class="block-4 text-center border">
                        <figure class="block-4-image">
                            <a href="shop-single.html">
                                <img src="images/cloth_1.jpg" alt="Image placeholder" class="img-fluid"></a>
                        </figure>
                        <div class="block-4-text p-4">
                            <h3><a href="shop-single.html">Tank Top</a></h3>
                            <p class="mb-0">Finding perfect t-shirt</p>
                            <p class="text-primary font-weight-bold">$50</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 mb-4 aos-init aos-animate" data-aos="fade-up">
                    <div class="block-4 text-center border">
                        <figure class="block-4-image">
                            <a href="shop-single.html">
                                <img src="images/shoe_1.jpg" alt="Image placeholder" class="img-fluid"></a>
                        </figure>
                        <div class="block-4-text p-4">
                            <h3><a href="shop-single.html">Corater</a></h3>
                            <p class="mb-0">Finding perfect products</p>
                            <p class="text-primary font-weight-bold">$50</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 mb-4 aos-init aos-animate" data-aos="fade-up">
                    <div class="block-4 text-center border">
                        <figure class="block-4-image">
                            <a href="shop-single.html">
                                <img src="images/cloth_2.jpg" alt="Image placeholder" class="img-fluid"></a>
                        </figure>
                        <div class="block-4-text p-4">
                            <h3><a href="shop-single.html">Polo Shirt</a></h3>
                            <p class="mb-0">Finding perfect products</p>
                            <p class="text-primary font-weight-bold">$50</p>
                        </div>
                    </div>
                </div>
            </div>--%>
            <div class="row mb-5">
                <div class="row">
                    <div class="col-md-12">
                        <div class="nonloop-block-3 owl-carousel owl-loaded owl-drag">





                            <div class="owl-stage-outer">
                                <div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0.25s ease 0s; width: 1864px; padding-left: 15px; padding-right: 15px;">
                                    <div class="owl-item active" style="width: 346.667px; margin-right: 20px;">
                                        <div class="item">
                                            <div class="block-4 text-center">
                                                <figure class="block-4-image">
                                                    <img src="images/cloth_1.jpg" alt="Image placeholder" class="img-fluid">
                                                </figure>
                                                <div class="block-4-text p-4">
                                                    <h3><a href="#">Tank Top</a></h3>
                                                    <p class="mb-0">Finding perfect t-shirt</p>
                                                    <p class="text-primary font-weight-bold">$50</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="owl-item active" style="width: 346.667px; margin-right: 20px;">
                                        <div class="item">
                                            <div class="block-4 text-center">
                                                <figure class="block-4-image">
                                                    <img src="images/shoe_1.jpg" alt="Image placeholder" class="img-fluid">
                                                </figure>
                                                <div class="block-4-text p-4">
                                                    <h3><a href="#">Corater</a></h3>
                                                    <p class="mb-0">Finding perfect products</p>
                                                    <p class="text-primary font-weight-bold">$50</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="owl-item active" style="width: 346.667px; margin-right: 20px;">
                                        <div class="item">
                                            <div class="block-4 text-center">
                                                <figure class="block-4-image">
                                                    <img src="images/cloth_2.jpg" alt="Image placeholder" class="img-fluid">
                                                </figure>
                                                <div class="block-4-text p-4">
                                                    <h3><a href="#">Polo Shirt</a></h3>
                                                    <p class="mb-0">Finding perfect products</p>
                                                    <p class="text-primary font-weight-bold">$50</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="owl-item" style="width: 346.667px; margin-right: 20px;">
                                        <div class="item">
                                            <div class="block-4 text-center">
                                                <figure class="block-4-image">
                                                    <img src="images/cloth_3.jpg" alt="Image placeholder" class="img-fluid">
                                                </figure>
                                                <div class="block-4-text p-4">
                                                    <h3><a href="#">T-Shirt Mockup</a></h3>
                                                    <p class="mb-0">Finding perfect products</p>
                                                    <p class="text-primary font-weight-bold">$50</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="owl-item" style="width: 346.667px; margin-right: 20px;">
                                        <div class="item">
                                            <div class="block-4 text-center">
                                                <figure class="block-4-image">
                                                    <img src="images/shoe_1.jpg" alt="Image placeholder" class="img-fluid">
                                                </figure>
                                                <div class="block-4-text p-4">
                                                    <h3><a href="#">Corater</a></h3>
                                                    <p class="mb-0">Finding perfect products</p>
                                                    <p class="text-primary font-weight-bold">$50</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="owl-nav">
                                <div class="owl-prev disabled"><span class="icon-arrow_back"></span></div>
                                <div class="owl-next"><span class="icon-arrow_forward"></span></div>
                            </div>
                            <div class="owl-dots">
                                <div class="owl-dot active"><span></span></div>
                                <div class="owl-dot"><span></span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="js/perfil.js"></script>
</asp:Content>
