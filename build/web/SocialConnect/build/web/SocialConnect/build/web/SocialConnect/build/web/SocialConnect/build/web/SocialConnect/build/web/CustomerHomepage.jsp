
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>

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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
        <script src="js/jquery.slides.min.js"></script>
        <script src="js/bootstrap.min.js"></script>  
    </head>


    <body>
        <% String ID = session.getAttribute("login").toString();
            String Query;
            java.sql.ResultSet rs;
            java.sql.ResultSet ps;
            java.sql.ResultSet cs;
        %>


        <jsp:include page="<%="nav" + ".jsp"%>"/>

        <div class="background">
            <div class="innerBackground">
                <div class="container">
                    <br><br><br><br><br>
                    <form class="form col-md-12 center-block" action="writePost.jsp" method="post">
                        <div class="row">
                            <div class="col-xs-4">
                                <a href="AdFord2012.jsp">
                                    <img style="width:70%;" src="images/ford2012.jpg">
                                </a>                          
                            </div>
                            
                        </div>    
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="Comments">
                                    <% Query = "SELECT A.Content FROM Advertisement A WHERE A.ItemName='2012-Mustang'";
                                        rs = DBConnection.ExecQuery(Query);
                                        if (rs.next()) {
                                            out.print(rs.getString(1));
                                        }
                                    %>  
                                </div>
                            </div>
                            <div class="col-xs-4">      
                            </div>
                            <div class="col-xs-2"> 
                                   
                            </div>
                        </div>  
                    </form> 

                    <div class="row">
                        <div class="col-xs-4">                            
                            <a href="AdSupermanShirt.jsp">
                                <img style="width:70%;  border-style: solid; " src="images/supermanshirt.jpg">
                            </a>                            
                        </div>
                        <div class="col-xs-6">   
                                <div class="form-group">
                                    <input name="MyPost" type="post" id="WritePostBox" class="form-control input-lg" placeholder="Write a post...">
                                </div>
                                <div class="col-sm-10 col-sm-offset-2">
                                    <a href="writePost.jsp">
                                        <input id="writePost" name="writePost" type="submit" value="Post" class="btn btn-primary" 
                                               >
                                    </a>
                                </div> 
                            </div> 
                    </div>
                    <div class="row">
                        <div class="col-xs-4">
                            <div class="Comments">
                                <% Query = "SELECT A.Content FROM Advertisement A WHERE A.ItemName='Superman Shirt'";
                                    rs = DBConnection.ExecQuery(Query);
                                    if (rs.next()) {
                                        out.print(rs.getString(1));
                                    }
                                %>  
                            </div>
                        </div>  
                    </div>    
                    <% Query = "select Post.PostID,Post.Date, Post.Content, Post.AuthorID from Post";
                        rs = DBConnection.ExecQuery(Query);
                        int pCounter = 0;
                        while (rs.next()) {
                    %>  <div class="row">
                        <div class="col-xs-4">
                        </div>   
                        <div class="col-xs-6">    
                            <div class="posts">
                                <% out.print(rs.getString(2)); %>  <br>
                                <% out.print(rs.getString(3)); %> 
                                &nbsp &nbsp &nbsp &nbsp
                                <% if (ID.equals(rs.getString(4))) //user is Owner of post 
                                            {%> <a onclick="<%session.setAttribute("PostID", rs.getString(1));%>"
                                   href="EditPost.jsp?PostID=<%=rs.getString(1)%>">  Edit  </a>  
                                <a onclick="<%session.setAttribute("PostID", rs.getString(1));%>" 
                                   href="deletePost.jsp?PostID=<%=rs.getString(1)%>">  Delete  </a>
                                <% }
                                    Query = "select * from LikesPost P where P.PostID = " + rs.getString(1) + " and P.CustomerID = " + ID;
                                    ps = DBConnection.ExecQuery(Query);
                                    if (ps.next()) {%> <a onclick="<%session.setAttribute("PostID", rs.getString(1));%>" 
                                   href="likePost.jsp?PostID=<%=rs.getString(1)%>">Like  </a>  
                                <%  ;
                                        } else {%> 
                                <a onclick="<%session.setAttribute("PostID", rs.getString(1));%>" 
                                   href="unlikePost.jsp?PostID=<%=rs.getString(1)%>">  Unlike  </a> 
                                <% ;
                                            } %>
                            </div>
                        </div>
                    </div>     
                    <br>
                    <div class="row">    
                        <div class="col-xs-6">
                        </div>
                        <div class="col-xs-4">   
                            <!-- Comments -->
                            <% Query = "select Cus.FirstName,Cus.LastName,C.Date,"
                                        + " C.Content, C.AuthorID, C.CommentID"
                                        + " from Comment C, Post P, Customer Cus"
                                        + " where C.AuthorID=Cus.CustomerID AND C.PostID=P.PostID"
                                        + " AND C.PostID=" + rs.getString(1);
                                cs = DBConnection.ExecQuery(Query);
                                while (cs.next()) {
                                    ps = DBConnection.ExecQuery("select * from LikesComment C where C.CommentID=" + cs.getString(6) + " and C.CustomerID = " + ID);
                            %>
                            <div class="Comments">                                     
                                <tr>
                                    <td > <% out.print(cs.getString(1) + " "); %> </td>
                                    <td > <% out.print(cs.getString(2) + ", "); %> </td>
                                    <td > <% out.print(cs.getString(3)); %> </td> <br>
                                <td > <% out.print(cs.getString(4)); %> </td> <br>
                                <% if (cs.getString(5).equals(ID)) /*if owner is the User */ {
                                %>    
                                <a onclick="<%session.setAttribute("CommentID", cs.getString(6));%>"
                                   href="EditComment.jsp?CommentID=<%=cs.getString(6)%>"> Edit </a>
                                <% ;
                                    }
                                    if (ps.next()) {%>  <a onclick="<%session.setAttribute("CommentID", cs.getString(6));%>"

                                   href="unlikeComment.jsp?CommentID=<%=cs.getString(6)%>"> Unlike </a> 
                                <%  ;
                                                    } else {%>  
                                <a onclick="<%session.setAttribute("CommentID", cs.getString(6));%>"

                                   href="likeComment.jsp?CommentID=<%=cs.getString(6)%>"> Like </a> 

                                <% ;
                                                            } %>
                                <br>    
                                </tr>  
                            </div>
                            <%  }
                            %>                         
                            <form class="form col-md-12 center-block" action="writeComment.jsp" method="post">
                                <div class="form-group">            
                                    <input name="MyComment" id="WriteCommentBox" class="form-control input-lg" placeholder="...">
                                    <a href="writeComment.jsp?PostID=<%=rs.getString(1)%>" onclick="<%session.setAttribute("PostID", rs.getString(1));%>"> 
                                        <input  name="writeComment" type="submit" value="Comment" class="btn btn-primary">   
                                    </a>   
                                    <br>        
                                </div>  
                            </form>            

                        </div> 
                    </div>
                    <%  }
                    %>                
                </div>
            </div>

        </div>
    </body>

</html>
