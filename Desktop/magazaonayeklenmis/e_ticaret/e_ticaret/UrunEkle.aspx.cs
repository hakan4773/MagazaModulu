using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace e_ticaret
{
    public partial class UrunEkle : System.Web.UI.Page
    {
        private List<TextBox> dinamikTextBoxlar = new List<TextBox>();
        private List<Label> labeller = new List<Label>();

        protected void Page_Load(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            Panel3.Visible = false;
            // Listeyi temizle

            if (!IsPostBack)
            {

                Markalar();
                FillKategoriDropDownList();




            }

            string secilenDeger = DropDownList3.SelectedValue;

            CreateDynamicControls(secilenDeger);
            for (int i = 0; i < labeller.Count; i++)
            {
                Label lbl = (Label)PlaceHolder1.FindControl("Label" + i);
                if (lbl != null)
                {
                    degerler.Add(lbl.Text);

                }

            }
            for (int i = 0; i < dinamikTextBoxlar.Count; i++)
            {
                TextBox txt = (TextBox)PlaceHolder1.FindControl("TextBox" + i);
                if (txt != null)
                {
                    collectedValues.Add(txt.Text);
                }
            }
            ListView1.DataSource = collectedValues;
            ListView1.DataSource = degerler;
            ListView1.DataBind();
            Session["CollectedValues"] = collectedValues;
            Session["Degerler"] = degerler;



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

        private void Markalar()
        {
            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;

            string query = "SELECT MarkaID, Marka FROM Markalar";

            using (SqlConnection connection = new SqlConnection(dbbaglanti))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    DropDownList2.Items.Clear();

                    DropDownList2.Items.Add(new ListItem("-- Marka Seçin --", "0"));
                    while (reader.Read())
                    {
                        ListItem item = new ListItem();
                        item.Text = reader["Marka"].ToString();
                        //item.Value = reader["MarkaID"].ToString();
                        DropDownList2.Items.Add(item);
                    }
                }
            }
        }
        private void FillKategoriDropDownList()
        {
            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
            string query = "SELECT kategori_id, kategori_adi FROM Kategori";

            using (SqlConnection connection = new SqlConnection(dbbaglanti))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    DropDownList1.Items.Clear();

                    DropDownList1.Items.Add(new ListItem("-- Kategori Seçin --", "0"));
                    while (reader.Read())
                    {
                        ListItem item = new ListItem();
                        item.Text = reader["kategori_adi"].ToString();
                        item.Value = reader["kategori_id"].ToString();
                        DropDownList1.Items.Add(item);
                    }
                }
            }
        }




        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList3.Items.Clear();
            FillAltKategoriDropDownList();
        }
        private void FillAltKategoriDropDownList()
        {

            string selectedCategoryId = DropDownList1.SelectedValue;
            if (selectedCategoryId == "0")
            {
                DropDownList1.Items.Clear();
                return;
            }
            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
            string query = "SELECT alt_id, alt_adi FROM Alt_kategori WHERE kategori_id = @kategori_id";

            using (SqlConnection connection = new SqlConnection(dbbaglanti))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@kategori_id", selectedCategoryId);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    DropDownList3.Items.Clear();

                    while (reader.Read())
                    {
                        ListItem item = new ListItem();
                        item.Text = reader["alt_adi"].ToString();
                        item.Value = reader["alt_id"].ToString();
                        DropDownList3.Items.Add(item.ToString());

                    }
                }
            }

        }
        private void CreateDynamicControls(string secilenDeger)
        {


            int altKategoriID;
            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
            string altKategoriIDQuery = "SELECT alt_id FROM Alt_kategori WHERE alt_adi = @alt_adi";

            using (SqlConnection connection = new SqlConnection(dbbaglanti))
            {
                SqlCommand command = new SqlCommand(altKategoriIDQuery, connection);
                command.Parameters.AddWithValue("@alt_adi", secilenDeger);
                connection.Open();

                object result = command.ExecuteScalar();
                if (result != null)
                {
                    altKategoriID = Convert.ToInt32(result);
                }
                else
                {
                    return;
                }
            }
            int urunSayisi = 0;
            string urunSayisiQuery = "SELECT COUNT(*) FROM Ozellikler WHERE AltKategoriID = @AltKategoriID";
            string urunAdlariQuery = "SELECT OzellikAdi FROM Ozellikler WHERE AltKategoriID = @AltKategoriID";
            using (SqlConnection connection = new SqlConnection(dbbaglanti))
            {
                SqlCommand command = new SqlCommand(urunSayisiQuery, connection);
                command.Parameters.AddWithValue("@AltKategoriID", altKategoriID);
                connection.Open();
                urunSayisi = (int)command.ExecuteScalar();
            }

            using (SqlConnection connection = new SqlConnection(dbbaglanti))
            {
                SqlCommand command = new SqlCommand(urunAdlariQuery, connection);
                command.Parameters.AddWithValue("@AltKategoriID", altKategoriID);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    List<string> textBoxIds = new List<string>();

                    int index = 0;

                    while (reader.Read() && index < urunSayisi)
                    {
                        string urunAdi = reader["OzellikAdi"].ToString();
                        Label label = new Label
                        {
                            ID = "Label" + index.ToString(),
                            Text = urunAdi,
                            CssClass = "urunLabel"
                        };
                        labeller.Add(label);
                        PlaceHolder1.Controls.Add(label);

                        TextBox textBox = new TextBox
                        {
                            ID = "TextBox" + index,

                            CssClass = "urunTextBox",

                        };
                        dinamikTextBoxlar.Add(textBox);
                        PlaceHolder1.Controls.Add(textBox);

                        index++;
                    }


                }
            }

        }





        protected void Button1_Click(object sender, EventArgs e)
        {


            string txtozellik = TextArea1.Value;
            string txturunAdi = Textboxurun.Text;
            string txtkategori = DropDownList1.SelectedItem.Text;
            string txtaltKategori = DropDownList3.SelectedValue;
            string txtmarka = DropDownList2.SelectedValue;
            string txtmodelKodu = textboxmodel.Text;
            string txturunkodu = textboxurunkodu.Text;
            string txtfiyat = textboxfiyat.Text;
            string txtstok = textboxstok.Text;

            if (!string.IsNullOrEmpty(txturunAdi) && !string.IsNullOrEmpty(txturunkodu) && !string.IsNullOrEmpty(txtmodelKodu) && !string.IsNullOrEmpty(txtfiyat) && !string.IsNullOrEmpty(txtstok) && !string.IsNullOrEmpty(txtozellik) && !string.IsNullOrEmpty(txtkategori) && !string.IsNullOrEmpty(txtaltKategori))
            {



                Panel1.Visible = false;
                Panel2.Visible = true;

            }



            else
            {
                // Display error message if no sub-category is selected
                Labelsonuc.Text = "Lütfen tüm alanları doldurun.";
            }




        }
        private string SanitizeHtml(string html)
        {
            // Burada basit bir örnek olarak HtmlEncode kullanılıyor.
            return HttpUtility.HtmlEncode(html);
        }
        List<string> collectedValues = new List<string>();

        List<string> degerler = new List<string>();

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {


        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < labeller.Count; i++)
            {
                Label lbl = (Label)PlaceHolder1.FindControl("Label" + i);
                if (lbl != null)
                {
                    degerler.Add(lbl.Text);

                }

            }

            for (int i = 0; i < dinamikTextBoxlar.Count; i++)
            {

                TextBox txt = (TextBox)PlaceHolder1.FindControl("TextBox" + i);

                if (txt != null)
                {
                    collectedValues.Add(txt.Text);

                }
            }
            ListView1.DataSource = collectedValues;
            ListView1.DataBind();
            ListView2.DataSource = degerler;
            Session["CollectedValues"] = collectedValues;
            Session["Degerler"] = degerler;
            Panel2.Visible = false;
            Panel3.Visible = true;

        }




        protected void BackButton_Click(object sender, EventArgs e)
        {
            Panel3.Visible = false;
            Panel2.Visible = true;
        }
        private string GetOzellikIDByUrunAdi(string ozellikadi)
        {

            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
            string ozellikID = null;
            string query = "SELECT OzellikID FROM Ozellikler WHERE OzellikAdi = @OzellikAdi";
            using (SqlConnection connection = new SqlConnection(dbbaglanti))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@OzellikAdi", ozellikadi);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            ozellikID = reader["OzellikID"].ToString();

                        }
                    }
                }
            }
            return ozellikID;
        }
        private string UrunID(string urunadi)
        {

            string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
            string urunID = null;

            string query = "SELECT TOP 1 UrunID FROM Urunler ORDER BY UrunID DESC";
            using (SqlConnection connection = new SqlConnection(dbbaglanti))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UrunAdi", urunadi);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            urunID = reader["UrunID"].ToString();

                        }
                    }
                }
            }
            return urunID;
        }


        private void ClearControls(Control parent)
        {
            foreach (Control c in parent.Controls)
            {
                if (c is TextBox)
                    ((TextBox)c).Text = string.Empty;
                else if (c is DropDownList)
                    ((DropDownList)c).SelectedIndex = -1;
                else if (c is CheckBox)
                    ((CheckBox)c).Checked = false;
                else if (c is HtmlTextArea)
                    ((HtmlTextArea)c).Value = string.Empty;
                else if (c.HasControls())
                    ClearControls(c);
            }
        }

        protected void ConfirmButton_Click(object sender, EventArgs e)
        {
            if (ProductImage.HasFile)
            {

                try
                {
                    string extension = Path.GetExtension(ProductImage.FileName).ToLower();
                    if (extension != ".jpg" && extension != ".jpeg" && extension != ".png")
                    {
                        lblsonuc.Text = "Lütfen sadece JPEG, JPG veya PNG formatında bir resim seçin.";
                        return;
                    }

                    string filename = Path.GetFileName(ProductImage.FileName);
                    string filepath = Server.MapPath("~/resimler/") + filename;
                    string relativePath = "~/resimler/" + filename;

                    if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                    {
                        ProductImage.SaveAs(filepath);
                        lblsonuc.Text = "Resim başarıyla yüklendi!";
                    }
                    else
                    {
                        lblsonuc.Text = "Lütfen bir resim seçin.";
                    }
                    int magazaID = GetMagazaID();

                    //Urun bilgileri
                    string ozellik = TextArea1.Value;
                    string urunAdi = Textboxurun.Text;
                    string kategori = DropDownList1.SelectedItem.Text;
                    string altKategori = DropDownList3.SelectedValue;
                    string marka = DropDownList2.SelectedValue;
                    string modelKodu = textboxmodel.Text;
                    string urunkodu = textboxurunkodu.Text;
                    string fiyat = textboxfiyat.Text;
                    string stok = textboxstok.Text;
                    DateTime tarih = DateTime.Now;



                    string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(dbbaglanti))
                    {
                        con.Open();

                        int? markaID = null;
                        int? kategoriID = null;
                        int? altkategoriID = null;

                        try
                        {
                            if (!string.IsNullOrEmpty(marka))
                            {
                                string markaQuery = "SELECT MarkaID FROM Markalar WHERE Marka = @Marka";
                                using (SqlCommand markaCmd = new SqlCommand(markaQuery, con))
                                {
                                    markaCmd.Parameters.AddWithValue("@Marka", marka);
                                    object result = markaCmd.ExecuteScalar();
                                    if (result != null)
                                    {
                                        markaID = Convert.ToInt32(result);
                                    }
                                }
                            }

                            if (markaID == null)
                            {
                                throw new Exception($"MarkaID bulunamadı veya marka adı geçersiz: {marka}");
                            }

                            if (!string.IsNullOrEmpty(kategori))
                            {
                                string kategoriQuery = "SELECT kategori_id FROM Kategori WHERE kategori_adi = @kategori_adi";
                                using (SqlCommand kategoriCmd = new SqlCommand(kategoriQuery, con))
                                {
                                    kategoriCmd.Parameters.AddWithValue("@kategori_adi", kategori);
                                    object KID = kategoriCmd.ExecuteScalar();
                                    if (KID != null)
                                    {
                                        kategoriID = Convert.ToInt32(KID);
                                    }
                                }
                            }
                            if (!string.IsNullOrEmpty(altKategori))
                            {
                                string altkategoriQuery = "SELECT alt_id FROM Alt_kategori WHERE alt_adi = @alt_adi";
                                using (SqlCommand altkategoriCmd = new SqlCommand(altkategoriQuery, con))
                                {
                                    altkategoriCmd.Parameters.AddWithValue("@alt_adi", altKategori);
                                    object AKID = altkategoriCmd.ExecuteScalar();
                                    if (AKID != null)
                                    {
                                        altkategoriID = Convert.ToInt32(AKID);
                                    }
                                }
                            }

                            if (markaID == null)
                            {
                                throw new Exception($"KategoriID bulunamadı veya marka adı geçersiz: {marka}");
                            }
                            if (kategoriID == null)
                            {
                                throw new Exception($"KategoriID bulunamadı veya marka adı geçersiz: {kategori}");
                            }
                            if (altkategoriID == null)
                            {
                                throw new Exception($"KategoriID bulunamadı veya marka adı geçersiz: {altKategori}");
                            }


                            string urunQuery = "INSERT INTO Urunler (Aciklama, UrunAdi,KategoriID,AltKategoriID, ModelKodu,UrunKodu, Fiyat, Stok, KayıtTarihi, Durum, MarkaID,MagazaID,Resim) VALUES (@Aciklama, @UrunAdi,@KategoriID,@AltKategoriID, @ModelKodu,@UrunKodu,@Fiyat, @Stok, @KayıtTarihi, @Durum, @MarkaID,@MagazaID,@Resim)";
                            using (SqlCommand urunCmd = new SqlCommand(urunQuery, con))
                            {
                                urunCmd.Parameters.AddWithValue("@Aciklama", ozellik);
                                urunCmd.Parameters.AddWithValue("@UrunAdi", urunAdi);
                                urunCmd.Parameters.AddWithValue("@KategoriID", kategoriID);
                                urunCmd.Parameters.AddWithValue("@AltKategoriID", altkategoriID);
                                urunCmd.Parameters.AddWithValue("@ModelKodu", modelKodu);
                                urunCmd.Parameters.AddWithValue("@UrunKodu", urunkodu);
                                urunCmd.Parameters.AddWithValue("@Fiyat", fiyat);
                                urunCmd.Parameters.AddWithValue("@Stok", stok);
                                urunCmd.Parameters.AddWithValue("@KayıtTarihi", tarih);
                                urunCmd.Parameters.AddWithValue("@Durum", 0);
                                urunCmd.Parameters.AddWithValue("@MarkaID", markaID);
                                urunCmd.Parameters.AddWithValue("@MagazaID", magazaID);
                                urunCmd.Parameters.AddWithValue("@Resim", relativePath);
                                urunCmd.ExecuteNonQuery();
                            }
                            string urunadi = Textboxurun.Text;
                            string urunıd = UrunID(urunadi);
                            for (int i = 0; i < degerler.Count; i++)
                            {
                                string ozellikadi = degerler[i];
                                string ozellikDeger = collectedValues[i];
                                DateTime kayıttarihi = DateTime.Now;
                                string ozellikID = GetOzellikIDByUrunAdi(ozellikadi);


                                if (!string.IsNullOrEmpty(ozellikID))
                                {
                                    string ozellikQuery = "INSERT INTO OzellikListe (OzellikID, OzellikDeger,UrunID,KayitTarihi,Durum) VALUES (@OzellikID, @OzellikDeger,@UrunID,@KayitTarihi,@Durum)";
                                    using (SqlConnection ozellikCon = new SqlConnection(dbbaglanti))
                                    {
                                        ozellikCon.Open();
                                        using (SqlCommand ozellikCmd = new SqlCommand(ozellikQuery, ozellikCon))
                                        {
                                            ozellikCmd.Parameters.AddWithValue("@OzellikID", ozellikID);
                                            ozellikCmd.Parameters.AddWithValue("@OzellikDeger", ozellikDeger);
                                            ozellikCmd.Parameters.AddWithValue("@UrunID", urunıd);

                                            ozellikCmd.Parameters.AddWithValue("@KayitTarihi", kayıttarihi);
                                            ozellikCmd.Parameters.AddWithValue("@Durum", 0);

                                            ozellikCmd.ExecuteNonQuery();
                                        }
                                    }
                                }
                            }

                            string Urunıd = UrunID(urunadi);
                            TalepGonder(Urunıd);

                        }
                        catch (Exception ex)
                        {
                            Response.Write("Hata: " + ex.Message);
                        }
                    }






                    Panel3.Visible = false;
                    Panel1.Visible = true;
                    lblsonuc.Text = "Ürün başarıyla yüklendi!";
                    ClearControls(Panel1);
                    ClearControls(Panel2);
                    ClearControls(Panel3);

                    // Geriye kalan dinamik TextBox'ları ve Label'ları temizle
                    dinamikTextBoxlar.Clear();
                    labeller.Clear();


                }

                catch (Exception ex)
                {
                    throw new Exception($"Bir hata oluştu: {ex.Message}", ex);
                }


            }

            else
            {
                lblsonuc.Text = "Lütfen bir resim seçin.";

            }






        }
        private void TalepGonder(string Urunıd)
        {
            try
            {
                string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
                using (SqlConnection con = new SqlConnection(dbbaglanti))
                {
                    con.Open();
                    string TalepQuery = "INSERT INTO Talepler (UrunID,MagazaID,TalepTuru,TalepDurum) VALUES (@UrunID,@MagazaID,@TalepTuru,@TalepDurum)";
                    using (SqlCommand talepCmd = new SqlCommand(TalepQuery, con))
                    {

                        talepCmd.Parameters.AddWithValue("@UrunID", Urunıd);
                        talepCmd.Parameters.AddWithValue("@TalepDurum", 0);
                        talepCmd.Parameters.AddWithValue("@TalepTuru", "ÜrünEkleme");
                        talepCmd.Parameters.AddWithValue("@MagazaID", GetMagazaID());
                        talepCmd.ExecuteNonQuery();
                    }
                }


            }
            catch (Exception ex)
            {
                throw new Exception($"Bir hata oluştu: {ex.Message}", ex);
            }
        }

    }
}