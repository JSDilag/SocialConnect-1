
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
        <title>Edit Customer</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/employee.css" rel="stylesheet">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
            <h2>Edit Customer</h2>
            <hr>
        </header>
        
        <a href="EmployeeHomepage.jsp" class="right">Return to homepage</a>
        
        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputFirstName">First Name</label>
                <input type="text" class="form-control" value="${sessionScope.cFirstName}" id="inputFirstName" name="firstname">
            </div>
            <div class="form-group">
                <label for="inputLastName">Last Name</label>
                <input type="text" class="form-control" value="${sessionScope.cLastName}" id="inputLastName" name="lastname">
            </div>
            <div class="form-group">
                <label for="inputSex">Sex</label>
                <input type="radio" class="form-control" id="inputSexM" name="sex" value="M">Male
                <input type="radio" class="form-control" id="inputSexF" name="sex" value="F">Female
            </div>
            <div class="form-group">
                <label for="inputEmailAddress">Email Address</label>
                <input type="email" class="form-control" value="${sessionScope.cEmail}" id="inputEmailAddress" name="emailaddress">
            </div>
            <div class="form-group">
                <label for="inputDOB">Date of Birth</label>
                <input type="date" class="form-control" id="inputDOB" name="dob">
            </div>
            <div class="form-group">
                <label for="inputAddress">Address</label>
                <input type="text" class="form-control" value="${sessionScope.cAddress}" id="inputAddress" name="address">
            </div>
            <div class="form-group">
                <label for="inputCity">City</label>
                <input type="text" class="form-control" value="${sessionScope.cCity}" id="inputCity" name="city">
            </div>
            <div class="form-group">
                <label for="inputState">State</label>
                <input type="text" class="form-control" value="${sessionScope.cState}" id="inputState" name="state">
            </div>
            <div class="form-group">
                <label for="inputZipCode">Zip Code</label>
                <input type="text" class="form-control" value="${sessionScope.cZipCode}" id="inputZipCode" name="zipcode">
            </div>
            <div class="form-group">
                <label for="inputTelephone">Phone Number</label>
                <input type="tel" class="form-control" value="${sessionScope.cPhoneNumber}" id="inputTelephone" name="telephone">
            </div>
            <div class="form-group">
                <label for="inputPreferences">Preferences (separate by commas, ex: cars,toys,guns)</label>
                <input type="text" class="form-control" value="${sessionScope.cPreference}" id="inputPreferences" name="preferences">
            </div>
<!--            <div class="form-group">
                <label for="inputRating">Rating</label>
                <input type="text" class="form-control" value="${sessionScope.cRating}" id="inputRating" name="rating">
            </div>-->
            <div class="form-group">
                <label for="inputPassword">Password</label>
                <input type="text" class="form-control" value="${sessionScope.cPassword}" id="inputPassword" name="password">
            </div>
<!--            <div class="form-group">
                <label for="inputCreditCardNum">Credit Card Number</label>
                <input type="text" class="form-control" value="${sessionScope.cCreditCardNum}" id="inputCreditCardNum" name="creditcardnum">
            </div>-->
            <button type="submit" name="btnSave">Save Changes</button>
            <%
                // THESE ARE FOR SETTING THE SEX RADIO BOX 
                String cDOB = (String) session.getAttribute("cDOB");
                String cSex = (String) session.getAttribute("cSex");
                String inputSex = cSex.equals("M") ? "inputSexM" : "inputSexF";
                
                // SETS THE RADIO BOX CORRESPONDING TO THE Customer's SEX
                out.print("<script type=\"text/javascript\">\n"
                        + "document.getElementById(\"" + inputSex + "\").checked = true;\n"
                        + "</script>");
                
                // SETS THE Customer's DoB
                out.print("<script type=\"text/javascript\">\n"
                        + "document.getElementById(\"inputDOB\").defaultValue = \""
                        + cDOB + "\";\n"
                        + "</script>");
                
                if (request.getParameter("btnSave") != null)
                {
                    String customerID = (String) session.getAttribute("customerID");
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String sex = request.getParameter("sex");
                    String dob = request.getParameter("dob");
                    String address = request.getParameter("address");
                    String city = request.getParameter("city");
                    String state = request.getParameter("state");
                    String zipcode = request.getParameter("zipcode");
                    String phonenumber = request.getParameter("telephone");
//                    String rating = request.getParameter("rating");
                    String password = request.getParameter("password");
                    String[] preferences = request.getParameter("preferences").split(",");
//                    String creditcardnumber;
                    
                    if (!firstname.isEmpty() && !lastname.isEmpty() && !sex.isEmpty() &&
                        !dob.isEmpty() && !address.isEmpty() && !city.isEmpty() &&
                        !state.isEmpty() && !zipcode.isEmpty() && !phonenumber.isEmpty() &&
                        preferences.length != 0 && !password.isEmpty())
                    {
                        // UPDATE FirstName
                        String query = "UPDATE Customer SET FirstName = '"
                                + firstname + "' WHERE CustomerID = " + customerID + ";";
                        int updated = DBConnection.ExecUpdateQuery(query);

                        // UPDATE LastName
                        query = "UPDATE Customer SET LastName = '"
                                + lastname + "' WHERE CustomerID = " + customerID + ";";
                        updated += DBConnection.ExecUpdateQuery(query);
                        
                        // UPDATE Sex
                        query = "UPDATE Customer SET Sex = '"
                                + sex + "' WHERE CustomerID = " + customerID + ";";
                        updated += DBConnection.ExecUpdateQuery(query);
                        
                        // UPDATE Date of Birth
                        query = "UPDATE Customer SET DOB = '"
                                + dob + "' WHERE CustomerID = " + customerID + ";";
                        updated += DBConnection.ExecUpdateQuery(query);
                        
                        // UPDATE Address
                        query = "UPDATE Customer SET Address = '"
                                + address + "' WHERE CustomerID = " + customerID + ";";
                        updated += DBConnection.ExecUpdateQuery(query);
                        
                        // UPDATE City
                        query = "UPDATE Customer SET City = '"
                                + city + "' WHERE CustomerID = " + customerID + ";";
                        updated += DBConnection.ExecUpdateQuery(query);
                        
                        // UPDATE State
                        query = "UPDATE Customer SET State = '"
                                + state + "' WHERE CustomerID = " + customerID + ";";
                        updated += DBConnection.ExecUpdateQuery(query);
                        
                        // UPDATE ZipCode
                        query = "UPDATE Customer SET ZipCode = "
                                + zipcode + " WHERE CustomerID = " + customerID + ";";
                        updated += DBConnection.ExecUpdateQuery(query);
                        
                        // UPDATE Telephone
                        query = "UPDATE Customer SET Telephone = '"
                                + phonenumber + "' WHERE CustomerID = " + customerID + ";";
                        updated += DBConnection.ExecUpdateQuery(query);
                        
                        // UPDATE Password
                        query = "UPDATE Customer SET Password = '"
                                + password + "' WHERE CustomerID = " + customerID + ";";
                        updated += DBConnection.ExecUpdateQuery(query);
                        
                        // UPDATE Preferences TABLE WITH THE COMMA SEPARATED VALUES
                        query = "DELETE FROM Preferences WHERE CustomerID = " + customerID + ";";
                        updated += DBConnection.ExecUpdateQuery(query);
                        
                        for (int i = 0; i < preferences.length; i++)
                        {
                            query = "INSERT INTO Preferences VALUES(" + customerID + ", '"
                                    + preferences[i] + "');";
                            updated += DBConnection.ExecUpdateQuery(query);
                        }

                        // CHECK IF THE Customer WAS EDITED
                        if (updated > 0)
                        {
                            out.println("<script type=\"text/javascript\">\n"
                                    + "var b = confirm('Changes have been saved. "
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
