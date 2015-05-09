<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Add an Employee</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/manager.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
            <h2>Add an Employee</h2>
            <hr>
        </header>
        
        <a href="ManagerHomepage.jsp" class="right">Return to homepage</a>
        
        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputFirstName">SSN</label>
                <input type="text" class="form-control" id="inputFirstName" name="SSN">
            </div>
            <div class="form-group">
                <label for="inputFirstName">First Name</label>
                <input type="text" class="form-control" id="inputFirstName" name="firstname">
            </div>
            <div class="form-group">
                <label for="inputLastName">Last Name</label>
                <input type="text" class="form-control" id="inputLastName" name="lastname">
            </div>
            <div class="form-group">
                <label for="inputAddress">Address</label>
                <input type="text" class="form-control" id="inputAddress" name="address">
            </div>
            <div class="form-group">
                <label for="inputCity">City</label>
                <input type="text" class="form-control" id="inputCity" name="city">
            </div>
            <div class="form-group">
                <label for="inputState">State</label>
                <input type="text" class="form-control" id="inputState" name="state">
            </div>
            <div class="form-group">
                <label for="inputZipCode">Zip Code</label>
                <input type="text" class="form-control" id="inputZipCode" name="zipcode">
            </div>
            <div class="form-group">
                <label for="inputTelephone">Phone Number</label>
                <input type="tel" class="form-control" id="inputTelephone" name="telephone">
            </div>
            <div class="form-group">
                <label for="inputPreferences">Hourly Rate</label>
                <input type="text" class="form-control" id="inputPreferences" name="hourlyrate">
            <div class="form-group">
                <label for="inputPreferences">PASSWORD</label>
                <input type="text" class="form-control" id="inputPreferences" name="password">
            </div>
            
            <button type="submit" name="btnAdd">Add Employee</button>
            <%
                if (request.getParameter("btnAdd") != null)
                {
                    String ssn = request.getParameter("SSN");
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String address = request.getParameter("address");
                    String city = request.getParameter("city");
                    String state = request.getParameter("state");
                    String zipcode = request.getParameter("zipcode");
                    String phonenumber = request.getParameter("telephone");
                    String hourlyrate = request.getParameter("hourlyrate");
                    String password = request.getParameter("password");
                    
                    if (!ssn.isEmpty() && !firstname.isEmpty() && !lastname.isEmpty() && !address.isEmpty() && !city.isEmpty() &&
                        !state.isEmpty() && !zipcode.isEmpty() && !phonenumber.isEmpty() &&
                        !hourlyrate.isEmpty() && !password.isEmpty())
                    {
                        String query = "SELECT MAX(EmployeeID) FROM Employee;";
                        java.sql.ResultSet rs = DBConnection.ExecQuery(query);

                        // CHECKS TO SEE IF THERE ARE ANY ADS IN DATABASE YET
                        String employeeID = (rs != null && rs.next()) ? 
                                "" + (Integer.parseInt(rs.getString(1)) + 1) : "0";
                        String rating = String.valueOf((int)(Math.random() * 10) + 1);

                        // UPDATE THE Employee TABLE IN DATABASE
                        query = "INSERT INTO Employee VALUES('" + ssn +"', " + employeeID
                                + ", '" + firstname + "', '" + lastname + "', '" + address + "', '" + city
                                + "', '" + state + "', " + zipcode + ", '" + phonenumber
                                + "', '" + Calendar.getInstance().get(Calendar.YEAR) + "-" + Calendar.getInstance().get(Calendar.MONTH) + "-" + Calendar.getInstance().get(Calendar.DAY_OF_MONTH)
                                + "', " + hourlyrate + ", 'Customer Representative'" + ", '" + password + "');";
                        int rowsUpdated = DBConnection.ExecUpdateQuery(query);

                        query = "INSERT INTO Supervises VALUES(111220, " + employeeID + ");";
                        int supervisesUpdated = DBConnection.ExecUpdateQuery(query);
                        // CHECK IF THE Emp WAS INSERTED INTO THE DATABASE
                        if (rowsUpdated <= 0)
                        {
                            out.print("An input is missing or invalid.");
                        } else
                        {
                            out.print("Employee account added successfully");
                        }
                    }
                }
            %>
        </form>
    </body>
</html>
