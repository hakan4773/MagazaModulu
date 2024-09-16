using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_ticaret
{
    public partial class Yorumlar : System.Web.UI.Page
    {
        string magazaID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            magazaID = Session["MagazaID"].ToString();
            SqlDataSource2.SelectCommand = "select * from Cevaplar,yorumlar,Magaza,Urunler,kullanicilar " +
                "where Cevaplar.MagazaID=magaza.MagazaID " +
                "and yorumlar.MagazaID = Magaza.MagazaID " +
                "and Yorumlar.UrunID = Urunler.UrunID " +
                "and Urunler.MagazaID = Magaza.MagazaID " +
                "and yorumlar.YorumID = cevaplar.YorumID " +
                "and cevaplar.UrunID = Urunler.UrunID " +
                "and kullanicilar.kullanici_id=Yorumlar.MusteriID " +
                "and Yorumlar.Durum is not NULL " +
                "and Cevaplar.MagazaID=" + magazaID;

            SqlDataSource1.SelectCommand = "select * from Yorumlar,kullanicilar,urunler " +
                "where Yorumlar.MusteriID=kullanicilar.kullanici_id " +
                "and Yorumlar.Durum is NULL " +
                "and Yorumlar.MagazaID=" + magazaID;


        }
    }
}