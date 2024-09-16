<%@ Page Title="" Language="C#" MasterPageFile="~/Magaza.Master" AutoEventWireup="true" CodeBehind="UrunDuzenle.aspx.cs" Inherits="e_ticaret.UrunDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            margin: 10px;
            width: 300px; /* Kart genişliği */
            background-color: #fff;
        }

        .image-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 300px; /* Görsel kapsayıcı yüksekliği */
            overflow: hidden;
            background-color: transparent; /* Arka plan rengi transparan */
        }

        .image-container img {
            height: 100%; /* Görsel yüksekliği */
            width: auto; /* Görsel genişliği otomatik */
            object-fit: cover; /* Geniş olan görselleri keserek sığdır */
        }

        /* Dar olan görseller için özel stil */
        .image-container img.small {
            width: auto; /* Görsel genişliği otomatik */
            height: 100%; /* Görsel yüksekliği otomatik */
            object-fit: none; /* Görseli kesmeden sığdır */
            object-position: center; /* Görseli ortala */
            background-color: transparent; /* Arka plan rengi transparan */
        }

        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 1.25em;
            margin-bottom: 10px;
        }

        .card-text {
            margin-bottom: 10px;
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }

        .btn-danger {
            background-color: #dc3545;
            color: #fff;
        }
        .card-text {
            margin-bottom: 10px;
            white-space: nowrap; /* Metni tek satırda tut */
            overflow: hidden; /* Taşan metni gizle */
            text-overflow: ellipsis; /* Gizlenen metin için üç nokta ekle */
        }
         .card-tittle {
            margin-bottom: 10px;
            white-space: nowrap; /* Metni tek satırda tut */
            overflow: hidden; /* Taşan metni gizle */
            text-overflow: ellipsis; /* Gizlenen metin için üç nokta ekle */
        }
        .card-body {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .col-lg-3 {
            margin-bottom: 20px;
            display:flex;
        }
        
    </style>

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
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-3">
                            <!-- Card with an image on top -->
                            <div class="card">
                                <div class="image-container">
                                    <img src='<%# ResolveUrl(Eval("Resim").ToString()) %>' class="card-img-top" alt="..."></div>

                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("UrunID") %></h5>
                                    <p class="card-text" style="font-weight: bold;"><%# Eval("Aciklama") %></p>
                                    <p class="card-text"><b>Ürün Kodu:</b> <%# Eval("UrunKodu") %></p>
                                    <p class="card-text"><b>Fiyat:</b> <%# Eval("Fiyat") %></p>
                                    <p class="card-text"><b>Stok:</b> <%# Eval("Stok") %></p>
                                    <asp:Button ID="btnViewDetails" runat="server" Text="Ürünü Gör" CommandName="ViewDetails" CommandArgument='<%# Eval("UrunID") %>' CssClass="btn btn-primary" />
                                    <br />
                                    <a class="btn btn-danger mb-2" href="UrunDuzenle.aspx?islem=Sil&urunID=<%# Eval("UrunID") %>">Sil                                             
                                    </a>






                                </div>
                            </div>
                            <!-- End Card with an image on top -->
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </section>

    </main>













</asp:Content>