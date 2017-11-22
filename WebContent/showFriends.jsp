<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

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
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="food.jsp">Food</a>
                    </li>
                    <li>
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


	<!-- Find a Meal -->
	<div class="container">
		<h1 class="text-center" style="margin-bottom:50px;">Find a Friend</h1>
			<div style="margin:auto; width:100%; text-align:center;">
			
				<%
					List<String> list = new ArrayList<String>();
					
					try {
			
						Class.forName("com.mysql.jdbc.Driver");
						String url = "jdbc:mysql://peopletable.clp3txsgtchd.us-east-2.rds.amazonaws.com:3306/innodb";
						
						Connection con = DriverManager.getConnection(url, "Admin", "Group13!");
			
						//Create a SQL statement
						Statement stmt = con.createStatement();
						//Get the selected radio button from the index.jsp
						String friend = request.getParameter("Friend");
						String address = request.getParameter("Address");
						//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
						String str = "SELECT Friend, FriendAddress FROM Friends WHERE Person ='" + friend + "' and PersonAddress LIKE '%" + address + "%'";
						//Run the query against the database.
						ResultSet result = stmt.executeQuery(str);
						
						boolean empty = false;
						if(!result.next()){
							empty = true;
						}
						result.beforeFirst();
						
						if(empty)
							out.print("No Results");
						else{
							if(result.next()){
								String fname = result.getString("Friend");
								String faddress = result.getString("FriendAddress");
								Statement stmt2 = con.createStatement();
								String str2 = "SELECT RecommendedCalories, RecommendedProtein, RecommendedCarbs, RecommendedFat, Fav_Restaurant FROM People WHERE Name ='" + fname +"' and Address LIKE '%" + faddress + "%'";
								ResultSet result2 = stmt.executeQuery(str2);
								out.print("<p style=\"font-size:14pt; font-weight:bold; text-align:left;\">Your Friend: " + fname + " at " + faddress);
								
								out.print("<br><br><table style=\"margin:0 auto\">");
								//make a row
								out.print("<tr style=\"font-size:14pt; font-weight:bold;\">");
								//make a column
								out.print("<td style=\"width:20%\">");
								//print out column header
								out.print("Calories");
								out.print("</td>");
								//make a column
								out.print("<td style=\"width:20%\">");
								//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
								out.print("Protein");
								out.print("</td>");
								out.print("<td style=\"width:20%\">");
								//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
								out.print("Carbs");
								out.print("</td>");
								out.print("<td style=\"width:20%\">");
								//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
								out.print("Fat");
								out.print("</td>");
								out.print("<td style=\"width:20%\">");
								//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
								out.print("Favorite Restaurant");
								out.print("</td>");
								out.print("</tr>");
								int counter = 1;
								while (result2.next()) {
									//make a row
									out.print("<tr style=\"height:50px;\">");
									//make a column
									out.print("<td style=\"text-align:center;\">");
									//Print out current bar or beer name:
									out.print(counter + ". " + result2.getString("RecommendedCalories"));
									out.print("</td>");
									out.print("<td>");
									//Print out current bar/beer additional info: Manf or Address
									out.print(result2.getString("RecommendedProtein"));
									out.print("</td>");
									out.print("<td>");
									//Print out current bar/beer additional info: Manf or Address
									out.print(result2.getString("RecommendedCarbs"));
									out.print("</td>");
									out.print("<td style=\"text-align:center;\">");
									//Print out current bar or beer name:
									out.print(result2.getString("RecommendedFat"));
									out.print("</td>");
									out.print("<td style=\"text-align:center;\">");
									out.print(result2.getString("Fav_Restaurant"));
									out.print("</td>");
									out.print("</tr>");
									counter++;
					
								}
								out.print("</table>");
								
								Statement stmt3 = con.createStatement();
								String str3 = "SELECT Restaurant FROM Frequents WHERE Name ='" + fname +"' and Address LIKE '%" + faddress + "%'";
								ResultSet result3 = stmt.executeQuery(str3);
								out.print("<br><br><br><p style=\"font-size:14pt; font-weight:bold; text-align:left;\">" + fname + "'s Most Frequented Restaurants:");
								
								out.print("<br><table>");
								
								//make a row
								out.print("<tr style=\"font-size:14pt; font-weight:bold; text-align:left;\">");
								//make a column
								out.print("<td style=\"width:100%; text-align:left;\">");
								//print out column header
								out.print("</td>");
								out.print("</tr>");
								
								counter = 1;
								while (result3.next()) {
									//make a row
									out.print("<tr style=\"height:50px;\">");
									//make a column
									out.print("<td style=\"text-align:left;\">");
									//Print out current bar or beer name:
									out.print(counter + ". " + result3.getString("Restaurant"));
									out.print("</td>");
									out.print("</tr>");
									counter++;
								}
								out.print("</table>");
								Statement stmt4 = con.createStatement();
								String str4 = "SELECT Meal FROM Likes WHERE Name ='" + fname +"' and Address LIKE '%" + faddress + "%'";
								ResultSet result4 = stmt.executeQuery(str4);
								out.print("<br><br><br><p style=\"font-size:14pt; font-weight:bold; text-align:left;\">" + fname + "'s Most Liked Meals:");
								
								out.print("<br><table style=\"margin:0 auto\">");
								
								//make a row
								out.print("<tr style=\"font-size:14pt; font-weight:bold;\">");
								//make a column
								out.print("<td style=\"width:20%\">");
								//print out column header
								out.print("</td>");
								out.print("</tr>");
								
								counter = 1;
								while (result4.next()) {
									//make a row
									out.print("<tr style=\"height:50px;\">");
									//make a column
									out.print("<td style=\"text-align:left;\">");
									//Print out current bar or beer name:
									out.print(counter + ". " + result4.getString("Meal"));
									out.print("</td>");
									out.print("</tr>");
									counter++;
								}
								out.print("</table><br>");
							}
						}
		
					//close the connection.
					con.close();
					}
				catch (Exception e) {
						out.print(e);
					}
				%>
				
			</div>
			
    </div><!-- /.container -->
	
	<div style="margin:auto; width:100%; text-align:center;">
	  	<div style="margin:auto; width:50%; padding:40px;">
		  	<button class="btn btn-primary" type="button" id="myButton">
		  		Search Again
		  	</button>
		  	<script type="text/javascript">
			    document.getElementById("myButton").onclick = function () {
			        location.href = "friends.jsp";
			    };
			</script>
	  	</div>
	</div>
	
	<!-- Footer -->
	<footer>

		<!-- Footer Links -->
		<div class="footer-info" style="margin-top:50px;">
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