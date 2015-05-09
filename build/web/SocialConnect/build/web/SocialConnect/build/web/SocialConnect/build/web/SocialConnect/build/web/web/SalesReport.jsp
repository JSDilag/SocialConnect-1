
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
        <label for="inputDate">Enter a year (YYYY)</label>
        <input type="text" class="form-control" placeholder="2010" id="year" name="year">
        <label for="inputDate">Enter a month (MM)</label>
        <input type="text" class="form-control" placeholder="04" id="month" name="month">
        <button type = "submit" name = "buttonSubmit">Enter</button>
        
        <% 
            String month = (String)request.getParameter("month");
            String year = (String)request.getParameter("year");
            if(request.getParameter("buttonSubmit") != null){
                String query = "SELECT  A.AdvertisementId,  A.Item_Name , E.EmployeeId, "
                        + "SUM(P.Number_Of_Units) as TSaleOnItem, SUM(P.Number_Of_Units * A.Unit_Price)  "
                        + "FROM Employee E INNER JOIN Purchase P INNER JOIN Advertisement A "
                        + "ON P.Advertisement =A.AdvertisementId AND A.Employee = E.EmployeeId  WHERE MONTH(P.Date) = " 
                        + month + " AND YEAR(P.Date) =" + year + " GROUP BY A.AdvertisementId";
                java.sql.ResultSet rs = DBConnection.ExecQuery(query);
            }
        
        %>
    </body>
</html>
