<%@ page import="myFirstBackendProject.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
User user = (User)session.getAttribute("session_user");

if(user==null){
    response.sendRedirect("fron.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Student Seat Details</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

body{

background:linear-gradient(135deg,#ffe259,#ffa751);

min-height:100vh;

}

.navbar{

box-shadow:0 5px 15px rgba(0,0,0,.2);

}

.details-card{

margin-top:60px;

border:none;

border-radius:20px;

overflow:hidden;

}

.card-header{

background:#198754;

color:white;

font-size:28px;

font-weight:bold;

text-align:center;

padding:20px;

}

.card-body{

padding:40px;

}

.info{

font-size:22px;

margin:25px 0;

font-weight:500;

}

.info i{

color:#198754;

margin-right:15px;

font-size:28px;

}

.btn-custom{

width:180px;

font-size:18px;

font-weight:bold;

}

footer{

margin-top:60px;

background:#198754;

color:white;

padding:15px;

text-align:center;

}

</style>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">

<div class="container">

<a class="navbar-brand fw-bold fs-3" href="#">

🎓 Exam Seat Finder

</a>

</div>

</nav>

<div class="container">

<div class="row justify-content-center">

<div class="col-lg-8">

<div class="card shadow-lg details-card">

<div class="card-header">

<i class="bi bi-person-circle"></i>

Student Examination Details

</div>

<div class="card-body">

<h3 class="text-center mb-5">

Welcome 👋

</h3>

<div class="info">

<i class="bi bi-person-vcard-fill"></i>

Enrollment Number :

<b><%=user.getEnrollment()%></b>

</div>

<div class="info">

<i class="bi bi-building-fill"></i>

Building Name :

<b><%=user.getBuilding()%></b>

</div>

<div class="info">

<i class="bi bi-door-open-fill"></i>

Room Number :

<b><%=user.getRoom()%></b>

</div>



</div>

</div>

</div>

</div>

</div>

<footer>

© 2026 Exam Seating Arrangement System

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>