<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link id="jqueryui" href="themes/humanity/jquery-ui.css" rel="stylesheet">
	<link id="theme" href="themes/humanity/theme.css" rel="stylesheet">
	<script src="external/jquery/jquery.js"></script>
	<script src="jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="login.do" method="POST" style="position: absolute;top:200px; left:600px">
<table border="1.0" >
<tbody>
<tr>
<td style="background-color:#ADADAD; color:#FF0000;">Username:</td>
<td><input type="text" name="username" style="background-color:#2345AD; color:#FF0000;"/></td>
</tr>
<tr>
<td style="background-color:#ADADAD; color:#FF0000;">Password:</td>
<td><input type="password" name="password" style="background-color:#2345AD; color:#FF0000;"/></td>
</tr>
<tr>
<td width="40%" align="center"><input id="button" type="submit" value="Login"/></td>
</tr>
</tbody>
</table>

</form>
</body>
<script>
$(function(){
	$( "#button" ).button();
})

</script>
</html>