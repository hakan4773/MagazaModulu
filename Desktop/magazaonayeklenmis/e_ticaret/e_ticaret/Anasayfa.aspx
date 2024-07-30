<%@ Page Title="" Language="C#" MasterPageFile="~/Magaza.Master" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="e_ticaret.Anasayfa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <main id="main" class="main">

        <div class="pagetitle">
            <h1>Dashboard</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
                <div class="btn-group" role="group" aria-label="Basic example">
                    <asp:Button ID="btnbugun" CssClass="btn btn-primary" runat="server" Text="Bugün" OnClick="btnbugun_Click" />
                    <asp:Button ID="btnhafta" CssClass="btn btn-primary" runat="server" Text="Bu Hafta" OnClick="btnhafta_Click" />
                    <asp:Button ID="btnay" CssClass="btn btn-primary" runat="server" Text="Bu Ay" OnClick="btnay_Click" />
                    <asp:Button ID="btnyil" CssClass="btn btn-primary" runat="server" Text="Bu Yıl" OnClick="btnyil_Click" />
                </div>
            </nav>

        </div>
        <!-- End Page Title -->

        <section class="section dashboard">
            <div class="row">

                <!-- Left side columns -->
                <div class="col-lg-12">
                    <div class="row">

                        <!-- Sales Card -->
                        <div class="col-xxl-4 col-md-6">
                            <div class="card info-card sales-card">


                                <div class="card-body">
                                    <h5 class="card-title">Satış </h5>

                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="bi bi-cart"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>
                                                <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource3">



                                                    <EmptyDataTemplate>
                                                        <table runat="server" style="">
                                                            <tr>
                                                                <td>Hiçbir veri döndürülmedi.</td>
                                                            </tr>
                                                        </table>
                                                    </EmptyDataTemplate>



                                                    <ItemTemplate>
                                                        <tr style="">
                                                            <td>
                                                                <asp:Label Text='<%# Eval("ToplamSatisAdeti") %>' runat="server" ID="ToplamSatisAdetiLabel" /></td>
                                                        </tr>
                                                    </ItemTemplate>

                                                </asp:ListView>
                                                Adet</h6>
                                            <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- End Sales Card -->

                        <!-- Revenue Card -->
                        <div class="col-xxl-4 col-md-6">
                            <div class="card info-card revenue-card">
                                <div class="card-body">
                                    <h5 class="card-title">Satış Ciro</h5>

                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="bi bi-currency-dollar"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>
                                                <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource4">

                                                    <EmptyDataTemplate>
                                                        <table runat="server" style="">
                                                            <tr>
                                                                <td>Hiçbir veri döndürülmedi.</td>
                                                            </tr>
                                                        </table>
                                                    </EmptyDataTemplate>

                                                    <ItemTemplate>
                                                        <tr style="">
                                                            <td>
                                                                <asp:Label Text='<%# Eval("ToplamSatisTutari") %>' runat="server" ID="ToplamSatisTutariLabel" /></td>
                                                        </tr>
                                                    </ItemTemplate>

                                                </asp:ListView>
                                                TL</h6>
                                            <span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">increase</span>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- End Revenue Card -->

                        <!-- Customers Card -->
                        <div class="col-xxl-4 col-xl-12">

                            <div class="card info-card customers-card">
                                <div class="card-body">
                                    <h5 class="card-title">Müşreriler </h5>

                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="bi bi-people"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>
                                                <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource5">

                                                    <EmptyDataTemplate>
                                                        <table runat="server" style="">
                                                            <tr>
                                                                <td>Hiçbir veri döndürülmedi.</td>
                                                            </tr>
                                                        </table>
                                                    </EmptyDataTemplate>

                                                    <ItemTemplate>
                                                        <h6>
                                                            <asp:Label Text='<%# Eval("ToplamMusteriSayisi") %>' runat="server" ID="ToplamMusteriSayisiLabel" />
                                                            Adet</h6>

                                                    </ItemTemplate>

                                                </asp:ListView>
                                                <asp:Label ID="lblmusteri" runat="server" Text="müşteri adet"></asp:Label></h6>
                                            <span class="text-danger small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">decrease</span>

                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <!-- End Customers Card -->


















                        <!-- Recent Sales -->
                        <div class="col-12">
                            <div class="card recent-sales overflow-auto">
                                <div class="card-body">
                                    <h5 class="card-title">Son Siparişler</h5>

                                    <table class="table table-borderless datatable">
                                        <thead>
                                            <tr>
                                                <th scope="col">Müsteri Adı</th>
                                                <th scope="col">Telefon</th>
                                                <th scope="col">E-Posta</th>
                                                <th scope="col">Sipariş Tutarı</th>
                                                <th scope="col">Sipariş Tarihi</th>
                                                <th scope="col">Durum</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="SiparisID">



                                                <EmptyDataTemplate>
                                                    <table runat="server" style="">
                                                        <tr>
                                                            <td>Hiçbir veri döndürülmedi.</td>
                                                        </tr>
                                                    </table>
                                                </EmptyDataTemplate>


                                                <ItemTemplate>
                                                   <tr style="">
                                                        <td scope="row">
                                                            <asp:Label Text='<%# Eval("ad") %>' runat="server" ID="SiparisIDLabel" />
                                                            <asp:Label Text='<%# Eval("soyad") %>' runat="server" ID="soyadLabel" />
                                                        </td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("telefon") %>' runat="server" ID="KullaniciIDLabel" /></td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("mail") %>' runat="server" ID="mailLabel" /></td>

                                                        <td>
                                                            <asp:Label Text='<%# Eval("ToplamTutar") %>' runat="server" ID="ToplamTutarLabel" /></td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("SiparisTarihi") %>' runat="server" ID="SiparisTarihiLabel" /></td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("Durum") %>' runat="server" ID="DurumLabel" /></td>
                                                        
                                                    </tr>
                                                </ItemTemplate>

                                            </asp:ListView>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ETicaret %>' SelectCommand="SELECT * FROM Siparisler,kullanicilar WHERE SiparisTarihi >= DATEADD(day, -1, GETDATE()) and KullaniciID=kullanici_id and MagazaID=1"></asp:SqlDataSource>


                                        </tbody>
                                    </table>

                                </div>

                            </div>
                        </div>
                        <!-- End Recent Sales -->

                        <!-- Top Selling -->
                        <div class="col-12">
                            <div class="card top-selling overflow-auto">
                                <div class="card-body pb-0">
                                    <h5 class="card-title">En Çok Satılanlar</h5>

                                    <table class="table table-borderless">
                                        <thead>
                                            <tr>
                                                <th scope="col">Urun Adı</th>
                                                <th scope="col">Adet</th>
                                                <th scope="col">Satış</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">



                                               
                                                <EmptyDataTemplate>
                                                    <table runat="server" style="">
                                                        <tr>
                                                            <td>Hiçbir veri döndürülmedi.</td>
                                                        </tr>
                                                    </table>
                                                </EmptyDataTemplate>

                                              
                                                <ItemTemplate>
                                                    <tr style="">
                                                        <td>
                                                            <asp:Label Text='<%# Eval("UrunAdi") %>' runat="server" ID="UrunAdiLabel" /></td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("ToplamSatisAdeti") %>' runat="server" ID="ToplamSatisAdetiLabel" /></td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("ToplamSatisTutari") %>' runat="server" ID="ToplamSatisTutariLabel" /></td>
                                                    </tr>
                                                </ItemTemplate>


                                            </asp:ListView>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ETicaret %>' SelectCommand="SELECT TOP 5 u.UrunAdi, SUM(su.Miktar) AS ToplamSatisAdeti, SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID JOIN Urunler u ON su.UrunID = u.UrunID WHERE u.MagazaID = 1 AND s.SiparisTarihi >= DATEADD(day, -1, GETDATE()) GROUP BY u.UrunAdi ORDER BY ToplamSatisAdeti DESC;"></asp:SqlDataSource>

                                        </tbody>
                                    </table>

                                </div>

                            </div>
                        </div>
                        <!-- End Top Selling -->

                    </div>
                </div>
                <!-- End Left side columns -->


            </div>
        </section>

    </main>
    <!-- End #main -->
    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ETicaret %>' SelectCommand="SELECT SUM(su.Miktar) AS ToplamSatisAdeti FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID =1 AND s.SiparisTarihi >= DATEADD(DAY, -1, GETDATE());"></asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ETicaret %>' SelectCommand="SELECT SUM(su.Miktar * su.Fiyat) AS ToplamSatisTutari FROM SiparisUrunler su JOIN Siparisler s ON su.SiparisID = s.SiparisID WHERE s.MagazaID = 1 AND s.SiparisTarihi >= DATEADD(DAY, -1, GETDATE());"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:ETicaret %>' SelectCommand="SELECT COUNT(DISTINCT s.KullaniciID) AS ToplamMusteriSayisi FROM Siparisler s WHERE s.MagazaID = 1 AND s.SiparisTarihi >= DATEADD(DAY, -1, GETDATE());"></asp:SqlDataSource>

</asp:Content>
