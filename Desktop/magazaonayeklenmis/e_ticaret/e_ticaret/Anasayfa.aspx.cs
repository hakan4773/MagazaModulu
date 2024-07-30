using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_ticaret
{
    public partial class Anasayfa : System.Web.UI.Page
    {
        string magazaID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            magazaID = Session["MagazaID"].ToString();

            if (Page.IsPostBack == false)
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM Siparisler,kullanicilar WHERE SiparisTarihi >= DATEADD(day, -1, GETDATE()) and KullaniciID=kullanici_id and MagazaID= " + magazaID;
                SqlDataSource2.SelectCommand = "SELECT TOP 5 u.UrunAdi, SUM(su.Miktar) AS ToplamSatisAdeti, SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID JOIN Urunler u ON su.UrunID = u.UrunID WHERE u.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(day, -1, GETDATE()) GROUP BY u.UrunAdi ORDER BY ToplamSatisAdeti DESC;";
                SqlDataSource3.SelectCommand = "SELECT SUM(su.Miktar) AS ToplamSatisAdeti FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID =" + magazaID + " AND s.SiparisTarihi >= DATEADD(DAY, -1, GETDATE());";
                SqlDataSource4.SelectCommand = "SELECT SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(DAY, -1, GETDATE());";
                SqlDataSource5.SelectCommand = "SELECT COUNT(DISTINCT s.KullaniciID) AS ToplamMusteriSayisi FROM Siparisler s WHERE s.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(DAY, -1, GETDATE());";

            }

        }

        protected void btnbugun_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Siparisler,kullanicilar WHERE SiparisTarihi >= DATEADD(day, -1, GETDATE()) and KullaniciID=kullanici_id and MagazaID= " + magazaID;
            SqlDataSource2.SelectCommand = "SELECT TOP 5 u.UrunAdi, SUM(su.Miktar) AS ToplamSatisAdeti, SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID JOIN Urunler u ON su.UrunID = u.UrunID WHERE u.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(day, -1, GETDATE()) GROUP BY u.UrunAdi ORDER BY ToplamSatisAdeti DESC;";
            SqlDataSource3.SelectCommand = "SELECT SUM(su.Miktar) AS ToplamSatisAdeti FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID =" + magazaID + " AND s.SiparisTarihi >= DATEADD(DAY, -1, GETDATE());";
            SqlDataSource4.SelectCommand = "SELECT SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(DAY, -1, GETDATE());";
            SqlDataSource5.SelectCommand = "SELECT COUNT(DISTINCT s.KullaniciID) AS ToplamMusteriSayisi FROM Siparisler s WHERE s.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(DAY, -1, GETDATE());";
        }

        protected void btnhafta_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Siparisler,kullanicilar WHERE SiparisTarihi >= DATEADD(week, -1, GETDATE()) and KullaniciID=kullanici_id and MagazaID=" + magazaID;
            SqlDataSource2.SelectCommand = "SELECT TOP 5 u.UrunAdi, SUM(su.Miktar) AS ToplamSatisAdeti, SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID JOIN Urunler u ON su.UrunID = u.UrunID WHERE u.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(week, -1, GETDATE()) GROUP BY u.UrunAdi ORDER BY ToplamSatisAdeti DESC;";
            SqlDataSource3.SelectCommand = "SELECT SUM(su.Miktar) AS ToplamSatisAdeti FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID =" + magazaID + " AND s.SiparisTarihi >= DATEADD(WEEK, -1, GETDATE());";
            SqlDataSource4.SelectCommand = "SELECT SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(WEEK, -1, GETDATE());";
            SqlDataSource5.SelectCommand = "SELECT COUNT(DISTINCT s.KullaniciID) AS ToplamMusteriSayisi FROM Siparisler s WHERE s.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(WEEK, -1, GETDATE());";
        }

        protected void btnay_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Siparisler,kullanicilar WHERE SiparisTarihi >= DATEADD(month, -1, GETDATE()) and KullaniciID=kullanici_id and MagazaID= " + magazaID;
            SqlDataSource2.SelectCommand = "SELECT TOP 5 u.UrunAdi, SUM(su.Miktar) AS ToplamSatisAdeti, SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID JOIN Urunler u ON su.UrunID = u.UrunID WHERE u.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(month, -1, GETDATE()) GROUP BY u.UrunAdi ORDER BY ToplamSatisAdeti DESC;";
            SqlDataSource3.SelectCommand = "SELECT SUM(su.Miktar) AS ToplamSatisAdeti FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID =" + magazaID + " AND s.SiparisTarihi >= DATEADD(MONTH, -1, GETDATE());";
            SqlDataSource4.SelectCommand = "SELECT SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(MONTH, -1, GETDATE());";
            SqlDataSource5.SelectCommand = "SELECT COUNT(DISTINCT s.KullaniciID) AS ToplamMusteriSayisi FROM Siparisler s WHERE s.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(MONTH, -1, GETDATE());";
        }

        protected void btnyil_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Siparisler,kullanicilar WHERE SiparisTarihi >= DATEADD(year, -1, GETDATE()) and KullaniciID=kullanici_id and MagazaID= " + magazaID;
            SqlDataSource2.SelectCommand = "SELECT TOP 5 u.UrunAdi, SUM(su.Miktar) AS ToplamSatisAdeti, SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID JOIN Urunler u ON su.UrunID = u.UrunID WHERE u.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(year, -1, GETDATE()) GROUP BY u.UrunAdi ORDER BY ToplamSatisAdeti DESC;";
            SqlDataSource3.SelectCommand = "SELECT SUM(su.Miktar) AS ToplamSatisAdeti FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID =" + magazaID + " AND s.SiparisTarihi >= DATEADD(YEAR, -1, GETDATE());";
            SqlDataSource4.SelectCommand = "SELECT SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(YEAR, -1, GETDATE());";
            SqlDataSource5.SelectCommand = "SELECT COUNT(DISTINCT s.KullaniciID) AS ToplamMusteriSayisi FROM Siparisler s WHERE s.MagazaID = " + magazaID + " AND s.SiparisTarihi >= DATEADD(YEAR, -1, GETDATE());";
        }
    }
}