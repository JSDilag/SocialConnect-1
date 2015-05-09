
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Receipts</title>

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
            <h2>My Advertisement Transaction Receipts</h2>
        </header>
        
        <table>
            <tr>
                <th>Transaction ID</th>
                <th>Date Time</th>
                <th>Advertisement ID</th>
                <th>Quantity</th>
                <th>Account Number</th>
            </tr>   
            <%
                String employeeID = (String) session.getAttribute("login");
                String query = "SELECT S.* FROM Sale S, Advertisement A "
                        + "WHERE A.EmployeeID = " + employeeID + " "
                        + "AND A.AdvertisementID = S.AdvertisementID;";
                ResultSet rs = DBConnection.ExecQuery(query);

                while (rs.next())
                {
                    %>
                    <tr>
                        <td><%out.print(rs.getString("TransactionID"));%></td>
                        <td><%out.print(rs.getString("DateTime"));%></td>
                        <td><%out.print(rs.getString("AdvertisementID"));%></td>
                        <td><%out.print(rs.getString("Quantity"));%></td>
                        <td><%out.print(rs.getString("AccountNumber"));%></td>
                    </tr>
                    <%
                }
            %>
        </table>
        <a href="EmployeeHomepage.jsp">Return to homepage</a>
    </body>
</html>
