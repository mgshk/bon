<?php 
  // echo "<pre>";print_r($LatitudesLongitude['lat']);print_r($LatitudesLongitude['lng']);exit;
         if(isset($LatitudesLongitude) && (count($LatitudesLongitude) > 0)){
         	//$cookie = $_COOKIE['myCookie'];
         	//$cookie_res = explode(',',$cookie);
         	$latitude = $LatitudesLongitude['lat'];
         	$longitude = $LatitudesLongitude['lng'];
         } else {
         	$latitude = '13.067439';
         	$longitude = '80.237617';
         }

	 $data = file_get_contents("http://maps.google.com/maps/api/geocode/json?latlng=".trim($latitude).",".trim($longitude)."&sensor=false");
	$data = json_decode($data);
	$add_array  = $data->results;
	$add_array = $add_array[0];
	$add_array = $add_array->address_components;
	$country = "";
	$state = ""; 
	$city = "";
	$local = "";
	//echo "<pre>";print_r($add_array);
	foreach ($add_array as $key) {
	  if($key->types[0] == 'political') {
		if($key->types[2] == 'sublocality_level_1') { $local = $key->long_name; }
	  }
	  if($key->types[0] == 'administrative_area_level_2')
	  {
	    $city = $key->long_name;
	  }
	  if($key->types[0] == 'administrative_area_level_1')
	  {
	    $state = $key->long_name;
	  }
	  if($key->types[0] == 'country')
	  {
	    $country = $key->long_name;
	  }
	}
	//echo "Country : ".$country." ,State : ".$state." ,City : ".$city." ,local : ".$local;
	
 ?>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css" type="text/css" media="all">
 <script type="text/javascript" src="catalog/view/javascript/jquery-ui.multidatespicker.js"></script>
<div class="col-sm-12">
<p><i class="fa fa-trash-o"></i> - Move to trash</p>
<p><i class="fa fa-play"></i> - Move to live</p>
<p><i class="fa fa-arrows-alt"></i> - Open</p>
<br>
</div>
<div class="col-sm-12">
         <?php if (!empty($advetises)) { ?>
         <?php foreach ($advetises as $advetise) { ?>
            <div class="col-sm-9">
               <div class="row">
                  <div class="hovereffect">
		  <?php if ($advetise['image']) { ?>
		       <img src="<?php echo $advetise['image']; ?>" alt="<?php echo $advetise['offer_title']; ?>" class="img-thumbnail img-responsive" />
		       <?php } else { ?>
		       <span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
		       <?php } ?>
                     <div class="overlay adv--ress">
		     <input id="ads_id" type="hidden" value="<?php echo $advetise['advertise_id']; ?>">
                        <h2><?php echo $advetise['offer_title']; ?></h2>
                        <!--<a class="info" class="" data-toggle="modal" data-id="<?php echo $advetise['advertise_id']; ?>" data-target='#myModal1'>click here</a>-->
			<a class="info" data-toggle="modal" data-target="#myModalad_approved_<?php echo $advetise['advertise_id']; ?>" ><i class="fa fa-arrows-alt"></i></a>
			<a class="info advertise_live_details" data-target='#myModal_adv' data-toggle='modal' data-id="<?php echo $advetise['advertise_id']; ?>"><i class="fa fa-play"></i></a>
			<a class="info" id="ads_delete_approved<?php echo $advetise['advertise_id']; ?>"><i class="fa fa-trash-o"></i></a>
                     </div>
                  </div>
               </div>
            </div>
	    <div class="col-sm-3"></div>
         <?php } ?>
         <?php } else { ?><?php echo $text_no_results; ?>
         <?php } ?>
</div>	
<div class="row">
   <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
   <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
<?php if (!empty($advetises)) { ?>
 <?php foreach ($advetises as $advetise) { ?>
<div class="modal fade" id="myModalad_approved_<?php echo $advetise['advertise_id']; ?>" role="dialog">
 <div class="modal-dialog">
	<div class="modal-content loc-pop">
	   <div class="modal-header">
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
		  <!-- <h4 class="modal-title loc-share-title">Advertise Details</h4> -->
	   </div>
	   <div class="modal-body loc-share-topps">
		   <h5><strong>Title: </strong><?php echo $advetise['offer_title']; ?></h5>
		   <img src="image/<?php echo $advetise['offer_image_original']; ?>" alt="<?php echo $advetise['offer_title']; ?>" class="img-thumbnail img-responsive" />
		   <p><strong>Description: </strong><?php echo $advetise['offer_desc']; ?></p>
		   <p><strong>URL: </strong><a href="<?php echo $advetise['offer_link']; ?>"><?php echo $advetise['offer_link']; ?></a></p>
	   </div>
	</div>
 </div>
</div>
<?php } ?>
<?php } ?>
<?php if (!empty($advetises)) { ?>
 <?php foreach ($advetises as $advetise) { ?>
<script>
$('#ads_delete_approved<?php echo $advetise['advertise_id']; ?>').on('click', function() {
//e.preventDefault();							
//var href = $(this).attr('href');
var modal = $('<div id="myModal_<?php echo $advetise['advertise_id']; ?>" class="modal alert_prof_del_close_can fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h3 id="myModalLabel3">Confirmation</h3></div><div class="modal-body"><p>Are you sure you want to move this to trash..</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><button class="btn-primary btn cancels">Yes</button></div></div></div></div>');			

$('body').append(modal);
	modal.modal({
	show: true
})
$('.cancels').on('click', function(e) {
var adss = <?php echo $advetise['advertise_id']; ?>;
if(adss)
	 {
	 $.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/trash&func=approved&advertise_id='+adss,
		type: 'post',
		dataType: 'json',
		success: function(json) {
			if (json['success']) {
				
				//window.location="index.php?route=sellerprofile/sellerprofile&tab_section=store";
				$('.alert_prof_del_close_can').modal('hide');
				$('#sellerapproved').load('index.php?route=sellerprofile/sellerprofile/selleradvertiseapproved&seller_id=<?php echo $seller_id; ?>');
				$('#sellerapprovedcount').html(json['count']);
				$('#sellertrashcount').html(json['trash_count']);
				
			}
			if(json['error_warning']) {
				$('#top-line-star').html('<i class="fa fa-times" aria-hidden="true"></i> ' + json['error_warning']);
			}
		}
	 });
	 }
 });
  });
</script>
<?php } ?>
<?php } ?>

<div class="modal fade" id="myModal_adv" role="dialog">
 <div class="modal-dialog">
	<div class="modal-content loc-pop">
	   <!--<div class="modal-header">
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
		  <h4 class="modal-title loc-share-title">Advertise Live Details</h4>
	   </div>-->
	   <div class="modal-body adv--nve-lve">
	   <div class="row">
	   <div class="main-tss-mg">
		<img class="img-responsive" src="image/advertise_image_top.jpg">
	   </div>
	   </div>
	   <div class="row">
	   <div class="col-sm-12">	   
	   <form method="post" id="advertise_move_live" class="form-horizontal">
	   <div class="row neet--ress-tep">
		<div class="set--sel--bt">
		   <input id="advetise_sp" name="advetise_sp" type="hidden" value="<?php echo $advetise['advertise_id']; ?>">
		    <input id="national" name="national" type="hidden" value="<?php echo strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', trim($country)))); ?>">
		    <input id="state" name="state" type="hidden" value="<?php echo strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', trim($state)))); ?>">
		    <input id="city" name="city" type="hidden" value="<?php echo strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', trim($city)))); ?>">
		   
		    <input type="radio" name="loc" id="home_top" value="1"/><label for="home_top">Home - Top banner<?php //echo ($basic_price_cashback['top_banner'] !='0') ? $basic_price_cashback['top_banner'].'%': ''; ?></label><br/>
		    <input type="radio" <?php if($country =='') { echo "disabled"; }?> name="loc" id="home_national" value="2"/><label for="home_national">Home - National (<?php if($country !='') { echo $country; } else { echo "Cannot get country name from your store geo code.";}?>)<?php echo ($basic_price_cashback['home_national'] !='0') ? $basic_price_cashback['home_national'].'%':''; ?></label><br/>
		    <input type="radio" <?php if($state =='') { echo "disabled"; }?> name="loc" id="home_state" value="3"/><label for="home_state">Home - State (<?php if($state !='') { echo $state; } else { echo "Cannot get state name from your store geo code.";}?>)<?php echo ($basic_price_cashback['home_state'] !='0') ? $basic_price_cashback['home_state'].'%': ''; ?></label><br/>
		    <input type="radio" <?php if($city =='') { echo "disabled"; }?> name="loc" id="home_city" value="4"/><label for="home_city">Home - City (<?php if($city !='') { echo $city; } else { echo "Cannot get city name from your store geo code.";}?>)<?php echo ($basic_price_cashback['home_city'] !='0') ? $basic_price_cashback['home_city'].'%': ''; ?></label><br/>
		    <input type="radio" name="loc" id="home_local" value="5"/><label for="home_local">Home - Nearby</label><br/>
		    <input type="radio" name="loc" id="store_ad" value="6"/><label for="store_ad">In your Page - Free</label><br/>
		</div>
		<div class="rigth--stat">
			<span class="set--trp"><strong>Basic price: </strong></span>
			<p>You can also post your advertisement on the position you prefer after paying the price or above already been considered for the same position by another advertisement.</p>
		</div>
	   </div>
		
	   <div class="row main-sec--res">
	   <span class="text-dangers" id="error_loc"> </span>
		<div id="home_top_hide" style="display:none;">
		   <label>From </label><input type="text" readonly class="form-control" name="from_date" id='datetimepicker_start_<?php echo $advetise['advertise_id']; ?>'/>
		   <span class="text-dangers" id="error_from_date"> </span>
		   <label>To </label><input type="text" readonly class="form-control check_span" name="end_date" id='datetimepicker_end_<?php echo $advetise['advertise_id']; ?>'/>
		   <span class="text-dangers" id="error_end_date"> </span>
		</div>
		    <span class="position_amount_visible" style="display:none;">
			    <span class="position_local_visible" style="display:none;">
				    <label>Area Covered in Km</label>
				    <select class="form-control area_km" name="km" id="km">							
					<option value=""> --Select-- </option>
					<?php for($i=1; $i<=20; $i++) { ?>
						<option value="<?php echo $i; ?>" ><?php echo $i; ?></option>
					<?php } ?>
				    </select>
			    </span>
			    <label>Position</label>
				<select class="form-control check_amount" name="position" id="position">							
					<option> ---- </option>				
				</select>
			    
			    <!-- <input type="text" name="position" class="form-control check_amount" /> -->
			    <span class="text-dangers" id="error_position"> </span>

			    <label>Price - Current Level: </label><span class="text-green" id="min_price_add">0 </span> Rs
			    
			    <label>Leavel one above: </label><span class="text-green" id="max_price_add">0 </span> Rs

			    <!--<label>Amount</label><span class="amount_show_for_basic" id=""> </span>-->
			    <input type="text" name="amount" id="amount_val" class="form-control amount_hide_for_basic"/>			  
			    <span class="text-dangers" id="error_amount"> </span>
		    </span>
		  

		  <div id="home_top_show" style="display:none;">
			<div id="withAltField" class="box"></div>
			<label>Select date</label>
			<input id="altField" name="top_banner_date" class="top_banner_dates form-control" type="text" read/>
			<input type="hidden" name="dates_for_hide" id="hide_date" />
			 <span class="text-dangers" id="error_top_banner_date"> </span>			 
			 <div class="margin-ttep">Number of days selected : <span class="display_total_2" id="display_total"> </span></div>
			 <div class="margin-ttep">Total price (no. of days x basic price) : <span class="display_amount_1" id="display_amount"> </span></div>
		  </div>
		  
		   
		    <button class="advertise-btn_live" type="button">Continue</button>
		    <button class="advertise-btn" type="button" onclick="this.form.reset();" data-dismiss="modal" aria-hidden="true">Cancel</button>
		    <span class="text-dangers" id="error_check"> </span>
		    </div>
	    </form>
	    </div>
	    </div>
	    <div class="row">
	    <div class="col-sm-12 nt--bt--bar">
	    <div class="row">
		    <span class="top--res-nll"><strong>Note: </strong></span>
		    <ul>
			<li>BoN incurs basic price to avoid flooding the space with free advertisements in the larger (buyer) audience area. </li>
			<li>If you delete the advertisement from 'Live' or 'Yet to go live' after you pay, the amount will not be refunded.</li>
			<li>Introductory offer is valid till 31st August 2017.</li>
		    </ul>
	     </div>
	     </div>
	     </div>
	   </div>
	</div>
 </div>
</div>

<script type="text/javascript">
    /*$(document).ready(function() {
	$('#datetimepicker_start_<?php echo $advetise['advertise_id']; ?>').datepicker({changeMonth: true, changeYear: true, yearRange: '-80:+0', dateFormat: 'dd-mm-yy'});
	$('#datetimepicker_end_<?php echo $advetise['advertise_id']; ?>').datepicker({changeMonth: true, changeYear: true, yearRange: '-80:+0', dateFormat: 'dd-mm-yy'});
    });*/
     $(document).ready(function () {

    var top_banner_price = "<?php echo $basic_position_amount['top_banner']; ?>";
    var today = new Date();
    var dates_for_hide = '';
    $('#altField').multiDatesPicker({ 
	altField: '#altField',
	dateFormat: "yy-mm-dd",
	minDate: 0,
	 onClose: function () {
	      $('#display_amount').text($(this).val().length);
	      $('.top_banner_dates').trigger('click');
	}
	//addDisabledDates: [today.setDate(1), today.setDate(3)]
    }).attr('readonly','readonly');   
         
   $('#altField').click(function() {
	//alert($('#altField').multiDatesPicker('getDates').length);
	$('#display_amount').text(parseInt($('#altField').multiDatesPicker('getDates').length) * parseInt(top_banner_price));
	$('#display_total').text(parseInt($('#altField').multiDatesPicker('getDates').length));
   });

	$("#datetimepicker_start_<?php echo $advetise['advertise_id']; ?>").datepicker({
		dateFormat: "yy-mm-dd",
		minDate: 0,
		onSelect: function (date) {
			var dt2 = $('#datetimepicker_end_<?php echo $advetise['advertise_id']; ?>');
			var startDate = $(this).datepicker('getDate');
			var minDate = $(this).datepicker('getDate');
			//dt2.datepicker('setDate', minDate);
			//startDate.setDate(startDate.getDate() + 30);
			//sets dt2 maxDate to the last day of 30 days window
			//dt2.datepicker('option', 'maxDate', startDate);
			dt2.datepicker('option', 'minDate', minDate);
			$(this).datepicker('option', 'minDate', minDate);
		}
	});

	

	$('#datetimepicker_end_<?php echo $advetise['advertise_id']; ?>').datepicker({
	    dateFormat: "yy-mm-dd"
	});

	$('input[name="loc"]').click(function() {
	$('#error_loc').html('');
		var loc = $(this).val();
		if(loc != 5) {
			$("select#km").val('');			
		}		
		$('.position_local_visible').hide();
		var basic_amount_loc = '';
		//if(loc == 2) { //var basic_amount_loc = 500; }
		//if(loc == 3) { //var basic_amount_loc = 400; }
		//if(loc == 4) { //var basic_amount_loc = 300; }
		if(loc == 5) { $('.position_local_visible').show(); } // var basic_amount_loc = 200;

		$('#datetimepicker_end_<?php echo $advetise['advertise_id']; ?>').datepicker('destroy');
			
		var dt1 = $('#datetimepicker_start_<?php echo $advetise['advertise_id']; ?>');
		var start_date = dt1.datepicker('getDate');
		if(loc == '1') {
			$('#home_top_hide').hide();
			$('#home_top_show').show();
			$.ajax({
			      type: "Post",
			      url: "index.php?route=sellerprofile/sellerprofile/top_banner_date_check",
			      //data: "top_banner_date="+date,
			      success: function(json)
			      {
				  if(json['success'].length > 0) {
					 $('#hide_date').val(json['success']);
					 //alert(json['success']);
					 $('#altField').multiDatesPicker({ 
						altField: '#altField',
						dateFormat: "yy-mm-dd",
						addDisabledDates: json['success']
					    });
				  }				  
			      }		    
			 });
		}
		if(loc == '6') {
			$('#home_top_hide').show();
			$('#home_top_show').hide();
		}

		if(loc == '2' || loc == '3' || loc == '4' || loc == '5') {
			$('#home_top_hide').show();
			$('#home_top_show').hide();
			$('#datetimepicker_start_<?php echo $advetise['advertise_id']; ?>').datepicker('destroy');
			$('#datetimepicker_end_<?php echo $advetise['advertise_id']; ?>').datepicker('destroy');
			$("#datetimepicker_start_<?php echo $advetise['advertise_id']; ?>").datepicker({
			    dateFormat: "yy-mm-dd",
			    minDate: 0,
			    onSelect: function (date) {
				var dt2 = $('#datetimepicker_end_<?php echo $advetise['advertise_id']; ?>');
				var startDate = $(this).datepicker('getDate');
				var minDate = $(this).datepicker('getDate');
				//dt2.datepicker('setDate', minDate);
				startDate.setDate(startDate.getDate() + 30);
				//sets dt2 maxDate to the last day of 30 days window
				dt2.datepicker('option', 'maxDate', startDate);
				dt2.datepicker('option', 'minDate', minDate);
				//$(this).datepicker('option', 'minDate', minDate);
				if(loc != '5') {
					$.post('index.php?route=sellerprofile/sellerprofile/advertiseAmountList', { 
					  'loc' : loc, 'from_date' : $(this).val() },
					  function(data) { //alert(data);
						$('#loader').html('');
						var sel = $("select#position");
						sel.empty();
						sel.append("<option value=''>-- Select --</option>");
						
						if(data.length == 0){
							sel.append('<option value="1" >1 - New</option>');
							sel.append('<option value="2">Basic price</option>');
						}

						for (var i=0; i<data.length; i++) {					
											
							var html_value = (parseInt(i) + parseInt(1))+ '-' + data[i];
						  if(data.length != (parseInt(i) + parseInt(1))) {						
							sel.append('<option value="' + (parseInt(i) + parseInt(1)) + '" >' + html_value + '</option>');
						   } else {
							//if(data.length == 1) {							
								//sel.append("<option value='" + (parseInt(i) + parseInt(2)) + "'>Basic price</option>");
							//} else {
								var basic_val = (parseInt(i) + parseInt(2))+ '- New';// +basic_amount_loc;
								sel.append('<option value="' + (parseInt(i) + parseInt(1)) + '" >' + html_value + '</option>');							
								sel.append("<option value='" + (parseInt(i) + parseInt(2)) + "' >" + basic_val + "</option>");
								sel.append("<option value='" + (parseInt(i) + parseInt(3)) + "' >Basic price</option>");
							//}
						   }
						
						}
					 }, "json");
				}

			    }
			});
			$('#datetimepicker_end_<?php echo $advetise['advertise_id']; ?>').datepicker( { dateFormat: "yy-mm-dd" });
			$('.position_amount_visible').show();			
			
		}else {
			$('#datetimepicker_start_<?php echo $advetise['advertise_id']; ?>').datepicker('destroy');
			$('#datetimepicker_end_<?php echo $advetise['advertise_id']; ?>').datepicker('destroy');
			 $("#datetimepicker_start_<?php echo $advetise['advertise_id']; ?>").datepicker({
			    dateFormat: "yy-mm-dd",
			    minDate: 0,
			    onSelect: function (date) {
				var dt2 = $('#datetimepicker_end_<?php echo $advetise['advertise_id']; ?>');
				var startDate = $(this).datepicker('getDate');
				var minDate = $(this).datepicker('getDate');
				//dt2.datepicker('setDate', minDate);
				//startDate.setDate(startDate.getDate() + 30);
				//sets dt2 maxDate to the last day of 30 days window
				//dt2.datepicker('option', 'maxDate', startDate);
				dt2.datepicker('option', 'minDate', minDate);
				$(this).datepicker('option', 'minDate', minDate);
			    }
			});

				
			$('#datetimepicker_end_<?php echo $advetise['advertise_id']; ?>').datepicker( { dateFormat: "yy-mm-dd" });
			$('.position_amount_visible').hide();	
		} 
		$('input[name="end_date"]').val('');
		$('input[name="from_date"]').val('');
		var sel = $("select#position");
		sel.empty();
		sel.append("<option value=''> ---- </option>");
		$('input[name="amount"]').val('');
		$('#max_price_add').html('0');
		$('#min_price_add').html('0');
		$('#error_position').html('');
		$('#error_amount').html('');
		$('#error_amount').html('');
		
	}); 

	
    });
</script>

<script>

var modetrue = false;
var delete_val = '0';
$('.advertise-btn_live').on('click', function(e) {
	$('#error_amount').html('');	
	var loc = $('input:radio[name=loc]:checked').val(),
		amount = parseInt($('#amount_val').val()),//$('input[name=amount]').val()),
		min_price = parseInt($('#min_price_add').html()),
		max_price = parseInt($('#max_price_add').html());	
		var total_position_length = $('#position > option').length
		if(total_position_length == 2) {
			position = (parseInt($('select[name=position]').val())+parseInt(2))
		} else {
			position = (parseInt($('select[name=position]').val())+parseInt(1));
		}
	      //alert(position); //alert(total_position_length);
	if(position != '') {
		if(loc == '2' || loc == '3' || loc == '4' || loc == '5') {	
			//alert(position);alert(total_position_length); return false;
			 if ( amount != 0  && (position != total_position_length)) { 		
				if(min_price == 0 && max_price !='' && $('select[name=position]').val() == 1){
					if (amount > max_price) { 
					} else { 
						$('#error_amount').html('<i class="fa fa-times" aria-hidden="true"></i><span>Price should be above ' +max_price+ ' Rs.'); return false;
					} 
				}
				if(min_price != 0 && max_price !='' && min_price != '') {
					var between_not_amount = (max_price - min_price);			
					//if(between_not_amount == 1) {
						//if(max_price != amount) {
							//$('#error_amount').html('<i class="fa fa-times" aria-hidden="true"></i><span>Enter ' +max_price+ ' only');
							//return false;
						//}
					//} else {
						if(position != total_position_length) { 
							if((amount > min_price) && (amount < max_price)) {					
							} else {
								$('#error_amount').html('<i class="fa fa-times" aria-hidden="true"></i><span>Price should be between '+min_price+' to ' +max_price +' or try other position');
								return false;
							}
						}
					//}

				}
			}
		 }
		 
	}	
	
	 $('.text-dangers').html('');
	 $.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/move_live&delete_val='+delete_val,
		type: 'post',
		dataType: 'json',
		data: $("#advertise_move_live").serialize(),
		success: function(json) { 
			if (json['success']) {				
				//alert(json['success']);
				//window.location.reload();
				$('#myModal_adv').append(json['confirmForm']);
				$('#payu_form').submit();
				return false;
				/*if(modetrue == false) {
						e.preventDefault();							
						//var href = $(this).attr('href');
						var modal = $('<div id="myModalfree" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h3 id="myModalLabel3">Success</h3></div><div class="modal-body"><p>Advertisment moved successfully...</p></p></div><div class="modal-footer"><button class="btn-primary btn" id="SubForms">OK</button></div></div></div></div>');			
						
						$('body').append(modal);
							modal.modal({
							show: true
						})
					
						.one('click', '#SubForms', function (e) {
							window.location.reload();
						})
					}*/
			}
			if(json['free_check'] == 1) {
				if(loc == '5') {
					if(modetrue == false) {
						e.preventDefault();							
						//var href = $(this).attr('href');
						var modal = $('<div id="myModalfree" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h3 id="myModalLabel3">Confirmation</h3></div><div class="modal-body"><p>Only one free Ad is allowed in "Home - Local" tab.</p><p>Do you want to removed old and post this Ad?</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><button class="btn-primary btn" id="SubForm">Yes</button></div></div></div></div>');			
						
						$('body').append(modal);
							modal.modal({
							show: true
						})
					
						.one('click', '#SubForm', function (e) {
							modetrue = true;
							delete_val = 1;
							$('#myModalfree').modal('hide');					
							$('.advertise-btn_live').click();
						})
					}
				} 
			}
			if(json['advertise_location']) {
				$('#error_loc').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['advertise_location']);
			}
			if(json['from_date']) {
				$('#error_from_date').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['from_date']);
			}
			if(json['end_date']) {
				$('#error_end_date').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['end_date']);
			}
			if(json['amount']) {
				$('#error_amount').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['amount']);
			}
			if(json['position']) {
				$('#error_position').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['position']);
			}
			if(loc == '1') { if(json['top_banner_date']) {
				$('#error_top_banner_date').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['top_banner_date']);
			} }
		}
	 });
 });

//$('#myModal_adv').modal({backdrop: 'static', keyboard: false});
$('.area_km').on('change',function() {
	var loc = $('input:radio[name=loc]:checked').val(),
	from_date = $( "#datetimepicker_start_<?php echo $advetise['advertise_id']; ?>" ).val(),
	km = $('select[name=km]').val();

	//alert(from_date);
	$.post('index.php?route=sellerprofile/sellerprofile/advertiseAmountList', { 
	  'loc' : loc, 'from_date' : from_date, 'km': km },
	  function(data) { //alert(data);
		$('#loader').html('');
		var sel = $("select#position");
		sel.empty();
		sel.append("<option value=''>-- Select --</option>");
		
		if(data.length == 0){
			sel.append('<option value="1" >1 - New</option>');
			sel.append('<option value="2">Basic price</option>');
		}

		for (var i=0; i<data.length; i++) {					
							
			var html_value = (parseInt(i) + parseInt(1))+ '-' + data[i];
		  if(data.length != (parseInt(i) + parseInt(1))) {						
			sel.append('<option value="' + (parseInt(i) + parseInt(1)) + '" >' + html_value + '</option>');
		   } else {
			//if(data.length == 1) {							
				//sel.append("<option value='" + (parseInt(i) + parseInt(2)) + "'>Basic price</option>");
			//} else {
				var basic_val = (parseInt(i) + parseInt(2))+ '- New';// +basic_amount_loc;
				sel.append('<option value="' + (parseInt(i) + parseInt(1)) + '" >' + html_value + '</option>');							
				sel.append("<option value='" + (parseInt(i) + parseInt(2)) + "' >" + basic_val + "</option>");
				sel.append("<option value='" + (parseInt(i) + parseInt(3)) + "' >Basic price</option>");
			//}
		   }
		
		}
	 }, "json");	
});

 $('.check_amount').on('change',function() {
	$('.amount_show_for_basic').empty();	
	$('.amount_hide_for_basic').show();
	$('.amount_hide_for_basic').val('');
	$('#error_position').html('');
	$('#error_amount').html('');
	$('#max_price_add').html('');
	$('#min_price_add').html('');
	if (this.value.length == 0){
	      return false;
	  }
	var select_value = (parseInt(this.value) + parseInt(1));
	var total_position_length = $('#position > option').length;
	
	if (this.value.length != 0 && this.value.length != ''){
		 $('.text-dangers').html('');
		 $.ajax({
			url: 'index.php?route=sellerprofile/sellerprofile/location_ad',
			type: 'post',
			dataType: 'json',
			data: $("#advertise_move_live").serialize(),
			success: function(json) {
				if (json['success']) {
					//alert(json['success']);
					if((json['success']).length === 0 && json['success'] == '') {
						$('#min_price_add').html('0');
						$('#max_price_add').html('500');
					} else {
						if(json['success'][0]) {
							//alert(json['success'][1]);
							$('#min_price_add').html('0');
							$('#max_price_add').html(json['success'][0]);
						}
						if(json['success'][0] && json['success'][1]) {							
							$('#max_price_add').html(json['success'][0]);
							$('#min_price_add').html(json['success'][1]);
						}												
					}
				}
				if(json['advertise_location']) {
					$('#error_loc').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['advertise_location']);
				}
				if(json['from_date']) {
					$('#error_from_date').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['from_date']);
				}
				if(json['end_date']) {
					$('#error_end_date').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['end_date']);
				}				
				if(total_position_length == select_value) { 
					$('.amount_show_for_basic').html(json['success'][0]);					
					$('.amount_hide_for_basic').val(json['success'][0]);
					$('.amount_hide_for_basic').hide();
				}
			}
		});
	} else {
		return false;
	}
	
 });

 $('.advertise_live_details').click(function() {
   //alert('called');
    // we want to copy the 'id' from the button to the modal
    var href = $(this).data('target');
    var id = $(this).data('id');

    // since the value of href is what we want, so I just did it like so
    //alert(href);
    // used it as the selector for the modal
   // alert(id);
    $(href).data('id', id);
    $('#advetise_sp').val(id);
});

$('#savebutton').click(function() {
    // now we grab it from the modal
    var id = $('#myModal').data('id');
     //var id=document.getElementById('myModal').getAttribute("data-id");
});	 
</script>

