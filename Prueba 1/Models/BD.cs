using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Prueba_1.Models
{
    public class BD
    {
        public bool logeado = false;
        public static string strConn = "Server=.;Database=Noticias;Trusted_Connection=True";
        public static SqlConnection Conect()
        {
            SqlConnection a = new SqlConnection(connectionString: strConn);
            a.Open();
            return a;
        }
        public static void Close(SqlConnection a)
        {
            a.Close();
        }
        public static List<TipoNoticias> ListarTipoNoticias() //Carga los filtros de Noticias
        {
            List<TipoNoticias> Temp = new List<TipoNoticias>();
            SqlConnection Conn = Conect();

            SqlCommand Query = Conn.CreateCommand();
            Query.CommandType = System.Data.CommandType.Text;
            Query.CommandText = "SELECT * FROM TipoNoticias";
            SqlDataReader Reader = Query.ExecuteReader();

            while (Reader.Read())
            {
                int IdTipoNoticia = (int)Reader["IdNoticia"];
                string Nombre = (string)Reader["Nombre"];
                TipoNoticias a = new TipoNoticias(IdTipoNoticia, Nombre);
                Temp.Add(a);
            }
            Close(Conn);
            return Temp;
        }
        public static List<Noticias> ListarNoticias() //Carga las noticias para el BackOffice
        {
            List<Noticias> Temp = new List<Noticias>();
            SqlConnection Conn = Conect();

            SqlCommand Query = Conn.CreateCommand();
            Query.CommandType = System.Data.CommandType.Text;
            Query.CommandText = "SELECT * FROM Noticias";
            SqlDataReader Reader = Query.ExecuteReader();
            string Imagen = null;

            while (Reader.Read())
            {
                int IdNoticia = (int)Reader["IdNoticias"];
                int IdTipoNoticia = (int)Reader["IdTipoNoticias"];
                string Titulo = (string)Reader["Titulo"];
                if (Reader["Imagen"].Equals(null))
                {
                    Imagen = (string)Reader["Imagen"];
                }
                string Descripcion = (string)Reader["Descripcion"];
                bool Destacado = (bool)Reader["Destacado"];
                Noticias HEYO = new Noticias(IdNoticia, IdTipoNoticia, Titulo, Imagen, Descripcion, Destacado);
                Temp.Add(HEYO);
            }
            Close(Conn);
            return Temp;
        }
        public static List<Noticias> FiltrarNoticias(List<Noticias> Todas, TipoNoticias Categoria) //Filtra las noticias para
        //cuando seselecciona una categoria
        {
            int i = 0;
            List<Noticias> Temp = new List<Noticias>();
            foreach(Noticias a in Todas)
            {
                if(Todas[i].IdTipoNoticias == Categoria.IdNoticia)
                {
                    Temp.Add(Todas[i]);
                }
                i++;
            }
            return Temp;
        }
        public static void destacarNoticia(int idNoticiaADestacar)
        {
            SqlConnection Conn = Conect();

            SqlCommand Query = Conn.CreateCommand();
            Query.CommandType = System.Data.CommandType.Text;
            Query.CommandText = "UPDATE Noticias SET Destacado = 0 WHERE Destacado = 1";
            SqlDataReader Reader = Query.ExecuteReader();

            Reader.Close();

            SqlCommand Query2 = Conn.CreateCommand();
            Query2.CommandType = System.Data.CommandType.Text;
            Query2.CommandText = "UPDATE Noticias SET Destacado = 1 WHERE IdNoticias = " + idNoticiaADestacar;
            SqlDataReader Reader2 = Query2.ExecuteReader();
            Reader2.Close();
            Close(Conn);
        }
        public static bool CheckUsuario(Usuario Puto)
        {
            bool ver = false;
            SqlConnection Conn = Conect();

            SqlCommand Query = Conn.CreateCommand();
            Query.CommandType = System.Data.CommandType.Text;
            Query.CommandText = "SELECT * FROM Usuario WHERE UserName = '" + Puto.UserName + "' AND Password = '" + Puto.Password + "'";
            SqlDataReader Reader = Query.ExecuteReader();
            if (Reader.Read())
            {
                ver = true;
            }
            Reader.Close();
            Close(Conn);

            return ver;
        }
        public static void ModificarNoti (int idNoticias, string txt)
        {
            SqlConnection Conn = Conect();

            SqlCommand Query = Conn.CreateCommand();
            Query.CommandType = System.Data.CommandType.Text;
            Query.CommandText = "Update Noticias SET Descripcion = '" + txt + "' WHERE IdNoticias = " + idNoticias;
            SqlDataReader Reader = Query.ExecuteReader();

            Reader.Close();
            Close(Conn);
        }
    }
}