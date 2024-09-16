<%@ Page Title="" Language="C#" MasterPageFile="~/Magaza.Master" AutoEventWireup="true" CodeBehind="Siparis.aspx.cs" Inherits="e_ticaret.Siparis" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <main id="main" class="main">

        <div class="pagetitle">
            <h1>Siparis</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Mağaza</a></li>
                    <li class="breadcrumb-item">Components</li>
                    <li class="breadcrumb-item active">Siparis</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Siparis</h5>


                        <a class="btn btn-primary mb-2" href="Siparis.aspx?islem=Tum">Tüm Siparişler
                            <asp:Label CssClass="badge bg-white text-primary" ID="TumSiparis" runat="server"></asp:Label>
                        </a>
                        <a class="btn btn-success mb-2" href="Siparis.aspx?islem=Bekleyen">Bekleyen
                            <asp:Label CssClass="badge bg-white text-success" ID="BekleyenSiparis" runat="server"></asp:Label>
                        </a>
                        <a class="btn btn-warning mb-2" href="Siparis.aspx?islem=Hazırlaniyor">Hazırlanıyor
                            <asp:Label CssClass="badge bg-white text-warning" ID="HazirlaniyorSiparis" runat="server"></asp:Label>
                        </a>
                        <a class="btn btn-secondary mb-2" href="Siparis.aspx?islem=Kargo">Kargoda
                            <asp:Label CssClass="badge bg-white text-secondary" ID="KargodaSiparis" runat="server"></asp:Label>
                        </a>
                        <a class="btn btn-info mb-2" href="Siparis.aspx?islem=Teslim">Teslim Edilen
                            <asp:Label CssClass="badge bg-white text-info" ID="TeslimSiparis" runat="server"></asp:Label>
                        </a>
                        <a class="btn btn-danger mb-2" href="Siparis.aspx?islem=Iptal">İptal Edilen
                            <asp:Label CssClass="badge bg-white text-danger" ID="IptalSiparis" runat="server"></asp:Label>
                        </a>

                    </div>
                </div>
                <!-- End Button Badges -->
            </div>
        </section>
        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Default Table</h5>

                            <!-- Default Table -->
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Bordered Table</h5>
                                    <!-- Bordered Table -->
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col">Siparis Tarihi</th>
                                                <th scope="col">Ad Soyad</th>
                                                <th scope="col">Teslimat Adresi</th>
                                                <th scope="col">Toplam Fiyat</th>
                                                <th scope="col">Durum</th>
                                                <th></th>
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
                                                        
                                                        <td>
                                                            <asp:Label Text='<%# Eval("SiparisTarihi") %>' runat="server" ID="SiparisTarihLabel" /></td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("ad") %>' runat="server" ID="MusteriAdiLabel" />
                                                            <asp:Label Text='<%# Eval("soyad") %>' runat="server" ID="MusteriSoyadiLabel" /></td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("adres") %>' runat="server" ID="TeslimatAdresiLabel" /></td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("ToplamTutar") %>' runat="server" ID="ToplamFiyatLabel" /></td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("Durum") %>' runat="server" ID="Label1" /></td>
                                                        <td>
                                                            <a class="btn btn-success mb-2" href="SiparisAyrinti.aspx?SiparisID=<%# Eval("SiparisID") %>">Siparişi görüntüle
                                                            </a></td>
                                                    </tr>
                                                </ItemTemplate>
                                               
                                            </asp:ListView>


                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ETicaret %>' SelectCommand="SELECT SiparisTarihi,ad,soyad,adres,ToplamTutar,Durum,SiparisID FROM Siparisler,kullanicilar WHERE KullaniciID=kullanici_id and MagazaID=1"></asp:SqlDataSource>



                                        </tbody>
                                    </table>
                                    <!-- End Bordered Table -->
                                    <!-- End Default Table Example -->
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main>

</asp:Content>
