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
    public partial class Talepler : System.Web.UI.Page
    {
        string islem = "";
        string magazaID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            magazaID = Session["MagazaID"].ToString();

            try
            {
                string komuttum = "SELECT  COUNT(*) FROM  talepler WHERE MagazaID=" + magazaID;
                string komutonay = "SELECT  COUNT(*) FROM  talepler WHERE MagazaID=" + magazaID + " and TalepDurum = 'onaylandı' GROUP BY  TalepDurum;";
                string komutbekle = "SELECT  COUNT(*) FROM  talepler WHERE MagazaID=" + magazaID + " and TalepDurum = 'beklemede' GROUP BY  TalepDurum;";
                string komutred = "SELECT  COUNT(*) FROM  talepler WHERE MagazaID=" + magazaID + " and TalepDurum = 'onaylanmadı' GROUP BY  TalepDurum;";
                string dbbaglanti = ConfigurationManager.ConnectionStrings["ETicaret"].ConnectionString;
                SqlConnection db = new SqlConnection(dbbaglanti); db.Open();
                SqlCommand komut1 = new SqlCommand(komuttum, db);
                SqlCommand komut2 = new SqlCommand(komutonay, db);
                SqlCommand komut3 = new SqlCommand(komutbekle, db);
                SqlCommand komut4 = new SqlCommand(komutred, db);


                SqlDataReader oku;
                oku = komut1.ExecuteReader();
                if (oku.Read())
                {
                    TumTalep.Text = oku[0].ToString();
                }
                oku.Close();
                oku = komut2.ExecuteReader();
                if (oku.Read())
                {
                    OnayTalep.Text = oku[0].ToString();
                }
                oku.Close();
                oku = komut3.ExecuteReader();
                if (oku.Read())
                {
                    BeklemeTalep.Text = oku[0].ToString();
                }
                oku.Close();
                oku = komut4.ExecuteReader();
                if (oku.Read())
                {
                    RedTalep.Text = oku[0].ToString();
                }
                oku.Close();

                db.Close();
                db.Dispose();
            }
            catch
            {


            }
            if (Page.IsPostBack == false)
            {
                islem = Request.QueryString["islem"];
            }
            if (islem == "Tum")
            {
                SqlDataSource1.SelectCommand = "select * from talepler WHERE MagazaID=" + magazaID;
            }
            else if (islem == "Onay")
            {
                SqlDataSource1.SelectCommand = "select * from talepler WHERE MagazaID=" + magazaID + " and TalepDurum='onaylandı'";

            }
            else if (islem == "Bekle")
            {
                SqlDataSource1.SelectCommand = "select * from talepler WHERE MagazaID=" + magazaID + " and TalepDurum='beklemede'";
            }
            else if (islem == "Red")
            {
                SqlDataSource1.SelectCommand = "select * from talepler WHERE MagazaID=" + magazaID + " and TalepDurum='onaylanmadı'";

            }
            else
            {
                SqlDataSource1.SelectCommand = "select * from talepler WHERE MagazaID=" + magazaID;

            }

        }
    }
}