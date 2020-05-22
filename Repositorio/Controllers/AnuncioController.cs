                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repositorio;

namespace Repositorio.Controllers
{
    public class AnuncioController
    {
        public void Inserir(Anuncio anuncio)
        {
            using (LivFlowEntities db = new LivFlowEntities())
            {
                db.Anuncio.Add(anuncio);
                db.SaveChanges();
            }
        }

        public List<Anuncio> Localizar(string titulo)
        {
            List<Anuncio> anuncios = null;
            using (LivFlowEntities db = new LivFlowEntities())
            {
                anuncios = anuncios = (from a in db.Anuncio where a.titulo.Contains(titulo) select a).ToList();
            }
            return anuncios;
        }

        public Anuncio Localizar(int codigo)
        {
            Anuncio anuncio = null;
            using (LivFlowEntities db = new LivFlowEntities())
            {
                anuncio = (from a in db.Anuncio where a.codigo == codigo select a).FirstOrDefault();
            }
            return anuncio;
        }

        public void Atualizar(Anuncio anuncio)
        {
            using (LivFlowEntities db = new LivFlowEntities())
            {
                db.Entry(anuncio).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        public void Excluir(Anuncio anuncio)
        {
            using (LivFlowEntities db = new LivFlowEntities())
            {
                db.Entry(anuncio).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
            }
        }
    }
}
                                                                                                                                                                                                                                                                                               