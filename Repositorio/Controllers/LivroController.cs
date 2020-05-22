using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio.Controllers
{
    public class LivroController
    {
        public void Inserir(Livro livro)
        {
            using (LivFlowEntities db = new LivFlowEntities())
            {
                db.Livro.Add(livro);
                db.SaveChanges();
            }
        }

        public List<Livro> Localizar(string titulo)
        {
            List<Livro> livros = null;
            using (LivFlowEntities db = new LivFlowEntities())
            {
                livros = livros = (from a in db.Livro where a.titulo.Contains(titulo) select a).ToList();
            }
            return livros;
        }
        
        public Livro Localizar(int codigo)
        {
            Livro livro = null;
            using (LivFlowEntities db = new LivFlowEntities())
            {
                livro = (from a in db.Livro where a.codigo == codigo select a).FirstOrDefault();
            }
            return livro;
        }

        public void Atualizar(Livro livro)
        {
            using (LivFlowEntities db = new LivFlowEntities())
            {
                db.Entry(livro).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        public void Excluir(Livro livro)
        {
            using (LivFlowEntities db = new LivFlowEntities())
            {
                db.Entry(livro).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
            }
        }
    }
}
