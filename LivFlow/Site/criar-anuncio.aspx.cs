using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Repositorio;
using Repositorio.Controllers;

namespace LivFlow.Site
{
    public partial class criar_anuncio : System.Web.UI.Page
    {
        public Layout master;
        public Usuario usuario;
        public string area;
        public List<vw_Livro> livros;
        public Anuncio anuncio;
        public List<Imagem> imagens;

        protected void Page_Load(object sender, EventArgs e)
        {
            master = (Layout)this.Master;
            try
            {
                if (Session["usuario_codigo"] != null)
                {
                    if ((int)Session["usuario_codigo"] > 0)
                    {
                        usuario = (new UsuarioController()).Localizar((int)Session["usuario_codigo"]);
                    }
                }
                if (!IsPostBack)
                {
                    area = "info";
                }
            }
            catch (Exception ex)
            {
                master.Erros("Erro ao carregar página", ex.Message);
            }
        }

        protected void btnCriarAnuncio_Click(object sender, EventArgs e)
        {
            try
            {
                if(Session["usuario_codigo"] != null)
                {
                    if (txtTitulo.Text != "" && txtDescrição.Text != "" && txtQuantidade.Text != "" && txtPreco.Text != "")
                    {
                        // Cria o anucio e carrega suas propriedades
                        anuncio = new Anuncio();
                        anuncio.usuario = (int)Session["usuario_codigo"];
                        anuncio.titulo = txtTitulo.Text;
                        anuncio.descricao = txtDescrição.Text;
                        anuncio.quantidade = int.Parse(txtQuantidade.Text);
                        anuncio.precoUnitario = decimal.Parse(txtPreco.Text);
                        anuncio.status = "I";
                        anuncio.criado_em = DateTime.Now;
                        anuncio.livro = 2;
                        (new AnuncioController()).Inserir(anuncio);

                        if (fileImagens.HasFiles)
                        {
                            imagens = new List<Imagem>();

                            // Percorre todos os arquivos enviados
                            foreach (HttpPostedFile arquivo in fileImagens.PostedFiles)
                            {
                                // Valida o tipo de arquivo e permite o upload
                                string[] contentTypes = new string[] { "image/jpg", "image/png" };
                                if (!contentTypes.Contains(arquivo.ContentType))
                                {
                                    Imagem imagem = new Imagem();
                                    imagem.origem = "tmp";
                                    imagem.anuncio = anuncio.codigo;
                                    (new ImagemController()).Inserir(imagem);

                                    // formata o novo nome para a imagem
                                    String nomeImagem = imagem.codigo.ToString() + arquivo.FileName.Substring(fileImagens.FileName.IndexOf("."),
                                    arquivo.FileName.Length - fileImagens.FileName.IndexOf("."));
                                    arquivo.SaveAs(Server.MapPath("~") + @"\Site\images\anuncios\" + nomeImagem);

                                    // atualiza o local da imagem com o novo nome
                                    imagem.origem = nomeImagem;
                                    (new ImagemController()).Atualizar(imagem);

                                    imagens.Add(imagem);
                                } else
                                {
                                    master.Erros("Imagem " + arquivo.FileName + " não é de um tipo suportado.");
                                }
                            }
                        }
                    } else
                    {
                        master.Erros("Preencha todos os campos obrigatórios.");
                    }
                } else
                {
                    master.Erros("Faça o login para poder continuar com a operação");
                }
            }
            catch (Exception ex)
            {
                master.Erros("Erro na criação do anúncio", ex.Message);
            }
        }

        protected void btnInfoSeguir_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuario_codigo"] != null)
                {
                    if (txtTitulo.Text != "" && txtDescrição.Text != "" && txtQuantidade.Text != "" && txtPreco.Text != "")
                    {
                        // Cria o anucio e carrega suas propriedades
                        anuncio = new Anuncio();
                        anuncio.usuario = (int)Session["usuario_codigo"];
                        anuncio.titulo = txtTitulo.Text;
                        anuncio.descricao = txtDescrição.Text;
                        anuncio.quantidade = int.Parse(txtQuantidade.Text);
                        anuncio.precoUnitario = decimal.Parse(txtPreco.Text);
                        anuncio.status = "I";
                        anuncio.criado_em = DateTime.Now;
                        anuncio.livro = 2;
                        (new AnuncioController()).Inserir(anuncio);
                        Session["anuncio"] = anuncio;

                        area = "livro";
                    } else
                    {
                        master.Erros("Preencha todos os campos");
                    }
                } else
                {
                    master.Erros("Faça login para poder criar anúncios");
                }
            } catch (Exception ex)
            {
                master.Erros("Erro na criação do anúncio", ex.Message);
            }
        }

        protected void btnLivroSeguir_Click(object sender, EventArgs e)
        {
            try
            {
                anuncio = (Anuncio)Session["anuncio"];
                anuncio.livro = int.Parse(txtIdLivro.Value);
                Session["anuncio"] = anuncio;

                area = "imagens";
            }
            catch (Exception ex)
            {
                master.Erros("Erro na criação do anúncio");
            }
        }

        protected void btnImagensSeguir_Click(object sender, EventArgs e)
        {
            try
            {
                if (fileImagens.HasFiles)
                {
                    anuncio = (Anuncio)Session["anuncio"];
                    imagens = new List<Imagem>();

                    // Percorre todos os arquivos enviados
                    foreach (HttpPostedFile arquivo in fileImagens.PostedFiles)
                    {
                        // Valida o tipo de arquivo e permite o upload
                        string[] contentTypes = new string[] { "image/jpg", "image/png" };
                        if (!contentTypes.Contains(arquivo.ContentType))
                        {
                            Imagem imagem = new Imagem();
                            imagem.origem = "tmp";
                            imagem.anuncio = anuncio.codigo;
                            (new ImagemController()).Inserir(imagem);

                            // formata o novo nome para a imagem
                            String nomeImagem = imagem.codigo.ToString() + arquivo.FileName.Substring(fileImagens.FileName.IndexOf("."),
                            arquivo.FileName.Length - fileImagens.FileName.IndexOf("."));
                            arquivo.SaveAs(Server.MapPath("~") + @"\Site\images\anuncios\" + nomeImagem);

                            // atualiza o local da imagem com o novo nome
                            imagem.origem = nomeImagem;
                            (new ImagemController()).Atualizar(imagem);

                            imagens.Add(imagem);
                        }
                        else
                        {
                            master.Erros("Imagem " + arquivo.FileName + " não é de um tipo suportado.");
                        }
                    }


                    area = "confirmar-imagens";
                } else
                {
                    master.Erros("Envie as imagens do anúncio");
                    area = "imagens";
                }
            }
            catch (Exception ex)
            {
                master.Erros("Erro na criação do anúncio");
            }
        }

        protected void btnConsultarLivros_Click(object sender, EventArgs e)
        {
            try
            {
                area = "livro";
                if(txtConsultarLivros.Text != null)
                {
                    livros = (new vw_LivroController()).Localizar(txtConsultarLivros.Text);
                } else
                {
                    master.Erros("Preencha o campo de pesquisa para localizar o livro");
                }
            }
            catch (Exception ex)
            {
                master.Erros("Ocorreu um erro ao localizar livros", ex.Message);
            }
        }
    }
}