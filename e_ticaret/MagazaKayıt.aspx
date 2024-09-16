<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MagazaKayıt.aspx.cs" Inherits="e_ticaret.MagazaKayıt" %>


<!DOCTYPE html>z
<html lang="en">
<head runat="server">
    <title>UYE GIRIS FORMU</title>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <!-- Favicons -->
    <link rel="icon" href="assets/img/favicon.png" />
    <link rel="apple-touch-icon" href="assets/img/apple-touch-icon.png" />
    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet" />
    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet" />
    <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet" />
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet" />
    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <main>
            <div class="container">
                <asp:Panel ID="pnlRegister" runat="server" CssClass="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
                                <asp:Panel ID="pnlCard" runat="server" CssClass="card mb-3">
                                    <div class="card-body">
                                        <div class="pt-4 pb-2">
                                            <h5 class="card-title text-center pb-0 fs-4">HESAP OLUŞTURUN</h5>


                                            <div class="col-12">
                                                <label for="yourvergi" class="form-label" font-size="13px">Magaza Adı</label>
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtUserName" runat="server" Font-Size="13px" CssClass="form-control" placeholder="Magaza Adı giriniz" />
                                                </div>
                                            </div>
                                            <div class="col-12">

                                                <div class="col-12">
                                                    <label for="yourUsername" class="form-label" font-size="13px">E-posta-Telefon</label>
                                                    <div class="input-group">
                                                        <span class="input-group-text" id="inputGroupPrepend">@</span>

                                                        <asp:TextBox ID="texttboxemail" runat="server" class="form-control" required="required" placeholder="E-posta ve ya telefon giriniz" Font-Size="13px"></asp:TextBox>
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <label for="yourvergi" class="form-label" font-size="13px">Vergi Numarası</label>
                                                    <div class="input-group">
                                                        <asp:TextBox ID="Textboxvergi" runat="server" Font-Size="13px" CssClass="form-control" placeholder="Vergi Numarası" />
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <label for="yourtelefon" class="form-label" font-size="13px">Telefon Numarası</label>
                                                    <div class="input-group">
                                                        <asp:TextBox ID="textboxtelefon" runat="server" Font-Size="13px" CssClass="form-control" placeholder="Telefon Numarası" />
                                                    </div>
                                                </div>



                                                <div class="col-12">
                                                    <label for="yourPassword" class="form-label" font-size="13px">Sifre</label>
                                                    <div class="input-group">
                                                        <asp:TextBox ID="textsifre" runat="server" Font-Size="13px" CssClass="form-control" placeholder="Şifrenizi giriniz" TextMode="Password" />
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
                                                        var passwordInput = document.getElementById('<%= textsifre.ClientID %>');
                                                var toggleIcon = document.getElementById('togglePasswordIcon');

                                                togglePassword.addEventListener('click', function () {
                                                    var type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                                                    passwordInput.setAttribute('type', type);

                                                  
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
                                                <br />
                                                <div class="col-12">
                                                    <asp:Button ID="Button1" runat="server" Text="Hesap oluşturmak" CssClass="btn btn-primary w-100" OnClick="btnCreateAccount_Click" />
                                                </div>
                                                <div class="col-12">
                                                    <asp:HyperLink ID="hypLogin" runat="server" NavigateUrl="login.aspx" Text="Zaten hesabınız var mı? Giriş yapmak"></asp:HyperLink>
                                                </div>

                                            </div>
                                            <br />
                                            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                                        </div>
                                    </div>

                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </main>
    </form>
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
    <!-- Vendor JS Files -->
    <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/chart.js/chart.umd.js"></script>
    <script src="assets/vendor/echarts/echarts.min.js"></script>

</body>
</html>
