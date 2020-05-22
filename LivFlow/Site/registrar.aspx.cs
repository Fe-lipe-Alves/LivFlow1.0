using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using Repositorio;
using Repositorio.Controllers;

namespace LivFlow.Site
{
    public partial class registrar : System.Web.UI.Page
    {
        public Layout master = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            master = (Layout)this.Master;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtNome.Text != "" && txtSobrenome.Text != "" && txtEmail.Text != ""
                    && txtSenha.Text != "" && txtConfrimacaoSenha.Text != "" && cbTermos.Checked)
                {
                    Usuario usuario = new Usuario()
                    {
                        nome = txtNome.Text,
                        sobrenome = txtSobrenome.Text,
                        email = txtEmail.Text,
                        senha = Hash.Gerar(txtSenha.Text),
                        criado_em = DateTime.Now,
                        tipoUsuario = 1,
                        TipoUsuario1 = new TipoUsuario() { codigo = 1, descricao = "comum"}
                    };

                    (new UsuarioController()).Inserir(usuario);

                    Session["usuario_codigo"] = usuario.codigo;
                    Session["usuario_nome"] = usuario.nome;

                    Response.Redirect("home.aspx");
                } else
                {
                    master.Erros("Preencha todos os campos");
                }
            }
            catch (Exception ex)
            {
                master.Erros("Erro ao Registrar", ex.Message);
            }
        }
    }
}