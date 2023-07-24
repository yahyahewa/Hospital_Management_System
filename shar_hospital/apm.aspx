<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="apm.aspx.cs" Inherits="shar_hospital.apm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <style>                div {border-radius:10px;}              .mdiv {margin-top:25px !important; }
                                                       #Panel1,#Panel2{height:300px;overflow-y:auto;}
            </style>
                <div class="col-6 m-auto" style="margin-top:40px !important;">
                    <h3 class="text-capitalize text-center text-success">Sending appoiment for patient</h3>
                    <asp:Label ID="Label1" CssClass="d-block text-capitalize text-center" runat="server" Text="patient ID"></asp:Label>
                    <asp:TextBox ID="TextBox1" CssClass="col-12 input-group-text" runat="server"></asp:TextBox>
                    <asp:Label ID="Label2" CssClass="d-block text-capitalize text-center" runat="server" Text="doctor ID"></asp:Label>
                    <asp:TextBox ID="TextBox2" CssClass="col-12 input-group-text" runat="server"></asp:TextBox>
                    <asp:Label ID="Label3" CssClass="d-block text-capitalize text-center" runat="server" Text="Date"></asp:Label>
                    <asp:TextBox ID="TextBox3" CssClass="col-12 input-group-text" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:Button ID="Button2" CssClass="btn btn-danger col-12 mt-2" runat="server" Text="send" OnClick="Button2_Click" />
                </div>
            <div class="col-11 m-auto justify-content-between row shadow p-1 mdiv">
                <div class="col-5 p-1 " runat="server" id="ddiv">
                    <asp:DropDownList CssClass="col-12 input-group-text mb-2" ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    <asp:Button ID="Button1" CssClass="col-12 btn btn-primary" runat="server" Text="Search" OnClick="Button1_Click" />
                    <asp:Panel ID="Panel1" CssClass="col-12 p-1" runat="server"></asp:Panel>
                </div>
                <div class="col-5 p-1" runat="server" id="pdiv">
                    <h3 class="text-capitalize text-center">patient </h3>
                    <asp:Panel ID="Panel2" CssClass="col-12 p-1" runat="server"></asp:Panel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
