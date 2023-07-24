<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chamb.aspx.cs" Inherits="shar_hospital.chamb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 class="text-capitalize text-center m-5">
                request to ambulance
            </h2>
            <style>
                #Panel1{height:400px;overflow-y:auto;}
                #Panel1 Button{margin-top:30px !important;}
            </style>
            <asp:Panel CssClass="m-auto col-5 justify-content-center p-1" ID="Panel1" runat="server">
            </asp:Panel>
        </div>
    </form>
</body>
</html>
