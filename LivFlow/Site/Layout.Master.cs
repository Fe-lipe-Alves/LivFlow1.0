using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LivFlow;

namespace LivFlow.Site
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        public List<object[]> erros = new List<object[]>();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Erros(string titulo)
        {
            this.erros.Add(new object[] { titulo, "" });
        }

        public void Erros(string titulo, string mensagem)
        {
            this.erros.Add(new object[] { titulo, mensagem });
        }

        public void Erros(object[] novoErro)
        {
            this.erros.Add(novoErro);
        }

        public void Erros(List<object[]> novosErros)
        {
            this.erros.AddRange(novosErros);
        }
    }
}