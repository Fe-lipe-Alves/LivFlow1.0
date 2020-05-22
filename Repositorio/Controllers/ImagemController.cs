using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio.Controllers
{
    public class ImagemController
    {
        public void Inserir(Imagem imagem)
        {
            using (LivFlowEntities db = new LivFlowEntities())
            {
                db.Imagem.Add(imagem);
                db.SaveChanges();
            }
        }

        public void Atualizar(Imagem imagem)
        {
            using (LivFlowEntities db = new LivFlowEntities())
            {
                db.Entry(imagem).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }
    }
}
