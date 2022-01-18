<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="nasa.*"%>

<!--Author: Christina Darstbanian  -->
<!-- The class is the front end part where it calls the backend functions and display the information needed -->


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>NASA'S APOD API GALLERY</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
                integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
                crossorigin="anonymous">
        <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
                crossorigin="anonymous">

        <script src="https://kit.fontawesome.com/9cec6e31d9.js" crossorigin="anonymous"></script> 
      
    </head>

    <body>
    <%if (request.getParameter("picid") != null) {
							if (Nasa.pics_likes.get(request.getParameter("picid"))) {
								Nasa.pics_likes.put(request.getParameter("picid"), false);
							} else {
								Nasa.pics_likes.put(request.getParameter("picid"), true);
							}
						}
    %>
        <%Nasa c = new Nasa();%>
		<h3 style="color: #051622;">NASA'S APOD API GALLERY</h3>
		<form action="nasa.jsp" method = "POST">
				<label style="font-size: 19px;" for="DATE">Date: </label> 
				<%if (request.getParameter("DATE") == null){ %>
					<input type="DATE" id="DATE" name="DATE">
				<%} else{ %>
			 <input type="DATE" id="DATE" name="DATE" value ="<%out.print(request.getParameter("DATE"));%>">
				<% }%>
				<input type="submit" class= "btn btn-outline-success"  value="Search by date" style="background-color: #A9BA9D; font-size: 19px; animation: rotating 2s 0.25s linear infinite;">
		</form>
		<%if(request.getParameter("DATE") == null || request.getParameter("DATE").isEmpty()){%>
				<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="margin-top: 0.5%;">
					<div class="carousel-inner">
                        <% 
						for (int i = 0; i < Nasa.pics.size(); i++) {
							if (i == 0) {%>
								<div class="carousel-item active"">
							<%} else {%>
								<div class="carousel-item ">
							<%}%>
									<div class="d-block w-100px" style="height: 900px; background-color: #051622; color: #DEB992; text-align: center; font-size: 5px;">
										<h4 style="margin-top: 1%; font-family: roboto-bold, Arial, Helvetica, Sans-serif;">
											<%out.print(Nasa.pics.get(i).title + "  " + Nasa.pics.get(i).date);%>
										</h4>
										<h4 style="margin-right: 1%; margin-left: 1%; font-family: roboto-bold, Arial, Helvetica, Sans-serif; font-size: 17px;">
											<%out.print(Nasa.pics.get(i).explanation);%>
										</h4>
										<img class="img-fluid" alt="Responsive image" src="<%out.print(Nasa.pics.get(i).url);%>"style="margin-top: 0.5%; height: 600px; width: 900px;">
										<form action="nasa.jsp" method="POST">
											<input type="hidden" name="picid" id="picid" value="<%out.print(Nasa.pics.get(i).date);%>">
											<%if (Nasa.pics_likes.get(Nasa.pics.get(i).date)) {%>
												<input type="submit" class="btn btn-outline-success" value="Unlike" style="margin-top: 1%; background-color: #A9BA9D; font-size: 24px; padding: 15px 62px;">
											<% } else { %>
												<div class="d-grid gap-2 d-md-flex justify-content-md-center">
													<input type="submit" class="btn btn-outline-success" value="Like" style="margin-top: 1%; background-color:#A9BA9D; font-size: 24px; padding: 15px 62px;">
												</div>
											<% } %>
										</form>
									</div>
								</div>
							<%}%>
						<btn btn-outline-success class="carousel-control-prev" type="btn btn-outline-success" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</btn btn-outline-success>
						<btn btn-outline-success class="carousel-control-next" type="btn btn-outline-success" data-bs-target="#carouselExampleControls" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</btn btn-outline-success>
					</div>
				</div>
		<%}else{
			AOAPODPicture  temp1 = c.searchbydate(request.getParameter("DATE"));
			if(temp1 != null){%> 
			<div id="carouselExampleControls" class="carousel slide  " data-bs-ride="carousel" style="margin-top: 0.5%;">
				<div class="carousel-inner ">
					<div class="carousel-item active">
						<div class="d-block w-100px" style="height: 900px; background-color: #051622; color: #DEB992; text-align: center; font-size: 5px;">
							<h4 style="margin-top: 1%; font-family: roboto-bold, Arial, Helvetica, Sans-serif;">
								<% out.print(temp1.title + "  " + temp1.date); %>
							</h4>
							<h4 style="margin-right: 1%; margin-left: 1%; font-family: roboto-bold, Arial, Helvetica, Sans-serif; font-size: 17px;">
								<% out.print(temp1.explanation); %>
							</h4>
					
							<img class="img-fluid" alt="Responsive image" src="<%out.print(temp1.url);%>" style="margin-top: 0.5%; height: 600px; width: 900px;">
							<form action="nasa.jsp" method="POST">
								<input type="hidden" id="DATE" name="DATE" value ="<%out.print(temp1.date);%>">
								<input type="hidden" name="picid" id="picid" value="<%out.print(temp1.date);%>">
								<%if (Nasa.pics_likes.get(temp1.date)) { %>
								<input type="submit" class="btn btn-outline-success" value="Unlike" style="margin-top: 1%; background-color: #A9BA9D; font-size: 24px; padding: 15px 62px;">
								<% } else { %>
								<div class="d-grid gap-2 d-md-flex justify-content-md-center">
									<input type="submit" class="btn btn-outline-success" value="Like" style="margin-top: 1%; background-color:#A9BA9D; font-size: 24px; padding: 15px 62px;">
								</div>
								<%}%>
							</form>
						</div>
					</div>
				</div>
			</div>
			<%}%>
		<%}%>
		
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
			integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
			integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
			crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
			integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
			crossorigin="anonymous"></script>

	</body>
</html>