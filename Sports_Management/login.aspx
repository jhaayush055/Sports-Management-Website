<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link rel="stylesheet" href="Design/css/bootstrap.css" />
    <!-- //bootstrap-css -->
    <!-- Custom CSS -->
    <link href="Design/css/style.css" rel='stylesheet' type='text/css' />
    <!-- font CSS -->
    <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
        rel='stylesheet' type='text/css' />
    <!-- font-awesome icons -->
    <link rel="stylesheet" href="Design/css/font.css" type="text/css" />
    <link href="Design/css/font-awesome.css" rel="stylesheet" />
    <!-- //font-awesome icons -->
</head>
<body class="signup-body">
    <div class="agile-signup">
        <div class="content2">
            <div class="grids-heading gallery-heading signup-heading">
                <h2>
                    Login</h2>
            </div>
            <form id="formlogin" method="post" runat="server">

            <asp:TextBox ID="txtemail" placeholder="Email Address" runat="server"></asp:TextBox><br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="please enter correct email address"
                ControlToValidate="txtemail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ValidationGroup="login"></asp:RegularExpressionValidator>

            <asp:TextBox ID="txtpass" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter correct password"
                ControlToValidate="txtpass" ForeColor="Red" ValidationGroup="login"></asp:RequiredFieldValidator>

            <asp:Button ID="submit" OnClick="btnSubmit_Click" class="register" runat="server"
                Text="Login" ValidationGroup="login" />
            </form>
      
            
          
        </div>
        <!-- footer -->
        <div class="copyright">
            <p>
                © 2021&nbsp; Dynamic Sports. All Rights Reserved . Design by Ayush</p>
        </div>
        <!-- //footer -->
    </div>
    <script type="text/javascript" src="Design/js/proton.js"></script>
</body>
</html>