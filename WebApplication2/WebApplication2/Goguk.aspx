<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Goguk.aspx.cs" Inherits="WebApplication2.Goguk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script  type="text/javascript" >

        function Register_click() {
           
            var userName = document.getElementById('user1').value;
            var pass1 =  document.getElementById('pass1').value;
            var pass2= document.getElementById('pass2').value;

            if (userName == "" || pass1 == "" || pass2 == "") {
                alert("oops");
                return;
            }

            if (pass1 !== pass2 ) {
                alert("Password must be equal!");
                return
            }

            if (pass1.length < 5) {
                alert("Your password is short!")
                return
            }

            var service = new WebApplication2.WebService();
            service.DoRegister(userName, pass1, onSuccess, null, null);
        }

        function onSuccess(result) {
            //alert(result);
            if (result === "Failre!") {
                alert("oops!")
            }

            else {
                window.location = "GogukLogin.aspx";
            }
        }
       //function onSuccess() {
        //    alert("It's ok");
       // }

    </script>
    <title>Registration</title>
    <style type="text/css">
        .body1{
            background-color:aqua;
        }
        
   .main { 
       
   position:fixed;
    top:50%;
    left:50%;
    margin-top:-50px;
    margin-left:-100px;
   }
</style> 
</head>
<body class="body1">
    
    <div class="main">
        <p id="text1"> Register </p>

  
<form>

    username:<br />
    <input  id="user1" type="text" name="user" />
    <br />
    password:<br />
    <input  id="pass1"type="password" name="pass" />
    <br />
    confirm password:<br />
    <input id="pass2" type ="password" name="confpass" /> <br />

</form>
        <br />
  <button  type="button" id="button1"  onclick=" Register_click()"> Register <//button>   
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
