<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bymed.aspx.cs" Inherits="shar_hospital.bymed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

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
            <style>                h1 {margin-top:100px;
                }
            </style>
            <h1 class="text-capitalize text-center text-primary">by medicine</h1>
            <asp:Panel ID="Panel1" CssClass="col-3 p-1 justify-content-center m-2 shadow m-auto" runat="server">
                <label class="text-capitalize d-block ">upload your receipt:</label>
                <asp:FileUpload ID="FileUpload1" CssClass=" input-group-text col-12" runat="server" />
                <label class="text-capitalize d-block">location:</label>
                <asp:TextBox CssClass="input-group-text col-12" ID="loc" runat="server"></asp:TextBox>
                <label class="text-capitalize d-block">ph.Num:</label>
                <asp:TextBox CssClass="input-group-text col-12 mb-3" ID="phone" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" CssClass="btn btn-success col-12 d-block" runat="server" Text="Order" OnClick="Button1_Click" />
                <label id="msg" runat="server" class="text-capitalize text-center mt-2 d-block"></label>
            </asp:Panel>
        </div>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
