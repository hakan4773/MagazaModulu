<%@ Page Title="" Language="C#" MasterPageFile="~/Magaza.Master" AutoEventWireup="true" CodeBehind="UrunEkle.aspx.cs" Inherits="e_ticaret.UrunEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Tekli Ürün Oluştur</h1>

        </div>
        <!-- End Page Title -->
        <asp:Panel ID="Panel1" runat="server">

            <section class="section">
                <div class="row">


                    <div class="col-lg-14">

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Ürün Bilgileri</h5>

                                <!-- Vertical Form -->
                                <d class="row g-3">
                                    <div class="col-12">
                                        <label for="inputNanme4" class="form-label">Ürün Adı</label>
                                        <asp:TextBox ID="Textboxurun" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-12">

                                        <label for="inputEmail4" class="form-label">Kategori Seçin</label>
                                        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" placeholder="Kategori Seçiniz" CssClass="form-select" Style="width: 100%" AutoPostBack="True"></asp:DropDownList>

                                    </div>
                                    <div class="col-12">

                                        <label for="inputEmail4" class="form-label">Alt Kategori Seçin</label>
                                        <asp:DropDownList ID="DropDownList3" runat="server" placeholder="Alt Kategori Seçiniz" CssClass="form-select" Style="width: 100%" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>



                                    </div>
                                    <div class="col-12">
                                        <asp:Label ID="Labelurunkodu" runat="server" class="form-label" Text="Urun Kodu"></asp:Label>
                                        <asp:TextBox ID="textboxurunkodu" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-12">
                                        <asp:Label ID="Labelmodel" runat="server" class="form-label" Text="Model Kodu"></asp:Label>
                                        <asp:TextBox ID="textboxmodel" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-12">
                                        <asp:Label ID="Labelmarka" runat="server" Text="Marka" class="form-label"></asp:Label>
                                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select" placeholder="Marka Seçiniz"></asp:DropDownList>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="inputPassword4" class="form-label">Fiyat</label>
                                            <asp:TextBox ID="textboxfiyat" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="inputPassword4" class="form-label">Stok</label>
                                            <asp:TextBox ID="textboxstok" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="inputPassword4" class="form-label"><b>Ürün Açıklaması</b></label>


                                        <textarea id="TextArea1" style="width: 100%; height: 50%" runat="server"></textarea>

                                    </div>
                            </div>
                            <div class="text-center">
                                <asp:Label ID="Labelsonuc" runat="server" ForeColor="#CC0000"></asp:Label>
                                <asp:Button ID="Button1" runat="server" Text="Sonraki Adıma Geç" class="btn btn-primary" OnClick="Button1_Click" />

                            </div>
                        </div>

                    </div>
                </div>




            </section>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <section class="section">
                <div class="row">


                    <div class="col-lg-14">

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Ürün Özellikleri</h5>

                                <!-- Vertical Form -->
                                <div class="row g-3">
                                    <%--<div class="col-12">
                                        <label for="inputNanme4" class="form-label">Ürün Kategori</label>
                                        <asp:TextBox ID="TextBoxkategori" class="form-control" runat="server"></asp:TextBox>

                                    </div>--%>
                                    <div class="col-12">
                                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

                                        <asp:Button ID="Button2" runat="server" Text="Ürünü Onaya Gönder" class="btn btn-primary" OnClick="Button2_Click" />

                                        <asp:Label ID="Labelyazdır" runat="server" Text="Label"></asp:Label>
                                    </div>



                                    <%-- <div class="text-center">


                                    </div>--%>
                                </div>

                            </div>
                        </div>



                    </div></div>
            </section>
        </asp:Panel>


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


        <asp:Panel ID="Panel3" runat="server">

            <div class="container">

                <h2 style="text-align: center; margin-bottom: 20px;">Ürün Resmi Yükleme</h2>

                <div class="form-group">
                    <label for="ProductImage">Ürün Resmi:</label>
                    <asp:FileUpload ID="ProductImage" runat="server"  CssClass="form-control" onchange="previewImage(this);" />
                    <div class="image-preview" id="imagePreview">
                        <img src="#" alt="Ürün Resmi Önizleme" style="max-width: 300px; height: 300px;display: none;"/>
                    </div>
                </div>
                <div class="form-group">
                    <br />
                    <asp:Button ID="BackButton" runat="server" Text="Geri Dön" CssClass="btn btn-secondary" OnClick="BackButton_Click" />

                    <asp:Button ID="ConfirmButton" runat="server" Text="Onayla" CssClass="btn btn-primary" OnClick="ConfirmButton_Click" />
                    <asp:Label ID="lblsonuc" runat="server" Text=""></asp:Label>
                    <asp:ListView ID="ListView1" runat="server">
                        <ItemTemplate>
                        </ItemTemplate>

                    </asp:ListView>
                    <asp:ListView ID="ListView2" runat="server">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:ListView>


                </div>

            </div>


            <script>
                function previewImage(input) {
                    var preview = document.querySelector('#imagePreview img');
                    var file = input.files[0];
                    var reader = new FileReader();

                    reader.onloadend = function () {
                        preview.src = reader.result;
                        preview.style.display = 'block';
                    }

                    if (file) {
                        reader.readAsDataURL(file);
                    } else {
                        preview.src = '';
                    }
                }
            </script>



        </asp:Panel>
    </main>
    <!-- End #main -->
 


</asp:Content>

