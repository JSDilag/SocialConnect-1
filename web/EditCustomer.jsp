
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
        <title>Edit Customer</title>

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
            <h2>Edit Customer</h2>
            <hr>
        </header>
        
        <a href="EmployeeHomepage.jsp" class="right">Return to homepage</a>
        
        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputCustomerID">Enter Customer ID to edit</label>
                <input type="number" class="form-control" id="inputCustomerID" name="customerid">
            </div>
            <button type="submit" name="btnEdit">Edit this customer</button>
            <%
                if (request.getParameter("btnEdit") != null)
                {
                    String customerID = request.getParameter("customerid");
                    
                    // RETRIEVE THE Customer INFORMATION FROM DATABASE
                    String query = "SELECT * FROM Customer WHERE CustomerID = " + 
                            customerID + ";";
                    ResultSet customer = DBConnection.ExecQuery(query);
                    
                    query = "SELECT Preference FROM Preferences WHERE CustomerID = " + 
                            customerID + ";";
                    ResultSet preferences = DBConnection.ExecQuery(query);
                    
                    // RETREIVE THE Customer's CREDIT CARD NUMBER FROM
                    // HIS Account
//                    query = "SELECT CreditCardNum FROM Account "
//                                + "WHERE CustomerID = " + customerID + ";";
//                    ResultSet account = DBConnection.ExecQuery(query);
                    
                    // IF THE Customer AND Account EXISTS
                    if (customer != null && customer.next() && 
                        preferences != null)
                    {
                        // SAVE ALL THE FIELDS INTO VARIABLES
                        String firstname    =   customer.getString("FirstName");
                        String lastname     =   customer.getString("LastName");
                        String sex          =   customer.getString("Sex");
                        String email        =   customer.getString("Email");
                        String dob          =   customer.getString("DOB");
                        String address      =   customer.getString("Address");
                        String city         =   customer.getString("City");
                        String state        =   customer.getString("State");
                        String zipcode      =   customer.getString("ZipCode");
                        String phonenumber  =   customer.getString("Telephone");
                        String rating       =   customer.getString("Rating");
                        String password     =   customer.getString("Password");
                        String preference   =   "";
                        if (preferences.next())
                        {
                            preferences.getString("Preference");
                            while(preferences.next())
                            {
                                preference += "," + preferences.getString("Preference");
                            }
                        }
//                        String creditcardnum=   account.getString("CreditCardNum");
                        
                        session.setAttribute("customerID", customerID);
                        session.setAttribute("cFirstName", firstname);
                        session.setAttribute("cLastName", lastname);
                        session.setAttribute("cSex", sex);
                        session.setAttribute("cEmail", email);
                        session.setAttribute("cDOB", dob);
                        session.setAttribute("cAddress", address);
                        session.setAttribute("cCity", city);
                        session.setAttribute("cState", state);
                        session.setAttribute("cZipCode", zipcode);
                        session.setAttribute("cPhoneNumber", phonenumber);
                        session.setAttribute("cPreference", preference);
                        session.setAttribute("cRating", rating);
                        session.setAttribute("cPassword", password);
//                        session.setAttribute("cCreditCardNum", creditcardnum);
                        response.sendRedirect("EditThisCustomer.jsp");
                        
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
