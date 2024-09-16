<%@ Page Title="" Language="C#" MasterPageFile="~/Magaza.Master" AutoEventWireup="true" CodeBehind="Profil.aspx.cs" Inherits="e_ticaret.Profil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <main id="main" class="main">
        <div class="pagetitle">
            <h1>Profile</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Users</li>
                    <li class="breadcrumb-item active">Profile</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section profile">
            <div class="row">
                <div class="col-xl-4">

                    <div class="card">
                        <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
                            <h2 style="text-align: center;">
                                <asp:Label ID="labelmagazaadi" runat="server"></asp:Label></h2>
                            <%--<div class="social-links mt-2">
                                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                            </div>--%>
                        </div>
                    </div>

                </div>

                <div class="col-xl-8">

                    <div class="card">
                        <div class="card-body pt-3">
                            <!-- Bordered Tabs -->
                            <ul class="nav nav-tabs nav-tabs-bordered">

                                <li class="nav-item">
                                    <asp:Button ID="btnprofil" CssClass="nav-link active" runat="server" Text="PROFİL" OnClick="btnprofil_Click" />
                                </li>
                                <li class="nav-item">
                                    <asp:Button ID="btnparola" CssClass="nav-link" runat="server" Text="PAROLA DEĞİŞTİR" OnClick="btnparola_Click" />
                                </li>

                            </ul>
                            <asp:Panel ID="panelprofil" runat="server">
                                <div class="tab-content pt-2">

                                    <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                        <h5 class="card-title">About</h5>

                                        <h5 class="card-title">Parola Değiştir</h5>

                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="MagazaID">
                                            <ItemTemplate>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label ">Mağaza adı</div>
                                                    <div class="col-lg-9 col-md-8">
                                                        <asp:Label Text='<%# Eval("MagazaAdi") %>' runat="server" ID="Label1" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label">Telefon</div>
                                                    <div class="col-lg-9 col-md-8">
                                                        <asp:Label Text='<%# Eval("Telefon") %>' runat="server" ID="Label2" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label">E-Posta</div>
                                                    <div class="col-lg-9 col-md-8">
                                                        <asp:Label Text='<%# Eval("EPosta") %>' runat="server" ID="Label3" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label">Vergi kimlik no</div>
                                                    <div class="col-lg-9 col-md-8">
                                                        <asp:Label Text='<%# Eval("VergiNo") %>' runat="server" ID="Label4" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label">Kayıt tarihi</div>
                                                    <div class="col-lg-9 col-md-8">
                                                        <asp:Label Text='<%# Eval("KayıtTarihi") %>' runat="server" ID="Label5" />
                                                    </div>
                                                </div>

                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ETicaret %>' SelectCommand="SELECT * FROM [Magaza]"></asp:SqlDataSource>


                                    </div>


                                </div>
                                <!-- End Bordered Tabs -->
                            </asp:Panel>

                            <asp:Panel ID="panelparola" Visible="false" runat="server">
                                <div class="tab-content pt-2">

                                    <div class="tab-pane fade show active profile-overview" id="profile-password">
                                        <h5 class="card-title">
                                            <asp:Label ID="lblislem" runat="server" Text="Parola İşlemleri"></asp:Label></h5>
                                        <h5 class="card-title">Profile Details</h5>

                                        <div class="row mb-3">
                                            <label for="eskiparola" class="col-md-4 col-lg-3 col-form-label">Eski parola</label>
                                            <div class="col-md-8 col-lg-9">
                                                <asp:TextBox ID="eskiparola" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label for="yeniparola" class="col-md-4 col-lg-3 col-form-label">Yeni parola</label>
                                            <div class="col-md-8 col-lg-9">
                                                <asp:TextBox ID="yeniparola" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label for="yeniparolatkr" class="col-md-4 col-lg-3 col-form-label">Yeni parola tekrar</label>
                                            <div class="col-md-8 col-lg-9">
                                                <asp:TextBox ID="yeniparolatkr" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="row mb-3">
                                             <label  class="col-md-4 col-lg-3 col-form-label"></label>
                                            <div class="col-md-8 col-lg-9">
                                                <asp:Button ID="Button1" CssClass="form-control" runat="server" Text="Parolayı Güncelle" OnClick="Button1_Click" />
                                            </div>
                                        </div>

                                      



                                    </div>


                                </div>
                                <!-- End Bordered Tabs -->
                            </asp:Panel>


                        </div>
                    </div>

                </div>
            </div>
        </section>
    </main>

</asp:Content>

