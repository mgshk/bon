<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.js"></script>
 <div class="table-responsive">
	<table>
	<tr>
	<td>
	<label>Monday</label>
	</td>
	<td>
		<select name="monday" id="select-monday">
			<option value="close">Close</option>
			<option value="open">Open</option>
			<option value="holiday">Holiday</option>
		</select>
	</td>
	<td>
			<div class="input-group bootstrap-timepicker timepicker">
			    <input id="timepicker1" type="text" class="form-control input-small timepicker1" readonly>
			    <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
			</div>
	</td>
	<td>
			<div class="input-group bootstrap-timepicker timepicker">
			    <input id="timepicker1" type="text" class="form-control input-small timepicker1" readonly>
			    <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
			</div>
	</td>
	<td>
			<div class="input-group">
			    <button>Add Hours</button>
			</div>
	</td>
	</tr>
	</table>
</div>
<script type="text/javascript">
    $('.timepicker1').timepicker();
</script>