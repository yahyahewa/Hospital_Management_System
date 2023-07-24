<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="shar_hospital.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="style.css" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <style>
    body{
      background-image: url("Images/back3.jpg");
      background-size: 100%;
    
    }
    .jumbotron{background-color:rgb(255 255 255 / 0.00) !important;}
    </style>
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
    <main class=" overflow-hidden mt-5">
      <div class="row ">
        <div class="container">
          <div class="jumbotron">
            <h1 class="text-white ">Welcome to Shar Hospital</h1>
            <p class="lead text-white">A heritage in care. A reputation in excellence</p>
            <br /><br />
            <div class="justify-content-center">
              <a href="dsch.aspx" class="btn btn-outline-light btn-lg btn-inline mr-2 mt-2">Doctor's Schedule</a>
              <a href="getamb.aspx" class="btn btn-outline-light btn-lg btn-inline mr-2 mt-2">Get An Ambulance</a>
              <a href="bymed.aspx" class="btn btn-outline-light btn-lg btn-inline mr-2 mt-2">Buy Medicine</a>
              <a href="users.aspx" class="btn btn-outline-light btn-lg btn-inline mr-2 mt-2">singup</a>
              
            </div>
          </div>
        </div>
        
      </div>
    </main>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </div>
    </form>
</body>
</html>
