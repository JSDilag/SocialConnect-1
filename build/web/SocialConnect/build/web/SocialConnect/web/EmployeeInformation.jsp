


<%@page import="java.sql.ResultSet"%>
<%@page import="DBWorks.DBConnection"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Employee Information</title>

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
            <h2>Employee Information</h2>
        </header>
        
        <table>
            <tr>
                <th>Employee ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Zip Code</th>
                <th>Phone Number</th>
                <th>Start Date</th>
            </tr>   
            <%
                String query = "SELECT EmployeeID, FirstName, LastName, Address, "
                        + "City, State, ZipCode, Telephone, StartDate FROM Employee;";
                ResultSet rs = DBConnection.ExecQuery(query);

                while (rs.next())
                {
                    %>
                    <tr>
                        <td><%out.print(rs.getString("EmployeeID"));%></td>
                        <td><%out.print(rs.getString("FirstName"));%></td>
                        <td><%out.print(rs.getString("LastName"));%></td>
                        <td><%out.print(rs.getString("Address"));%></td>
                        <td><%out.print(rs.getString("City"));%></td>
                        <td><%out.print(rs.getString("State"));%></td>
                        <td><%out.print(rs.getString("ZipCode"));%></td>
                        <td><%out.print(rs.getString("Telephone"));%></td>
                        <td><%out.print(rs.getString("StartDate"));%></td>
                    </tr>
                    <%
                }
            %>
        </table>
        <a href="EmployeeHomepage.jsp">Return to homepage</a>
    </body>
</html>
