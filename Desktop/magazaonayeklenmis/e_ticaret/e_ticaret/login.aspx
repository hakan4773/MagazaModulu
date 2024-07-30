<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="e_ticaret.login" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pages / Login - NiceAdmin Bootstrap Template</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
  * Template Name: NiceAdmin - v2.4.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

    <main>
        <div class="container">

            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4">
                                <a href="index.html" class="logo d-flex align-items-center w-auto">

                                    <span class="d-none d-lg-block">SHOP</span>
                                </a>
                            </div>
                            <!-- End Logo -->

                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Giriş Yap</h5>
                                        <p class="text-center small">Shop Satıcı Paneli’ne hoşgeldiniz! Devam etmek için lütfen giriş yapınız.</p>
                                    </div>

                                    <form class="row g-3 needs-validation" novalidate runat="server">
                                        <div class="col-12">
                                            <label for="yourUsername" class="form-label" font-size="13px">E-posta-Telefon</label>
                                            <div class="input-group">
                                                <span class="input-group-text" id="inputGroupPrepend">@</span>

                                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" required="required" placeholder="E-posta ve ya telefon giriniz!" Font-Size="13px"></asp:TextBox>
                                                <div class="invalid-feedback"></div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourPassword" class="form-label" font-size="13px">Sifre</label>
                                            <div class="input-group">
                                                <asp:TextBox ID="TextBox2" runat="server" Font-Size="13px" CssClass="form-control" placeholder="Şifrenizi giriniz!" TextMode="Password" />
                                                <span class="input-group-text" id="togglePassword">
                                                    <i class="bi bi-eye-slash" id="togglePasswordIcon"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <style>
                                            .input-group-text {
                                                cursor: pointer;
                                            }
                                        </style>
                                        <script>
                                            document.addEventListener('DOMContentLoaded', function () {
                                                var togglePassword = document.getElementById('togglePassword');
                                                var passwordInput = document.getElementById('<%= TextBox2.ClientID %>');
                                                var toggleIcon = document.getElementById('togglePasswordIcon');

                                                togglePassword.addEventListener('click', function () {
                                                    var type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                                                    passwordInput.setAttribute('type', type);

                                                    // İkonu değiştir
                                                    if (type === 'password') {
                                                        toggleIcon.classList.remove('bi-eye');
                                                        toggleIcon.classList.add('bi-eye-slash');
                                                    } else {
                                                        toggleIcon.classList.remove('bi-eye-slash');
                                                        toggleIcon.classList.add('bi-eye');
                                                    }
                                                });
                                            });
</script>

                                        <div class="col-12">
                                            <div class="form-check">
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                                <asp:Label ID="Label1" runat="server" class="form-label" Font-Size="13px" Text="Beni Hatırla"></asp:Label>

                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <asp:Button ID="Button1" runat="server" class="btn btn-primary w-100" type="submit" Text="Giriş" OnClick="Button1_Click" />
                                        </div>

                                        <div class="col-12">
                                            <p class="small mb-0">Hesabınız yok mu?<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/MagazaKayıt.aspx"> Hesap Oluştur</asp:HyperLink></p>
                                        </div>
                                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                    </form>

                                </div>
                            </div>



                        </div>
                    </div>
                </div>

            </section>

        </div>
    </main>
    <!-- End #main -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/chart.js/chart.min.js"></script>
    <script src="assets/vendor/echarts/echarts.min.js"></script>
    <script src="assets/vendor/quill/quill.min.js"></script>
    <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

</body>

</html>
