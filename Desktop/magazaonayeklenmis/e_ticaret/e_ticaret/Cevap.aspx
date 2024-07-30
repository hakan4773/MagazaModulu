<%@ Page Title="" Language="C#" MasterPageFile="~/Magaza.Master" AutoEventWireup="true" CodeBehind="Cevap.aspx.cs" Inherits="e_ticaret.Cevap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <main id="main" class="main">

        <div class="pagetitle">
            <h1>Cards</h1>
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

                <div class="col-lg-12">
                    <!-- Card with an image on left -->
                    <div class="card mb-3">
                        <div class="row g-0">
                            <div class="col-md-2">
                                <img src="assets/img/card.jpg" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-10">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <asp:Label ID="Yorum" runat="server" Text="text"></asp:Label></h5>
                                </div>
                                <div class="card-text">
                                    <div class="row mb-3">
                                        <div class="col-sm-10">
                                            <asp:Label ID="Yorumtxt" runat="server" Text="Label"></asp:Label>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-sm-10">
                                                <asp:TextBox CssClass="form-control" ID="Cevaptxt" Height="100px" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                <div class=" d-grid gap-2 mt-3">
                                                    <asp:Button CssClass="btn btn-primary mb-2" ID="Cevaplabtn" runat="server" Text="Cevapla" OnClick="Cevaplabtn_Click" />
                                                </div>
                                            </div>

                                        </div>



                                    </div>
                                </div>
                                </div>
                        </div>
                    </div>
                    <!-- End Card with an image on left -->
                </div>
            </div>
        </section>
    </main>

</asp:Content>
