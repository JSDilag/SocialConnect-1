

<!--@page contentType="text/html" pageEncoding="UTF-8"-->
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Customers</title>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
            <h2>View Customers</h2>
            <hr>
        </header>
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
