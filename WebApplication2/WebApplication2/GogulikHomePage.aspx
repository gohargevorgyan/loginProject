<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GogulikHomePage.aspx.cs" Inherits="WebApplication2.GogulikHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script>
        function Save_click() {
            var Username = document.getElementById('<%=TextBox1.ClientID%>').innerText;
            var Name = document.getElementById('name').value;
            var Address = document.getElementById('address').value;
            var service = new WebApplication2.WebService();
            service.DoSave(Username, Name, Address, onSuccess, null, null);

        }
        function onSuccess(result) {
            alert(result);
            
            }


    </script>

     <style type="text/css">

         .usernamecss {
             color:white;
             font-size:xx-large;
         }

        .body1{
            background-color:purple;
        }
        
   .main { 
       
    position:fixed;
    top:50%;
    left:50%;
    margin-top:-50px;
    margin-left:-100px;
   }
</style> 
    <title> Home Page</title>
</head>
<body class="body1">
    
    <div class="main">
       
    <form runat="server">
              <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="WebService.svc" />
            </Services>
      </asp:ScriptManager>
        <asp:Label id="TextBox1" runat="server" CssClass = "usernamecss"/>

    </form>   
<form>
     <br/>
    
    <span style="color:white" > Name:</span><br />
    <input  id="name" type="text" name="People" />
    <br />
   <span style="color:white"> Address:</span><br />
    <input  id="address"type="text" name="address" />
    <br />
    
</form>
        <br />
  <button  type="button" id="button1"  onclick=" Save_click()"> Save <//button>   
    </div>


</body>
</html>
