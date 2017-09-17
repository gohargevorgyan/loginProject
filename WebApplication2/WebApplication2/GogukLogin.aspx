<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GogukLogin.aspx.cs" Inherits="WebApplication2.GogukLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script>
        function Login_click() {
            var userName = document.getElementById('usern').value;
            var pass1 = document.getElementById('pass2').value;
            var service = new WebApplication2.WebService();
            service.DoLogin(userName, pass1, onSuccess, null, null);
        }

        function onSuccess(result) {
            //alert(result);
            if (result === "ok") {
                alert("Gogul you are win");
                var userName = document.getElementById('usern').value;
                window.location = ("GogulikHomePage.aspx?usern=" + userName)
            }

        }
    </script>

    <title> Login</title>
    <style type="text/css">

.main1{
    position:fixed;
    top:50%;
    left:50%;
    margin-top:-50px;
    margin-left:-100px;
}
.body2{
    background-color:yellowgreen;
}

    </style>
</head>
<body class="body2">
    <div class="main1">
    <form >
   username:<br />
    <input  id="usern" type="text" name="user" />
    <br />
    password:<br />
    <input  id="pass2"type="password" name="pass" />
    <br />
    
    </form>
        <br />
        <button  type="button" id="button1"  onclick=" Login_click()"> Login <//button>   
    </div>
    <form runat="server">
              <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="WebService.svc" />
            </Services>
      </asp:ScriptManager>
    </form>
</body>
</html>
