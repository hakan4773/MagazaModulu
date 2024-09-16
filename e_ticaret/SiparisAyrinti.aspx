<%@ Page Title="" Language="C#" MasterPageFile="~/Magaza.Master" AutoEventWireup="true" CodeBehind="SiparisAyrinti.aspx.cs" Inherits="e_ticaret.SiparisAyrinti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <main id="main" class="main">

        <div class="pagetitle">
            <h1>Siparis Ayrıntı</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Mağaza</a></li>
                    <li class="breadcrumb-item">Components</li>
                    <li class="breadcrumb-item active">Siparis ayrıntı</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->


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
                                    <p>Add <code>.table-bordered</code> for borders on all sides of the table and cells.</p>
                                    <!-- Bordered Table -->
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col">Ürün Kodu</th>
                                                <th scope="col">Ürün Adı</th>
                                                <th scope="col">Ürün Adeti</th>
                                                <th scope="col">Birim Fiyat</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="SiparisID,SiparisUrunID">

                                               
                                                <ItemTemplate>

                                                    <tr style="">
                                                        <td>
                                                            <asp:Label Text='<%# Eval("UrunID1") %>' runat="server" ID="Label1" /></td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("UrunAdi") %>' runat="server" ID="UrunAdiLabel" /></td>
                                                        <td>
                                                            <asp:Label Text='<%# Eval("Miktar") %>' runat="server" ID="MiktarLabel" /></td>
                                                        
                                                        <td>
                                                            <asp:Label Text='<%# Eval("Fiyat1") %>' runat="server" ID="Fiyat1Label" /></td>
                                                </ItemTemplate>

                                                
                                            </asp:ListView>


                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ETicaret %>' SelectCommand="select * from Siparisler,SiparisUrunler,urunler where Siparisler.SiparisID=SiparisUrunler.SiparisID and SiparisUrunler.UrunID=Urunler.UrunID and siparisler.MagazaID=1 and Siparisler.SiparisID=1"></asp:SqlDataSource>



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
        <section class="section">
            <div class="row">
                <div class="col-lg-6">

                    <!-- Default Card -->
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Adres</h5>
                            <asp:Label ID="lbladres" runat="server"></asp:Label>
                        </div>
                    </div>
                    <!-- End Default Card -->
                </div>
                <div class="col-lg-6">

                    <!-- Default Card -->
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Durum Güncelle</h5>
                            <asp:Button ID="Onayla" CssClass="btn btn-primary" runat="server" Text="Onayla" OnClick="Onayla_Click" />
                            <asp:Button ID="Reddet" CssClass="btn btn-danger" runat="server" Text="Reddet" OnClick="Reddet_Click"/>
                        </div>
                    </div>
                    <!-- End Default Card -->
                </div>
            </div>
        </section>

    </main>

</asp:Content>
