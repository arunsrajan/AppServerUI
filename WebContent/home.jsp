<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link id="jqueryui" href="themes/humanity/jquery-ui.css" rel="stylesheet">
	<link id="theme" href="themes/humanity/theme.css" rel="stylesheet">
	<script src="external/jquery/jquery.js"></script>
	<script src="jquery-ui.js"></script>
	<script src="jquery.ui.table.js"></script>
	<script src="ElementQueries.js"></script>
	<script src="ResizeSensor.js"></script>
	<style type="text/css">
		body { margin: 10px; }
		table, th, td, li, dl { font-family: "lucida grande", arial; font-size: 10pt; }
		dt { font-weight: bold; }
		table { background-color: #efefef; border: 2px solid #dddddd; width: 100%; border-spacing: 0px; }
		tbody { background-color: #ffffff; }
		th { background-color: #efefef; padding: 10px; position: relative; }
		td { padding: 10px; }
		.alternate { background-color: #f9f9f9; }
		.ui-resizable-e { cursor:e-resize;width:7px;right:-3px;top:0;height:100%;background:crimson; }
		.ui-resizable-handle{position:absolute;font-size:0.1px;display:block;-ms-touch-action:none;touch-action:none}
		tr > th:last-child >.ui-resizable-e { right: 0px; }
		.mousechange:hover{
			cursor:pointer;
		}
	</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table width="100%">
<tbody>
<tr>
<td align="left">
<select id="themes">
  <option value=""></option>
  <option value="themes/black-tie/">black-tie</option>
  <option value="themes/blitzer/">blitzer</option>
  <option value="themes/cupertino/">cupertino</option>
  <option value="themes/dark-hive/">dark-hive</option>
  <option value="themes/dot-luv/">dot-luv</option>
  <option value="themes/eggplant/">eggplant</option>
  <option value="themes/excite-bike/">excite-bike</option>
  <option value="themes/flick/">flick</option>
  <option value="themes/hot-sneaks/">hot-sneaks</option>
  <option value="themes/humanity/">humanity</option>
  <option value="themes/le-frog/">le-frog</option>
  <option value="themes/mint-choc/">mint-choc</option>
  <option value="themes/overcast/">overcast</option>
  <option value="themes/pepper-grinder/">pepper-grinder</option>
  <option value="themes/redmond/">redmond</option>
  <option value="themes/start/">Start</option>
  <option value="themes/smoothness/">Smoothness</option>
  <option value="themes/sunny/" selected>Sunny</option>
  <option value="themes/swanky-purse/">swanky-purse</option>
  <option value="themes/trontastic/">trontastic</option>
  <option value="themes/ui-darkness/">ui-darkness</option>
  <option value="themes/ui-lightness/">ui-lightness</option>
  <option value="themes/vader/">vader</option>
</select>
</td>
<td align="right">
<input type="button" id="logout" value="Logout"></input>
</td>
</tr>
</tbody>
</table>
<BR/>
<BR/>
<BR/>
<form action="upload.do" id="frmUploadArchive" method="POST">
<input type="hidden" name="method" value=""/>
<input type="hidden" name="style" value="humanity"/>
<div id="tabs">
  <ul>
    <li><a href="ear.do">Enterprise Application Archive [EAR]</a></li>
    <li><a href="war.do">Web Archive [WAR]</a></li>
    <li><a href="rar.do">Resource Adapter Archive [RAR]</a></li>
    <li><a href="sar.do">Service Archive [SAR]</a></li>
    <li><a href="ezb.do">Eazy Beans Archive [EZB]</a></li>
    <li><a href="jar.do">EnterpriseJava Beans [EJB3]</a></li>
    <li><a href="rmi.do">Rmi Clustered Beans [RMI]</a></li>
    <li><a href="dss.do">DataSources [DSS]</a></li>
  </ul>
  <div id="ear.do">
   <p align="center">
    <BR/>
    
    </p>
  </div>
   <div id="war.do">
   <p align="center">
    <BR/>
    
    </p>
  </div>
    <div id="rar.do">
   <p align="center">
    <BR/>
    
    </p>
  </div>
    <div id="sar.do">
   <p align="center">
    <BR/>
    
    </p>
  </div>
    <div id="ezb.do">
   <p align="center">
    <BR/>
    
    </p>
  </div>
    <div id="jar.do">
   <p align="center">
    <BR/>
    
    </p>
  </div>
   <div id="rmi.do">
   <p align="center">
    <BR/>
    
    </p>
  </div>
  <div id="dss.do">
   <p align="center">
    <BR/>
    
    </p>
  </div>
</div>
</form>
</body>
  <script>
  var tabz;
  $(document).ready(function() {
	  tabz=$( "#tabs" ).tabs({
      beforeLoad: function( event, ui ) {
        /*ui.jqXHR.fail(function() {
          ui.panel.html(
            "Couldn't load this tab. We'll try to fix this as soon as possible. " +
            "If this wouldn't be a demo." );
        });*/
        /*ui.jqXHR.success(function(data) {
            ui.panel.html(data);
          });*/
      },
      load: function( event, ui ) {
    	  $(ui.panel.selector).find("script").each(function(i) {
          });
      }
    });  
  $( "#themes" ).selectmenu({ change:function(){
	  $("#jqueryui").attr({href : $('#themes').find(":selected").val()+"jquery-ui.css"});
	  $("#theme").attr({href : $('#themes').find(":selected").val()+"themes.css"});
	  //$("#style").val($('#themes').find(":selected").val());
	}
  });
  $("#jqueryui").attr({href : "themes/sunny/jquery-ui.css"});
  $("#theme").attr({href : "themes/sunny/themes.css"});
  //$("#browse").button();
	$('#logout').button().click(function(event){
			$("#frmUploadArchive").get(0).setAttribute('action', 'logout.do');
			$("#frmUploadArchive").submit();
	});
  });
  function undeploy(filename){
	  	  if(window.XMLHttpRequest){
			xhr=new XMLHttpRequest();
		  }
		  else{
			  xhr=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		  	xhr.onreadystatechange=function(e){
		  		if (xhr.readyState == 4 && xhr.status == 200) 
		        {
		  			 var selected = tabz.tabs("option", "active");
		  			 tabz.tabs({ active: 0 });
		  			 //$(tabz).slideUp( 4000 ).delay( 400 ).slideDown( 4000 );
		  			 $(tabz).effect( "highlight", {	to: { width: 200, height: 0 }}, 500, function(){} );
		  			 $(tabz).effect( "bounce", {to: { width: 200, height: 500 }}, 400, function(){});
		  			 tabz.tabs({ active: selected });
		        }
		  	}
		  	xhr.timeout = 60000;
		  	//xhr.setRequestHeader("Content-Type", "multipart/form-data");
		  	xhr.open('GET', "undeploy.do?filename="+filename, true);
		  	xhr.send(null);
  }
  function uploadclick(event){
		//$("#frmUploadArchive").get(0).setAttribute('action', 'upload.do');
		//$("#frmUploadArchive").submit();
		//alert('data');
		var formData = new FormData();
		formData.append('file', $('#browse'+event.target.id)[0].files[0]);
		event.preventDefault();
		$("#"+event.target.id).unbind();
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
		  if(window.XMLHttpRequest){
			xhr=new XMLHttpRequest();
		  }
		  else{
			  xhr=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		  	xhr.onreadystatechange=function(e){
		  		if (xhr.readyState == 4 && xhr.status == 200) 
		        {
		  			 var selected = tabz.tabs("option", "active");
		  			 tabz.tabs({ active: 0 });
		  			 //$(tabz).slideUp( 4000 ).delay( 400 ).slideDown( 4000 );
		  			 $(tabz).effect( "highlight", {	to: { width: 200, height: 0 }}, 500, function(){} );
		  			 $(tabz).effect( "bounce", {to: { width: 200, height: 500 }}, 400, function(){});
		  			 tabz.tabs({ active: selected });
		        }
		  	}
		  	xhr.timeout = 60000;
		  	//xhr.setRequestHeader("Content-Type", "multipart/form-data");
		  	xhr.open('POST', "deploy.do", true);
		  	xhr.send(formData);
}
  </script>
</html>