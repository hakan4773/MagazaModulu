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
    public partial class Cevap : System.Web.UI.Page
    {
        string YorumID = "";
        string magazaID = "";
        string urunID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            magazaID = Session["MagazaID"].ToString();
            YorumID = Request.QueryString["YorumID"];

            try
            {
                string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
                SqlConnection db = new SqlConnection(dbbaglanti); db.Open();
                SqlCommand komut = new SqlCommand("select * from Yorumlar,kullanicilar,urunler " +
                    "where Yorumlar.MusteriID=kullanicilar.kullanici_id " +
                    "and Yorumlar.Durum is NULL and Yorumlar.YorumID=@YorumID ", db);





                komut.Parameters.AddWithValue("@YorumID", YorumID);
                SqlDataReader oku;
                oku = komut.ExecuteReader();
                if (oku.Read())
                {
                    Yorum.Text = oku["ad"].ToString() + " " + oku["soyad"].ToString() + " adı: " + oku["UrunAdi"].ToString() + " kodu: " + oku["UrunID"].ToString() + " olan ürüne yorum yaptı";
                    Yorumtxt.Text = oku["Yorum"].ToString();
                    urunID = oku["UrunID"].ToString();
                }

                oku.Close();
                db.Close();
                db.Dispose();
            }
            catch
            {


            }
        }



        protected void Cevaplabtn_Click(object sender, EventArgs e)
        {
            try
            {
                string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
                SqlConnection db = new SqlConnection(dbbaglanti);
                SqlCommand komut = new SqlCommand("insert into Cevaplar values(@YorumID,@MagazaID,@UrunID,@Cevap,@Durum)", db);
                SqlCommand komut2 = new SqlCommand("update Yorumlar set Durum=1 where YorumID=@YorumID", db);
                komut.Parameters.AddWithValue("@YorumID", YorumID);
                komut.Parameters.AddWithValue("@MagazaID", magazaID);
                komut.Parameters.AddWithValue("@UrunID", urunID);
                komut.Parameters.AddWithValue("@Cevap", Cevaptxt.Text);
                komut.Parameters.AddWithValue("@Durum", 1);

                komut2.Parameters.AddWithValue("@YorumID", YorumID);

                db.Open();
                komut.ExecuteNonQuery();
                komut2.ExecuteNonQuery();
                db.Close();
                Response.Redirect("Yorumlar.aspx");
            }
            catch (Exception)
            {
                Response.Write("ekleme bağlantı hatası");
            }
        }
    }
}