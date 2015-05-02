
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Record a Transaction</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/employee.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        
        <header>
            <h1>
                <b>SocialConnect</b>
            </h1>
            <hr>

            <ul id="navbar">
                <li id="home" class="navbar-item"><a href="EmployeeHomepage.jsp">Home</a></li>
                <li id="messages" class="navbar-item">Messages</li>
                <li id="circles" class="navbar-item">Circles</li>
                <li id="advertisements" class="navbar-item">My Advertisements</li>
                <li id="sales" class="navbar-item">My Transactions</li>
                <li id="customers" class="navbar-item">Customers</li>
            </ul>

            <div style="clear: both;"></div>

        </header>
        
        <form>
            
            <div class="form-group">
                <label for="inputAdID">Advertisement ID</label>
                <input type="text" class="form-control" id="inputAdID" name="adid">
            </div>
            <div class="form-group">
                <label for="inputDate">Quantity</label>
                <input type="number" class="form-control" id="inputQuantity" name="quantity">
            </div>
            <div class="form-group">
                <label for="inputAccountNumber">Account Number</label>
                <input type="text" class="form-control" id="inputAccountNumber" name="accountnumber">
            </div>
            <div class="form-group">
                <label for="inputDate">Date</label>
                <input type="date" class="form-control" id="inputDate" name="date">
            </div>
            <button></button>
            
        </form>
        
        <%
            String accountNumber = request.getParameter("");
            String quantity = request.getParameter("");
            String totalPrice = request.getParameter("");
            String dateTime = request.getParameter("");
        %>
    </body>
</html>
