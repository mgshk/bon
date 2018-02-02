<?php

    if(isset($LatitudesLongitude) && (count($LatitudesLongitude) > 0)) {
     	$latitude = $LatitudesLongitude['lat'];
     	$longitude = $LatitudesLongitude['lng'];
    } else {
     	$latitude = '13.067439';
     	$longitude = '80.237617';
    }

	$data = file_get_contents("https://maps.google.com/maps/api/geocode/json?key=AIzaSyCXvDvmhFTLZ5iJyGSQm3-3GEJg0G3iztk&latlng=".trim($latitude).",".trim($longitude)."&sensor=false");
	$data = json_decode($data);
	$add_array  = $data->results;
	$add_array = $add_array[0];
	$add_array = $add_array->address_components;
	$country = $state = $city = $local = "";

	foreach ($add_array as $key) {
	  if($key->types[0] == 'political') {
		if($key->types[2] == 'sublocality_level_1') {
		    $local = $key->long_name; }
	  }

	  if($key->types[0] == 'administrative_area_level_2') {
	    if(strlen($key->long_name) > 10) {
		$city = substr($key->long_name,0,10)."...";
	    } else {
        	$city = $key->long_name;
	    }
	  }

	  if($key->types[0] == 'administrative_area_level_1') {
	    if(strlen($key->long_name) > 10) {
		$state = substr($key->long_name,0,10)."...";
	    } else {
        	$state = $key->long_name;
	    }
	  }

	  if($key->types[0] == 'country') {
	    if(strlen($key->long_name) > 10) {
		$country = substr($key->long_name,0,10)."...";
	    } else {
        	$country = $key->long_name;
	    }
	  }
	}	
 ?>
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
					<a class="info" data-toggle="modal" data-target="#myModalad_approved_<?php echo $advetise['advertise_id']; ?>" ><i class="fa fa-arrows-alt"></i></a>
					<a class="info advertise_live_details" data-target='#myModal_adv' data-toggle='modal' data-id="<?php echo $advetise['advertise_id']; ?>"><i class="fa fa-play"></i></a>
					<a class="info" id="ads_delete_approved<?php echo $advetise['advertise_id']; ?>"><i class="fa fa-trash-o"></i></a>
                </div>
              </div>
           </div>
        </div>
    	<div class="col-sm-3"></div>
     <?php } } else { echo $text_no_results; } ?>
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
		   <h4><?php echo $advetise['offer_title']; ?></h4>
		   <img src="image/<?php echo $advetise['offer_image_original']; ?>" alt="<?php echo $advetise['offer_title']; ?>" class="img-thumbnail img-responsive" />
		   <p><?php echo $advetise['offer_desc']; ?></p>
		   <p><a href="<?php echo $advetise['offer_link']; ?>"><?php echo $advetise['offer_link']; ?></a></p>
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
				var modal = $('<div id="myModal_<?php echo $advetise['advertise_id']; ?>" class="modal alert_prof_del_close_can fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h3 id="myModalLabel3">Confirmation</h3></div><div class="modal-body"><p>Are you sure you want to move this to trash..</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><button class="btn-primary btn cancels">Yes</button></div></div></div></div>');			

				$('body').append(modal);
				modal.modal({
					show: true
				});

				$('.cancels').on('click', function(e) {
					var adss = <?php echo $advetise['advertise_id']; ?>;
					if(adss) {
						$.ajax({
						url: 'index.php?route=sellerprofile/sellerprofile/trash&func=approved&advertise_id='+adss,
						type: 'post',
						dataType: 'json',
						success: function(json) {
							if (json['success']) {
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

	<div class="modal fade" id="myModal_adv" role="dialog" data-backdrop="static" data-keyboard="false">
	 <div class="modal-dialog">
		<div class="modal-content loc-pop">
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
								<!-- <input type="hidden" id="banner_amnts" name="banner_amnts" value="<?php echo json_decode($basic_position_amount); ?>" /> -->
							    <input id="advetise_sp" name="advetise_sp" type="hidden" value="<?php echo $advetise['advertise_id']; ?>">
							    <input id="national" name="national" type="hidden" value="<?php echo strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', trim($country)))); ?>">
							    <input id="state" name="state" type="hidden" value="<?php echo strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', trim($state)))); ?>">
							    <input id="city" name="city" type="hidden" value="<?php echo strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', trim($city)))); ?>">
							   
							    <input type="radio" name="loc" id="home_top" data-advertise-id="<?php echo $advetise['advertise_id']; ?>" data-advertise-name="top_banner" data-cash-back="<?php echo $basic_price_cashback['top_banner']; ?>" value="1"/><label for="home_top">Home - Top banner</label><br/>

							    <input type="radio" <?php if($country =='') { echo "disabled"; }?> name="loc" id="home_national" data-advertise-name="home_national" data-cash-back="<?php echo $basic_price_cashback['home_national']; ?>" value="2"/><label for="home_national">Home - Country (<?php if($country !='') { echo $country; } else { echo "Cannot get country name from your store geo code.";}?>)</label><br/>

							    <input type="radio" <?php if($state =='') { echo "disabled"; }?> name="loc" id="home_state" data-advertise-name="home_state" data-cash-back="<?php echo $basic_price_cashback['home_state']; ?>" value="3"/><label for="home_state">Home - State (<?php if($state !='') { echo $state; } else { echo "Cannot get state name from your store geo code.";}?>)</label><br/>

							    <input type="radio" <?php if($city =='') { echo "disabled"; }?> name="loc" id="home_city" data-advertise-name="home_city" data-cash-back="<?php echo $basic_price_cashback['home_city']; ?>" value="4"/><label for="home_city">Home - City (<?php if($city !='') { if(($city =='Yanam') || ($city =='yanam')) { echo 'Pondicherry'; } else { echo $city; } } else { echo "Cannot get city name from your store geo code.";}?>)</label><br/>

							    <input type="radio" name="loc" id="home_local" data-advertise-name="home_local" data-cash-back="<?php echo $basic_price_cashback['home_local']; ?>" value="5"/><label for="home_local">Home - Nearby</label><br/>

							    <input type="radio" name="loc" id="store_ad" data-advertise-name="store_ad" data-cash-back="0" value="6"/><label for="store_ad">In your Page - Free</label><br/>
							</div>
							<div class="rigth--stat">
								<p id="show_basic_price" style="font-size: 16px;color: #FD6A00" class="set--trp"><strong>Basic price: <span id="basic_price"></span> Rs</strong></p>
								<p style="font-size: 12px">Advertisements posted with basic price are sorted random. You can also post your advertisement on the position you prefer after paying the price or above already been considered for the same position by another advertiser.</p>
							</div>
				   		</div>
					
				   		<div class="row main-sec--res">
				   			<div class="row.neet--ress-tep">
							   <img id = "img_goes_here" src="image/goes here - nearby.png" class="img_border_live img-responsive" alt=""> 
							</div>
							<script>
								$(document).ready(function(){
									$('#advertise_move_live  input[name=loc]').on('change', function() {
										var imageSrc = "goes here - nearby";
										if($('input[name=loc]:checked', '#advertise_move_live ')[0].id == "home_top")
										   imageSrc = "goes_here_top_banner";
										else if($('input[name=loc]:checked', '#advertise_move_live ')[0].id == "home_national")
										   imageSrc = "goes_here_country";
										else if($('input[name=loc]:checked', '#advertise_move_live ')[0].id == "home_state")
										   imageSrc = "goes_here_state";
										else if($('input[name=loc]:checked', '#advertise_move_live ')[0].id == "home_city")
										   imageSrc = "goes_here_city";
										else if($('input[name=loc]:checked', '#advertise_move_live ')[0].id == "home_local")
										   imageSrc = "goes here - nearby";
										else if($('input[name=loc]:checked', '#advertise_move_live ')[0].id == "store_ad")
										   imageSrc = "goes_here_in_your_page";

										$('#img_goes_here').attr('src',"image/" + imageSrc + ".png");
									});
								});
							</script>
							<div id="home_top_hide">
							   <label>From </label><input type="text" readonly class="form-control" name="from_date" id='datetimepicker_start_<?php echo $advetise['advertise_id']; ?>'/>
							   <label>To </label><input type="text" readonly class="form-control check_span" name="end_date" id='datetimepicker_end_<?php echo $advetise['advertise_id']; ?>'/>
							</div>
						    <span class="position_amount_visible">
							    <span class="position_local_visible">
								    <label>Area Covered in Km</label>
								    <select class="form-control area_km" name="km" id="km">							
									<option value=""> --Select-- </option>
										<?php for($i=1; $i<=20; $i++) { ?>
											<option <?php if ($i == 3) { echo 'selected'; } ?> value="<?php echo $i; ?>" ><?php echo $i; ?></option>
										<?php } ?>
								    </select>
							    </span>
							    <label>Position</label>
								<select class="form-control check_amount" name="position" id="position">							
									<option> ---- </option>				
								</select>
								<input type="hidden" name="selectedPosition" id="selectedPosition"/>
							    <div id="validation_txt" style="display:none">
								    <label>Price :&nbsp;&nbsp;&nbsp;&nbsp;</label><span class="text-green" id="price_vaidation_txt" style="font-size: 12px;font-style: italic"></span>
								    <input type="text" name="amount_val" id="amount_val" class="form-control" min="1" step="1" onkeypress="return event.charCode >= 48 && event.charCode <= 57"/>
								</div>
							    <input type="hidden" name="amount" id="actual_price"/>
						    </span>
						  
							<div id="home_top_show" style="display:none;">
								<div id="withAltField" class="box"></div>
								<label>Select date</label>
								<input id="hiddenaltField" name="top_banner_date" class="top_banner_dates form-control" type="hidden" />
								<div id="altField"></div>		 
								<div class="margin-ttep">
									Number of days selected : <span class="display_total_2" id="display_total">0</span>
								</div>
								<div class="margin-ttep" style="color: #6194f9">Total price: <span class="display_amount_1" id="display_amount"> </span></div>
							</div>

							<span id="display_amount_1" style="display:none;font-size: 14px;color: #6194f9"></span>
							<button class="advertise-btn_live" id="advertise-btn_lve" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Next&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
							<button class="advertise-btn" type="button" data-dismiss="modal" aria-hidden="true">&nbsp;&nbsp;&nbsp;Cancel&nbsp;&nbsp;&nbsp;</button>
							<button class="advertise-btn reset" type="button" style="display:none;">Reset</button>
							<div id="error_check" class="alert alert-danger" style="display:none;"></div>
	                  		<div id="liveSuccessMsg" class="alert alert-success" style="display:none;"></div>
						</div>
				    </form>
			    </div>
		    </div>
		    <div class="row">
			    <div class="col-sm-12 nt--bt--bar">
				    <div class="row" style="font-size: 12px">
					    <span class="top--res-nll"><strong>Note: </strong></span>
					    <table>
						<tr>
						    <td>1.&nbsp</td>
						    <td>BoN incurs basic price to avoid flooding the space with free advertisements in the larger (buyer) audience area.</td>
						</tr>
						<tr>
						    <td>2.&nbsp</td>
						    <td>If you delete the advertisement from 'Live' or 'Yet to go live' after you pay, the amount will not be refunded.</td>
						</tr>
						<tr>
						    <td>3.&nbsp</td>
						    <td>Introductory offer is valid till February 28, 2018.</td>
						</tr>
						<tr>
						    <td>4.&nbsp</td>
						    <td>Discount will be applicable only for the price more or equal to 2 rupees.</td>
						</tr>
						<tr>
						    <td>5.&nbsp</td>
						    <td>Please be sure image(s) are not being used in the advertisements before deleting from your directory. It is permanent and BoN cannot revert your action.</td>
						</tr>
						<tr>
						    <td>6.&nbsp</td>
						    <td>Please be aware that postion in Nearby tab for paid advertisement might change due to coverage area of other advertisements or if you change your store/entity location.</td>
						</tr>
						<tr>
						    <td>7.&nbsp</td>
						    <td>Buyer's, who added you as their favourites will be notified only for paid advertisement.</td>
						</tr>
					    </table>
				     </div>
			     </div>
		     </div>
		   </div>
		</div>
	 </div>
	</div>
<?php } ?>

<script type="text/javascript">
	var bannerBasicPrice = [];
//document.getElementById("advertise-btn_lve").bgcolor="#5ca0f9');
	function getBannerBasicPrice() {
		bannerBasicPrice = [];
		$.ajax({
			url: 'index.php?route=sellerprofile/sellerprofile/getStoreOfferBasicPrice',
			type: 'post',
			dataType: 'json',
			success: function(resp) {
				bannerBasicPrice['store_ad'] = 0;

				$.each(resp, function(key, val) { 
					bannerBasicPrice[key] = val; 
				});


				//$('#basic_price').text(bannerBasicPrice["home_local"]);

				var banner_name = "home_local";
				$('#basic_price').text(bannerBasicPrice[banner_name]);
				$('#amount_val').val(bannerBasicPrice[banner_name]);
				discount_txt(bannerBasicPrice[banner_name]);
			}
		});

		return false;
	}

	function getAdvertiseAmountList (loc) {
		var advertise_id = $('#advetise_sp').val();

		$.post('index.php?route=sellerprofile/sellerprofile/advertiseAmountList', { 
		  'loc' : loc, 
		  'from_date' : $('#datetimepicker_start_'+advertise_id).val(),
		  'km': $('select[name=km]').val()
		}, function(data) {
			$('#loader').html('');
			var sel = $("select#position");
			sel.empty();
			sel.append("<option value=''>-- Select --</option>");
			
			if(data.length == 0){
				sel.append('<option value="1" >1 : New</option>');
				sel.append('<option selected value="2">Basic price</option>');
			}

			for (var i=0; i<data.length; i++) {					
								
				var html_value = (parseInt(i) + parseInt(1))+ ' : ' + data[i].price + 'Rs - ' + data[i].nickname;
			    if(data.length != (parseInt(i) + parseInt(1))) {						
					sel.append('<option value="' + (parseInt(i) + parseInt(1)) + '" >' + html_value + '</option>');
			    } else {
					var basic_val = (parseInt(i) + parseInt(2))+ ' : New';
					sel.append('<option value="' + (parseInt(i) + parseInt(1)) + '" >' + html_value + '</option>');							
					sel.append("<option value='" + (parseInt(i) + parseInt(2)) + "' >" + basic_val + "</option>");
					sel.append("<option selected value='" + (parseInt(i) + parseInt(3)) + "' >Basic price</option>");
			    }
			}

			//$(".check_amount")[0].selectedIndex = $(".check_amount option").length - 1;

		 }, "json");

		return false;
	}

    $(document).ready(function () {

    	getBannerBasicPrice();

	    var today = new Date();
	    var dates_for_hide = '';
	    var advertise_id = $('#advetise_sp').val();
	    var json_result = '';
	    var min_price = 0;
	    var max_price = 0;

		$('#altField').multiDatesPicker({
			minDate: 0,
    		onSelect: function () {
    			var discount_txt = '';
    			var discount_price = 0;
    			var discount = $('input[name="loc"]:checked').data('cashBack');
    			var length = parseInt($('#altField').multiDatesPicker('getDates').length);

    			$('#hiddenaltField').val($('#altField').multiDatesPicker('getDates'));

    			$('#display_total').text(length);

    			var total_price = length * parseInt(bannerBasicPrice['top_banner']);

    			if (discount <=1) {
    				discount_txt = total_price;
    				discount_price = total_price;
    			} else {
    				discount_price = (discount / 100) * total_price;
    				discount_txt = '<span style="color: #ff0000"><del>'+total_price+' Rs</del></span> <span style="font-weight: bold">&nbsp;&nbsp'+ discount_price.toFixed(2) + ' Rs</span>&nbsp;&nbsp;&nbsp;(' +discount+'% discount)</br><span style="font-style: italic;color: #878787;font-size: 12px">(no. of days x basic price)</span>';
    			}

    			$('#display_amount').html(discount_txt);
    			$('#actual_price').val(discount_price);

    			if ($('#altField').multiDatesPicker('getDates').length > 0) {
    				$('.advertise-btn_live').attr('disabled', false);
				//$('.advertise-btn_live').attr('hidden', false);
				//$('.advertise-btn_live_dis').attr('hidden', true);
    			} else {
    				$('.advertise-btn_live').attr('disabled', true);
				//$('.advertise-btn_live').attr('hidden', true);
				//$('.advertise-btn_live_dis').attr('hidden', false);
    				$('#display_amount').empty();
    			}
    		}
    	});

		$('.reset').on('click', function() {
			//reset fields
			$('#display_amount_1').empty();
			//$('#amount_val').hide();
			$('.check_amount').removeAttr('selected');

			$(".check_amount")[0].selectedIndex = $(".check_amount option").length - 1;
			$('.advertise-btn_live').attr('disabled', false);
			//$('.advertise-btn_live').attr('hidden', false);
			//$('.advertise-btn_live_dis').attr('hidden', true);

			return false;
		});

        $('#home_local').trigger('click');

		$('input[name="loc"]').on('click', function() {
			
			var basic_amount_loc = '';
			var loc = $(this).val();
			var banner_name = $(this).data('advertiseName');

			//var dt1 = $('#datetimepicker_start_'+advertise_id);
			//var start_date = dt1.datepicker('getDate');
			
			$('#error_loc').html('');
			$('#basic_price').text(bannerBasicPrice[banner_name]);
			$('#amount_val').val(bannerBasicPrice[banner_name]);
			$('#show_basic_price').show();
			$('.position_local_visible').hide();
			$('.reset').trigger('click');

			$('.advertise-btn_live').attr('disabled', true);
			//$('.advertise-btn_live').attr('hidden', true);
			//$('.advertise-btn_live_dis').attr('hidden', false);

			if(loc == 1) {
				$('#home_top_hide').hide();
				$('#home_top_show').show();
			}

			if (loc != 5) { 
				$("select#km").val('');	
			}

			if (loc == 5) {
				$('.area_km').val('3');
				$('.position_local_visible').show();
			}

			if(loc == '6') {
				$('#home_top_hide').show();
				$('#home_top_show').hide();
			}

			if(loc == '2' || loc == '3' || loc == '4' || loc == '5') {
				$('#home_top_hide').show();
				$('#home_top_show').hide();
				
				$('#datetimepicker_start_'+advertise_id).datepicker('destroy');
				$('#datetimepicker_end_'+advertise_id).datepicker('destroy');
                //$('#datetimepicker_end_'+advertise_id).datepicker('option', 'minDate', 0);
				$("#datetimepicker_start_"+advertise_id).datepicker({
				    dateFormat: "yy-mm-dd",
				    minDate: 0,
				    onSelect: function (date) {
						var dt2 = $('#datetimepicker_end_'+advertise_id);
						var startDate = $(this).datepicker('getDate');
						var minDate = $(this).datepicker('getDate');

						startDate.setDate(startDate.getDate() + 30);
						dt2.datepicker('option', 'maxDate', startDate);
						dt2.datepicker('option', 'minDate', minDate);

						var endDate = $(this).datepicker('getDate');
						endDate.setDate(startDate.getDate() + 5);
						dt2.datepicker('setDate', endDate);
				    }
				});

				$('#datetimepicker_start_'+advertise_id).datepicker('setDate', 'today');

				$('#datetimepicker_end_'+advertise_id).datepicker({ 
					dateFormat: "yy-mm-dd", 
					minDate: 0,
					maxDate: "+30d"
				});

				$('#datetimepicker_end_'+advertise_id).datepicker('setDate', '+5');
				$('.position_amount_visible').show();			
				
			} else {
				$('#datetimepicker_start_'+advertise_id).datepicker('destroy');
				$('#datetimepicker_end_'+advertise_id).datepicker('destroy');
                //$('#datetimepicker_end_'+advertise_id).datepicker('option', 'minDate', 0);
				$("#datetimepicker_start_"+advertise_id).datepicker({
				    dateFormat: "yy-mm-dd",
				    minDate: 0,
				    onSelect: function (date) {
						var dt2 = $('#datetimepicker_end_'+advertise_id);
						var startDate = $(this).datepicker('getDate');
						var minDate = $(this).datepicker('getDate');
						//dt2.datepicker('option', 'minDate', minDate);
						//$(this).datepicker('option', 'minDate', minDate);

						startDate.setDate(startDate.getDate() + 30);
						dt2.datepicker('option', 'maxDate', startDate);
						dt2.datepicker('option', 'minDate', minDate);

						var endDate = $(this).datepicker('getDate');
						endDate.setDate(startDate.getDate() + 5);
						dt2.datepicker('setDate', endDate);
				    }
				});

				$('#datetimepicker_start_'+advertise_id).datepicker('setDate', 'today');
					
				$('#datetimepicker_end_'+advertise_id).datepicker({ 
					dateFormat: "yy-mm-dd",
					minDate: 0,
					maxDate: "+30d"
				});

				$('#datetimepicker_end_'+advertise_id).datepicker('setDate', '+5');

				$('.position_amount_visible').hide();	
			}

			getAdvertiseAmountList(loc);
			$('.check_amount').trigger('change');
		});

    	$("#datetimepicker_start_"+advertise_id).datepicker({
		    dateFormat: "yy-mm-dd",
		    minDate: 0,
		    onSelect: function (date) {
				var dt2 = $('#datetimepicker_end_'+advertise_id);
				var startDate = $(this).datepicker('getDate');
				var minDate = $(this).datepicker('getDate');

				startDate.setDate(startDate.getDate() + 30);
				dt2.datepicker('option', 'maxDate', startDate);
				dt2.datepicker('option', 'minDate', minDate);

				var endDate = $(this).datepicker('getDate');
				endDate.setDate(startDate.getDate() + 5);
				dt2.datepicker('setDate', endDate);
		    }
		});

		$('#datetimepicker_start_'+advertise_id).datepicker('setDate', 'today');
			
		$('#datetimepicker_end_'+advertise_id).datepicker({ 
			dateFormat: "yy-mm-dd",
			minDate: 0,
			maxDate: "+30d"
		});

		$('#datetimepicker_end_'+advertise_id).datepicker('setDate', '+5');

		$('.area_km').on('change',function() {

			var loc = $('input:radio[name=loc]:checked').val(),
			from_date = $('#datetimepicker_start_'+advertise_id ).val(),
			km = $('select[name=km]').val();

			$.post('index.php?route=sellerprofile/sellerprofile/advertiseAmountList', {
			  'loc' : loc, 
			  'from_date' : from_date, 
			  'km': km 
			}, function(data) {
				$('#loader').html('');

				var sel = $("select#position");
				sel.empty();
				sel.append("<option value=''>-- Select --</option>");
				
				if(data.length == 0){
					sel.append('<option value="1" >1 : New</option>');
					sel.append('<option selected value="2">Basic price</option>');
				}

				for (var i = 0; i < data.length; i++) {						
					var html_value = (parseInt(i) + parseInt(1))+ ' : ' + data[i].price + 'Rs - ' + data[i].nickname;

				    if (data.length != (parseInt(i) + parseInt(1))) {					
						sel.append('<option value="' + (parseInt(i) + parseInt(1)) + '" >' + html_value + '</option>');
				    } else {
						var basic_val = (parseInt(i) + parseInt(2))+ ': New';
						sel.append('<option value="' + (parseInt(i) + parseInt(1)) + '" >' + html_value + '</option>');							
						sel.append("<option value='" + (parseInt(i) + parseInt(2)) + "' >" + basic_val + "</option>");
						sel.append("<option selected value='" + (parseInt(i) + parseInt(3)) + "' >Basic price</option>");
				   }
				}
				$("#selectedPosition").val($("#position option:selected").text());
			 }, "json");	
		});

		$('.area_km').trigger('change');

		setTimeout(function() {
			var banner_name = $('input[name="loc"]:checked').data('advertiseName');
			$('#basic_price').text(bannerBasicPrice[banner_name]);
			$('#amount_val').val(bannerBasicPrice[banner_name]);
			discount_txt(bannerBasicPrice[banner_name]);
		}, 1000);

		$('.check_amount').on('change', function() {
			$('#display_amount_1').hide();
            $("#selectedPosition").val($("#position option:selected").text());
			if (this.value.length === 0)
			    return;

			var select_value = (parseInt(this.value) + parseInt(1));
			var total_position_length = $('#position > option').length;
			var banner_name = $('input[name="loc"]:checked').data('advertiseName');
    		var level = $(this).find(':selected').text();
    		var price = level.split(':');

    		if (level == 'Basic price' && $('input:radio[name=loc]:checked').val() !== '1') {
    			$('.advertise-btn_live').attr('disabled', false);
				//$('.advertise-btn_live').attr('hidden', false);
				//$('.advertise-btn_live_dis').attr('hidden', true);
    		} else {
    			$('.advertise-btn_live').attr('disabled', true);
				//$('.advertise-btn_live').attr('hidden', true);
				//$('.advertise-btn_live_dis').attr('hidden', false);
    		}

    		$.ajax({
				url: 'index.php?route=sellerprofile/sellerprofile/advertiseAmountList',
				type: 'post',
				dataType: 'json',
				data: {
					loc: $('input:radio[name=loc]:checked').val(),
					from_date: $('#datetimepicker_start_'+advertise_id).val(),
					km: $('select[name=km]').val()
				},
				success: function(json) {
					json_result = json;

					if (level !== 'Basic price') {
						$('#validation_txt').show();
						$('#amount_val').val('');

						if (price[1] && price[1].replace(/\s/g, '') === 'New') {
			    			min_price = bannerBasicPrice[banner_name];

			    			if (price[0].replace(/\s/g, '') === '1') {
			    				$('#price_vaidation_txt').text('(Should be Greater than '+min_price+ ' Rs)');
			    			} else {
			    				var selected_length = $('#position > option:checked').val();
			    				max_price = json_result[parseInt(selected_length) - 2].price;

			    				$('#price_vaidation_txt').text('(Should be between '+min_price+ 'Rs and ' + max_price + 'Rs)');
			    			}

			    		} else if ($('.check_amount').find(':selected').val() === '1') {
			    			min_price = json_result[0].price;
			    			$('#price_vaidation_txt').text('(Should be Greater than '+min_price+ ' Rs)');
			    		} else {
			    			var selected_length = $('#position > option:checked').val();
							//alert(JSON.stringify(price));
			    			min_price = price[1].replace(/\s/g, '');
		    				max_price = json_result[selected_length - 2].price;

		    				$('#price_vaidation_txt').text('(Should be between '+min_price.split('-')[0]+ ' and ' + max_price + 'Rs)');
			    		}
					} else {
						$('#validation_txt').hide();
						discount_txt(bannerBasicPrice[banner_name]);
						// var discount = $('input[name="loc"]:checked').data('cashBack');
						// if (discount == 0) {
						// 	$('#actual_price').val(bannerBasicPrice[banner_name]);
						// } else {
						// 	var discount_price = (discount / 100) * parseInt(bannerBasicPrice[banner_name]);
						// 	$('#actual_price').val(discount_price);
						// }
					}
				}
			});

			return false;	
		});		

		$(document).on('keyup', '#amount_val', function() {
    		var level = $('#position').find(":selected").text();
    		var price = level.split(':');
    		var amount = $(this).val();
    		var banner_name = $('input[name="loc"]:checked').data('advertiseName');
    		var showPriceText = false;

    		if (price[1] && price[1].replace(/\s/g, '') === 'New') {

    			if (price[0].replace(/\s/g, '') === '1') {
    				if (parseInt(amount) > parseInt(bannerBasicPrice[banner_name])) {
    					$('.advertise-btn_live').attr('disabled', false);
					//$('.advertise-btn_live').attr('hidden', false);
					//$('.advertise-btn_live_dis').attr('hidden', true);
    					showPriceText = true;
    				} else {
    					$('.advertise-btn_live').attr('disabled', true);
					//$('.advertise-btn_live').attr('hidden', true);
					//$('.advertise-btn_live_dis').attr('hidden', false);
    					showPriceText = false;
    				}
    				
    			} else {
    				if (parseInt(amount) > parseInt(bannerBasicPrice[banner_name]) && parseInt(amount) < parseInt(max_price)) {
    					$('.advertise-btn_live').attr('disabled', false);
					//$('.advertise-btn_live').attr('hidden', false);
					//$('.advertise-btn_live_dis').attr('hidden', true);
    					showPriceText = true;
    				} else {
    					$('.advertise-btn_live').attr('disabled', true);
					//$('.advertise-btn_live').attr('hidden', true);
					//$('.advertise-btn_live_dis').attr('hidden', false);
    					showPriceText = false;
    				}
    			}

    		} else if ($('.check_amount').find(':selected').val() === '1') {
    			if (parseInt(amount) > parseInt(min_price)) {
					$('.advertise-btn_live').attr('disabled', false);
					//$('.advertise-btn_live').attr('hidden', false);
					//$('.advertise-btn_live_dis').attr('hidden', true);
					showPriceText = true;
				} else {
					$('.advertise-btn_live').attr('disabled', true);
					//$('.advertise-btn_live').attr('hidden', true);
					//$('.advertise-btn_live_dis').attr('hidden', false);
					showPriceText = false;
				}
    		} else {
    			if (parseInt(amount) > parseInt(min_price) && parseInt(amount) < parseInt(max_price)) {
					$('.advertise-btn_live').attr('disabled', false);
					//$('.advertise-btn_live').attr('hidden', false);
					//$('.advertise-btn_live_dis').attr('hidden', true);
					showPriceText = true;
				} else {
					$('.advertise-btn_live').attr('disabled', true);
					//$('.advertise-btn_live').attr('hidden', true);
					//$('.advertise-btn_live_dis').attr('hidden', false);
					showPriceText = false;
				}
    		}

    		if (showPriceText) {
    			discount_txt(amount);
    		} else {
    			$('#display_amount_1').empty().hide();
    		}
    	});
    });

	var modetrue = false;
	var delete_val = '0';

	function discount_txt (amount) {
		if ($('input[name="loc"]:checked').val() === '1')
			return;

		var discount = $('input[name="loc"]:checked').data('cashBack');;
		var discount_price = 0;
		var discount_txt = '';
		if(!amount) amount = 0;
		if (amount == 0 ) {
			discount_txt = '</br><span style="font-weight: bold">OFFER PRICE:</span> FREE</br>';
		} else {
			if(parseInt(amount) <= 1) 
				discount = 0;

			if (discount === 0) {
				discount_price = parseInt(amount);
				discount_txt = '</br>Pay <span style="font-weight: bold"> &nbsp;&nbsp;'+ amount.toFixed(2) + ' Rs</span></br>';
			} else {	    
				discount_price = parseInt(amount) - (discount / 100) * parseInt(amount);
				discount_txt = '</br><span style="font-weight: bold">OFFER PRICE:</span> Pay only <span style="color: #ff0000"><del>'+amount+' Rs</del></span> <span style="font-weight: bold"> &nbsp;&nbsp;'+ discount_price.toFixed(2) + ' Rs</span>&nbsp;&nbsp;&nbsp;(' +discount+'% discount)</br>';
			}
		}

		if ($('input[name="loc"]:checked').val() === '5')
		{
		discount_txt = discount_txt + '<span style="color: #ff0000;font-size: 12px;">Please be aware that postion in Nearby tab for paid advertisement might change due to coverage area of other advertisements or if you change your store/entity location.</span></br>';
		}
	
		$('#display_amount_1').html(discount_txt).show();
		$('#actual_price').val(discount_price);

		// if (discount === 0) {
		// 	//discount_txt = amount+' Rs (' +discount+'% discount)';
		// 	//discount_price = amount;
		// 	//discount_txt = amount + ' Rs';
		// 	discount_price = amount;

		// 	if (amount === 0) {
		// 		discount_txt = '</br><span style="font-weight: bold">OFFER PRICE:</span> FREE</br>';
		// 	}
		// 	else {
		// 		discount_txt = '</br><span style="font-weight: bold">OFFER PRICE:</span> Pay only <span style="color: #ff0000"><del>'+amount+' Rs</del></span> <span style="font-weight: bold"> &nbsp;&nbsp;'+ discount_price.toFixed(2) + ' Rs</span>&nbsp;&nbsp;&nbsp;(' +discount+'% discount)</br>';
		// 	}		
		// } else {
	    
		// 	discount_price = (discount / 100) * parseInt(amount);
		// 	discount_txt = '</br><span style="font-weight: bold">OFFER PRICE:</span> Pay only <span style="color: #ff0000"><del>'+amount+' Rs</del></span> <span style="font-weight: bold"> &nbsp;&nbsp;'+ discount_price.toFixed(2) + ' Rs</span>&nbsp;&nbsp;&nbsp;(' +discount+'% discount)</br>';
		// }
	}
	$('#myModal_adv').on('hidden.bs.modal', function () {
		$('#advertise_move_live')[0].reset();
		$('#home_local').click();	
		$('#validation_txt').hide();
	})
    
	$('.advertise-btn_live').on('click', function(e) {
		$('#error_amount').html('');

		$.ajax({
			url: 'index.php?route=sellerprofile/sellerprofile/move_live',
			type: 'post',
			dataType: 'json',
			data: $("#advertise_move_live").serialize(),
			success: function(json) {
				if (json['success']) {
					var loc = $('input[name="loc"]:checked').val();
					var amount = json['amount'];

					if (loc === '6' || amount == '0') {
						$('#liveSuccessMsg').html('<i class="fa fa-check-circle"></i> '+ json['success']).show();
					
						setTimeout(function() {
							$('#liveSuccessMsg').empty().hide();
							$('#myModal_adv').modal('hide');
							$('#sellerapproved').load('index.php?route=sellerprofile/sellerprofile/selleradvertiseapproved&seller_id=<?php echo $seller_id; ?>');

							$('#sellerapprovedcount').html(json['approved_count']);
							$('#sellerlivecount').html(json['live_count']);
						}, 3000);
					} else {
						$('#myModal_adv').append(json['confirmForm']);
						$('#payu_form').submit();
					}
				} else {
					$('#error_check').html('<i class="fa fa-exclamation-circle"></i> '+ json['error']).show();
					setTimeout(function() {
						$('#error_check').empty().hide();
					}, 5000);
				}

				// if(json['free_check'] == 1) {
				// 	if(loc == '5') {
				// 		if(modetrue == false) {
				// 			e.preventDefault();

				// 			var modal = $('<div id="myModalfree" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h3 id="myModalLabel3">Confirmation</h3></div><div class="modal-body"><p>Only one free Ad is allowed in "Home - Local" tab.</p><p>Do you want to removed old and post this Ad?</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><button class="btn-primary btn" id="SubForm">Yes</button></div></div></div></div>');			
							
				// 			$('body').append(modal);
				// 				modal.modal({
				// 				show: true
				// 			})
						
				// 			.one('click', '#SubForm', function (e) {
				// 				modetrue = true;
				// 				delete_val = 1;
				// 				$('#myModalfree').modal('hide');					
				// 				$('.advertise-btn_live').click();
				// 			})
				// 		}
				// 	} 
				// }

				// if(json['advertise_location']) {
				// 	$('#error_loc').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['advertise_location']).show();
				// }

				// if(json['from_date']) {
				// 	$('#error_from_date').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['from_date']).show();
				// }

				// if(json['end_date']) {
				// 	$('#error_end_date').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['end_date']).show();
				// }

				// if(json['amount']) {
				// 	$('#error_amount').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['amount']).show();
				// }

				// if(json['position']) {
				// 	$('#error_position').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['position']).show();
				// }

				// if(loc == '1') { 
				// 	if(json['top_banner_date']) {
				// 		$('#error_top_banner_date').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['top_banner_date']).show();
				// 	} 
				// }
			}
		});

		return false
	});

	$('.advertise_live_details').on('click', function() {
	    var href = $(this).data('target');
	    var id = $(this).data('id');

	    $(href).data('id', id);
	    $('#advetise_sp').val(id);
	});

	// $('#savebutton').click(function() {
	//     // now we grab it from the modal
	//     var id = $('#myModal').data('id');
	//      //var id=document.getElementById('myModal').getAttribute("data-id");
	// });	
</script>
