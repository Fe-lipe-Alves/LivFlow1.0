using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LivFlow.Site
{
    public class Erro : IDisposable
    {
        public int codigo { get; set; }
        public string titulo { get; set; }
        public String mensagem { get; set; }

        public Erro() { }

        public Erro(int codigo, string titulo, string mensagem)
        {
            this.codigo = codigo;
            this.titulo = titulo;
            this.mensagem = mensagem;
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}