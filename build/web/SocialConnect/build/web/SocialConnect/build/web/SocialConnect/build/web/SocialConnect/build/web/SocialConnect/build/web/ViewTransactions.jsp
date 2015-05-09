
<!--@page contentType="text/html" pageEncoding="UTF-8" -->
<!--
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>
-->
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>View Transactions</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/manager.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </head>
    <body>
        <jsp:include page = "ManagerNav.jsp"/>
        <br><br><header>
            <h2>View Transactions...</h2>
            <hr>
        </header>

        <form class = "center-block" style="width: 75%;" action = "ViewTransByCust.jsp">
            <label for="inputCustName">Enter Customer Name:</label>
            <input type="text" class="form-control" placeholder="Alice McKeeny" id="year" name="CustName">
            <button type = "submit" id = "buttonSubmit" name = "buttonSubmit">Enter</button>
        </form>
        <form class = "center-block" style="width: 75%;" action = "ViewTransByItem.jsp">
            <label for="inputItemName">Enter Item Name: </label>
            <input type="text" class="form-control" placeholder="04" id="month" name="ItemName">
            <button type = "submit" id = "buttonSubmit" name = "buttonSubmit">Enter</button>
        </form>
            

    </body>
</html>
