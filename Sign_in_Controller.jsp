
<%@page import="Controller.User"%>
<%@page import="Controller.Server"%>
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
		Server profile_Modal = new Server();
		User User = profile_Modal.call_me(access_token);
	%>

	Name :
	<%=User.getUser_name()%><br> Email :
	<%=User.getEmail()%><br> id :
	<%=User.getId()%><br> Profile Picture :
	<%=User.getProfile_picture()%><br>

	<img src="<%=User.getProfile_picture()%>"></img>

</body>
</html>