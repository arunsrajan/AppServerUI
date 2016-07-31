<div id="singammenu" style="height: 400px;">
	<ul>
		<li><a href="navigatemenu.do?page=home">Home</a></li>
		<li class="isFolder isExpanded" title="Deploy Panel">
            Servers
            <ul>
               <li><a href="navigatemenu.do?page=deploypanel">Deploy</a></li>
               <li><a href="navigatemenu.do?page=serverstartpanel">Server Info</a></li>
            </ul>
        </li>
		<!-- <li>
            Node 1
            <ul>
                <li>Sub Node 1</li>
                <li>Sub Node 2</li>
                <li>Sub Node 3</li>
            </ul>
        </li>
        <li>Node 2</li> -->
	</ul>
</div>
<script>
	$(document).ready(function() {
		$('#singammenu').easytree();
	});
</script>