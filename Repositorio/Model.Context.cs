﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Repositorio
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class LivFlowEntities : DbContext
    {
        public LivFlowEntities()
            : base("name=LivFlowEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Anuncio> Anuncio { get; set; }
        public virtual DbSet<Autor> Autor { get; set; }
        public virtual DbSet<AutorLivro> AutorLivro { get; set; }
        public virtual DbSet<Avaliacao> Avaliacao { get; set; }
        public virtual DbSet<Comentario> Comentario { get; set; }
        public virtual DbSet<Editora> Editora { get; set; }
        public virtual DbSet<Genero> Genero { get; set; }
        public virtual DbSet<GeneroLivro> GeneroLivro { get; set; }
        public virtual DbSet<Imagem> Imagem { get; set; }
        public virtual DbSet<ImagemCapa> ImagemCapa { get; set; }
        public virtual DbSet<Livro> Livro { get; set; }
        public virtual DbSet<Mensagem> Mensagem { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TipoUsuario> TipoUsuario { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<vw_Anuncio> vw_Anuncio { get; set; }
        public virtual DbSet<vw_Livro> vw_Livro { get; set; }
    }
}