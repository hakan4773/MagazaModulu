<%@ Page Title="" Language="C#" MasterPageFile="~/Magaza.Master" AutoEventWireup="true" CodeBehind="Yorumlar.aspx.cs" Inherits="e_ticaret.Yorumlar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Yorumlar </h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Components</li>
                    <li class="breadcrumb-item active">Cards</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section">
            <div class="row align-items-top">


                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="YorumID">

                
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>Hiçbir veri döndürülmedi.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                
                    <ItemTemplate>
                         <div class="col-lg-12">

                            <!-- Default Card -->
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("ad") %> <%# Eval("soyad") %> adı: "<%# Eval("UrunAdi") %>" kodu: "<%# Eval("UrunID") %>" olan ürüne yorum yaptı</h5>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Yorum") %>'></asp:Label>
                                </div>


                                <div class=" d-grid gap-2 mt-3">
                                    <a class="btn btn-primary mb-2" href="Cevap.aspx?YorumID=<%# Eval("YorumID") %>">Cevapla
                                    </a>
                                </div>
                            </div>
                        </div>
                      

                    </ItemTemplate>

                   
                </asp:ListView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ETicaret %>' SelectCommand="select * from Yorumlar,kullanicilar,urunler where Yorumlar.MusteriID=kullanicilar.kullanici_id and Yorumlar.Durum is NULL and Yorumlar.MagazaID=1"></asp:SqlDataSource>
            </div>
        </section>
        <section class="section">
            <div class="row align-items-top">



                <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="CevapID,YorumID1,MagazaID2">


                    
                    <ItemTemplate>
                          <div class="col-lg-12">

                            <!-- Default Card -->
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("ad") %> <%# Eval("soyad") %> adı: "<%# Eval("UrunAdi") %>" kodu: "<%# Eval("UrunID") %>" olan ürüne yorum yaptı</h5>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Yorum") %>'></asp:Label>
                                </div>


                                <div class="col-lg-8">

                                    <!-- Default Card -->
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Cevabınız</h5>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Cevap") %>'></asp:Label>
                                        </div>



                                    </div>
                                </div>

                            </div>
                        </div>
                        
                    </ItemTemplate>


                </asp:ListView>
             
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ETicaret %>' SelectCommand="select * from Cevaplar,yorumlar,Magaza,Urunler,kullanicilar where Cevaplar.MagazaID=magaza.MagazaID and yorumlar.MagazaID = Magaza.MagazaID and Yorumlar.UrunID = Urunler.UrunID and Urunler.MagazaID = Magaza.MagazaID and yorumlar.YorumID = cevaplar.YorumID and cevaplar.UrunID = Urunler.UrunID and kullanicilar.kullanici_id=Yorumlar.MusteriID and Yorumlar.Durum is not NULL"></asp:SqlDataSource>
            </div>
        </section>


    </main>

</asp:Content>
