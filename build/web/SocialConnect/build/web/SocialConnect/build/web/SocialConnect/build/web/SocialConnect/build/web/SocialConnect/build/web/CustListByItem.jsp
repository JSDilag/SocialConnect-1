
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
        <title>Customer Purchases by Item</title>

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
            <h2>View Customers that purchased a particular item</h2>
            <hr>
        </header>
        <form class = "center-block" style="width: 75%;" action = "CustListByItemView.jsp">
            <label for="inputAdID">Enter Advertisement ID:</label>
            <input type="text" class="form-control" placeholder="33332" id="year" name="AdID">
            <button type = "submit" id = "buttonSubmit" name = "buttonSubmit">Enter</button>
        </form>
       


        
    </body>
</html>
