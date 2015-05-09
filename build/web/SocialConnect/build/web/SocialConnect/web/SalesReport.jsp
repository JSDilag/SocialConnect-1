
<!--@page contentType="text/html" pageEncoding="UTF-8" -->
<!--
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Report</title>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
            <h2>Sales Report</h2>
            <hr>
        </header>
        <form style="width: 50%;">
            <label for="inputDate">Enter a year (YYYY)</label>
            <input type="text" class="form-control" placeholder="2010" id="year" name="year">
            <label for="inputDate">Enter a month (MM)</label>
            <input type="text" class="form-control" placeholder="04" id="month" name="month">
            <button type = "submit" id = "buttonSubmit" name = "buttonSubmit">Enter</button>
        </form>
        <TABLE BORDER="3" CELLSPACING="1" CELLPADDING="1">
            <TR> <TD ALIGN = "center">AdvertisementID</TD>
                <TD ALIGN = "center">Item Name</TD>
                <TD ALIGN = "center">EmployeeID</TD>
                <TD ALIGN = "center">Number Sold</TD>
                <TD ALIGN = "center">Revenue</TD>
            </TR>
        <%
            if (request.getParameter("buttonSubmit") != null) {
                String month = (String) request.getParameter("month");
                String year = (String) request.getParameter("year");

                String query = "SELECT  A.AdvertisementId,  A.ItemName , E.EmployeeId, SUM(S.Quantity) "
                        + "as TSaleOnItem, SUM(S.Quantity * A.UnitPrice) as Revenue FROM Employee E INNER JOIN Sale S "
                        + "INNER JOIN Advertisement A ON S.AdvertisementID = A.AdvertisementId AND "
                        + "A.EmployeeID = E.EmployeeId WHERE MONTH(S.DateTime) = " + month
                        + " AND YEAR(S.DateTime) = " + year + " GROUP BY A.AdvertisementId;";
                java.sql.ResultSet rs = DBConnection.ExecQuery(query);

                while(rs.next()) {
                    String advertisementID = rs.getString("AdvertisementID");
                    String itemName = rs.getString("ItemName");
                    String employeeID = rs.getString("EmployeeID");
                    String tSaleOnItem = rs.getString("TSaleOnItem");
                    String revenue = rs.getString("Revenue");
        %>
            <TR> <TD ALIGN = "center"><%out.println(advertisementID);%> </TD>
                <TD ALIGN = "center"><%out.println(itemName);%> </TD>
                <TD ALIGN = "center"><%out.println(employeeID);%> </TD>
                <TD ALIGN = "center"><%out.println(tSaleOnItem);%> </TD>
                <TD ALIGN = "center"><%out.println(revenue);%> </TD>

        <%        
                }
            }

        %>
        </TABLE>
    </body>
</html>
