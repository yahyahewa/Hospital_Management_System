<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patient.aspx.cs" Inherits="shar_hospital.patient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="style.css" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style>
    body{
     background-image: url("https://post.healthline.com/wp-content/uploads/2020/08/Doctors_For_Men-732x549-thumbnail-1-732x549.jpg");
     background-repeat:no-repeat;
      background-size: 100%;
    
    }
    div{border-radius:10px !important;}
        .boxes{
            margin:auto;
            margin-top:100px;
        }
        .boxes div{
            height:200px;
            margin:5px;
            border:solid 1px rgb(116 73 73 / 0.00);
            border-radius:6px;
        }
        .imgsl {
            border-radius: 20px;
            top: 0px;
            left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top   ">
            <a class="navbar-brand " href="index.html">Shar Hospital</a>
            <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#nav">
              <span class="navbar-toggler-icon"></span>
            </button>
      
            <div class="collapse navbar-collapse " id="nav">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="index.html">Home</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                    Catagories
                  </a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="doctors.html">Doctor's Schedule</a>
                    <a class="dropdown-item" href="checkup.html">Checkup Due Dates </a>
                    <a class="dropdown-item" href="taxi.html">Get A Taxi</a>
                    <a class="dropdown-item" href="med.html">Buy Medicine </a>
                  </div>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="about.html">About</a>
                  </li>
              </ul>
                <input class="form-control mr-sm-2" type="search" placeholder="Search for Doctors"/>
                <button class="btn btn-outline-light mt-2 mt-sm-0" type="submit">Search</button>
            </div>
          </nav>
    </header>
        <div>
            <div class="col-11 p-3 row justify-content-center row boxes">
                <h3 class="text-center" runat="server" id="pntid">h</h3>
                <div class="bg-danger col-3 shadow ">
                    <a href="checknot.aspx">
                    <asp:Image ID="Image1" runat="server"  src="https://images.agoramedia.com/wte3.0/gcms/due-date-calculator-722x406.jpg" class="img-fluid col-9 m-auto d-block mt-4 imgsl" />
                    </a>
                    <label class="text-center d-block m-2 text-capitalize">Check Up Due Dates</label>
                </div>
                <div class="bg-success col-3 shadow">
                    <a href="dsch.aspx">
                    <img src="https://image.shutterstock.com/image-vector/friendly-female-doctor-near-calendar-260nw-1366515293.jpg" class="img-fluid col-9 m-auto d-block mt-4 imgsl "/>
                        </a>
                    <label class="text-center d-block m-2 text-capitalize">doctor's schedule</label></div>
                <div class="bg-primary col-3 shadow">
                    <a href="bymed.aspx">
                    <img src="data:image/jpeg;base64,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" class="img-fluid col-9 m-auto d-block mt-4 imgsl "/>
                        </a>
                    <label class="text-center d-block m-2 text-capitalize">by medicine</label></div>
                <div class="bg-warning col-3 shadow">
                    <a href="getamb.aspx">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzZuQSN6LulAQUtspx9cyrZrhJKquCod5X0g&usqp=CAU" class="img-fluid col-9 m-auto d-block mt-4 imgsl "/>
                        </a>
                    <label class="text-center d-block m-2 text-capitalize">Get an ambulance</label></div>
            </div>
        </div>
                <div class="col-10 row p-1 shadow m-auto  justify-content-center" style="background-color:rgb(255 255 255 / 0.95)" id="chpass">
                    <h4 class="text-capitalize text-center text-danger">Change my password</h4>
                    <asp:TextBox CssClass="col-7  btn border ch" placeholder="old password" ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:TextBox CssClass="col-7 btn mt-2 border  ch" placeholder="new password" ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:TextBox CssClass="col-7 btn mt-2 border ch" placeholder="confirm new password" ID="TextBox8" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:Button CssClass="btn col-7 btn-success mt-2" ID="Button3" runat="server" Text="change" OnClick="Button3_Click"  />
                    <asp:Label ID="mesg" CssClass="col-7 text-capitalize text-danger text-center" runat="server" Text=""></asp:Label>
                </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

