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
    public partial class SiparisAyrinti : System.Web.UI.Page
    {
        string SiparisID = "";
        string magazaID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            magazaID = Session["MagazaID"].ToString();
            SiparisID = Request.QueryString["SiparisID"];



            SqlDataSource1.SelectCommand = "select * from Siparisler,SiparisUrunler,urunler " +
                "where Siparisler.SiparisID=SiparisUrunler.SiparisID " +
                "and SiparisUrunler.UrunID=Urunler.UrunID " +
                "and siparisler.MagazaID= " + magazaID + " " +
                "and Siparisler.SiparisID = " + SiparisID;



            try
            {
                string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
                SqlConnection db = new SqlConnection(dbbaglanti); db.Open();
                SqlCommand komut = new SqlCommand("select adres,Siparisler.Durum from siparisler,SiparisUrunler,kullanicilar,Urunler " +
                    "where Siparisler.KullaniciID=kullanicilar.kullanici_id " +
                    "and Urunler.UrunID=SiparisUrunler.UrunID " +
                    "and Siparisler.SiparisID=@SiparisID", db);


                komut.Parameters.AddWithValue("@SiparisID", SiparisID);
                SqlDataReader oku;
                oku = komut.ExecuteReader();
                if (oku.Read())
                {
                    lbladres.Text = oku[0].ToString();
                    if (oku[1].ToString() != "Beklemede")
                    {
                        Onayla.Visible = false;
                        Reddet.Visible = false;
                    }

                }

                oku.Close();
                db.Close();
                db.Dispose();
            }
            catch
            {


            }

        }

        protected void Onayla_Click(object sender, EventArgs e)
        {
            try
            {
                string komut = "select Siparisler.Durum from siparisler,SiparisUrunler,kullanicilar " +
                    "where Siparisler.SiparisID = SiparisUrunler.SiparisID " +
                    "and Siparisler.KullaniciID = kullanicilar.kullanici_id " +
                    "and Siparisler.MagazaID = " + magazaID + " " +
                    "and Siparisler.SiparisID = " + SiparisID;
                string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
                SqlConnection db = new SqlConnection(dbbaglanti); db.Open();
                SqlCommand komut1 = new SqlCommand(komut, db);
                SqlDataReader oku;
                oku = komut1.ExecuteReader();
                if (oku.Read())
                {
                    if (oku[0].ToString() == "Beklemede")
                    {
                        oku.Close();

                        SqlCommand newkomut = new SqlCommand("update Siparisler set Durum=@yenidurum where SiparisID = @SiparisID", db);

                        newkomut.Parameters.AddWithValue("@yenidurum", "Hazırlanıyor");
                        newkomut.Parameters.AddWithValue("@SiparisID", SiparisID);
                        newkomut.ExecuteNonQuery();


                    }
                    db.Close();
                    db.Dispose();
                    Response.Redirect("Siparis.aspx");

                }

            }
            catch (Exception)
            {


            }
        }

        protected void Reddet_Click(object sender, EventArgs e)
        {
            try
            {
                string komut = "select Siparisler.Durum from siparisler,SiparisUrunler,kullanicilar " +
                    "where Siparisler.SiparisID = SiparisUrunler.SiparisID " +
                    "and Siparisler.KullaniciID = kullanicilar.kullanici_id " +
                    "and Siparisler.MagazaID = " + magazaID + " " +
                    "and Siparisler.SiparisID = " + SiparisID;

                string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
                SqlConnection db = new SqlConnection(dbbaglanti); db.Open();
                SqlCommand komut1 = new SqlCommand(komut, db);
                SqlDataReader oku;
                oku = komut1.ExecuteReader();
                if (oku.Read())
                {
                    if (oku[0].ToString() == "Beklemede")
                    {
                        oku.Close();

                        SqlCommand newkomut = new SqlCommand("update Siparisler set Durum=@yenidurum where SiparisID = @SiparisID", db);

                        newkomut.Parameters.AddWithValue("@yenidurum", "İptal");
                        newkomut.Parameters.AddWithValue("@SiparisID", SiparisID);
                        newkomut.ExecuteNonQuery();


                    }
                    db.Close();
                    db.Dispose();
                    Response.Redirect("Siparis.aspx");

                }

            }
            catch (Exception)
            {

                Onayla.Text = SiparisID.ToString();

            }
        }
    }
}