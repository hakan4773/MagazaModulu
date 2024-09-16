<%@ Page Title="" Language="C#" MasterPageFile="~/Magaza.Master" AutoEventWireup="true" CodeBehind="Talepler.aspx.cs" Inherits="e_ticaret.Talepler" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Talepler</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Mağaza</a></li>
                    <li class="breadcrumb-item">Components</li>
                    <li class="breadcrumb-item active">Talepler</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Talepler</h5>


                        <a  class="btn btn-primary mb-2" href="Talepler.aspx?islem=Tum">
                            Tüm Talepler <asp:Label CssClass="badge bg-white text-primary" ID="TumTalep" runat="server" ></asp:Label>
                        </a>
                        <a  class="btn btn-success mb-2" href="Talepler.aspx?islem=Onay">
                            Onaylanan <asp:Label CssClass="badge bg-white text-success" ID="OnayTalep" runat="server" ></asp:Label>
                        </a>
                        <a  class="btn btn-warning mb-2" href="Talepler.aspx?islem=Bekle">
                            Beklemede <asp:Label CssClass="badge bg-white text-warning" ID="BeklemeTalep" runat="server" ></asp:Label>
                        </a>
                        <a  class="btn btn-danger mb-2" href="Talepler.aspx?islem=Red">
                            Onaylanmayan <asp:Label CssClass="badge bg-white text-danger" ID="RedTalep" runat="server"></asp:Label>
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
                            <table class="table table-striped">
                                <thead>
                                    <tr>

                                        <th scope="col">Talep Türü</th>
                                        <th scope="col">Durum</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="TalepID">

                                        <EmptyDataTemplate>
                                            <table class="table table-striped" runat="server" style="">
                                                <tr>
                                                    <td>Talebiniz yok.</td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>

                                        <ItemTemplate>

                                            <tr style="">

                                                <td>
                                                    <asp:Label Text='<%# Eval("TalepTuru") %>' runat="server" ID="TalepTuruLabel" /></td>
                                                <td>
                                                    <asp:Label Text='<%# Eval("TalepDurum") %>' runat="server" ID="TalepDurumLabel" /></td>
                                            </tr>
                                        </ItemTemplate>


                                    </asp:ListView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ETicaret %>' SelectCommand="SELECT * FROM [Talepler]"></asp:SqlDataSource>
                                </tbody>
                            </table>
                            <!-- End Default Table Example -->
                        </div>
                    </div>


                </div>
            </div>
        </section>

    </main>

</asp:Content>
