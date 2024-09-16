<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim.Master" AutoEventWireup="true" CodeBehind="sifredegistir.aspx.cs" Inherits="e_ticaret.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main" class="column">
    <div id="UpdatePanel1">
        <div id="KayitTamam" class="alert_success" style="display: none;">
            <span id="KayitTamamLbl"></span>
        </div>
        <div id="HataVar" class="alert_error" style="display: none;">
            <span id="HataLbl"> Hata !! Lütfen bilgileri kontrol edip tekrar deneyiniz !</span>
        </div>
        <article class="module width_full">
            <header>
                <h3>şifre işlemleri</h3>
            </header>
           <div class="module_content" style="height: auto;">
                <fieldset>
                    <label class="labelfiel">Şifre</label>
                    <asp:TextBox ID="SifreDegistirBox" runat="server" CssClass="textfield" Width="410px" TextMode="Password"></asp:TextBox>
                </fieldset>
                <footer>
                    <div class="submit_link">
                        <asp:Button ID="SifreDegistir_Btn" runat="server" Text="Şifre Değiştir" CssClass="alt_btn" OnClick="SifreDegistir_Btn_Click" />
                    </div>
                </footer>
                <br />
                <br />
                <h4 id="KayitTamam" runat="server" class="alert_success" style="display: none;">
                    <asp:Label ID="KayitTamamLbl" runat="server" ></asp:Label>
                </h4>
                <h4 id="HataVar" runat="server" class="alert_error" style="display: none;">
                    <asp:Label ID="HataLbl" runat="server"> Hata !! Lütfen bilgileri kontrol edip tekrar deneyiniz !</asp:Label>
                </h4>
            </div>
        </article>
        <div class="clear"></div>
    </div>
</section>

</asp:Content>
