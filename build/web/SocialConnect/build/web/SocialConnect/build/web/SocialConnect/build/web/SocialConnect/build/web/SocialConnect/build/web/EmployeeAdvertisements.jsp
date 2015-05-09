
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
        <title>My Advertisements</title>

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
            <h2>My Advertisements</h2>
        </header>
        
        <table>
            <tr>
                <th>Advertisement ID</th>
                <th>Employee ID</th>
                <th>Type</th>
                <th>Date</th>
                <th>Company</th>
                <th>Item Name</th>
                <th>Content</th>
                <th>Unit Price</th>
                <th>Quantity</th>
            </tr>   
            <%
                String employeeID = (String) session.getAttribute("login");
                String query = "SELECT * FROM Advertisement WHERE EmployeeID = " + employeeID + ";";
                ResultSet rs = DBConnection.ExecQuery(query);

                while (rs.next())
                {
                    %>
                    <tr>
                        <td><%out.print(rs.getString("AdvertisementID"));%></td>
                        <td><%out.print(rs.getString("EmployeeID"));%></td>
                        <td><%out.print(rs.getString("Type"));%></td>
                        <td><%out.print(rs.getString("Date"));%></td>
                        <td><%out.print(rs.getString("Company"));%></td>
                        <td><%out.print(rs.getString("ItemName"));%></td>
                        <td><%out.print(rs.getString("Content"));%></td>
                        <td><%out.print(rs.getString("UnitPrice"));%></td>
                        <td><%out.print(rs.getString("Quantity"));%></td>
                    </tr>
                    <%
                }
            %>
        </table>
        <a href="EmployeeHomepage.jsp">Return to homepage</a>
    </body>
</html>
