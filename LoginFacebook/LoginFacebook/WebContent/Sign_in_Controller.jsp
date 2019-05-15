
<%@page import="Controller.Profile_Bean"%>
<%@page import="Controller.Profile_Modal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String access_token = (String) request.getParameter("access_token");
		Profile_Modal profile_Modal = new Profile_Modal();
		Profile_Bean profile_Bean = profile_Modal.call_me(access_token);
	%>

	Name :
	<%=profile_Bean.getUser_name()%><br> Email :
	<%=profile_Bean.getEmail()%><br> id :
	<%=profile_Bean.getId()%><br> Profile Picture :
	<%=profile_Bean.getProfile_picture()%><br>

	<img src="<%=profile_Bean.getProfile_picture()%>"></img>

</body>
</html>