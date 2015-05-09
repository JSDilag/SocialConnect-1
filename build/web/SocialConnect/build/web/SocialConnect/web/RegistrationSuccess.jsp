
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>SocialConnect Registration Success</title>
        <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
        <link rel="icon" href="images/favicon-32x32.png" type="image/x-icon">
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
                <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="css/main.css" rel="stylesheet">
    </head>
    <body >

        <%  String ID = "0";
            String Acc = "0";
            String FirstName = request.getParameter("FirstName");
            String LastName = request.getParameter("LastName");
            String Sex = request.getParameter("Sex");
            String Email = request.getParameter("Email");
            String DOB = request.getParameter("DOB");
            String Address = request.getParameter("Address");
            String City = request.getParameter("City");
            String State = request.getParameter("State");
            String ZipCode = request.getParameter("ZipCode");
            String Telephone = request.getParameter("Telephone");
            String Password = request.getParameter("Password");
            String CreditCardNum = request.getParameter("CreditCardNum");
            if(FirstName != null && LastName != null && Sex != null && Email != null && 
                DOB != null && Address != null && City != null && State != null &&
                ZipCode != null && Telephone != null && Password != null && CreditCardNum != null)
            {    java.sql.ResultSet js = DBConnection.ExecQuery("SELECT MAX(CustomerID) FROM CUstomer");
       
                if(js.next())
                    ID =  js.getString(1);
                 java.sql.ResultSet ds = DBConnection.ExecQuery("SELECT MAX(AccountNumber) FROM Account");
               
                if(js.next())
                    Acc =  ds.getString(1); 
                int newID = Integer.parseInt(ID)+1;
                int newAcc = Integer.parseInt(Acc)+1;
                String Query = "INSERT INTO Customer VALUES ("+newID +", '"+FirstName+"', '"+LastName+"', '"+Sex+"', '"+Email+"', '"+DOB+"', '"                  
                        +Address+"', '"+City+"', '"+State+"', "+ZipCode+", "+Telephone+", "+ 1  +", '"+Password+"')" ;
                int er = DBConnection.ExecUpdateQuery(Query);
                if(er == 0)
                {   out.print("Error with field(s)");
                %> <a href="index.html">Return</a>  
                <%
                }
                Query = "INSERT INTO Account VALUES ("+newID+", "+newAcc+", '2015-05-07', "+CreditCardNum+")";
                DBConnection.ExecUpdateQuery(Query);
                Query= "INSERT INTO HasAccount VALUES ("+newID+", "+newAcc+")";
                DBConnection.ExecUpdateQuery(Query);
                String select[] = request.getParameterValues("Preferences"); 
                if (select != null && select.length != 0) 
                  {  for (int i = 0; i < select.length; i++) 
                     {   DBConnection.ExecUpdateQuery("INSERT INTO Preferences VALUES ("+newID+", '"+select[i]+"')");
                     
                     }
                  }
        %>  
            <div class="alert alert-success">
                <center>
                    <h4>Well done! Registration was successful. ID is <%=newID%></h4>
                    
                    <h6> <a href="index.html">Return</a></h6>
                </center>
            </div>
        <%  }  
            else 
            {    
                %>  <h3> Error one or more fields missing </h3>
                    <h6> <a href="index.html">Return</a></h6>
            <% 
            ;} 
            %>

    </body>
</html>