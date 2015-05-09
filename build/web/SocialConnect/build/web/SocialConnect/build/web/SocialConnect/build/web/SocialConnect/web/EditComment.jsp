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

        <title>SocialConnect Edit Comment</title>
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


<body>
    <% String IDs = session.getAttribute("login").toString();
       int ID = Integer.parseInt(IDs);
        String Query;
        int rs;
       String commentIDs = session.getAttribute("commentID").toString(); 
    %>
    <%@ include file="nav.jsp" 
    %>
   <script>
         function Editcomment()
         { <%if(commentIDs != null) 
              {   query="UPDATE Comment SET Content="+request.getParameter("Editcomment")+"WHERE CommentID="+
                Integer.parseInt(commentIDs);
              } 
            else 
            {  out.print("Error CommentID is null");
            }
           %>
         }
    </script>


      <div class="background">
        <div class="innerBackground">
          <div class="container">
            <br><br>
            
              <%  if(commentIDs != null)
                    {   
                    %>
                        <input name="Editcomment" type="comment" class="form-control input-lg" placeholder="...">
                        <a href="CustomerHomepage.jsp" >
                          <input  type="submit" value="comment" class="btn btn-primary" onclick="Editcomment()">
                        </a>
                  <%      
                    }
                  else
                  {   out.print("One or more fields are missing");
                  }  
              %>      
            <a href="CustomerHomepage.jsp">Return</a>  
          </div>
        </div>
      </div>

    </body>

</html>
