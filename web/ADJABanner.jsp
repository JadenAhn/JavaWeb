<%-- ADJABanner.jsp
     Assignment 1
     Revision History
        Jaden Ahn, 2018.01.24: Created
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="styles/main.css">
        <title>ADJA Computer Programming Club</title>
    </head>
    <body>
        <header>
            <div class="center">
                <img src="images/adja-icon.png" alt="ADJA Logo">
                <div class="imgText">
                    <h1>ADJA Computer Programming Club</h1>
                    <h2>IT@Conestoga</h2>
                </div>
            </div>
        <nav id="nav_bar">
            <ul>
                <li><a href="ADJAIndex.jsp">Home</a></li>
                <li><a href="<c:url value = "/ADJAMemberAdmin?action=addMember"/>">Register</a></li>
                <li><a href="/ADJAClub/ADJALoan">eLoan</a></li>
                <li><a href="/ADJAClub/ADJACart">eCart</a></li>
                <li><a href="ADJAAdmin.jsp">Admin</a></li>
            </ul>
        </nav>
        </header>
        <main>