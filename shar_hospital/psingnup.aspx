<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="psingnup.aspx.cs" Inherits="shar_hospital.getamb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="style.css" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style>        .mdiv {
            margin-top:80px !important;
        }
    </style>
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
                <asp:Panel class="col-12 row  justify-content-between" runat="server" id="addingPatirntPanel">
                    <label class="text-capitalize text-center col-12 d-block m-1" runat="server" id="ptitle">Adding patient</label>
                <div id="Adp" runat="server" class="col-5 mt-5 p-3 m-auto">
                    <label class="text-capitalize d-block m-1  m-auto">First name</label>
                    <asp:TextBox ID="pfn" runat="server" CssClass="input-group-text col-12"></asp:TextBox>
                    <label class="text-capitalize d-block m-1">Last name</label>
                    <asp:TextBox ID="pln" runat="server" CssClass="input-group-text col-12"></asp:TextBox>
                    <label class="text-capitalize d-block m-1">gender</label>
                    <asp:DropDownList ID="pgen" runat="server" CssClass="input-group-text col-12">
                        <asp:ListItem>male</asp:ListItem>
                        <asp:ListItem>female</asp:ListItem>
                        <asp:ListItem>other</asp:ListItem>
                    </asp:DropDownList>
                    <label class="text-capitalize d-block m-1">Phone Number</label>
                    <asp:TextBox ID="pphnum" runat="server" CssClass="input-group-text col-12"></asp:TextBox>
                    <label class="text-capitalize d-block m-1">birthday</label>
                    <asp:TextBox ID="pbday" runat="server" CssClass="input-group-text col-12" TextMode="Date"></asp:TextBox>
                    <label class="text-capitalize d-block m-1">Password</label>
                    <asp:TextBox ID="ppass" runat="server" CssClass="input-group-text col-12 "></asp:TextBox>
                    Chronic illness
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="input-group-text col-12 mb-2"></asp:DropDownList>
                    <asp:Button ID="Button7" CssClass="btn-success col-12 btn m-auto" runat="server" Text="Submet" OnClick="Button7_Click"  />
                </div>
                </asp:Panel>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
