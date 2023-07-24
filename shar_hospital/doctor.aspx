<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doctor.aspx.cs" Inherits="shar_hospital.doctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <%--<script src="jq.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
    body{
     background-image: url("https://post.healthline.com/wp-content/uploads/2020/08/Doctors_For_Men-732x549-thumbnail-1-732x549.jpg");
     background-repeat:no-repeat;
      background-size: 100%;
    
    }</style>
</head>
<body>
    <div class="col-11 m-auto" style="background-color:rgb(0 0 0 / 0.2)">
    <form id="form1" runat="server">
        <div>
            <div class="col-12 p-1 row justify-content-start">
            <h4 class=" d-inline-block m-4 col-6 " style="color:#ffd800" runat="server" id="dname">
                Dr.yahya hiwa
            </h4>
            </div>
            <style> .dimg{ width:150px;height:150px;border-radius:13px;}
 #Panel1{height:200px;overflow-y:auto;}
 .temp{font-size:10px;}.ltime{color:rgb(156 156 156 / 0.35)}
                       .appscrol{height:150px;overflow-y:auto;}
            </style>
            <div class="col-5 d-block m-auto divimg p-1">
                <asp:Image ID="Image1" CssClass="dimg d-block m-auto col-12" ImageUrl="#" runat="server" />
            </div>
            <div class="col-6 row justify-content-center m-auto p-1">
                <asp:TextBox ID="search" placeholder="Search patient id" CssClass="input-group-text bg-white col-8 m-1" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CssClass="col-3 p-1 btn btn-primary" Text="Search" OnClick="Button1_Click" />
            </div>
            <div style="background-color:rgb(255 255 255 / 0.90);border-radius:10px;" class="col-11 p-1 m-auto row sinfo shadow justify-content-center">
                <div class="col-3 p-1 m-1">
                <asp:Label ID="usernamel" CssClass="text-capitalize d-block m-2" runat="server" Text="P ID:"></asp:Label>
                <asp:Label ID="namel" CssClass="text-capitalize d-block m-2" runat="server" Text="p Name:"></asp:Label>
                <asp:Label ID="b_dayl" CssClass="text-capitalize d-block m-2" runat="server" Text="p birthday:"></asp:Label>
                <asp:Label ID="phonel" CssClass="text-capitalize d-block m-2" runat="server" Text="p ph.Num:"></asp:Label>
                <asp:Label ID="genderl" CssClass="text-capitalize d-block m-2" runat="server" Text="p gender:"></asp:Label>
                    </div>
                <asp:Panel CssClass="col-8 row justify-content-center p-1 " ID="Panel1" runat="server">
                </asp:Panel>
                </div>
            <div class="m-auto row justify-content-center pnt col-11 p-5 mt-3 " style="background-color:rgb(255 255 255 / 0.90);border-radius:10px;">
                <h3 class="text-capitalize text-center text-danger">adding patient Note</h3>
                <label class="text-capitalize m-auto text-center">patient ID:</label>
                <asp:TextBox ID="TextBox1" CssClass="input-group-text m-1 col-6" runat="server"></asp:TextBox>
                <label class="text-capitalize d-block text-center">disease name:</label>
                <asp:TextBox ID="TextBox2" CssClass="input-group-text m-1 col-6" runat="server"></asp:TextBox>
                <label class="text-capitalize text-center d-block">note:</label>
                <style>#TextBox3{height:100px; }
                </style>
                <textarea id="TextArea1" style="background-color:rgb(222 222 222);border:none; border-radius:7px;" runat="server" cols="20" rows="2"></textarea>
                <asp:Button ID="Button2" CssClass="col-6 mt-3 btn btn-primary " runat="server" Text="Add" OnClick="Button2_Click" />
            </div>
            <div class="col-11 mt-2 m-auto row justify-content-between">
            <input type="button" class=" d-inline-block btn col-2 m-2  btn-success"  id="H1" value="Appointment" />
            <input type="button" class=" d-inline-block btn col-2 m-2  btn-warning"  id="H2" value="change password" />
            </div>
            <style>#Paneltd,#Paneltm{background-color:rgb(255 255 255 / 0.90) ;   }div{border-radius:10px !important;}
            </style>
                <div class="col-11 row p-1 shadow m-auto appmain m-1 mb-5 justify-content-between" id="apm">
                    <asp:Panel ID="Paneltd" CssClass="col-5  p-1 appscrol border" runat="server"></asp:Panel>
                    <asp:Panel ID="Paneltm" CssClass="col-5 p-1 appscrol border" runat="server"></asp:Panel>
                </div>
                <div class="col-10 row p-1 shadow m-auto  justify-content-center" style="background-color:rgb(255 255 255 / 0.90)" id="chpass">
                    <asp:TextBox CssClass="col-7 btn mt-2 btn-outline-primary ch" placeholder="old password" ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:TextBox CssClass="col-7 btn mt-2 btn-outline-primary ch" placeholder="new password" ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:TextBox CssClass="col-7 btn mt-2 btn-outline-primary ch" placeholder="confirm new password" ID="TextBox8" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:Button CssClass="btn col-7 btn-success mt-2" ID="Button3" runat="server" Text="change" OnClick="Button3_Click" />
                    <asp:Label ID="mesg" CssClass="col-7 text-capitalize text-danger text-center" runat="server" Text=""></asp:Label>
                </div>
            <div class="col-13 p-3 m-auto">
            </div>
            <script >
                $(document).ready(function () {
                    $("#apm").slideUp(1);
                    $("#chpass").slideUp(1);
                    $("#H1").click(function () {
                        $("#apm").slideToggle(); $("#chpass").slideUp();
                        $(".pnt").slideToggle();
                    })
                    $("#H2").click(function () {
                        $(".pnt").slideToggle();
                        $("#chpass").slideToggle(); $("#apm").slideUp();
                        if ($("#apm").clientHeight > 50 || $("#chpass").clientHeight > 50) {
                            $(".pnt").slideUp();
                        }
                        else if ($("#apm").clientHeight < 50 || $("#chpass").clientHeight < 50) {
                            $(".pnt").slideDown();
                        } 
                    })
                });
            </script>
        </div>
    </form></div>
</body>
</html>
