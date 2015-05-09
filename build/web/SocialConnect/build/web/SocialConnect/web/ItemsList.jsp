

<!--@page contentType="text/html" pageEncoding="UTF-8"-->
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Items List</title>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
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
