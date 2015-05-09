
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SocialConnect View A User's Circle</title>
        <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
        <link rel="icon" href="images/favicon-32x32.png" type="image/x-icon">
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
                <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="css/main.css" rel="stylesheet"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
        <script src="js/jquery.slides.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
<body>
        <jsp:include page="<%="nav"+".jsp"%>"/>

    <% String ID = session.getAttribute("login").toString();
        String Query;
        java.sql.ResultSet rs;
        String userID= request.getParameter("userID"); 
    %>
                        <br><br><br><br><br>

                        <br><br><br><br><br>

            <% if (!(userID.trim().equals(""))) 
               { %>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th> CircleID </th>
                                <th>CircleName </th>
                                <th> CIrcleType </th>                              
                            </tr>
                        </thead>
                        <tbody>
                        <%      
                                Query="SELECT C.CircleID, C.CircleName, C.Type FROM CircleMembership CM, Circle C WHERE CM.CustomerID="+userID+" AND CM.CircleID=C.CircleID";
                                rs= DBConnection.ExecQuery(Query);
                                while(rs.next())
                                {
                                   %>
                                  <tr>
                                     <td > <a href="<%=rs.getString(1)+".jsp"%>">
                                             <% out.print(rs.getString(1)); %> </a>
                                        </td>
                                     <td > <% out.print(rs.getString(2)); %> </td>
                                     <td > <% out.print(rs.getString(3)); %> </td>                                       
                                  </tr>
                                   <%         
                                }                                            
                          %> 
                        </tbody>
                    </table>
                </div>   
             <% }  
                 else
                  {  
                      out.print("\nuserID field is missing");
                  }  
              %>      
            <a href="Circles.jsp">Return</a>  
