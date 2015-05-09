
<%@page import="java.sql.ResultSet"%>
<%@page import="DBWorks.DBConnection"%>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Create Advertisement</title>

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
            <h1><b>SocialConnect</b></h1>
            <h2>Create Advertisement</h2>
            <hr>
        </header>
        
        <a href="EmployeeHomepage.jsp" class="right">Return to homepage</a>
        
        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputType">Type</label>
                <input type="text" class="form-control" id="inputType" name="type">
            </div>
            <div class="form-group">
                <label for="inputDate">Date</label>
                <input type="date" class="form-control" id="inputDate" name="date">
            </div>
            <div class="form-group">
                <label for="inputCompany">Company</label>
                <input type="text" class="form-control" id="inputCompany" name="company">
            </div>
            <div class="form-group">
                <label for="inputItemName">Item Name</label>
                <input type="text" class="form-control" id="inputItemName" name="itemName">
            </div>
            <div class="form-group">
                <label for="inputContent">Content</label>
                <input type="text" class="form-control" id="inputContent" name="content">
            </div>
            <div class="form-group">
                <label for="inputUnitPrice">Unit Price</label>
                <input type="number" class="form-control" min="0" id="inputUnitPrice" name="unitPrice">
            </div>
            <div class="form-group">
                <label for="inputQuantity">Quantity</label>
                <input type="number" class="form-control" min="0" id="inputQuantity" name="quantity">
            </div>
            <button type="submit" name="btnCreate">Create</button>
            <%
                if (request.getParameter("btnCreate") != null)
                {
                    String type = request.getParameter("type");
                    String date = request.getParameter("date");
                    String company = request.getParameter("company");
                    String itemName = request.getParameter("itemName");
                    String content = request.getParameter("content");
                    String unitPrice = request.getParameter("unitPrice");
                    String quantity = request.getParameter("quantity");
                    
                    if (!type.isEmpty() && !date.isEmpty() && !company.isEmpty() &&
                        !itemName.isEmpty() && !content.isEmpty() && !unitPrice.isEmpty() &&
                        !quantity.isEmpty())
                    {
                        String query = "SELECT MAX(AdvertisementID) FROM Advertisement;";
                        ResultSet rs = DBConnection.ExecQuery(query);

                        // CHECKS TO SEE IF THERE ARE ANY ADS IN DATABASE YET
                        String advertisementID = (rs != null && rs.next()) ? 
                                "" + (Integer.parseInt(rs.getString(1)) + 1) : "0";
                        String employeeID = (String) session.getAttribute("login");


                        // UPDATE THE Advertisement TABLE IN DATABASE
                        query = "INSERT INTO Advertisement VALUES(" + advertisementID
                                + ", " + employeeID + ", '" + type + "', '" + date
                                + "', '" + company + "', '" + itemName + "', '" + content
                                + "', " + unitPrice + ", " + quantity + ");";
                        int rowsUpdated = DBConnection.ExecUpdateQuery(query);                        

                        // CHECK IF THE Ad WAS INSERTED INTO THE DATABASE
                        if (rowsUpdated > 0)
                        {
                            // INSERT THIS TRANSACTION INTO Places RELATIONSHIP
                            query = "INSERT INTO Places VALUES(" + employeeID 
                                    + ", " + advertisementID + ");";
                            DBConnection.ExecUpdateQuery(query);
                            
                            out.println("<script type=\"text/javascript\">\n"
                                    + "var b = confirm('Advertisement " + advertisementID + " has been created. "
                                    + "Click OK to redirect to homepage or Cancel otherwise.');\n"
                                    + "if (b) location = \"EmployeeHomepage.jsp\";\n"
                                    + "</script>");
                        } else
                        {
                            out.println("<script type=\"text/javascript\">\n"
                                    + "alert('An error occurred while trying to update.');\n"
                                    + "</script>");
                        }
                    } else
                    {
                        out.println("<script type=\"text/javascript\">\n"
                                + "alert('All forms must be filled out before submitting!');\n"
                                + "</script>");
                    }
                }
            %>
        </form>
    </body>
</html>
