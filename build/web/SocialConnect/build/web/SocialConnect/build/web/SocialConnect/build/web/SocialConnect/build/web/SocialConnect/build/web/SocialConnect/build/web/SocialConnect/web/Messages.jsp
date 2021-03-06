
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

        <title>SocialConnect Messages</title>
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
    <% String ID = session.getAttribute("login").toString();
        java.sql.ResultSet rs;
    %>    

     <jsp:include page="<%="nav"+".jsp"%>"/>

      <div class="background">
        <div class="innerBackground">
          <br><br><br><br>
                <a href="sendMessage.jsp">  
                    <input type="submit" value="Send" class="btn btn-primary">
                </a>
          <form  action="deleteMessage.jsp" method="post">
            <div class="form-group">
             
               
                
                <a href="deleteMessage.jsp">
                    <input type="submit" value="Delete Selected" class="btn btn-primary">
                </a> 
                <br><br>
                <div class="table-responsive">
                   <table class="table table-bordered table-hover">
                      <thead>
                         <tr>
                            <th>  </th>
                            <th> Date </th>
                            <th> Subject </th>   
                            <th> Content </th>  
                            <th> Sender </th>                             
                        </tr>
                      </thead>
                      <tbody>  
                       <%   rs = DBConnection.ExecQuery("select * from Message where ReceiverID ="+ID);   

                         while(rs.next())
                         {   
                          %><tr>    
                              <td> 
                                    <div class="form-group">   
                                     <div style="padding-left: 30px;">

                                       <label class="checkbox">
                                           <input type="checkbox" name="MessageCheck" value="<%=rs.getString(1)%>" >
                                       </label> 
                                     </div>
                                    </div> 
                              </td>
                              <td > <% out.print(rs.getString(2)); %> </td> 
                              <td > <% out.print(rs.getString(3)); %> </td>
                              <td > <% out.print(rs.getString(4)); %> </td> 
                              <td > <% out.print(rs.getString(5)); %> </td> 
                            </tr>
                      <% ;} %>
                      </tbody>
                    </table>                                                          
                </div>
            </div>
          <a href="CustomerHomepage.jsp">Return</a>  
          </form>
       </div>
      </div>
    </body>

</html>
