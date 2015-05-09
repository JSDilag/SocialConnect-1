
<!--@page contentType="text/html" pageEncoding="UTF-8" -->
<!--
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>
-->
<!DOCTYPE html>

<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
    <title>Sales Report</title>

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
            <h2>Sales Report</h2>
            <hr>
        </header>
        <form class = "center-block" style="width: 75%;">
            <label for="inputDate">Enter a year (YYYY)</label>
            <input type="text" class="form-control" placeholder="2010" id="year" name="year">
            <label for="inputDate">Enter a month (MM)</label>
            <input type="text" class="form-control" placeholder="04" id="month" name="month">
            <button type = "submit" id = "buttonSubmit" name = "buttonSubmit">Enter</button>

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

                        while (rs.next()) {
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
                </TR>
                <%
                        }
                    }

                %>
            </TABLE>
        </form>
    </body>
</html>
