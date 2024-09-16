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
    public partial class UrunGuncelleSil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["UrunID"] != null)
                {
                    string urunID = Request.QueryString["UrunID"];
                    int ozellikSayisi = GetOzellikSayisi(urunID);
                    CreateTextBoxesAndLabels(urunID, ozellikSayisi);
                    UrunBilgileriniGetir(urunID);
                }
                else
                {
                    deneme.Text = "ID bulunamadı";
                }
            }
            else
            {
                if (Request.QueryString["UrunID"] != null)
                {
                    string urunID = Request.QueryString["UrunID"];
                    int ozellikSayisi = GetOzellikSayisi(urunID);
                    CreateTextBoxesAndLabels(urunID, ozellikSayisi);
                }
            }
        }

        private int GetOzellikSayisi(string urunID)
        {
            int ozellikSayisi = 0;
            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(dbbaglanti))
                {
                    string query = "SELECT COUNT(*) FROM OzellikListe WHERE UrunID = @UrunID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@UrunID", urunID);
                    connection.Open();
                    ozellikSayisi = (int)command.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Hata: " + ex.Message);
            }

            return ozellikSayisi;
        }

        private void UrunBilgileriniGetir(string urunID)
        {
            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(dbbaglanti))
                {
                    string queryozellikler = "SELECT UrunID, UrunAdi, Aciklama, UrunKodu, ModelKodu, Fiyat, Stok,Resim FROM Urunler WHERE UrunID = @UrunID";
                    SqlCommand command = new SqlCommand(queryozellikler, connection);
                    command.Parameters.AddWithValue("@UrunID", urunID);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        txturunadi.Text = reader["UrunAdi"].ToString();
                        TextArea1.Value = reader["Aciklama"].ToString();
                        txturunkodu.Text = reader["UrunKodu"].ToString();
                        txtmodelkodu.Text = reader["ModelKodu"].ToString();
                        txtfiyat.Text = reader["Fiyat"].ToString();
                        txtstok.Text = reader["Stok"].ToString();
                        string resimYolu = reader["Resim"].ToString();
                        if (!string.IsNullOrEmpty(resimYolu))
                        {
                            // Resmin fiziksel yolunu al
                            string fizikselYol = Server.MapPath(resimYolu);

                            // Resmi doğrudan Image2 kontrolüne yükle
                            Image2.ImageUrl = resimYolu;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Hata: " + ex.Message);
            }
        }
        private List<TextBox> dinamikTextBoxlar = new List<TextBox>();
        private List<Label> labeller = new List<Label>();
        private void CreateTextBoxesAndLabels(string urunID, int ozellikSayisi)
        {
            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(dbbaglanti))
                {
                    string query = "SELECT OzellikListe.OzellikDeger, Ozellikler.OzellikAdi " +
                                                       "FROM OzellikListe " +
                                                       "INNER JOIN Ozellikler ON OzellikListe.OzellikID = Ozellikler.OzellikID " +
                                                       "WHERE OzellikListe.UrunID = @UrunID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@UrunID", urunID);
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();
                    int index = 1;

                    while (reader.Read())
                    {
                        // Label oluştur
                        Label label = new Label
                        {
                            ID = "Label" + index.ToString(),
                            Text = reader["OzellikAdi"].ToString(),
                            CssClass = "urunLabel form-label"
                        };
                        labeller.Add(label);
                        PlaceHolder1.Controls.Add(label);

                        TextBox textBox = new TextBox
                        {
                            ID = "TextBox" + index.ToString(),
                            Text = reader["OzellikDeger"].ToString(),
                            CssClass = "urunTextBox form-control"
                        };
                        dinamikTextBoxlar.Add(textBox);
                        PlaceHolder1.Controls.Add(textBox);

                        PlaceHolder1.Controls.Add(new LiteralControl("<br/>"));

                        index++;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Hata: " + ex.Message);
            }
        }

        private void guncelleozellik(string urunID)
        {
            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(dbbaglanti))
                {
                    connection.Open();



                    // Update OzellikListe table
                    string selectOzellikQuery = "SELECT OzellikListe.OzellikID, Ozellikler.OzellikAdi " +
                                     "FROM OzellikListe " +
                                     "INNER JOIN Ozellikler ON OzellikListe.OzellikID = Ozellikler.OzellikID " +
                                     "WHERE UrunID = @UrunID";
                    SqlCommand selectOzellikCommand = new SqlCommand(selectOzellikQuery, connection);
                    selectOzellikCommand.Parameters.AddWithValue("@UrunID", urunID);

                    Dictionary<string, int> ozellikDict = new Dictionary<string, int>();
                    using (SqlDataReader reader = selectOzellikCommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ozellikDict.Add(reader["OzellikAdi"].ToString(), (int)reader["OzellikID"]);
                        }
                    }

                    // Update OzellikListe table
                    for (int i = 0; i < dinamikTextBoxlar.Count; i++)
                    {
                        TextBox txt = dinamikTextBoxlar[i];
                        string deger = txt.Text;

                        if (ozellikDict.TryGetValue(labeller[i].Text, out int ozellikID))
                        {
                            string updatequery = "UPDATE OzellikListe " +
                                                 "SET OzellikDeger = @OzellikDeger " +
                                                 "WHERE UrunID = @UrunID AND OzellikID = @OzellikID";
                            SqlCommand ozellikguncelle = new SqlCommand(updatequery, connection);
                            ozellikguncelle.Parameters.AddWithValue("@OzellikDeger", deger);
                            ozellikguncelle.Parameters.AddWithValue("@UrunID", urunID);
                            ozellikguncelle.Parameters.AddWithValue("@OzellikID", ozellikID);
                            ozellikguncelle.ExecuteNonQuery();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Hata: " + ex.Message);
            }
        }
        List<string> collectedValues = new List<string>();


        private void degerlerikaydet()
        {


            for (int i = 0; i < dinamikTextBoxlar.Count; i++)
            {

                TextBox txt = (TextBox)PlaceHolder1.FindControl("TextBox" + i);

                if (txt != null)
                {
                    collectedValues.Add(txt.Text);

                }
            }
        }

        private void guncelleUrun(string urunID)
        {
            resim.Text = "";
            deneme.Text = "";
            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(dbbaglanti))
                {
                    connection.Open();
                    using (SqlTransaction transaction = connection.BeginTransaction())
                    {
                        try
                        {

                            string mevcutResimYolu = null;
                            string selectQuery = "SELECT Resim FROM Urunler WHERE UrunID = @UrunID";
                            SqlCommand selectCommand = new SqlCommand(selectQuery, connection, transaction);
                            selectCommand.Parameters.AddWithValue("@UrunID", urunID);
                            using (SqlDataReader reader = selectCommand.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    mevcutResimYolu = reader["Resim"].ToString();
                                }
                            }
                            string query = "UPDATE Urunler " +
                                           "SET UrunAdi = @UrunAdi, Aciklama = @Aciklama, " +
                                           "UrunKodu = @UrunKodu, ModelKodu = @ModelKodu, Fiyat = @Fiyat, Stok = @Stok,Resim=@Resim " +
                                           "WHERE UrunID = @UrunID";
                            SqlCommand command = new SqlCommand(query, connection, transaction);


                            command.Parameters.AddWithValue("@UrunAdi", txturunadi.Text);

                            command.Parameters.AddWithValue("@Aciklama", TextArea1.Value);

                            command.Parameters.AddWithValue("@UrunKodu", txturunkodu.Text);

                            command.Parameters.AddWithValue("@ModelKodu", txtmodelkodu.Text);

                            command.Parameters.AddWithValue("@Fiyat", txtfiyat.Text);

                            command.Parameters.AddWithValue("@Stok", txtstok.Text);






                            if (image1.HasFile)
                            {
                                string dosyaAdi = Path.GetFileName(image1.FileName);
                                string dosyaUzantisi = Path.GetExtension(dosyaAdi).ToLower();
                                if (dosyaUzantisi == ".jpeg" || dosyaUzantisi == ".jpg" || dosyaUzantisi == ".png")
                                {
                                    string yeniResimYolu = "~/resimler/" + dosyaAdi;
                                    string fizikselYol = Server.MapPath(yeniResimYolu);

                                    // Yeni resmi kaydet
                                    image1.SaveAs(fizikselYol);

                                    command.Parameters.AddWithValue("@Resim", yeniResimYolu);

                                    Image2.ImageUrl = yeniResimYolu;
                                }
                                else
                                {
                                    resim.Text = "Yalnızca JPEG ve PNG dosya türleri kabul edilmektedir.";
                                }
                            }
                            else
                            {
                                command.Parameters.AddWithValue("@Resim", mevcutResimYolu);
                            }


                            command.Parameters.AddWithValue("@UrunID", urunID);
                            if (!string.IsNullOrEmpty(txturunadi.Text) && !string.IsNullOrEmpty(TextArea1.Value) && !string.IsNullOrEmpty(txturunkodu.Text) && !string.IsNullOrEmpty(txtfiyat.Text) && !string.IsNullOrEmpty(txtstok.Text))
                            {

                                command.ExecuteNonQuery();
                            }


                            else
                            {

                                deneme.Text = "Ürün Bilgileri Boş Bırakılamaz";
                            }
                            transaction.Commit();
                        }

                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            Console.WriteLine("Hata: " + ex.Message);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Hata: " + ex.Message);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            if (Request.QueryString["UrunID"] != null)
            {
                string urunID = Request.QueryString["UrunID"];
                degerlerikaydet();
                guncelleUrun(urunID);
                guncelleozellik(urunID);
            }
        }
    }
}