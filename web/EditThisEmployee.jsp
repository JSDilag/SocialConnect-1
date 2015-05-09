
    <%@page import="java.sql.ResultSet"%>
    <%@page import="DBWorks.DBConnection"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta name="description" content="">
            <meta name="author" content="">
            <title>Edit Employee</title>

            <!-- Bootstrap Core CSS -->
            <link href="css/bootstrap.min.css" rel="stylesheet">

            <!-- Custom CSS -->
            <link href="css/manager.css" rel="stylesheet">
            
            <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
            
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
            
            <!-- Bootstrap Core JavaScript -->
            <script src="js/bootstrap.min.js"></script>
        </head>
        <body>
            <jsp:include page="ManagerNav.jsp"/>
            <br><br><header>
                <h2>Edit Employee</h2>
                <hr>
            </header>
            
            <a href="ManagerHomepage.jsp" class="right">Return to Homepage</a>
            
            <form style="width: 50%;">
                <div class="form-group">
                    <label for="inputFirstName">SSN</label>
                    <input type="text" class="form-control" value="${sessionScope.eSSN}" id="inputSSN" name="ssn">
                </div>
                <div class="form-group">
                    <label for="inputFirstName">First Name</label>
                    <input type="text" class="form-control" value="${sessionScope.eFirstName}" id="inputFirstName" name="firstname">
                </div>
                <div class="form-group">
                    <label for="inputLastName">Last Name</label>
                    <input type="text" class="form-control" value="${sessionScope.eLastName}" id="inputLastName" name="lastname">
                </div>
                <div class="form-group">
                    <label for="inputAddress">Address</label>
                    <input type="text" class="form-control" value="${sessionScope.eAddress}" id="inputAddress" name="address">
                </div>
                <div class="form-group">
                    <label for="inputCity">City</label>
                    <input type="text" class="form-control" value="${sessionScope.eCity}" id="inputCity" name="city">
                </div>
                <div class="form-group">
                    <label for="inputState">State</label>
                    <input type="text" class="form-control" value="${sessionScope.eState}" id="inputState" name="state">
                </div>
                <div class="form-group">
                    <label for="inputZipCode">Zip Code</label>
                    <input type="text" class="form-control" value="${sessionScope.eZipCode}" id="inputZipCode" name="zipcode">
                </div>
                <div class="form-group">
                    <label for="inputTelephone">Phone Number</label>
                    <input type="tel" class="form-control" value="${sessionScope.ePhoneNumber}" id="inputTelephone" name="telephone">
                </div>
                <div class="form-group">
                    <label for="inputHourlyRate">Hourly Rate</label>
                    <input type="text" class="form-control" value="${sessionScope.eHourlyRate}" id="inputHourlyRate" name="hourlyrate">
                </div>
                <div class="form-group">
                    <label for="inputRole">Role</label>
                    <input type="text" class="form-control" value="${sessionScope.eRole}" id="inputRole" name="role">
                </div>
                <div class="form-group">
                    <label for="inputPassword">Password</label>
                    <input type="text" class="form-control" value="${sessionScope.ePassword}" id="inputPassword" name="password">
                </div>
                <button type="submit" name="btnSave">Save Changes</button>
                <%
                    if (request.getParameter("btnSave") != null)
                    {
                        
                        String ssn = request.getParameter("ssn");
                        String employeeID = (String)session.getAttribute("employeeID");
                        String firstname = request.getParameter("firstname");
                        String lastname = request.getParameter("lastname");
                        String address = request.getParameter("address");
                        String city = request.getParameter("city");
                        String state = request.getParameter("state");
                        String zipcode = request.getParameter("zipcode");
                        String phonenumber = request.getParameter("telephone");
                        String hourlyrate = request.getParameter("hourlyrate");
                        String role = request.getParameter("role");
                        String password = request.getParameter("password");
    //                    
                        
                        if (!ssn.isEmpty() &&!firstname.isEmpty() && !lastname.isEmpty() 
                            && !address.isEmpty() && !city.isEmpty() &&
                            !state.isEmpty() && !zipcode.isEmpty() && !phonenumber.isEmpty() &&
                            !hourlyrate.isEmpty() && !role.isEmpty() && !password.isEmpty())
                        {
                            // UPDATE SSN
                            String query = "UPDATE Employee SET SSN = '"
                                    + ssn + "' WHERE EmployeeID = " + employeeID + ";";
                            int updated = DBConnection.ExecUpdateQuery(query);
                            
                            //UPDATE FirstName
                            query = "UPDATE Employee SET FirstName = '"
                                    + firstname + "' WHERE EmployeeID = " + employeeID + ";";
                            updated = DBConnection.ExecUpdateQuery(query);

                            // UPDATE LastName
                            query = "UPDATE Employee SET LastName = '"
                                    + lastname + "' WHERE EmployeeID = " + employeeID + ";";
                            updated += DBConnection.ExecUpdateQuery(query);
                            
                            // UPDATE Address
                            query = "UPDATE Employee SET Address = '"
                                    + address + "' WHERE EmployeeID = " + employeeID + ";";
                            updated += DBConnection.ExecUpdateQuery(query);
                            
                            // UPDATE City
                            query = "UPDATE Employee SET City = '"
                                    + city + "' WHERE EmployeeID = " + employeeID + ";";
                            updated += DBConnection.ExecUpdateQuery(query);
                            
                            // UPDATE State
                            query = "UPDATE Employee SET State = '"
                                    + state + "' WHERE EmployeeID = " + employeeID + ";";
                            updated += DBConnection.ExecUpdateQuery(query);
                            
                            // UPDATE ZipCode
                            query = "UPDATE Employee SET ZipCode = "
                                    + zipcode + " WHERE EmployeeID = " + employeeID + ";";
                            updated += DBConnection.ExecUpdateQuery(query);
                            
                            // UPDATE Telephone
                            query = "UPDATE Employee SET Telephone = '"
                                    + phonenumber + "' WHERE EmployeeID = " + employeeID + ";";
                            updated += DBConnection.ExecUpdateQuery(query);
                            
                            //UPDATE HourlyRate
                            query = "UPDATE Employee SET HourlyRate = '"
                                    + hourlyrate + "' WHERE EmployeeID = " + employeeID + ";";
                            updated += DBConnection.ExecUpdateQuery(query);
                            
                            //UPDATE Role
                            query = "UPDATE Employee SET Role = '"
                                    + role + "' WHERE EmployeeID = " + employeeID + ";";
                            updated += DBConnection.ExecUpdateQuery(query);
                            
                            // UPDATE Password
                            query = "UPDATE Employee SET Password = '"
                                    + password + "' WHERE EmployeeID = " + employeeID + ";";
                            updated += DBConnection.ExecUpdateQuery(query);
                            
                            
                            // CHECK IF THE Customer WAS EDITED
                            if (updated > 0)
                            {
                                out.println("<script type=\"text/javascript\">\n"
                                        + "var b = confirm('Advertisement has been deleted. "
                                        + "Click OK to redirect to homepage or Cancel otherwise.);\n"
                                        + "if (b) location = \"ManagerHomepage.jsp\";\n"
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
