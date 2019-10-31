using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Prueba_1.Models;

namespace Prueba_1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Noticias = BD.ListarNoticias();
            ViewBag.Categorias = BD.ListarTipoNoticias();
            return View();
        }

        public ActionResult Noticia(int id)
        {
            List<Noticias> ListaNoticias = BD.ListarNoticias();
            foreach (Noticias a in ListaNoticias)
            {
                if (a.IdNoticias == id)
                {
                    ViewBag.Tit = a.Titulo;
                    ViewBag.Img = a.Imagen;
                    ViewBag.Desc = a.Descripcion;
                }
            }
            return View();
        }

        public ActionResult Noticias(int id)
        {
            List<Noticias> ListaNoticias = BD.ListarNoticias();
            List<Noticias> NoticiasSelect = new List<Noticias>();
            foreach (Noticias a in ListaNoticias)
            {
                if (a.IdTipoNoticias == id)
                {
                    NoticiasSelect.Add(a);
                }
            }
            ViewBag.NoticiasSelect = NoticiasSelect;
            return View();
        }
    }
}