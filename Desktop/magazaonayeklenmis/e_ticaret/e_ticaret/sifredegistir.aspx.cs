using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_ticaret
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SifreDegistir_Btn_Click(object sender, EventArgs e)
        {
            // Yeni şifreyi al
            string yeniSifre = SifreDegistirBox.Text;

            // Veritabanında şifreyi güncelle
            if (GuncelleSifre(yeniSifre))
            {
                // Şifre başarıyla güncellendiğinde kullanıcıya bilgi ver
                string script = "alert('Şifreniz başarıyla güncellendi!');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
            else
            {
                // Şifre güncelleme başarısız olduğunda kullanıcıya bilgi ver
                HataVar.Visible = true;
                HataLbl.Text = "Şifre güncelleme işlemi başarısız oldu. Lütfen tekrar deneyin!";
            }
        }

        private bool GuncelleSifre(string yeniSifre)
        {
            // Veritabanı bağlantı dizesini burada tanımlayın
            string connectionString = "Data Source=LAPTOP-LH9FG425\\SQLEXPRESS;Initial Catalog=eticaret;Integrated Security=True";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Veritabanı bağlantısını aç
                    connection.Open();

                    // Veritabanında şifreyi güncellemek için bir SQL sorgusu hazırla
                    string query = "UPDATE admin SET sifre = @YeniSifre";

                    // SQL komutunu hazırla
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Parametreleri ekle
                        command.Parameters.AddWithValue("@YeniSifre", yeniSifre);

                        // Komutu çalıştır
                        int rowsAffected = command.ExecuteNonQuery();

                        // Eğer hiç satır etkilenmediyse (yani, bir hata oluştuysa), false döndür
                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Hata oluştuğunda burada işlenir ve false döndürülür.
                // Hata mesajı loglanabilir veya kullanıcıya bildirilebilir.
                return false;
            }
        }
    }
}