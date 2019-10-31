using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Prueba_1.Models
{
    public class Noticias
    {
        public int IdNoticias { get; set; }
        public int IdTipoNoticias { get; set; }
        public string Titulo { get; set; }
        public string Imagen { get; set; }
        public string Descripcion { get; set; }
        public bool Destacado { get; set; }

        public Noticias(int a, int b, string c, string d, string e, bool f)
        {
            IdNoticias = a;
            IdTipoNoticias = b;
            Titulo = c;
            Imagen = d;
            Descripcion = e;
            Destacado = f;
        }
        public Noticias()
        {
            
        }
    }
    public class TipoNoticias
    {
        public int IdNoticia { get; set; }
        public string Nombre { get; set; }

        public TipoNoticias(int a, string b)
        {
            IdNoticia = a;
            Nombre = b;
        }
    } 
 
    public class Usuario
    {
        [Required(ErrorMessage = "UserName is required")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Password is required")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}