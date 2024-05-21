<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <div class="navbar-header">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                <span class="navbar-toggler-icon"></span>
                <span class="navbar-toggler-icon"></span>
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="${root}/">S*P*R*I*N*G</a>
        </div>
        <div class="collapse navbar-collapse" id="Navbar">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a href="${root}/">Home</a></li>
                <li><a href="MainBoard">MainBoard</a></li>
                <li><a href="#">Another action</a></li>
            </ul>
        </div>
    </div>
</nav>