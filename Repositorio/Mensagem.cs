//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Mensagem
    {
        public int codigo { get; set; }
        public int remetente { get; set; }
        public int destinatario { get; set; }
        public Nullable<int> anuncio { get; set; }
        public string conteudo { get; set; }
        public string anexo { get; set; }
        public System.DateTime criado_em { get; set; }
    
        public virtual Anuncio Anuncio1 { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual Usuario Usuario1 { get; set; }
    }
}
