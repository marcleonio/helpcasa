<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="refresh" content="0; URL=./casa/login!logout.action?"> --> 
<title>Insert title here</title>
</head>
<body>

<c:set var="inicio" value="true" scope="session"/>
<c:redirect url="/casa/login!logout.action?" />
<!--<c:redirect url="/login.jsp" />--><!--
<script src= "<c:url value="/casa/abertura.js.jsp"/>" type="text/javascript" />  
--></body>
</html>