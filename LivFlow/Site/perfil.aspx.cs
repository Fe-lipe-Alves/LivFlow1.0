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
    public partial class perfil : System.Web.UI.Page
    {
        public Layout master = null;
        public Usuario usuario = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            master = (Layout)this.Master;

            if (!IsPostBack)
            {
                if (Request.Params["u"] != null)
                {
                    int num = int.Parse(Request.Params["u"]);
                    if (num > 0)
                    {
                        usuario = (new UsuarioController()).Localizar(num);
                        usuario.Avaliacao = new List<Avaliacao>();

                        if (Session["usuario_codigo"] != null)
                        {
                            if (usuario.codigo == (int)Session["usuario_codigo"])
                            {
                                txtNovoNome.Text = usuario.nome+" "+usuario.sobrenome;
                                txtNovoResumo.Text = usuario.resumo;
                                txtNovoEmail.Text = usuario.email;
                            }
                        }
                    }
                }
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            usuario = (new UsuarioController()).Localizar((int)Session["usuario_codigo"]);
            if(txtNovoNome.Text != "")
            {
                string[] nomes = txtNovoNome.Text.Split(' ');
                usuario.nome = nomes[0];
                usuario.sobrenome = "";
                if(nomes.Length > 1)
                {
                    for (int i = 1; i < nomes.Length; i++)
                    {
                        usuario.sobrenome += " " + nomes[i];
                    }
                }
            }

            if(txtNovoEmail.Text != "")
            {
                usuario.email = txtNovoEmail.Text;
            }

            if(txtNovoResumo.Text != "")
            {
                usuario.resumo = txtNovoResumo.Text;
            }

            if (fileNovaImagem.HasFile)
            {
                // Filtra o tipo de arquivo permitido
                if (fileNovaImagem.PostedFile.ContentType == "image/jpeg" ||
                      fileNovaImagem.PostedFile.ContentType == "image/png" ||
                      fileNovaImagem.PostedFile.ContentType == "image/gif" ||
                      fileNovaImagem.PostedFile.ContentType == "image/bmp")
                {

                    //Obtem o  HttpFileCollection
                    HttpFileCollection hfc = Request.Files;
                    for (int i = 0; i < hfc.Count; i++)
                    {
                        HttpPostedFile hpf = hfc[i];
                        if (hpf.ContentLength > 0) { 
                        //{
                        //    //Pega o nome do arquivo
                        //    string nome = System.IO.Path.GetFileName(hpf.FileName);
                        //    //Pega a extensão do arquivo
                        //    string extensao = Path.GetExtension(hpf.FileName);
                        //    //Gera nome novo do Arquivo numericamente
                        //    string filename = string.Format("{0:00000000000000}", GerarID());
                        //    //Caminho a onde será salvo
                        //    hpf.SaveAs(Server.MapPath("~/uploads/fotos/") + filename + i
                        //    + extensao);

                        //    //Prefixo p/ img pequena
                        //    var prefixoP = "-p";
                        //    //Prefixo p/ img grande
                        //    var prefixoG = "-g";

                        //    //pega o arquivo já carregado
                        //    string pth = Server.MapPath("~/uploads/fotos/")
                        //    + filename + i + extensao;

                        //    //Redefine altura e largura da imagem e Salva o arquivo + prefixo
                        //    Redefinir.resizeImageAndSave(pth, 70, 53, prefixoP);
                        //    Redefinir.resizeImageAndSave(pth, 500, 331, prefixoG);
                        }

                    }

                } else
                {
                    master.Erros("O arquivo enviado para a imagem de perfil não tem formato de arquivos suportados.");
                }
            }

            (new UsuarioController()).Atualizar(usuario);
        }
    }
}