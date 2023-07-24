<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getamb.aspx.cs" Inherits="shar_hospital.psingnup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <style>
        body {
           /* background-image: url("https://post.healthline.com/wp-content/uploads/2020/08/Doctors_For_Men-732x549-thumbnail-1-732x549.jpg");
           */
      background-image: url("Images/back3.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
        }
    </style>
    <title></title>
</head>
<body>
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
        <div class="container " style="margin-top:100px;">
            <asp:Label ID="Label1" CssClass="text-capitalize text-white d-block text-center display-5" runat="server" Text="Get an ambulance"></asp:Label>
            <div class="col-6 m-auto p-1">
                <label class="d-block text-capitalize text-white mb-1" style="font-size:20px;">your location:</label>
                <asp:TextBox ID="TextBox1" CssClass="col-12 input-group-text" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" CssClass="col-12 mt-2 btn btn-success" runat="server" Text="Submit" OnClick="Button1_Click" />
                <label runat="server" id="msg" class="d-block text-center text-capitalize text-white mt-1" style="font-size:20px;"></label>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
