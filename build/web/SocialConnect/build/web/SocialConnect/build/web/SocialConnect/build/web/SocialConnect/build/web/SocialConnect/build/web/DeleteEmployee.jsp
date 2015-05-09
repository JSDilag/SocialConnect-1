
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
        <title>Delete Employee</title>

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
