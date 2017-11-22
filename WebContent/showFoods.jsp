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
		<h1 class="text-center" style="margin-bottom:50px;">Find a Meal</h1>
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
						String rest = " ";
						boolean changed = false;
						String temp_rest =  request.getParameter("Restaurant");
						for(int i = 0; i < temp_rest.length(); i++){
							if(temp_rest.charAt(i) == '\''){
								rest = temp_rest.substring(0, i) + "'" + temp_rest.substring(i, temp_rest.length());
								changed = true;
							}
						}
						if(!changed)
							rest = temp_rest;
						String type = request.getParameter("Type");
						String meal = request.getParameter("Meal");
						String price = request.getParameter("Price");
						if(price == "")
							price ="1000";
						String cals = request.getParameter("Calories");
						if(cals == "")
							cals ="50000";
						String protein = request.getParameter("Protein");
						if(protein == "")
							protein ="50000";
						String carbs = request.getParameter("Carbs");
						if(carbs == "")
							carbs ="50000";
						String fat = request.getParameter("Fat");
						if(fat == "")
							fat ="50000";
						//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
						String str;
						if(meal == "")
							str = "SELECT s1.Price, s1.Meal, m1.Calories, m1.Protein, m1.Carbs, m1.Fat, s1.Restaurant FROM Serves s1, Meals m1 WHERE s1.Restaurant LIKE '%" + rest + "%' and s1.Meal LIKE '%" + meal + "%' and s1.Price <=" + price + " and m1.Protein <=" + protein + " and m1.Calories <=" + cals + " and m1.Carbs <= " + carbs +" and m1.Fat <=" +fat+ " and s1.Meal = m1.Meal GROUP BY m1.Meal LIMIT 100";
						else
							str = "SELECT s1.Price, s1.Meal, m1.Calories, m1.Protein, m1.Carbs, m1.Fat, s1.Restaurant FROM Serves s1, Meals m1 WHERE s1.Restaurant LIKE '%" + rest + "%' and s1.Meal LIKE '%" + meal + "%' and s1.Price <=" + price + " and m1.Protein <=" + protein + " and m1.Calories <=" + cals + " and m1.Carbs <= " + carbs +" and m1.Fat <=" +fat+ " and s1.Meal = m1.Meal LIMIT 100";
						//Run the query against the database.
						ResultSet result = stmt.executeQuery(str);
						
						boolean empty = false;
						if(!result.next()){
							empty = true;
						}
						result.beforeFirst();
						//Make an HTML table to show the results in:
						out.print("<table style=\"margin:0 auto\">");
			
						//make a row
						out.print("<tr style=\"font-size:14pt; font-weight:bold;\">");
						//make a column
						out.print("<td style=\"width:25%\">");
						//print out column header
						out.print("Restaurant Name");
						out.print("</td>");
						//make a column
						out.print("<td style=\"width:25%\">");
						//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
						out.print("Meal Name");
						out.print("</td>");
						out.print("<td style=\"width:10%\">");
						//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
						out.print("Calories");
						out.print("</td>");
						out.print("<td style=\"width:10%\">");
						//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
						out.print("Protein");
						out.print("</td>");
						out.print("<td style=\"width:10%\">");
						//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
						out.print("Carbs");
						out.print("</td>");
						out.print("<td style=\"width:10%\">");
						//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
						out.print("Fat");
						out.print("</td>");
						out.print("<td style=\"width:10%\">");
						//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
						out.print("Meal Price");
						out.print("</td>");
						out.print("</tr>");
						
						int counter = 1;
						//parse out the results
						if(rest == "" && meal == "" && price == ""){
							out.print("</table>");
							out.print("<br>No Results");
						}
						else{
							while (result.next()) {
								//make a row
								out.print("<tr style=\"height:50px;\">");
								//make a column
								out.print("<td style=\"text-align:left;\">");
								//Print out current bar or beer name:
								out.print(counter + ". " + result.getString("Restaurant"));
								out.print("</td>");
								out.print("<td>");
								//Print out current bar/beer additional info: Manf or Address
								out.print(result.getString("Meal"));
								out.print("</td>");
								out.print("<td>");
								//Print out current bar/beer additional info: Manf or Address
								out.print(result.getString("Calories"));
								out.print("</td>");
								out.print("<td style=\"text-align:center;\">");
								//Print out current bar or beer name:
								out.print(result.getString("Protein"));
								out.print("</td>");
								out.print("<td style=\"text-align:center;\">");
								out.print(result.getString("Carbs"));
								out.print("</td>");
								out.print("<td style=\"text-align:center;\">");
								out.print(result.getString("Fat"));
								out.print("</td>");
								out.print("<td style=\"text-align:center;\">");
								out.print("$" + result.getString("Price"));
								out.print("</td>");
								out.print("</tr>");
								counter++;
				
							}
							out.print("</table>");
						}
					if(empty)
						out.print("<br>No Results");
		
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
			        location.href = "food.jsp";
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