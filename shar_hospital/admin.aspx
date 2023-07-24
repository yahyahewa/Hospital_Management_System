<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="shar_hospital.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="col-11 row m-auto shadow  p-5 justify-content-between mt-5">
                <asp:Button ID="Button1" CssClass="col-3 shadow btn-primary   btn m-2" runat="server" Text="Staff" OnClick="Button1_Click" />
                <asp:Button ID="Button2" CssClass="col-3 shadow btn-success   btn m-2" runat="server" Text="Doctor" OnClick="Button2_Click" />
                <%--<asp:Button ID="Button3" CssClass="col-3 shadow btn-warning   btn m-2" runat="server" Text="Patient" OnClick="Button3_Click" />--%>
                <asp:Button ID="Button4" CssClass="col-3 shadow btn-info      btn m-2" runat="server" Text="Info" OnClick="Button4_Click" />
                <asp:Button ID="Button5" CssClass="col-3 shadow btn-warning btn m-2" runat="server" Text="Adding Staff And Doctor" OnClick="Button5_Click" />
                <asp:Button ID="Button6" CssClass="col-3 shadow btn-danger btn m-2" runat="server" Text="Adding patient" OnClick="Button6_Click" />
                <asp:Panel class="col-12 row  justify-content-between" runat="server" id="addingPatirntPanel">
                    <label class="text-capitalize text-center col-12 d-block m-1" runat="server" id="ptitle">Adding patient</label>
                <div id="Adp" runat="server" class="col-5 mt-3 p-3 m-auto">
                    <label class="text-capitalize d-block m-1  m-auto">First name</label>
                    <asp:TextBox ID="pfn" runat="server" CssClass="input-group-text col-11"></asp:TextBox>
                    <label class="text-capitalize d-block m-1">Last name</label>
                    <asp:TextBox ID="pln" runat="server" CssClass="input-group-text col-11"></asp:TextBox>
                    <label class="text-capitalize d-block m-1">gender</label>
                    <asp:DropDownList ID="pgen" runat="server" CssClass="input-group-text col-11">
                        <asp:ListItem>male</asp:ListItem>
                        <asp:ListItem>female</asp:ListItem>
                        <asp:ListItem>other</asp:ListItem>
                    </asp:DropDownList>
                    <label class="text-capitalize d-block m-1">Phone Number</label>
                    <asp:TextBox ID="pphnum" runat="server" CssClass="input-group-text col-11"></asp:TextBox>
                    <label class="text-capitalize d-block m-1">birthday</label>
                    <asp:TextBox ID="pbday" runat="server" CssClass="input-group-text col-11" TextMode="Date"></asp:TextBox>
                    <label class="text-capitalize d-block m-1">Password</label>
                    <asp:TextBox ID="ppass" runat="server" CssClass="input-group-text col-11 "></asp:TextBox>
                    Chronic illness
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="input-group-text col-11 mb-2"></asp:DropDownList>
                    <asp:Button ID="Button7" CssClass="btn-success col-11 btn m-auto" runat="server" Text="Add" OnClick="Button7_Click" />
                </div>
                    <div class="col-5 mt-3 p-3 m-auto">
                        <br />
                        <asp:Label ID="pid" runat="server" Text="ID\" CssClass="d-block"></asp:Label>
                        <br />
                        <asp:Label ID="pfnl" runat="server" Text="First Name\" CssClass="d-block"></asp:Label>
                        <br />
                        <asp:Label ID="plnl" runat="server" Text="Last Name\" CssClass="d-block"></asp:Label>
                        <br />
                        <asp:Label ID="ppassl" runat="server" Text="Password\" CssClass="d-block"></asp:Label>
                        <br />
                        <asp:Label ID="pbdayl" runat="server" Text="Birthday\" CssClass="d-block"></asp:Label>
                        <br />
                        <asp:Label ID="pphonl" runat="server" Text="Ph.Num\" CssClass="d-block"></asp:Label>
                        <br />
                        <asp:Label ID="pgenl" runat="server" Text="Gender\" CssClass="d-block"></asp:Label>
                        <br />
                        <asp:Label ID="chl" runat="server" Text="Chronic illness\" CssClass="d-block"></asp:Label>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel1"  class="row col-11 justify-content-around"  runat="server">
                    
                    <label class="text-capitalize text-center col-12 d-block m-1" runat="server" id="stitle">Adding Staff</label>
                    <div class="col-5 p-4">
                        <label class="col-12 text-capitalize">username</label>
                        <asp:TextBox ID="susername" runat="server" CssClass="input-group-text col-11 "></asp:TextBox>
                        <label class="col-12 text-capitalize">password</label>
                        <asp:TextBox ID="spass" runat="server" CssClass="input-group-text col-11 "></asp:TextBox>
                        <label class="col-12 text-capitalize">first name</label>
                        <asp:TextBox ID="sfn" runat="server" CssClass="input-group-text col-11 "></asp:TextBox>
                        <label class="col-12 text-capitalize">last name</label>
                        <asp:TextBox ID="sln" runat="server" CssClass="input-group-text col-11 "></asp:TextBox>
                        <label class="col-12 text-capitalize">authority type</label>
                        <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="input-group-text col-11">
                            <asp:ListItem>admin</asp:ListItem>
                            <asp:ListItem>doctor</asp:ListItem>
                            <asp:ListItem>staff</asp:ListItem>
                        </asp:DropDownList>
                        <label class="col-12 text-capitalize">birthday</label>
                        <asp:TextBox ID="sbday" runat="server" CssClass="input-group-text col-11 " TextMode="date"></asp:TextBox>
                        <label class="col-12 text-capitalize">gender</label>
                        <asp:DropDownList ID="DropDownList2" runat="server"  CssClass="input-group-text col-11">
                            <asp:ListItem>male</asp:ListItem>
                            <asp:ListItem>female</asp:ListItem>
                            <asp:ListItem>other</asp:ListItem>
                        </asp:DropDownList>
                        <label class="col-12 text-capitalize">ph.Num</label>
                        <asp:TextBox ID="sphon" runat="server" CssClass="input-group-text col-11"></asp:TextBox>
                        <label class="col-12 text-capitalize">Image</label>
                        <asp:FileUpload ID="FileUpload1" CssClass="col-11" runat="server" />
                        <label class="col-12 text-capitalize">medical</label>
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="input-group-text mb-3 col-11"></asp:TextBox>
                        <asp:Button ID="Button8" runat="server" Text="Add" CssClass="col-11 btn btn-success" OnClick="Button8_Click" />
                    </div>
                    <div class="col-5 p-4">
                        <style>
                            #Image1{height:200px;width:200px; border:1px solid rgb(255 255 255 / 0.00);border-radius:7px;}
                        </style>
                        <asp:Image CssClass=" d-block shadow m-auto" ID="Image1" runat="server" />
                        <asp:Label CssClass="d-block mt-4 mb-2 " ID="susernamel" runat="server" Text="username:"></asp:Label>
                        <asp:Label CssClass="d-block mb-2 text-capitalize" ID="spassl" runat="server" Text="password:"></asp:Label>
                        <asp:Label CssClass="d-block mb-2 text-capitalize" ID="sauthl" runat="server" Text="authority:"></asp:Label>
                        <asp:Label CssClass="d-block mb-2 text-capitalize" ID="sfnl" runat="server" Text="first name:"></asp:Label>
                        <asp:Label CssClass="d-block mb-2 text-capitalize" ID="slnl" runat="server" Text="last name:"></asp:Label>
                        <asp:Label CssClass="d-block mb-2 text-capitalize" ID="sbl" runat="server" Text="birthday:"></asp:Label>
                        <asp:Label CssClass="d-block mb-2 text-capitalize" ID="sgl" runat="server" Text="gender:"></asp:Label>
                        <asp:Label CssClass="d-block mb-2 text-capitalize" ID="spnl" runat="server" Text="ph.Num:"></asp:Label>
                    </div>
                </asp:Panel>

                <style>
                    #staffList{height:500px;
                               overflow-y:auto;
                    }
                </style>
                <asp:Panel id="panel3" class="col-11 p-3 mt-5 row m-auto justify-content-between"  runat="server">
                    <div class="p-2 col-4 justify-content-center" id="staffList" runat="server">
                        <label class="text-primary d-block text-capitalize text-center">staff list</label>

                    </div>
                    <div class="col-7 p-2 ">
                        <style>
                        </style>
                        <asp:Button ID="Button13" CssClass="col-11 btn btn-info" runat="server" Text="Search" OnClick="Button13_Click" />
                        <asp:Label ID="test" runat="server" class="d-block text-capitalize ">username:</asp:Label>
                        <asp:TextBox ID="TextBox1" CssClass="input-group-text col-11" runat="server"></asp:TextBox>
                        <label class="d-block text-capitalize ">password:</label>
                        <asp:TextBox ID="TextBox2" CssClass="input-group-text col-11" runat="server"></asp:TextBox>
                        <label class="d-block text-capitalize ">first name:</label>
                        <asp:TextBox ID="TextBox3" CssClass="input-group-text col-11" runat="server"></asp:TextBox>
                        <label class="d-block text-capitalize ">last name:</label>
                        <asp:TextBox ID="TextBox4" CssClass="input-group-text col-11" runat="server"></asp:TextBox>
                        <label class="d-block text-capitalize ">birthday:</label>
                        <asp:TextBox ID="TextBox5" CssClass="input-group-text col-11" runat="server" ></asp:TextBox>
                        <label class="d-block text-capitalize ">gender:</label>
                        <asp:DropDownList ID="DropDownList3" CssClass="input-group-text col-11 " runat="server">
                            <asp:ListItem>male</asp:ListItem>
                            <asp:ListItem>female</asp:ListItem>
                            <asp:ListItem>other</asp:ListItem>
                        </asp:DropDownList>
                        <label class="d-block text-capitalize ">ph.num:</label>
                        <asp:TextBox ID="TextBox6" CssClass="input-group-text col-11" runat="server"></asp:TextBox>
                        <div class="container row justify-content-around mt-3">
                            <asp:Button ID="Button9" CssClass="col-5 btn btn-danger" runat="server" Text="Delete" OnClick="Button9_Click" />
                            <asp:Button ID="Button10" CssClass="col-5 btn btn-primary" runat="server" Text="Update" OnClick="Button10_Click" />
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel style="background-color:rgb(255 255 255 / 0.90);border-radius:10px;margin-top:300px;" Cssclass="col-7 row p-3 shadow m-auto  justify-content-center" ID="Panel4" runat="server">
                <div  style="background-color:rgb(255 255 255 / 0.90)" id="chpass">
                    <h5 class="text-capitalize text-center text-danger" id="usern" runat="server">Change password:</h5>
                    <asp:TextBox CssClass="col-12 btn mt-2 btn-outline-primary ch" placeholder="old password" ID="TextBox8" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:TextBox CssClass="col-12 btn mt-2 btn-outline-primary ch" placeholder="new password" ID="TextBox9" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:TextBox CssClass="col-12 btn mt-2 btn-outline-primary ch" placeholder="confirm new password" ID="TextBox10" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:Button CssClass="btn col-12 btn-success mt-2" ID="Button3" runat="server" Text="change" OnClick="Button3_Click" />
                    <asp:Label ID="mesg" CssClass="col-7 text-capitalize text-danger text-center" runat="server" Text=""></asp:Label>
                </div></asp:Panel>

                <style>
                    #Panel2{height:500px; overflow-y:auto;

                    }
                    #Panel2 panel{
                        border-radius:10px;
                    }
                    .dimg{
                        height:80px;width:80px;border-radius:7px;display:block;margin:auto;
                    }
                </style>
                <asp:Panel ID="doctorPanel" CssClass="col-11 p-2 m-auto row justify-content-between" runat="server">
                    <asp:Panel ID="Panel2" CssClass="col-4 m-auto m-1 p-2 justify-content-center" runat="server"></asp:Panel>
                </asp:Panel>
            </div>
            <script >
                $(document).ready(function () {
                    $(".sid").click(function () {
                        $("#susername").val($(".sid").attr('id'));
                    });
                });
            </script>
        </div>
    </form>
</body>
</html>
