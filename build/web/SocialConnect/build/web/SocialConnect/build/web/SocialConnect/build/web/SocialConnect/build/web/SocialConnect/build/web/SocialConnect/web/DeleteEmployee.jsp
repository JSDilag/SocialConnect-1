
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
        <title>View Transactions</title>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
            <h2>Delete an Employee</h2>
            <hr>
        </header>

        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputEmpID">Enter Employee ID:</label>
                <input type="text" class="form-control" id="inputEmpID" name="EmpID">

                <button type="submit" name="btnDelete">Delete</button>
                <%
                    if (request.getParameter("btnDelete") != null) {
                        String empID = request.getParameter("EmpID");

                        String query = "Delete from Employee Where EmployeeID = " + empID + ";";
                        int result = DBConnection.ExecUpdateQuery(query);
                        
                        if(result == 0){
                            out.print("Invalid ID input.");
                        }
                        else{
                            out.print("Successfully deleted Employee.");
                        }
                    }

                %>
        </form>


        <a href ="ManagerHomepage.jsp">Return To Homepage</a>
    </body>
</html>
