
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Customer Item Suggestions</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/employee.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    </head>
    
    <body>
        <header>
            <h1>SocialConnect</h1>
            <h2>Create Customer</h2>
            <hr>
        </header>
        
        <a href="EmployeeHomepage.jsp" class="right">Return to homepage</a>
        
        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputCustomerID">Enter Customer ID to produce item suggestions</label>
                <input type="number" class="form-control" id="inputCustomerID" name="customerid">
            </div>
            <button type="submit" id="submit">Submit</button>
        </form>
        
        <%
            if (request.getParameter("submit") != null)
            {
                String query = "SELECT A.Item_Name, A.Advertisement_Id FROM Advertisement  A  "
                        + "WHERE A.Employee = ? AND A.Number_Of_Units>0  AND A.Type IN "
                        + "(SELECT DISTINCT (A.Type) FROM Advertisement A "
                        + "INNER JOIN Purchase P "
                        + "INNER JOIN User U ON "
                        + "A.Advertisement_Id = P.Advertisement AND P.User = U.User_Id WHERE U.User_Id = ? ) ";
                ResultSet rs = DBConnection.ExecQuery(query);
            }
            
        %>
        
    </body>
</html>
