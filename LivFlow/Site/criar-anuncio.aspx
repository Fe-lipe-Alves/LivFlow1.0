<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Layout.Master" AutoEventWireup="true" CodeBehind="criar-anuncio.aspx.cs" Inherits="LivFlow.Site.criar_anuncio" ClientIDMode="Inherit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Criar Anúncio</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" runat="server">
    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-black">Criar anúncio</h2>
                </div>
                <div class="col-md-7">


                        <div class="p-3 p-lg-5 border">
                            <div class="row mb-5">
                                <div class="col">
                                    <span class="<%= (area == "info")?"text-primary":"text-muted" %>">Informações</span>
                                </div>
                                <div class="col">
                                    <span class="<%= (area == "livro")?"text-primary":"text-muted" %>">Livro</span>
                                </div>
                                <div class="col">
                                    <span class="<%= (area == "imagens" || area == "confirmar-imagens")?"text-primary":"text-muted" %>">Imagens</span>
                                </div>
                                <div class="col">
                                    <span class="<%= (area == "confirmar")?"text-primary":"text-muted" %>">Confirmar</span>
                                </div>
                            </div>
                            <%-- Box informações principais --%>
                            <div id="info" class="form-group row <%= (area == "info")?"":"d-none" %>">
                                <div class="col-md-12 mb-3">
                                    <label for="txtTitulo" class="text-black">Título do Anúncio<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtTitulo" CssClass="form-control obrigatorio" runat="server"></asp:TextBox>
                                    <div class="invalid-feedback">Preencha este campo.</div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label for="txtDescrição" class="text-black">Descrição<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtDescrição" CssClass="form-control obrigatorio" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    <div class="invalid-feedback">Preencha este campo.</div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label for="txtQuantidade" class="text-black">Quantidade<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtQuantidade" CssClass="form-control obrigatorio" TextMode="Number" runat="server"></asp:TextBox>
                                    <div class="invalid-feedback">Preencha este campo.</div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label for="txtPreco" class="text-black">Preco<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtPreco" CssClass="form-control obrigatorio" runat="server"></asp:TextBox>
                                    <div class="invalid-feedback">Preencha este campo.</div>
                                </div>
                                <div class="col-md-12 mb-3">
                                     <asp:Button ID="btnInfoSeguir" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Confirmar Informações" OnClick="btnInfoSeguir_Click" />
                                </div>
                            </div>
                            <div id="livro" class="form-group row <%= (area == "livro")?"":"d-none" %>">
                                <div class="col-md-12 mb-3">
                                    <label for="btnMostraBoxLivro" class="text-black">Livro<span class="text-danger">*</span></label><br/>

                                    <small class="small">Digite o titulo do livro</small>
                                    <div class="row">
                                        <div class="col-md-9"><asp:TextBox ID="txtConsultarLivros" CssClass="form-control" runat="server"></asp:TextBox></div>
                                        <div class="col-md-3"><asp:Button ID="btnConsultarLivros" CssClass="btn btn-sm btn-outline-primary" runat="server" Text="Localizar" OnClick="btnConsultarLivros_Click" /></div>
                                    </div>
                                    <div class="row py-4">
                                        <asp:HiddenField ID="txtIdLivro" runat="server" />
                                    <% if (livros != null)
                                             {
                                                 foreach (Repositorio.vw_Livro livro in livros)
                                                 { %>
                                        
                                                    <div class="col-12">
                                                        <div class="row my-1 px-2 itemListaLivro mx-0" data-idlivro="<%= livro.codigo %>">
                                                            <div class="col-3">
                                                               <img src="images/capa-roube-como-um-artisata.png" class="img-fluid" />
                                                            </div>
                                                            <div class="col-8">
                                                                <span class="titulo"><%= livro.titulo %></span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                 <% }
                                             }%>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md-4">
                                            <asp:Button ID="btnCriarLivro" CssClass="btn btn-sm btn-outline-primary" runat="server" Text="Não encontrei" />
                                        </div>
                                        <div class="col-12 text-center">
                                            <span id="infoNaoSelecionado" class="mr-4">Livro ainda não selecionado</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <asp:Button ID="btnLivroSeguir" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Confirmar Livro" OnClick="btnLivroSeguir_Click"/>
                                </div>
                            </div>
                            <div id="imagens" class="form-group row <%= (area == "imagens" || area == "confirmar-imagens")?"":"d-none" %>">
                                <div class="col-md-12 mb-3">
                                    <label for="btnMostraBoxLivro" class="text-black">Imagens</label>
                                    <div class="custom-file">
                                        <label class="custom-file-label" for="fileImagens">Imagens do anúncio</label>
                                        <asp:FileUpload ID="fileImagens" aria-describedby="inputGroupFileAddon01" CssClass="custom-file-input" AllowMultiple="true" runat="server" />
                                    </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <asp:HiddenField ID="hiddenImagemCapa" runat="server" />
                                    <div class="row">
                                        <% if (area == "confirmar-imagens")
                                            {
                                                foreach (Repositorio.Imagem imagem in imagens)
                                                {%>
                                                <div class="col-6">
                                                    <%--<img src="images/anuncios/<%= imagem.origem %>" class="img-fluid"/>--%>
                                                    <img src="images/anuncios/3.jpg" data-idimagem="<%= imagem.codigo %>"" class="img-fluid imagensDemo"/>
                                                </div>
                                              <%}
                                            }%>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <asp:Button ID="btnImagensSeguir" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Confirmar Informações" OnClick="btnImagensSeguir_Click" />
                                </div>
                            </div>
                            
                            <div class="form-group row d-none">
                                <div class="col-lg-12">
                                    <asp:Button ID="btnCriarAnuncio" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Publicar anúncio" OnClick="btnCriarAnuncio_Click" />
                                    
                                </div>
                            </div>
                        </div>


                </div>
                <div class="col-md-5 ml-auto">
                    <div class="p-4 border mb-3">
                        <span class="d-block text-primary h6 text-uppercase">Dá uma olhadinha aqui como funciona...</span>
                        <p class="mb-0">Assim que você criar o anúncio ele passa por uma análise pelos nossos administradores para verficar se ele está de acordo com as nossas <a href="politicas-de-uso.aspx">políticas de uso</a>.<br/>
                            Assim que ele for validao você terá uma resposta em seu e-mail avisando que ele está disponível ao público ou se ele foi inátivado.</p>
                    </div>
                </div>

                <%-- Modal de escolha do livro --%>
                <div class="modal fade bd-example-modal-lg" id="modalLivro" tabindex="-1" role="dialog" aria-labelledby="Selecione o livro do anúncio" aria-hidden="true">
                  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="TituloModalCentralizado">Selecione o livro para o anúncio</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          <div class="container-fluid">
                              <div class="row">

                              </div>
                          </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="button" class="btn btn-sm btn-primary">Selecionar</button>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
