using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_ticaret
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label2.Text = "";
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Label2.Text = "";
            try
            {

                string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
                SqlConnection db = new SqlConnection(dbbaglanti); db.Open();
                SqlCommand komut = new SqlCommand("SELECT * FROM Magaza WHERE (Eposta = @EpostaOrPhone OR Telefon = @EpostaOrPhone) AND Sifre = @Sifre and Durum=1", db);
                komut.Parameters.AddWithValue("@EpostaOrPhone", TextBox1.Text.Trim());

                komut.Parameters.AddWithValue("@Sifre", TextBox2.Text.Trim());
                SqlDataReader oku;
                oku = komut.ExecuteReader();
                if (oku.Read())
                {

                    Session["MagazaID"] = oku["MagazaID"];
                    Session["MagazaAdi"] = oku["MagazaAdi"];
                    Session["EPosta"] = oku["EPosta"];
                    Session["Telefon"] = oku["Telefon"];

                    Response.Redirect("AnaSayfa.Aspx");
                }
                else
                {
                    Label2.Text = "Kullanıcı adı veya Sifre yanlıs";
                }
                oku.Close();
                db.Close();
                db.Dispose();
            }
            catch
            {
                Label2.Text = "Hatalı veya eksik giriş";

            }
        }
    }
}