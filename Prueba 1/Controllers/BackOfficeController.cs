using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Prueba_1.Models;

namespace Prueba_1.Controllers
{
    public class BackOfficeController : Controller
    {
        // GET: BackOffice
        public ActionResult Contact()
        {
            ViewBag.lst = BD.ListarNoticias();
            return View();
        }
        public ActionResult Highlight(int id)
        {
            BD.destacarNoticia(id);
            return View();
        }
        [HttpPost]
        public ActionResult Loguearse(Usuario Culo)
        {
            if (BD.CheckUsuario(Culo))
            {
                return RedirectToAction("Contact");
            }
            else
            {
                return View("Logueo");
            }
        }
        public ActionResult Logueo()
        {
            return View();
        }
        public ActionResult Modify(int Id)
        {
            Noticias Noticion = new Noticias();
            List<Noticias> BigF = BD.ListarNoticias();
            foreach(Noticias a in BigF)
            {
                if(Id == a.IdNoticias)
                {
                    Noticion = a;
                }
            }
            return View(Noticion);
        }
        [HttpPost]
        public ActionResult Edit(Noticias Hello)
        {
            BD.ModificarNoti(Hello.IdNoticias, Hello.Descripcion);
            return View("Contact");
        }
    }
}