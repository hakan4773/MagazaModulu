using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_ticaret
{
    public partial class MagazaKayıt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            // Kullanıcı bilgilerini al
            string username = txtUserName.Text.Trim();
            string email = texttboxemail.Text.Trim();
            string taxNumber = textboxtelefon.Text.Trim();
            string phoneNumber = textboxtelefon.Text.Trim();
            string password = textsifre.Text.Trim();

            // Vergi numarası ve telefon numarasının 11 haneli ve sadece rakam olup olmadığını kontrol et
            if (taxNumber.Length != 11 || !long.TryParse(taxNumber, out _))
            {
                // Hata mesajı göster
                lblMessage.Text = "Vergi numarası 11 haneli ve sadece rakam olmalıdır.";
                return;
            }

            if (phoneNumber.Length != 11 || !long.TryParse(phoneNumber, out _))
            {
                // Hata mesajı göster
                lblMessage.Text = "Telefon numarası 11 haneli ve sadece rakam olmalıdır.";
                return;
            }

            // Veritabanına bağlan ve verileri kaydet
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Magaza (MagazaAdi, Telefon, EPosta, VergiNo, KayıtTarihi, Durum, Sifre) VALUES (@MagazaAdi, @Telefon, @EPosta, @VergiNo, @KayıtTarihi, @Durum, @Sifre)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@MagazaAdi", username);
                cmd.Parameters.AddWithValue("@Telefon", phoneNumber);
                cmd.Parameters.AddWithValue("@EPosta", email);
                cmd.Parameters.AddWithValue("@VergiNo", taxNumber);
                cmd.Parameters.AddWithValue("@KayıtTarihi", DateTime.Now);
                cmd.Parameters.AddWithValue("@Durum", 0); // Durum 0 olarak ayarlanacak
                cmd.Parameters.AddWithValue("@Sifre", password);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Kayıt başarılı!";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Hata: " + ex.Message;
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}