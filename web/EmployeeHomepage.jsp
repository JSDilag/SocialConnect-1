
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
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        
    </head>

    <body>
        <header>
            <h1>SocialConnect</h1>
        </header>
        
        <nav>
            <ul id="navbar">
                <li id="home" class="navbar-item"><a href="EmployeeHomepage.jsp">Home</a></li>
                <li id="messages" class="navbar-item">Messages</li>
                <li id="advertisements" class="navbar-item">My Advertisements</li>
                <li id="sales" class="navbar-item">My Transactions</li>
                <!--<li id="customers" class="navbar-item">Customers</li>-->
            </ul>
        </nav>

        <div style="clear: both;"></div>

        <!-- Displays the info of the employee -->
        <div id="my-info">
            <h3>Transactions</h3>
            <%
                
            %>
        </div>

        <!--
        Left side bar
        View customers to edit/add/delete
        Produce a list of customer emails
        Produce a list of customer item suggestions
        -->
        <div id="employee-abilities">
            <ul id="buttonlist">
                <!--<li><button id="" class="buttons" onclick="location.href='CreateAdvertisement.jsp'">Create an Advertisement</button></li>-->
<!--                <li><button id="" class="buttons">Delete an Advertisement</button></li>-->
                <!--<li><button id="" class="buttons">Record a Transaction</button></li>-->
                <!--<li><button id="" class="buttons">Customers</button></li>-->
                <!--<li><button id="" class="buttons">Customer Mailing List</button></li>-->
            </ul>
            <div id="advertisement">
                <button class="buttons" onclick="location.href='CreateAdvertisement.jsp'">Create an Advertisement</button>
                <h2>Delete an Advertisement</h2>
                <form>
                    <div class="form-group">
                        <label for="inputAdID">Enter Advertisement ID to delete</label>
                        <input type="number" class="form-control" id="inputAdID" name="adid">
                    </div>
                    <button type="submit">Delete Advertisement</button>
                </form>
            </div>
            <div id="transaction">
                <button id="" class="buttons">Record a Transaction</button>
            </div>
            <div id="customers">
                <button class="buttons">Add Customer</button>
                <button class="buttons">Edit Customer</button>
                <form>
                    <div class="form-group">
                        <label for="inputCustomerID">Enter Customer ID to delete</label>
                        <input type="number" class="form-control" id="inputCustomerID" name="customerid">
                    </div>
                    <button type="submit">Delete Customer</button>
                </form>
            </div>
        </div>

        <footer>
            <p>
                &copy;2015 SocialConnect. Steven Liao
            </p>
        </footer>
    </body>
</html>