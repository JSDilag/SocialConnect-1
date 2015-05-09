
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
        <title>Create Customer</title>

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
                <label for="inputFirstName">First Name</label>
                <input type="text" class="form-control" id="inputFirstName" name="firstname" required>
            </div>
            <div class="form-group">
                <label for="inputLastName">Last Name</label>
                <input type="text" class="form-control" id="inputLastName" name="lastname" required>
            </div>
            <div class="form-group">
                <label for="inputSex">Sex</label>
                <input type="radio" class="form-control" id="inputSex" name="sex" value="M" required>Male
                <input type="radio" class="form-control" id="inputSex" name="sex" value="F">Female
            </div>
            <div class="form-group">
                <label for="inputEmailAddress">Email Address</label>
                <input type="email" class="form-control" id="inputEmailAddress" name="emailaddress" required>
            </div>
            <div class="form-group">
                <label for="inputDoB">Date of Birth</label>
                <input type="date" class="form-control" id="inputDoB" name="dob" required>
            </div>
            <div class="form-group">
                <label for="inputAddress">Address</label>
                <input type="text" class="form-control" id="inputAddress" name="address" required>
            </div>
            <div class="form-group">
                <label for="inputCity">City</label>
                <input type="text" class="form-control" id="inputCity" name="city" required>
            </div>
            <div class="form-group">
                <label for="inputState">State</label>
                <input type="text" class="form-control" id="inputState" name="state" required>
            </div>
            <div class="form-group">
                <label for="inputZipCode">Zip Code</label>
                <input type="number" class="form-control" id="inputZipCode" name="zipcode" required>
            </div>
            <div class="form-group">
                <label for="inputTelephone">Phone Number</label>
                <input type="tel" class="form-control" id="inputTelephone" name="telephone" required>
            </div>
            <div class="form-group">
                <label for="inputPreferences">Preferences (separate by commas, ex: cars,toys,guns)</label>
                <input type="text" class="form-control" id="inputPreferences" name="preferences">
            </div>
            <div class="form-group">
                <label for="inputPassword">Password</label>
                <input type="password" class="form-control" id="inputPassword" name="password" required>
            </div>
            <button type="submit" name="btnCreate">Create</button>
            <%
                if (request.getParameter("btnCreate") != null)
                {
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String sex = request.getParameter("sex");
                    String email = request.getParameter("emailaddress");
                    String dob = request.getParameter("dob");
                    String address = request.getParameter("address");
                    String city = request.getParameter("city");
                    String state = request.getParameter("state");
                    String zipcode = request.getParameter("zipcode");
                    String phonenumber = request.getParameter("telephone");
                    String preferences = request.getParameter("preferences");
                    String password = request.getParameter("password");
                    
                    if (!firstname.isEmpty() && !lastname.isEmpty() && !sex.isEmpty() &&
                        !dob.isEmpty() && !address.isEmpty() && !city.isEmpty() &&
                        !state.isEmpty() && !zipcode.isEmpty() && !phonenumber.isEmpty() &&
                        !password.isEmpty())
                    {
                        String query = "SELECT MAX(CustomerID) FROM Customer;";
                        ResultSet rs = DBConnection.ExecQuery(query);

                        // CHECKS TO SEE IF THERE ARE ANY ADS IN DATABASE YET
                        String customerID = (rs != null && rs.next()) ? 
                                "" + (Integer.parseInt(rs.getString(1)) + 1) : "0";
                        String rating = String.valueOf((int) (Math.random() * 10) + 1);

                        // INSERT THE Advertisement INTO DATABASE
                        query = "INSERT INTO Customer VALUES (" + customerID
                                + ", '" + firstname + "', '" + lastname + "', '" + sex
                                + "', '" + email + "', '" + dob + "', '" + address + "', '" + city 
                                + "', '" + state + "', " + zipcode + ", '" + phonenumber
                                + "', " + rating + ", '" + password + "');";
                        int rowsUpdated = DBConnection.ExecUpdateQuery(query);
                        
                        // INSERT THE Preferences INTO DATABASE
                        query = "INSERT INTO Preferences VALUES(" + customerID
                                + ", '" + preferences + "');";
                        rowsUpdated += DBConnection.ExecUpdateQuery(query);

                        // CHECK IF THE Customer WAS INSERTED INTO THE DATABASE
                        if (rowsUpdated > 0)
                        {
                            out.println("<script type=\"text/javascript\">\n"
                                    + "var b = confirm('Customer " + customerID + " has been created. "
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
                                + "alert('All forms must be filled out!');\n"
                                + "</script>");
                    }
                }
            %>
        </form>
    </body>
</html>
