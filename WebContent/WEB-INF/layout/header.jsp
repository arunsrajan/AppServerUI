<table>
		<tbody>
			<tr>
				<td align="left"><select id="themes">
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
				</select></td>
				<td align="right"><input type="button" id="logout"
					value="Logout"></input></td>
			</tr>
		</tbody>
	</table>
	<script>
	var tabz;
	$(document).ready(
			function() {
				$("#themes").selectmenu(
						{
							change : function() {
								$("#jqueryui").attr(
										{
											href : $('#themes').find(
													":selected").val()
													+ "jquery-ui.css"
										});
								$("#theme").attr(
										{
											href : $('#themes').find(
													":selected").val()
													+ "themes.css"
										});
								//$("#style").val($('#themes').find(":selected").val());
							}
						});
				$("#jqueryui").attr({
					href : "themes/sunny/jquery-ui.css"
				});
				$("#theme").attr({
					href : "themes/sunny/themes.css"
				});
				//$("#browse").button();
				$('#logout').button().click(
						function(event) {
							$("#frmUploadArchive").get(0).setAttribute(
									'action', 'logout.do');
							$("#frmUploadArchive").submit();
						});
			});
	</script>
</body>
</html>