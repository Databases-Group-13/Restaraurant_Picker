<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Restaurant Picker</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/custom.css" rel="stylesheet">

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
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="food.jsp">Food</a>
                    </li>
                    <li  class="active">
                        <a href="ingredients.jsp">Ingredients</a>
                    </li>
                    <li>
                        <a href="friends.jsp">Friends</a>
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

	<!-- Find a Recipe -->
	<div class="container">
		<h1 class="text-center">Find a Recipe</h1>
			<div style="margin:auto; width:100%; text-align:center;">
			
				<%
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://peopletable.clp3txsgtchd.us-east-2.rds.amazonaws.com:3306/innodb";
					
					Connection con = DriverManager.getConnection(url, "Admin", "Group13!");
		
					//Create a SQL statement
					Statement stmt = con.createStatement();
					String str = "SELECT DISTINCT Meal FROM Serves ORDER BY Meal DESC";
					//Run the query against the database.
					ResultSet meals = stmt.executeQuery(str);
					
					Statement stmt2 = con.createStatement();
					String str2 = "SELECT DISTINCT Restaurant FROM Serves ORDER BY Restaurant ASC";
					//Run the query against the database.
					ResultSet restaurants = stmt2.executeQuery(str2);
					
					Statement stmt3 = con.createStatement();
					String str3 = "SELECT DISTINCT recipe FROM Recipes ORDER BY recipe ASC";
					//Run the query against the database.
					ResultSet recipes = stmt3.executeQuery(str3);
				%>
			
				<form method="post" action="showIngredients.jsp" style="margin-top:50px;">
					<table style="width:100%;">
						<tr style="text-align:center; height:50px;">
							<td style="width:33%;">
								Restaurant Name: <select name="Restaurant" style="width:45%;">
													<option value=""> </option>
													<%
														while(restaurants.next())
														{
														String rest = restaurants.getString("Restaurant"); 
													%>
													<option value="<%=rest %>"><%=rest %></option>
													<%
														}
													%>
												 </select>
							</td>
							<td style="width:33%;">
								Meal Name:  <select name="Meal" style="width:45%;">
												<option value=""> </option>
												<%
													while(meals.next())
													{
													String name = meals.getString("Meal"); 
												%>
												<option value="<%=name %>"><%=name %></option>
												<%
													}
												%>
											</select>
							</td>
							<td style="width:33%;">
								Ingredient: <input type="text" name="recipe" />
							</td>
						</tr>
					</table>
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
                <p class="lead text-center" style="text-align:left;">Find all of the meals made with a specific ingredient. Enter an ingredient and the meals that contain that ingredient and the recipe of that meal. Find the recipe of a meal by enter the name of the meal or find all of the recipes of a particular restaurant by entering a restaurant name. </p>
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
        		<p>Copyright &copy; Restaurant Picker 2017 </p>
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
