

<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Create Advertisement</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/employee.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <h1><b>SocialConnect</b></h1>
            <h2>Create Advertisement</h2>
            <hr>
        </header>
        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputType">Type</label>
                <input type="text" class="form-control" id="inputType" placeholder="Enter type" name="type">
            </div>
            <div class="form-group">
                <label for="inputDate">Date</label>
                <input type="date" class="form-control" id="inputDate" placeholder="Enter date" name="date">
            </div>
            <div class="form-group">
                <label for="inputCompany">Company</label>
                <input type="text" class="form-control" id="inputCompany" placeholder="Enter company" name="company">
            </div>
            <div class="form-group">
                <label for="inputType">Item Name</label>
                <input type="text" class="form-control" id="inputItemName" placeholder="Enter item name" name="itemName">
            </div>
            <div class="form-group">
                <label for="inputContent">Content</label>
                <input type="text" class="form-control" id="inputContent" placeholder="Enter content" name="content">
            </div>
            <div class="form-group">
                <label for="inputUnitPrice">Unit Price</label>
                <input type="number" class="form-control" id="inputUnitPrice" placeholder="Enter unit price" name="unitPrice">
            </div>
            <div class="form-group">
                <label for="inputQuantity">Quantity</label>
                <input type="number" class="form-control" id="inputQuantity" placeholder="Enter quantity" name="quantity">
            </div>
            <button onclick="location.href="'AdvertisementSuccessful.jsp'">Submit</button>
            <button type="reset">Reset</button>
            <button>Cancel</button>
        </form>
        <%
            
        %>
        
    </body>
</html>
