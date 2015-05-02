
<!--
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>
-->
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Homepage Dashboard</title>

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

        <!-- Displays the info of the employee -->
        <div id="my-info">
            <span>My name<br></span>
        </div>

        <!--
        Left side bar
        View customers to edit/add/delete
        Produce a list of customer emails
        Produce a list of customer item suggestions
        -->
        <div id="content">
            <ul id="buttonlist">
                <li><button id="create-ad" class="buttons">Create an Advertisement</button></li>
                <li><button id="" class="buttons">Delete an Advertisement</button></li>
                <li><button id="" class="buttons">Record a Transaction</button></li>
                <li><button id="" class="buttons">Customers</button></li>
                <li><button id="" class="buttons">Customer Mailing List</button></li>
            </ul>
        </div>

        <footer>
            <p>
                &copy;2015 SocialConnect. Steven Liao
            </p>
        </footer>
    </body>
</html>