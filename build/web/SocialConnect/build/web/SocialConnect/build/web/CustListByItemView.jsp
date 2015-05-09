

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
            <h2>View Customers</h2>
            <hr>
        </header>
        <a href="CustListByItem.jsp" class="right">Back</a>
        <TABLE BORDER="3" CELLSPACING="1" CELLPADDING="1">
            <TR> <TD ALIGN = "center">CustomerID</TD>
                <TD ALIGN = "center">First Name</TD>
                <TD ALIGN = "center">Last Name</TD>
                <TD ALIGN = "center">Item Name</TD>
            </TR>
        <%
            String adID = request.getParameter("AdID");
            String query = "SELECT C.CustomerID, C.FirstName, C.LastName, A.ItemName "
                    + "FROM Sale S, Customer C, Advertisement A, Account Ac "
                    + "WHERE A.AdvertisementID = S.AdvertisementID AND Ac.CustomerID = C.CustomerID "
                    + "AND Ac.AccountNumber = S.AccountNumber AND A.AdvertisementID = " + adID + ";";
            java.sql.ResultSet rs = DBConnection.ExecQuery(query);

            while (rs.next()) {
                String customerID = rs.getString("CustomerID");
                String firstName = rs.getString("FirstName");
                String lastName = rs.getString("LastName");
                String itemName = rs.getString("ItemName");
              
        %>


        
            <TR> <TD ALIGN = "center"><%out.println(customerID);%> </TD>
                <TD ALIGN = "center"><%out.println(firstName);%> </TD>
                <TD ALIGN = "center"><%out.println(lastName);%> </TD>
                <TD ALIGN = "center"><%out.println(itemName);%> </TD>
                
            </TR>

        <%
            }
        %>
        </TABLE>
        <a href="ManagerHomepage.jsp"> Back to Homepage</a>
    </body>

</html>
