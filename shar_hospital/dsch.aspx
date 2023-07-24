<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dsch.aspx.cs" Inherits="shar_hospital.dsch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            background-image: url("Images/back3.jpg");
            background-size: 100%;
        }
    </style>
    <title></title>
</head>
<body>
    <style>        .divsearc {
            margin:auto;
            margin-top:100px;
        }

        .info{text-align:left; font-size:10px;}
        .dr_div{
            margin-top:10px;
            background-color:rgb(255 255 255 / 0.9);
            margin-top:10px !important;
            border-radius:7px;
        }
        .container{background-color:rgb(255 255 255 / 0.50);
            border-radius:7px !important;
            height:540px;
            margin-top:80px !important;
            overflow-y:auto;}
        .div_img img{ width:80px;height:80px;}
    </style>
    <form id="form1" runat="server">
 

    <header>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top   ">
            <a class="navbar-brand " href="index.aspx">Shar Hospital</a>
            <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#nav">
              <span class="navbar-toggler-icon"></span>
            </button>
      
            <div class="collapse navbar-collapse " id="nav">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="login.aspx">login</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                    Catagories
                  </a>
                 <div class="dropdown-menu">
                    <a class="dropdown-item" href="dsch.aspx">Doctor's Schedule</a>
                    <a class="dropdown-item" href="getamb.aspx">Get An Ambulance</a>
                    <a class="dropdown-item" href="users.aspx">Buy Medicine </a>
                  </div>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="about.html">About</a>
                  </li>
              </ul>
              <form class="form-inline my-2 my-md-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search for Doctors">
                <button class="btn btn-outline-light mt-2 mt-sm-0" type="submit">Search</button>
              </form>
            </div>
          </nav>
    </header>
        <div>
            <div class="container shadow" runat="server" id="mDiv">
            <div class="col-7 divsearc row justify-content-center">
                <asp:TextBox CssClass="col-6 input-group-text m-1" placeholder="Search doctors" ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button CssClass="btn col-2 btn-primary m-1" ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
            </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
