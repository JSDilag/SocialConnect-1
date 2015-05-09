

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
        <title>Transactions by Customer</title>

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
            <h2>View Transactions by Customer</h2>
            <hr>
        </header>
        <a href="ViewTransactions.jsp" class="right">Back</a>
        <TABLE BORDER="3" CELLSPACING="1" CELLPADDING="1">
            <TR> <TD ALIGN = "center">TransactionID</TD>
                <TD ALIGN = "center">DateTime</TD>
                <TD ALIGN = "center">AdvertisementID</TD>
                <TD ALIGN = "center">Quantity</TD>
                <TD ALIGN = "center">Account Number</TD>
            </TR>
            <%
                String name = request.getParameter("CustName");
                String firstName = name.split(" ")[0];
                String lastName = name.split(" ")[1];
                String query = "SELECT S.* FROM Sale S, Customer C, Account Ac WHERE "
                        + "S.AccountNumber = Ac.AccountNumber AND Ac.CustomerID = C.CustomerID "
                        + "AND C.FirstName = '" + firstName + "' AND C.LastName = '" + lastName + "'";
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
       
    </body>

</html>
