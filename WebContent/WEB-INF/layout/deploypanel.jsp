<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List"%>

	<form action="upload.do" id="frmUploadArchive" method="POST">
		<input type="hidden" name="method" value="" /> <input type="hidden"
			name="style" value="humanity" />
		<div id="singam">
			<ul>
				<%
					List<String> singams = (List<String>) session.getAttribute("singams");
				%>
				<%
					for (String mbsname : singams) {
				%>
				<li><a href="#<%=mbsname%>"><%=mbsname%></a></li>
				<%
					}
				%>
			</ul>
			<%
				for (String mbsname : singams) {
			%>
			<div id="<%=mbsname%>">
				<div id="<%=mbsname%>-subtabs">
					<ul>
						<li><a href="ear.do?mbsname=<%=mbsname%>#<%=mbsname%>ear">Enterprise
								Application Archive [EAR]</a></li>
						<li><a href="war.do?mbsname=<%=mbsname%>#<%=mbsname%>war">Web
								Archive [WAR]</a></li>
						<li><a href="rar.do?mbsname=<%=mbsname%>#<%=mbsname%>rar">Resource
								Adapter Archive [RAR]</a></li>
						<li><a href="sar.do?mbsname=<%=mbsname%>#<%=mbsname%>sar">Service
								Archive [SAR]</a></li>
						<li><a href="ezb.do?mbsname=<%=mbsname%>#<%=mbsname%>ezb">Eazy
								Beans Archive [EZB]</a></li>
						<li><a href="jar.do?mbsname=<%=mbsname%>#<%=mbsname%>jar">EnterpriseJava
								Beans [EJB3]</a></li>
						<li><a href="rmi.do?mbsname=<%=mbsname%>#<%=mbsname%>rmi">Rmi
								Clustered Beans [RMI]</a></li>
						<li><a href="dss.do?mbsname=<%=mbsname%>#<%=mbsname%>dss">DataSources
								[DSS]</a></li>
					</ul>
					<div id="<%=mbsname%>ear">
						<p align="center">
							<BR />

						</p>
					</div>
					<div id="<%=mbsname%>war">
						<p align="center">
							<BR />

						</p>
					</div>
					<div id="<%=mbsname%>rar">
						<p align="center">
							<BR />

						</p>
					</div>
					<div id="<%=mbsname%>sar">
						<p align="center">
							<BR />

						</p>
					</div>
					<div id="<%=mbsname%>ezb">
						<p align="center">
							<BR />

						</p>
					</div>
					<div id="<%=mbsname%>jar">
						<p align="center">
							<BR />

						</p>
					</div>
					<div id="<%=mbsname%>rmi">
						<p align="center">
							<BR />

						</p>
					</div>
					<div id="<%=mbsname%>dss">
						<p align="center">
							<BR />

						</p>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</form>
<script>
	var tabz;
	$(document).ready(
			function() {
				<%
				StringBuilder ids= new StringBuilder("#singam");;
				for (String mbsname : singams) {
					ids.append(", #");
					ids.append(mbsname);
					ids.append("-subtabs");
				%>
				<%
				}
				%>
				var singamids="<%=ids.toString()%>";
				tabz = $(singamids).tabs();
				$("#tabs, #subtabs").tabs();
			});
	function undeploy(filename,mbsname) {
		if (window.XMLHttpRequest) {
			xhr = new XMLHttpRequest();
		} else {
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xhr.onreadystatechange = function(e) {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var selected = tabz.tabs("option", "active");
				tabz.tabs({
					active : 0
				});
				//$(tabz).slideUp( 4000 ).delay( 400 ).slideDown( 4000 );
				$(tabz).effect("highlight", {
					to : {
						width : 200,
						height : 0
					}
				}, 500, function() {
				});
				$(tabz).effect("bounce", {
					to : {
						width : 200,
						height : 500
					}
				}, 400, function() {
				});
				tabz.tabs({
					active : selected
				});
			}
		}
		xhr.timeout = 60000;
		//xhr.setRequestHeader("Content-Type", "multipart/form-data");
		xhr.open('GET', "undeploy.do?filename=" + filename+"&mbsname="+mbsname, true);
		xhr.send(null);
	}
	function uploadclick(event) {
		//$("#frmUploadArchive").get(0).setAttribute('action', 'upload.do');
		//$("#frmUploadArchive").submit();
		//alert('data');
		var formData = new FormData();
		formData.append('file', $('#browse' + event.target.id)[0].files[0]);
		formData.append('mbsname',$(this).attr("mbsname"));
		event.preventDefault();
		$("#" + event.target.id).unbind();
		/*$.ajax({
		    type: 'post',
		    url: 'deploy.do' ,
		    data: formData,
		    contentType: false,
		    encType: 'multipart/form-data',
		    done: function () {
		      alert('success')
		    },
		    processData: false
		  });*/
		if (window.XMLHttpRequest) {
			xhr = new XMLHttpRequest();
		} else {
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xhr.onreadystatechange = function(e) {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var selected = tabz.tabs("option", "active");
				tabz.tabs({
					active : 0
				});
				//$(tabz).slideUp( 4000 ).delay( 400 ).slideDown( 4000 );
				$(tabz).effect("highlight", {
					to : {
						width : 200,
						height : 0
					}
				}, 500, function() {
				});
				$(tabz).effect("bounce", {
					to : {
						width : 200,
						height : 500
					}
				}, 400, function() {
				});
				tabz.tabs({
					active : selected
				});
			}
		}
		xhr.timeout = 60000;
		//xhr.setRequestHeader("Content-Type", "multipart/form-data");
		xhr.open('POST', "deploy.do", true);
		xhr.send(formData);
	}
</script>
