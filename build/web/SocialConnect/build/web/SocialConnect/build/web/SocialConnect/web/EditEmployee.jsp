
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
        <title>SocialConnect</title>

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
            <h2>Edit Employee</h2>
            <hr>
        </header>
        
        <a href="ManagerHomepage.jsp" class="right">Return to homepage</a>
        
        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputEmployeeID">Enter Employee ID to edit</label>
                <input type="number" class="form-control" id="inputCustomerID" name="employeeID">
            </div>
            <button type="submit" name="btnEdit">Edit this Employee</button>
            <%
                if (request.getParameter("btnEdit") != null)
                {
                    String employeeID = request.getParameter("employeeID");
                    
                    // RETRIEVE THE Customer INFORMATION FROM DATABASE
                    String query = "SELECT * FROM Employee WHERE EmployeeID = " + 
                            employeeID + ";";
                    ResultSet employee = DBConnection.ExecQuery(query);
                    
                    
                    // RETREIVE THE Customer's CREDIT CARD NUMBER FROM
                    // HIS Account
//                    query = "SELECT CreditCardNum FROM Account "
//                                + "WHERE CustomerID = " + customerID + ";";
//                    ResultSet account = DBConnection.ExecQuery(query);
                    
                    // IF THE Customer AND Account EXISTS
                    if (employee != null && employee.next())
                    {
                        // SAVE ALL THE FIELDS INTO VARIABLES
                        String ssn          =   employee.getString("SSN");
                        String firstname    =   employee.getString("FirstName");
                        String lastname     =   employee.getString("LastName");
                        String address      =   employee.getString("Address");
                        String city         =   employee.getString("City");
                        String state        =   employee.getString("State");
                        String zipcode      =   employee.getString("ZipCode");
                        String phonenumber  =   employee.getString("Telephone");
                        String startdate    =   employee.getString("StartDate");
                        String hourlyrate   =   employee.getString("HourlyRate");
                        String role         =   employee.getString("Role");  
                        String password     =   employee.getString("Password");
                       
//                        String creditcardnum=   account.getString("CreditCardNum");
                        session.setAttribute("eSSN", ssn);
                        session.setAttribute("employeeID", employeeID);
                        session.setAttribute("eFirstName", firstname);
                        session.setAttribute("eLastName", lastname);
                        session.setAttribute("eAddress", address);
                        session.setAttribute("eCity", city);
                        session.setAttribute("eState", state);
                        session.setAttribute("eZipCode", zipcode);
                        session.setAttribute("ePhoneNumber", phonenumber);
                        session.setAttribute("eStartDate", startdate);
                        session.setAttribute("eHourlyRate", hourlyrate);
                        session.setAttribute("eRole", role);
                        session.setAttribute("ePassword", password);
                        response.sendRedirect("EditThisEmployee.jsp");
                        
                    } else
                    {
                        out.println("<script type=\"text/javascript\">\n"
                                + "alert('Customer ID is invalid!');\n"
                                + "</script>");
                    }
                }
                
            %>
        </form>
    </body>
</html>
