<!--
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
-->

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SocialConnect Send Message</title>
        <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
        <link rel="icon" href="images/favicon-32x32.png" type="image/x-icon">
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
                <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="css/main.css" rel="stylesheet"> 
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" ></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
        <script src="js/jquery.slides.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>

    <% String IDs = session.getAttribute("login").toString();
      int ID = Integer.parseInt(IDs);
        java.sql.ResultSet rs;
    %>

    <body>

      <%@ include file="nav.jsp" 

      %>
      <script>
        function sendMessage()
         { <%   String subject = request.getParameter("Subject");
                String content = request.getParameter("Content");
                String receiver = request.getParameter("Receiver");
                if (subject != null && content != null && receiver != null) 
                  {  DBConnection.ExecQuery("insert into Message values (3597, '2015-05-07', '"+subject+"', '"
                                                 +content+"', "+ID+", "+Receiver+")");
                    %> alert("Message Sent");  
                    <% 
                  }
                else 
                %>  alert("One or more fields missing");  
         }
      </script>
      <div class="background">
        <div class="innerBackground">
          <div class="container">
            <br><br>
            <div class="modal-body">
                <form class="form col-md-12 center-block" action="RegistrationSuccess.jsp" method="post">
                    <div class="form-group">
                        <h4 style="display:inline;"> ReceiverID </h4>
                        <input name="Receiver" type="text" class="form-control input-lg" placeholder="e.g. 100100102">
                    </div>
                    <div class="form-group" >
                        <h4 style="display:inline;"> Subject </h4>
                        <input name="Subject" type="text" class="form-control input-lg"  placeholder="e.g. You won!"autofocus>
                    </div>
                    <div class="form-group">
                        <h4 style="display:inline;"> Content </h4>
                        <input name="Content" type="text" class="form-control input-lg" placeholder="e.g. Nice job!">
                    </div>
                     <div class="form-group"> 
                        <center>                          
                            <a class="btn btn-large btn-info" onclick="sendMessage()">Send</a>
                        </center>
                    </div>                   

                </form>
            </div>                
                
              <a href="CustomerHomepage.jsp">Return</a>  

          </div>
       </div>
    </body>

</html>
