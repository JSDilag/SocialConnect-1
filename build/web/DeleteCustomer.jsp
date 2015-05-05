
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
        <title>Delete Customer</title>

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
            <h2>Delete Customer</h2>
            <hr>
        </header>
        
        <a href="EmployeeHomepage.jsp" class="right">Return to homepage</a>
        
        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputCustomerID">Enter Customer ID to delete</label>
                <input type="number" class="form-control" id="inputCustomerID" name="customerid">
            </div>
            <button type="submit" name="btnDelete">Delete</button>
            <%
                if (request.getParameter("btnDelete") != null)
                {
                    String customerID = request.getParameter("customerid");
                    if (!customerID.isEmpty())
                    {
                        // DELETES THE Advertisement FROM DATABASE
                        String query = "DELETE FROM Customer "
                                + "WHERE CustomerID = " + customerID + ";";
                        int deleted = DBConnection.ExecUpdateQuery(query);
                        
                        // CHECK IF IT HAS BEEN DELETED
                        if (deleted <= 0)
                        {
                            out.println("<script type=\"text/javascript\">\n"
                                    + "alert('The advertisement ID is invalid.');\n"
                                    + "</script>");
                        } else
                        {
                            out.println("<script type=\"text/javascript\">\n"
                                    + "boolean b = confirm('Customer has been deleted."
                                    + "Click OK to redirect to homepage and Cancel otherwise.);\n"
                                    + "if (b) location = EmployeeHomepage.jsp\n"
                                    + "</script>");
                        }
                    } else
                    {
                        out.println("<script type=\"text/javascript\">\n"
                                + "alert('Customer ID cannot be empty!');\n"
                                + "</script>");
                    }
                }
            %>
        </form>
    </body>
</html>
