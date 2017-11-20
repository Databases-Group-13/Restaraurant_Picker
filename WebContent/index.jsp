<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<!-- Template by Quackit.com -->
<!-- Images by various sources under the Creative Commons CC0 license and/or the Creative Commons Zero license. 
Although you can use them, for a more unique website, replace these images with your own. -->
<html lang="en">
<head>
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Restaurant Picker</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS: You can use this stylesheet to override any Bootstrap styles and/or apply your own styles -->
    <link href="css/custom.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Logo and responsive toggle -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">
                	<span class="glyphicon glyphicon-fire"></span> 
                	R P
                </a>
            </div>
            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active">
                        <a href="index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="food.jsp">Food</a>
                    </li>
                    <li>
                        <a href="#">Ingredients</a>
                    </li>
                    <li>
                        <a href="#">Friends</a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container -->
    </nav>

	<!-- Feature -->
	<div class="jumbotron feature">
		<div class="container">
			<h1><span class="glyphicon glyphicon-equalizer"></span> Restaurant Picker</h1>
			<p>Find The Right Restaurant For You</p>
		</div>
	</div>


    <!-- Heading -->
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h1 class="text-center">Superior Selections</h1>
                <p class="lead text-center">Search our database of 1000s of Restaurants in New Jersey and find the right place to eat. Looking for strictly vegetarian restaurants? Or maybe even steakhouses in the same town as you? See what foods each restaurant you are interested in has and even take a look at some of the ingredients used to prepare your meals with Restaurant Picker.</p>
            </div>
        </div>
    </div>

    <!-- Promos -->
	<div class="container-fluid">
        <div class="row promo">
			<div class="col-md-4 promo-item item-1">
				<h3>
					Find Great Restaurants
				</h3>
			</div>
			<div class="col-md-4 promo-item item-2">
				<h3>
					Find Great Food
				</h3>
			</div>
			<div class="col-md-4 promo-item item-3">
				<h3>
					Find The Best Ingredients
				</h3>
			</div>
        </div>
    </div><!-- /.container-fluid -->

	<!-- Find a Restaurant -->
	<div class="container">
		<h1 class="text-center">Find a Restaurant</h1>
			<div style="margin:auto; width:100%; text-align:center;">
			
				<form method="post" action="show.jsp" style="margin-top:50px;">
					<div style="width:100%; text-align:left;">
					  <div style="left:0%; position:relative; display:inline;">Restaurant Name: <input type="text" name="Restaurant" /></div>
					  <div style="left:7.5%; position:relative; display:inline;">Restaurant Type: <input type="text" name="Type" /></div>
					  <div style="left:15%; position:relative; display:inline;">Restaurant Location: <input type="text" name="Location" /></div>
				  	</div>
				  	<div style="margin:auto; width:50%; padding:40px;">
				  	<button class="btn btn-primary" type="submit">
				  		<span aria-hidden="true"></span> Submit
				  	</button>
				  	</div>
				</form>
				
			</div>
			
    </div><!-- /.container -->
	
	<div class="container">
        <div class="row">
            <div class="col-xs-12">
            	<h1 class="text-center" style="text-align:left;">How It Works:</h1>
                <p class="lead text-center" style="text-align:left;">Type a restaurant name you want to find out more about, or enter a restaurant type to get a list of all the restaurants in NJ and their locations with that type. You can also find all the restaurants in a specific town, or just get a list of 100 restaurants in NJ.</p>
            </div>
        </div>
    </div>
	
	<!-- Footer -->
	<footer>

		<!-- Footer Links -->
		<div class="footer-info">
			<div class="container">
				<div class="row">
					<div class="col-sm-4 footer-info-item">
						<h3>Information</h3>
						<ul class="list-unstyled">
							<li><a href="#">About Us</a></li>
							<li><a href="#">Customer Service</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Sitemap</a></li>
							<li><a href="#">Orders &amp; Returns</a></li>
						</ul>
					</div>
					<div class="col-sm-4 footer-info-item">
						<h3>My Account</h3>
						<ul class="list-unstyled">
							<li><a href="#">Sign In</a></li>
							<li><a href="#">View Cart</a></li>
							<li><a href="#">My Wishlist</a></li>
							<li><a href="#">Track My Order</a></li>
							<li><a href="#">Help</a></li>
						</ul>	
					</div>
					<div class="col-sm-4 footer-info-item">
						<h3><span class="glyphicon glyphicon-list-alt"></span> Newsletter</h3>
						<p>Sign up for exclusive offers.</p>
						<div class="input-group">
							<input type="email" class="form-control" placeholder="Enter your email address">
							<span class="input-group-btn">
								<button class="btn btn-primary" type="button">
									Subscribe!
								</button>
							</span>
						</div>
					</div>
				</div><!-- /.row -->
			</div><!-- /.container -->
        </div>
        
        <!-- Copyright etc -->
        <div class="small-print">
        	<div class="container">
        		<p><a href="#">Terms &amp; Conditions</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact</a></p>
        		<p>Copyright &copy; Example.com 2015 </p>
        	</div>
        </div>
        
	</footer>

	
    <!-- jQuery -->
    <script src="js/jquery-1.11.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	
	<!-- IE10 viewport bug workaround -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
	
</body>

</html>
