<%@ Page Title="" Language="C#" MasterPageFile="~/Magaza.Master" AutoEventWireup="true" CodeBehind="UrunGuncelleSil.aspx.cs" Inherits="e_ticaret.UrunGuncelleSil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .urunContainer {
            margin-bottom: 10px; /* Containerlar arasında boşluk */
        }

        .urunLabel {
            display: inline-block;
            width: 150px; /* Label için sabit bir genişlik belirleyin */
            /* Label'ların sağa hizalanması */
        }

        .urunTextBox {
            display: inline-block;
            width: 100%;
            border: 1px solid #ced4da
        }
    </style>

    <asp:Panel ID="Panel1" runat="server">
        <section class="section" style="margin-left: 320px; margin-top: 100px">
            <div class="row">


                <div class="col-lg-14">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Ürün Güncelle</h5>

                            <!-- Vertical Form -->
                            <div class="row g-3">
                                <div class="col-12">
                                    <asp:Panel ID="Panel2" runat="server">



                                        <!-- Vertical Form -->
                                        <d class="row g-3">
                                            <div class="col-12">
                                                <asp:Image ID="Image2" runat="server" style="max-width: 300px; height: 300px;" />
                                                <asp:FileUpload ID="image1" runat="server" CssClass="form-control" />
                                                <asp:Label ID="resim" runat="server" ForeColor="red" Text="" class="form-label"></asp:Label> 

                                            </div>
                                            <br />
                                            <div class="col-12">
                                                <label for="inputNanme4" class="form-label">Ürün Adı</label>
                                                <asp:TextBox ID="txturunadi" runat="server" class="form-control"></asp:TextBox>
                                            </div>


                                            <div class="col-12">
                                                <asp:Label ID="Labelurunkodu" runat="server" class="form-label" Text="Urun Kodu"></asp:Label>
                                                <asp:TextBox ID="txturunkodu" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-12">
                                                <asp:Label ID="Labelmodel" runat="server" class="form-label" Text="Model Kodu"></asp:Label>
                                                <asp:TextBox ID="txtmodelkodu" runat="server" class="form-control"></asp:TextBox>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label for="inputPassword4" class="form-label">Fiyat</label>
                                                    <asp:TextBox ID="txtfiyat" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="inputPassword4" class="form-label">Stok</label>
                                                    <asp:TextBox ID="txtstok" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                    </asp:Panel>
                                   <%-- ürün bilgileri son --%>
                                </div>
                                <div class="col-12">
                                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

                                </div>
                                <div class="col-12">
                                    <label for="inputPassword4" class="form-label">Ürün Açıklaması</label>


                                    <textarea id="TextArea1" style="width: 100%; height: 50%" runat="server"></textarea>

                                </div>
                                <div class="text-center">
                                    <asp:Button ID="Button2" runat="server" Text="Ürünü Güncelle" class="btn btn-primary" OnClick="Button2_Click" />

                                    <asp:Label ID="deneme" runat="server" ForeColor="Red" Text=""></asp:Label>

                                </div>


                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </section>
    </asp:Panel>
</asp:Content>

