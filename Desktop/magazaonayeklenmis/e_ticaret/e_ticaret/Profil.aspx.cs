using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_ticaret
{
    public partial class Profil : System.Web.UI.Page
    {
        string magazaID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            magazaID = Session["MagazaID"].ToString();
            SqlDataSource1.SelectCommand = "SELECT * FROM Magaza where MagazaID=" + magazaID;

            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            // Eğer veri döndüyse, 3. sütundaki değeri Label6'ya yazdırın.
            if (dv.Count > 0)
            {
                // 3. sütundaki veriyi alıp Label6'ya yazdırın.
                labelmagazaadi.Text = dv[0]["MagazaAdi"].ToString(); // 2, 3. sütunu temsil eder çünkü indeksler 0'dan başlar.
            }
        }

        protected void btnprofil_Click(object sender, EventArgs e)
        {
            btnprofil.CssClass = "nav-link active";
            btnparola.CssClass = "nav-link";
            panelprofil.Visible = true;
            panelparola.Visible = false;
        }

        protected void btnparola_Click(object sender, EventArgs e)
        {
            btnparola.CssClass = "nav-link active";
            btnprofil.CssClass = "nav-link";
            panelparola.Visible = true;
            panelprofil.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string yparola = yeniparola.Text;
            string ytkrparola = yeniparolatkr.Text;
            if (yparola == ytkrparola)
            {
                try
                {
                    string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
                    SqlConnection db = new SqlConnection(dbbaglanti); db.Open();
                    SqlCommand komut = new SqlCommand("SELECT * FROM Magaza WHERE MagazaID=@magazaID", db);
                    komut.Parameters.AddWithValue("@magazaID", magazaID);
                    SqlDataReader oku;
                    oku = komut.ExecuteReader();
                    if (oku.Read())
                    {
                        oku.Close();
                        SqlCommand newkomut = new SqlCommand("update Magaza set Sifre=@yenisifre where MagazaID=@magazaID", db);
                        newkomut.Parameters.AddWithValue("@magazaID", magazaID);
                        newkomut.Parameters.AddWithValue("@yenisifre", yparola);
                        newkomut.ExecuteNonQuery();
                        Response.Redirect("AnaSayfa.Aspx");

                    }


                    db.Close();
                    db.Dispose();
                }
                catch
                {
                    lblislem.Text = "Eski parolayı yanlış girdiniz";

                }


            }
            else
            {
                lblislem.Text = "Yeni parolalar uyuşmuyor";
            }
        }
    }
}