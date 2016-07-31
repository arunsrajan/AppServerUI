<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Singam</title>
<link href="skin-win8/ui.easytree.css" rel="stylesheet">
<link id="theme" href="themes/humanity/theme.css" rel="stylesheet">
<link id="jqueryui" href="themes/humanity/jquery-ui.css"
	rel="stylesheet">
<script src="external/jquery/jquery.js"></script>
<script src="jquery-ui.js"></script>
<script src="jquery.ui.table.js"></script>
<script src="ElementQueries.js"></script>
<script src="ResizeSensor.js"></script>
<script src="jquery.easytree.js"></script>
<style type="text/css">
body {
	margin: 10px;
}

table, th, td, li, dl {
	font-family: "lucida grande", arial;
	font-size: 10pt;
}

dt {
	font-weight: bold;
}

table {
	background-color: #efefef;
	border: 2px solid #dddddd;
	width: 100%;
	border-spacing: 0px;
}

tbody {
	background-color: #ffffff;
}

th {
	background-color: #efefef;
	padding: 10px;
	position: relative;
}

td {
	padding: 10px;
}

.alternate {
	background-color: #f9f9f9;
}

.ui-resizable-e {
	cursor: e-resize;
	width: 7px;
	right: -3px;
	top: 0;
	height: 100%;
	background: crimson;
}

.ui-resizable-handle {
	position: absolute;
	font-size: 0.1px;
	display: block;
	-ms-touch-action: none;
	touch-action: none
}

tr>th:last-child>.ui-resizable-e {
	right: 0px;
}

.mousechange:hover {
	cursor: pointer;
}
</style>
</head>
<body>
    <table border="1" cellpadding="2" cellspacing="2" align="center">
        <tr>
            <td height="20%" colspan="2">
            	<tiles:insert attribute="header" ignore="true" />
            </td>
        </tr>
        <tr>
        <td height="4%" colspan="2">
            <%if(request.getAttribute("message")!=null){
            	out.print(request.getAttribute("message"));
            }%>	
            </td>
        </tr>
        <tr>
            <td width="20%" height="400">
            	<tiles:insert attribute="menu" />
            </td>
            <td>
            	<tiles:insert attribute="body" />
            </td>
        </tr>
        <tr>
            <td height="20%" colspan="2">
            	<tiles:insert attribute="footer" />
            </td>
        </tr>
    </table>
</body>
</html>