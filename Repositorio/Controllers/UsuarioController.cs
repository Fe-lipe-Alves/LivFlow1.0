using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repositorio;

namespace Repositorio.Controllers
{
    public class UsuarioController
    {
        public void Inserir(Usuario usuario)
        {
            using (LivFlowEntities db = new LivFlowEntities())
            {
                db.Usuario.Add(usuario);
                db.SaveChanges();
            }
        }

        public Usuario Localizar(string email, string senha)
        {
            Usuario usuario = null;
            using (LivFlowEntities db = new LivFlowEntities())
            {
                usuario = (from u in db.Usuario where u.email == email && u.senha == senha select u).FirstOrDefault();
            }
            return usuario;
        }

        public Usuario Localizar(int codigo)
        {
            Usuario usuario = null;
            using (LivFlowEntities db = new LivFlowEntities())
            {
                usuario = (from u in db.Usuario where u.codigo == codigo select u).FirstOrDefault();
            }
            return usuario;
        }

        public void Atualizar(Usuario usuario)
        {
            using (LivFlowEntities db = new LivFlowEntities())
            {
                db.Entry(usuario).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        public void Excluir(Usuario usuario)
        {
            using (LivFlowEntities db = new LivFlowEntities())
            {
                db.Entry(usuario).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
            }
        }
    }
}
