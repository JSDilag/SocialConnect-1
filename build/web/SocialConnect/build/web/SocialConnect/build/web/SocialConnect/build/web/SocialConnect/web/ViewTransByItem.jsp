

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
            <TR> <TD ALIGN = "center">TransactionID</TD>
                <TD ALIGN = "center">DateTime</TD>
                <TD ALIGN = "center">AdvertisementID</TD>
                <TD ALIGN = "center">Quantity</TD>
                <TD ALIGN = "center">Account Number</TD>
            </TR>
            <%
                String itemName = request.getParameter("ItemName");
                String query = "SELECT S.* FROM Sale S, Advertisement A WHERE S.AdvertisementID = "
                        + "A.AdvertisementID AND A.ItemName = '"+ itemName + "'";
                java.sql.ResultSet rs = DBConnection.ExecQuery(query);

                while (rs.next()) {
                    String transactionID = rs.getString("TransactionID");
                    String dateTime = rs.getString("DateTime");
                    String advertisementID = rs.getString("AdvertisementID");
                    String quantity = rs.getString("Quantity");
                    String accountNumber = rs.getString("AccountNumber");
            %>



            <TR> <TD ALIGN = "center"><%out.println(transactionID);%> </TD>
                <TD ALIGN = "center"><%out.println(dateTime);%> </TD>
                <TD ALIGN = "center"><%out.println(advertisementID);%> </TD>
                <TD ALIGN = "center"><%out.println(quantity);%> </TD>
                <TD ALIGN = "center"><%out.println(accountNumber);%> </TD>
            </TR>

            <%
                }
            %>
        </TABLE>
        <a href="ManagerHomepage.jsp"> Back to Homepage</a>
    </body>

</html>
