

<!--@page contentType="text/html" pageEncoding="UTF-8"-->
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Items Being Advertised</title>

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
        <header>
            <h2>Listing of all items being advertised</h2>
            <hr>
        </header>
        <TABLE BORDER="3" CELLSPACING="1" CELLPADDING="1">
            <TR> <TD ALIGN = "center">Item Name</TD>
                <TD ALIGN = "center">Unit Price</TD>
                <TD ALIGN = "center">Quantity</TD>
            </TR>
        <%
            String query = "SELECT A.ItemName, A.UnitPrice, A.Quantity  FROM Advertisement A";
            java.sql.ResultSet rs = DBConnection.ExecQuery(query);

            while (rs.next()) {
                String itemName = rs.getString("ItemName");
                String unitPrice = rs.getString("UnitPrice");
                String quantity = rs.getString("Quantity");
        %>


        
            <TR> <TD ALIGN = "center"><%out.println(itemName);%> </TD>
                <TD ALIGN = "center"><%out.println(unitPrice);%> </TD>
                <TD ALIGN = "center"><%out.println(quantity);%> </TD>
            </TR>

        <%
            }
        %>
        </TABLE>
        <a href="ManagerHomepage.jsp"> Back to Homepage</a>
    </body>

</html>
