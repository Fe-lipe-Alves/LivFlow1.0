using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio.Controllers
{
    public class vw_LivroController
    {
        public List<vw_Livro> Localizar()
        {
            List<vw_Livro> livros = null;
            using (LivFlowEntities db = new LivFlowEntities())
            {
                livros = (from l in db.vw_Livro select l).ToList();
            }
            return livros;
        }

        public List<vw_Livro> Localizar(string pesquisa)
        {
            List<vw_Livro> livros = null;
            using (LivFlowEntities db = new LivFlowEntities())
            {
                livros = (from l in db.vw_Livro where l.titulo.Contains(pesquisa) select l).ToList();
            }
            return livros;
        }
    }
}
