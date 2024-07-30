using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_ticaret
{
    public partial class UrunDuzenle : System.Web.UI.Page
    {

        string islem = "";
        string urunID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                islem = Request.QueryString["islem"];

                if (islem == "Sil")
                {
                    urunID = Request.QueryString["UrunID"];

                    string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
                    SqlConnection db = new SqlConnection(dbbaglanti); db.Open();


                    string komut = "UPDATE Urunler SET Durum = 2 WHERE UrunID = " + urunID;
                    SqlCommand komut1 = new SqlCommand(komut, db);
                    komut1.ExecuteNonQuery();



                }


                LoadProducts();

            }
        }

        public int GetMagazaID()
        {

            if (Session["MagazaID"] != null)
            {
                return Convert.ToInt32(Session["MagazaID"]);
            }
            else
            {
                throw new Exception("MagazaID session'da bulunamadı.");
            }

        }




        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                string urunID = e.CommandArgument.ToString();
                Response.Redirect("UrunGuncelleSil.aspx?UrunID=" + urunID);
            }
        }

        List<Product> productList = new List<Product>();


        private void LoadProducts()
        {
            int magazaID = GetMagazaID();
            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(dbbaglanti))
            {

                string query = "SELECT UrunID, MagazaID, UrunAdi, Aciklama, UrunKodu, Fiyat, Stok, Resim FROM Urunler WHERE Durum = 1";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                var productList = new List<Product>();

                while (reader.Read())
                {
                    int MagazaID = Convert.ToInt32(reader["MagazaID"]);
                    if (magazaID == MagazaID)
                    {

                        var product = new Product
                        {
                            UrunID = reader["UrunID"].ToString(),
                            UrunAdi = reader["UrunAdi"].ToString(),
                            Aciklama = reader["Aciklama"].ToString(),
                            UrunKodu = reader["UrunKodu"].ToString(),
                            Fiyat = reader["Fiyat"].ToString(),
                            Stok = reader["Stok"].ToString(),
                            Resim = ResolveUrl(reader["Resim"].ToString())
                        };

                        productList.Add(product);
                    }
                }

                reader.Close();

                Repeater1.DataSource = productList;
                Repeater1.DataBind();
            }
        }

        public class Product
        {
            public string MagazaID { get; set; }

            public string UrunID { get; set; }
            public string UrunAdi { get; set; }
            public string Aciklama { get; set; }
            public string UrunKodu { get; set; }
            public string Fiyat { get; set; }
            public string Stok { get; set; }
            public string Resim { get; set; }
        }
    }
}