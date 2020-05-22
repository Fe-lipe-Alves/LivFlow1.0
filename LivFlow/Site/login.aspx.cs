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
    public partial class Login : System.Web.UI.Page
    {
        public Layout master = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            master = (Layout)this.Master;
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtEmail.Text != "" && txtSenha.Text != "")
                {
                    string senha = (Hash.Gerar(txtSenha.Text));
                    Usuario usuario = (new UsuarioController()).Localizar(txtEmail.Text, senha);

                    if(usuario != null)
                    {
                        Session["usuario_codigo"] = usuario.codigo;
                        Session["usuario_nome"] = usuario.nome;

                        Response.Redirect("home.aspx");
                    } else
                    {
                        master.Erros("Dados incompatíveis. Confira os dados informados.");
                    }
                } else
                {
                    master.Erros("Preencha todos os campos.");
                }
            }
            catch (Exception ex)
            {
                master.Erros("Erro ao entrar", ex.Message);
            }
        }
    }
}