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

    <title>SocialConnect Customer Homepage</title>
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
    <% String ID = session.getAttribute("login").toString();
        String Query;
        java.sql.ResultSet rs;
    %>


    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="CustomerHomepage.jsp">Homepage </a>
            </div>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="Messages.jsp"><i class="fa fa-fw fa-dashboard"></i>Messages</a>
                    </li>
                    <li>
                        <a href="Circles.jsp"><i class="fa fa-fw fa-dashboard"></i>Circles</a>
                    </li>
                    <li>
                        <a href="Account.jsp"><i class="fa fa-fw fa-dashboard"></i>Account</a>
                    </li>
                    <li>
                        <a href="BestSellerItems.jsp"><i class="fa fa-fw fa-dashboard"></i>Best-Seller items</a>
                    </li>
                    <li>
                        <a href="ItemSuggestions.jsp"><i class="fa fa-fw fa-dashboard"></i>ItemSuggestions</a>
                    </li>
                    <li>
                        <a href="logout.jsp"><i class="fa fa-fw fa-dashboard"></i>Log out</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        </div>
<div class="background">
  <div class="innerBackground">
    <div class="container">
      <br><br>
      <div class="row">
        <div class="col-xs-4">
          <div class="AdBox">
            <a href="Ford2012.jsp">
             <img style="width:100%;" src="images/ford2012.jpg">
            </a> 
          </div>
        </div>
        <div class="col-xs-6">      
          <div class="form-group" >
             <input name="MyPost" type="post" id="WritePostBox" class="form-control input-lg" placeholder="Write a post...">
          </div>
            <div class="row">
              <div class="col-xs-4">
                <% Query = "SELECT A.Content FROM Advertisement A WHERE A.ItemName='Superman Shirt'";
                   rs =DBConnection.ExecQuery(Query);  
                   if(rs.next())
                   {   out.print(rs);
                    }
                %>      
              </div>
              <div class="col-xs-4">      
              </div>
              <div class="col-xs-2"> 
                <div class="col-sm-10 col-sm-offset-2">
                    <a href="CustomerHomepage.jsp" >
                        <input id="writePost" name="writePost" type="submit" value="Post" class="btn btn-primary" >
                    </a>
                </div>    
              </div>
             </div>  
        </div>    
        <div class="col-xs-2">      

        </div>
      </div>

      <div class="row">
        <div class="col-xs-4">
            <div class="AdBox">
            <a href="SuperManShirt.jsp">
             <img style="width:95%; float:right; border-style: solid; " src="images/supermanshirt.jpg">
            </a> 
          </div>
        </div>
        <div class="col-xs-6">   <!-- Middle column -->
           <div class="posts">
                <% Query = 
                                "select Post.PostID,Post.Date," + 
                                " Post.Content" +
                                " from Post";
                     rs =DBConnection.ExecQuery(Query);                   

                 while(rs.next())
                 {
                 %> 
                    <div class="col-xs-5" style="width: 400px; height: 100px; background-color: yellow; border-style: solid;">
                      <td > <% out.print(rs.getString(1)+", "); %> </td>
                      <td > <% out.print(rs.getString(2)); %> </td> <br>
                      <td > <% out.print(rs.getString(3)); %> </td> <br>

                      <!-- Comments -->
                      <% Query = "select Cus.FirstName,Cus.LastName,C.Date," + 
                                        " C.Content, C.AuthorID" +
                                        " from Comment C, Post P, Customer Cus" +
                                        "where C.AuthorID=Cus.CustomerID AND C.PostID=P.PostID";
                         java.sql.ResultSet cs =DBConnection.ExecQuery(Query);                                
                        while(cs.next())
                        {
                      %>
                            <tr>
                                <td > <% out.print(cs.getString(1)+" "); %> </td>
                                <td > <% out.print(cs.getString(2)+", "); %> </td>
                                <td > <% out.print(cs.getString(3)); %> </td> <br>
                                <td > <% out.print(cs.getString(4)); %> </td> 
                                <% if(cs.getString(5).equals(ID))   /*if owner is the User */
                                    {
                                   %>    
                                      <a href="EditComment.jsp">Edit</a>
                                   <% }
                                %>
                                <br>    
                            </tr>   
                    <%  }
                    %>                         
                            <!--TextBar -->
                          <input name="MyComment" type="comment" id="WriteCommentBox" class="form-control input-lg" placeholder="...">

                    </div>
                    <div class="col-xs-1">
                        <a href="EditPost.jsp">Edit</a>
                    </div>
               <% 
                  }
               %>

          </div> 
        </div>
      </div>   
    </div>
  </div>
</div>


</body>

</html>