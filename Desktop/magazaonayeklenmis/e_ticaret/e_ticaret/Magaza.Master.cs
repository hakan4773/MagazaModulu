using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_ticaret
{
    public partial class Magaza : System.Web.UI.MasterPage
    {
        public string id = "";
        public string isim = "";
        public string adres = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Session["MagazaID"].ToString();
            isim = Session["MagazaAdi"].ToString();
            adres = Session["EPosta"].ToString();
            txtisim.Text = txtisim2.Text = isim;

        }
    }
}