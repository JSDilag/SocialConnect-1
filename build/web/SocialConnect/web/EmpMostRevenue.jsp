

<!--@page contentType="text/html" pageEncoding="UTF-8"-->
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Best Employee</title>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
            <h2>Employee that generated most revenue</h2>
            <hr>
        </header>
        <TABLE BORDER="3" CELLSPACING="1" CELLPADDING="1">
            <TR> <TD ALIGN = "center">SSN</TD>
                <TD ALIGN = "center">First Name</TD>
                <TD ALIGN = "center">Last Name</TD>
                <TD ALIGN = "center">Revenue</TD>
            </TR>
        <%
            String query = "SELECT E.SSN, E.FirstName, E.LastName,  SUM(S.Quantity * A.UnitPrice) "
                    + "AS Revenue FROM Employee E INNER JOIN Advertisement A INNER JOIN Sale S WHERE "
                    + "E.EmployeeID = A.EmployeeID AND S.AdvertisementID = A.AdvertisementID "
                    + "ORDER BY Revenue DESC LIMIT 1 ";
            java.sql.ResultSet rs = DBConnection.ExecQuery(query);

            while (rs.next()) {
                String ssn = rs.getString("SSN");
                String firstName = rs.getString("FirstName");
                String lastName = rs.getString("LastName");
                String revenue = rs.getString("Revenue");
        %>


        
            <TR> <TD ALIGN = "center"><%out.println(ssn);%> </TD>
                <TD ALIGN = "center"><%out.println(firstName);%> </TD>
                <TD ALIGN = "center"><%out.println(lastName);%> </TD>
                <TD ALIGN = "center"><%out.println(revenue);%> </TD>
            </TR>

        <%
            }
        %>
        </TABLE>
        <a href="ManagerHomepage.jsp"> Back to Homepage</a>
    </body>

</html>
