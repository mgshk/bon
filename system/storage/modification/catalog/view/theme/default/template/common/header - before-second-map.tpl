

<!doctype html>
<html lang="en">
   <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title><?php echo $title; ?></title>
      <base href="<?php echo $base; ?>" />
      <?php if ($description) { ?>
      <meta name="description" content="<?php echo $description; ?>" />
      <?php } ?>
      <?php if ($keywords) { ?>
      <meta name="keywords" content= "<?php echo $keywords; ?>" />
      <?php } ?>
      <base href="http://localhost/projects/2.3.0.2-compiled"/>
      <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/jquery/jquery-ui.js"></script>
      <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
      <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
      <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
      <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
      <!--Mega Menu-->
      <link rel="stylesheet" href="catalog/view/javascript/mega-menu/reset.css">
      <!-- CSS reset -->
      <link rel="stylesheet" href="catalog/view/javascript/mega-menu/style.css">
      <!-- Resource style -->
      <script src="catalog/view/javascript/mega-menu/modernizr.js"></script> <!-- Modernizr -->
      <script src="catalog/view/javascript/mega-menu/jquery.menu-aim.js"></script> <!-- menu aim -->
      <script src="catalog/view/javascript/mega-menu/main.js"></script>
      <!--End Mega Menu-->

      <!-- -->
      <link href="catalog/view/javascript/chosen/chosen.css" rel="stylesheet" media="screen" />
      <script src="catalog/view/javascript/chosen/chosen.jquery.js" type="text/javascript"></script>

      <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
      <link rel="stylesheet" href="catalog/view/javascript/custom.css">
      <?php foreach ($styles as $style) { ?>
      <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
      <?php } ?>
      <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
      <?php foreach ($links as $link) { ?>
      <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
      <?php } ?>
      <?php foreach ($scripts as $script) { ?>
      <script src="<?php echo $script; ?>" type="text/javascript"></script>
      <?php } ?>
      <?php foreach ($analytics as $analytic) { ?>
      <?php echo $analytic; ?>
      <?php } ?>
     <script>
     var $start_km = "<?php echo (!isset($_COOKIE['myCookiestart'])) ? '': $_COOKIE['myCookiestart']; ?>";
	var $end_km = "<?php echo (!isset($_COOKIE['myCookieend'])) ? '': $_COOKIE['myCookieend']; ?>";
         $( function() {
          $( "#slider-range" ).slider({
             range: true,
             min: 0,
             max: 20,
             values: [ 0, 3 ],
             slide: function( event, ui ) {
		$.cookie('myCookiestart', ui.values[ 0 ]);
	       $.cookie('myCookieend', ui.values[ 1 ]);
               $( "#amount" ).val( $.cookie('myCookiestart'));
	       $( "#amount1" ).val( $.cookie('myCookieend'));
	       
	       //var kms = (ui.values[ 0 ], ui.values[ 1 ]);
	       //alert($("#store_list_auto").html());
		   //store_auto();

		   //$('#store_list_auto').load('index.php?route=seller/seller&path=2&search=&by_search=1;');
	       	       	       
             }
           });
	   //alert('The value of myCookie is now "'+ $.cookie('myCookiestart')+ $.cookie('myCookieend')+ '". Now, reload the page, PHP should read it correctly.');
	   if(($start_km != '') && ($end_km != '')){
		   if($.cookie('myCookiestart') !=''  && $.cookie('myCookiestart') !=''){
		   //alert("nte");			  

			  $( "#amount" ).val($.cookie('myCookiestart'));
			   $( "#amount1" ).val($.cookie('myCookieend'));

			       var left1 = ($.cookie('myCookiestart') * 5);
			       var left2 = ($.cookie('myCookieend') * 5);
			       var differece = ((parseInt($.cookie('myCookieend')) - parseInt($.cookie('myCookiestart'))) * 5);
			       $('#slider-range span:first').css('left', left1+'%');
			       $('#slider-range span:last').css('left', left2+'%');

			       $('.ui-slider-range').css('left', left1+'%');
			       $('.ui-slider-range').css('width', differece+'%');
			   }
		  
	   } else {//alert("tt");
		//alert('The value of myCookie is now "'+ $.cookie('myCookiestart')+ $.cookie('myCookieend')+ '". Now, reload the page, PHP should read it correctly.');
	          $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ));
		   $( "#amount1" ).val( $( "#slider-range" ).slider( "values", 1 ));
		   
	   }
         
         /*var valMap = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
           $("#slider-range").slider({
               min: 1,
               max: valMap.length - 1,
               value: 0,
               slide: function(event, ui) {                        
                   $("#amount").val(valMap[ui.value]);
               }       
           });
         $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ));*/
         } );


	$(document).ready(function() {
		var qs = (function(a) {
	    if (a == "") return {};
	    var b = {};
	    for (var i = 0; i < a.length; ++i)
	    {
		var p=a[i].split('=', 2);
		if (p.length == 1)
		    b[p[0]] = "";
		else
		    b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
	    }
	    return b;
	})(window.location.search.substr(1).split('&'));

		$("#kms_set").click(function(){//alert("test");
		var ttt = qs["route"];
		//alert(ttt);
		
		if((ttt == 'common/home') || (ttt == 'undefined')) {
			//alert("home");
			location.reload();
		} else if(ttt == 'seller/seller') {
			//alert("seller");
			location.reload();
		}
		
	});
	});
	
     </script>

      
   </head>
   <body class="<?php echo $class; ?>">
      <!--<nav id="top">
         <div class="container-fluid">
         	<?php //echo $currency; ?>
         	<?php //echo $language; ?>
         	<div id="top-links" class="nav pull-right">
         		<ul class="list-inline">
         		<?php if ($logged) { ?>
         			<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
         		<?php } else { ?>
         			<li><a style="cursor:pointer" data-toggle="modal" data-target="#_log-bon"><i class="fa fa-adn"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_login; ?></span></a></li>
         		<?php } ?>
         			<li><a style="cursor:pointer" data-toggle="modal" data-target="#ad-model"><i class="fa fa-adn"></i> <span class="hidden-xs hidden-sm hidden-md">Advertise</span></a></li>
         			<li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php //echo $telephone; ?></span></li>
         			<?php if ($logged && $isseller) { ?>
         			<li class="dropdown">
         				<a href="<?php echo $seller_profile; ?>" title="<?php echo $text_seller_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-users"></i> <span class="hidden-xs hidden-sm hidden-md" style="
         					color: red;
         					"><?php echo $text_seller_account; ?></span> <span class="caret"></span></a>
         				<ul class="dropdown-menu dropdown-menu-right" style="background-color: wheat;">
         					<li><a href="<?php echo $seller_profile; ?>"><?php echo $text_seller_account; ?></a></li>
         					<li><a href="<?php echo $seller_order; ?>"><?php echo $text_seller_order; ?></a></li>
         					<li><a href="<?php echo $seller_product; ?>"><?php echo $text_seller_product; ?></a></li>
         				</ul>
         			</li>
         			<?php } ?>
         			<li class="dropdown">
         				<a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
         				<ul class="dropdown-menu dropdown-menu-right">
         					<?php if ($logged) { ?>
         					<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
         					<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
         					<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
         					<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
         					<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
         					<?php } else { ?>
         					<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
         					<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
         					<?php } ?>
         				</ul>
         			</li>
         			<li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
         			<li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
         			<li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
         		</ul>
         	</div>
         </div>
         </nav>-->
      <div class="container-fluid">
         <div class="row top-header-new">
            <div class="col-sm-2 fis-des">
               <div id="logo">
                  <?php if ($logo) { ?>
                  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                  <?php } else { ?>
                  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                  <?php } ?>
               </div>
            </div>
            <div class="col-sm-10">
               <div class="row fis-des">
                  <div class="col-sm-1"></div>
                  <div class="col-sm-3">
                     <div class="free-list-top--bon">Free Listing</div>
                  </div>
                  <div class="col-sm-8">
                     <div id="top-links" class="nav pull-right">
                        <ul class="list-inline">
                           <li><a style="cursor:pointer" data-toggle="modal" data-target="#ad-model">Advertise |</a></li>
                           <?php if ($logged) { ?>
                           <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?> |</a></li>
                           <?php } else { ?>
                           <li><a style="cursor:pointer" data-toggle="modal" data-target="#_log-bon"><?php echo $text_login; ?> |</a></li>
                           <!--<li><a style="cursor:pointer" data-toggle="modal" data-target="#_log-bon">Sign Up |</a></li>-->
                           <?php } ?>						
                           <?php if ($logged && $isseller) { ?>
                           <li class="dropdown">
                              <a href="<?php echo $seller_profile; ?>" title="<?php echo $text_seller_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php //echo $text_seller_account; ?>Hi, <?php if (strlen($seller_info['firstname']) > 9){ echo substr($seller_info['firstname'], 0, 7) . '...';} else { echo $seller_info['firstname'];} ?> <span class="caret"></span> |</a>
                              <ul class="dropdown-menu dropdown-menu-right" style="background-color: wheat;">
                                 <li><a href="<?php echo $seller_profile; ?>"><?php echo $text_seller_account; ?></a></li>
                                 <li><a href="<?php echo $seller_order; ?>"><?php echo $text_seller_order; ?></a></li>
                                 <li><a href="<?php echo $seller_product; ?>"><?php echo $text_seller_product; ?></a></li>
                                 <!--<li><a href="<?php echo $seller_bankaccount; ?>"><?php echo $text_seller_bankaccount; ?></a></li>
                                 <li><a href="<?php echo $seller_shipping; ?>"><?php echo $text_seller_shipping; ?></a></li>
                                 <li><a href="<?php echo $sellerdownload; ?>"><?php echo $text_sellerdownload; ?></a></li>-->
                              </ul>
                           </li>
                           <?php } ?>
                           <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?> |</a></li>
                           <li><a href="#" title="Contact Us">Contact Us |</a></li>
                           <li><a href="#" title="Feedback">Feedback |</a></li>
                           <li><a href="#" title="FAQ">FAQ |</a></li>
                           <li><a href="#" title="Help">Help</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="row sec-mob">
                  <div class="col-xs-4" style="margin-top: 10px;">
                     <div class="row">
                        <div id="logo">
                           <?php if ($logo) { ?>
                           <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                           <?php } else { ?>
                           <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                           <?php } ?>
                        </div>
                     </div>
                  </div>
                  <div class="col-xs-5" style="margin-top: 8px;">
                     <div class="free-list-top--bon">Free Listing</div>
                  </div>
                  <div class="col-xs-3">
                  </div>
                  <nav class="navbar navbar-inverse">
                     <div class="container-fluid">
                        <div class="navbar-header">
                           <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                           <span class="icon-bar"></span>
                           <span class="icon-bar"></span>
                           <span class="icon-bar"></span>                        
                           </button>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                           <ul class="mob-menu">
                              <li><a style="cursor:pointer" data-toggle="modal" data-target="#ad-model">Advertise</a></li>
                              <?php if ($logged) { ?>
                              <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                              <?php } else { ?>
                              <li><a style="cursor:pointer" data-toggle="modal" data-target="#_log-bon"><?php echo $text_login; ?></a></li>
                              <li><a style="cursor:pointer" data-toggle="modal" data-target="#_log-bon">Sign Up</a></li>
                              <?php } ?>						
                              <?php if ($logged && $isseller) { ?>
                              <li class="dropdown">
                                 <a href="<?php echo $seller_profile; ?>" title="<?php echo $text_seller_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $text_seller_account; ?> |<span class="caret"></span></a>
                                 <ul class="dropdown-menu dropdown-menu-right" style="background-color: wheat;">
                                    <li><a href="<?php echo $seller_profile; ?>"><?php echo $text_seller_account; ?></a></li>
                                    <li><a href="<?php echo $seller_order; ?>"><?php echo $text_seller_order; ?></a></li>
                                    <li><a href="<?php echo $seller_product; ?>"><?php echo $text_seller_product; ?></a></li>
                                    <li><a href="<?php echo $seller_bankaccount; ?>"><?php echo $text_seller_bankaccount; ?></a></li>
                                    <li><a href="<?php echo $seller_shipping; ?>"><?php echo $text_seller_shipping; ?></a></li>
                                    <li><a href="<?php echo $sellerdownload; ?>"><?php echo $text_sellerdownload; ?></a></li>
                                 </ul>
                              </li>
                              <?php } ?>
                              <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                              <li><a href="#" title="Contact Us">Contact Us</a></li>
                              <li><a href="#" title="Feedback">Feedback</a></li>
                              <li><a href="#" title="FAQ">FAQ</a></li>
                              <li><a href="#" title="Help">Help</a></li>
                           </ul>
                        </div>
                     </div>
                  </nav>
               </div>
               <div class="row">
	       <?php if((isset($_GET['route']) && ($_GET['route'] == 'common/home' || $_GET['route'] == 'seller/seller')) || !isset($_GET['route'])) { ?>
                  <div class="col-sm-6">
                     <div class="header-heading">
                        <div class="ui-icon-video" id="location-search">
                           <div class="new-text-top">
                              <input style="cursor: pointer;" type="button" data-toggle="modal" data-target="#map_mod" placeholder="Current Location" id="location-search-val">
                              <span class="top-current-loc"><a style="cursor: pointer;" type="button" data-toggle="modal" data-target="#map_mod"><i class="fa fa-map-marker"></i></a></span>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-sm-3 header-center-kms">
                     <form method="post" action="">
                        <div class="col-sm-1" style="display: none;"></div>
                        <div class="col-sm-9"></div>
                        <div class="col-sm-1"  style="display: none;"></div>
                        <div id="slider-range"></div>
                        <input type="text" name="amount" id="amount" value="" readonly>
			<input type="text" name="amount1" id="amount1" value="" readonly>
			
                     </form><button id="kms_set">set</button>
                     <?php //echo $cart; ?>
                  </div>
		  <?php } else { ?>
			<div class="col-sm-9"></div>
		  <?php } ?>
                  <div class="col-sm-3"><?php echo $cart; ?></div>
               </div>
            </div>
            <!--<div class="col-sm-5"><?php //echo $search; ?></div>
               <div class="col-sm-3"><?php //echo $cart; ?></div>-->
         </div>
      </div>
      <div class="col-sm-12">
	<div class="row">
		<div class="col-sm-6"></div>
		<div class="col-sm-3">
		<button style="cursor: pointer;" type="button" data-toggle="modal" data-target="#site_feedback">Feedback</button>
		</div>
		<div class="col-sm-3">
		<?php echo $store_favouries; ?>      
		</div>
	</div>
      </div>
      <div class="modal fade" id="site_feedback" role="dialog">
	 <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content loc-pop">
	       <div class="modal-header">
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
		  <h4 class="modal-title loc-share-title">Feedback</h4>
	       </div>
	       <div class="modal-body site-feedback-top">
			<div id="site_feed_alt"></div>
			<form action="" method="post" enctype="multipart/form-data" id="form_site_feedback" class="form-horizontal">
			<div class="form-group">
				<input type="number" name="fd_mobile_num" id="fd_mobile_num" value="" placeholder="Mobile Number" required>
			</div>
			<div class="form-group">
				<input type="text" name="fd_email" id="fd_email" value="" placeholder="Email ID" required>
			</div>
			<div class="form-group">
				<textarea type="text" name="feedback" id="fd_feedback" value="" placeholder="Your consecen/issue/feebdback is valuable to us. Will be addressed shortly."></textarea>
			</div>
				<button type="button" id="button_site_feedback">Submit</button>
			</form>
	       </div>
	    </div>
	 </div>
	</div>
	<script>
		$('#button_site_feedback').on('click', function() {
		 $.ajax({
			url: 'index.php?route=common/header/site_feedback',
			type: 'post',
			dataType: 'json',
			data: $("#form_site_feedback").serialize(),
			success: function(json) {
				if (json['success']) {
					$( '#form_site_feedback' ).each(function(){
					    this.reset();
					});
					$('#site_feed_alt').html('');
					$('#site_feed_alt').html(json['success']);
				}
				if(json['error']) {
					$('#site_feed_alt').html('');
					$('#site_feed_alt').html('<i class="fa fa-times" aria-hidden="true"></i>'+json['error']);
				}
			}
		 });
		 });
	</script>
      <p id="demo"></p>
      <script>
         function getLocation() {
         	//alert("test");
         	if (navigator.geolocation) {
         		navigator.geolocation.getCurrentPosition(showPosition);
         	
         	} else { 
         		x.innerHTML = "Geolocation is not supported by this browser.";
         	}
         }
         
         function showPosition(position) {
         if((position.coords.latitude && position.coords.longitude) != ''){	
         	var latitude = position.coords.latitude;
         	var longitude = position.coords.longitude;
         	var latlong = (latitude+", "+longitude);
         	$('#myModal').modal('toggle');
         	$.cookie('myCookie', latlong);
         	//alert('The value of myCookie is now "'+ $.cookie('myCookie')+ '". Now, reload the page, PHP should read it correctly.');
         }
         	x.innerHTML = "Latitude: " + position.coords.latitude + 
         	"<br>Longitude: " + position.coords.longitude;
         }
         //var x = document.getElementById("demo");
         //$("#demo").val(x);
         //var x = document.getElementById("demo").value;
         //alert(position.coords.longitude);		
      </script>
      <?php 
         $city = 'London';
          
         #Find latitude and longitude
          
         $url = "http://maps.googleapis.com/maps/api/geocode/json?address=$city";
         $json_data = file_get_contents($url);
         $result = json_decode($json_data, TRUE);
         //echo $latitude = $result['results'][0]['geometry']['location']['lat'];
         //echo $longitude = $result['results'][0]['geometry']['location']['lng'];
         ?>
      <div class="modal fade" id="myModal" role="dialog">
         <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content loc-pop">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title loc-share-title">Let's start Searching from here</h4>
               </div>
               <div class="modal-body loc-share-top">
                  <button onclick="getLocation()">Share Your Location</button>
               </div>
               <!--<div class="modal-footer">
                  <button class="" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>-->
            </div>
         </div>
      </div>
      <script>
	$('input.favts2, input.favts1').on('change', function(){
			//alert($(this).data('name'));
			var fav_store_id = $(this).data('text');
			var fav_name = $(this).data('name');
			if($(this).is(":checked")) {
				var vat = 1;
			} else {
				var vat = 0;
			}
			//alert(fav_name);
			$.ajax({				
				url: "index.php?route=common/header/updatestore_favourites_front",
				type: 'post',
				dataType: 'json',
				data: {store_id:fav_store_id, value:vat, fav_name:fav_name},
				success: function(json) {
					if (json['success']) {
						//$('#cus_prof').val(json['success']);
					}
				}
			 });
	});
      </script>
      <?php 
         if(!isset($_COOKIE['myCookie'])){ ?>
      <script>
         $('#myModal').modal({
         	backdrop: 'static',
         	keyboard: false
         })
      </script>
      <?php } ?>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
      <?php 
         if(isset($_COOKIE['myCookie'])){
         	//echo "<p><b>PHP found this value for <i>myCookie</i>: " .  $_COOKIE['myCookie'] . "</b></p>";
         }
         else{
         	//echo "<p><b>PHP did not find a value for <i>myCookie</i>. Give it a value below.<b></p>";
         }
         
         //echo $_COOKIE['myCookie'];
         if(isset($_COOKIE['myCookie'])){
         	$cookie = $_COOKIE['myCookie'];
         	$cookie_res = explode(',',$cookie);
         	$latitude = $cookie_res[0];
         	$longitude = $cookie_res[1];
         } else {
         	$latitude = '13.067439';
         	$longitude = '80.237617';
         }
	//$address = getAddress($latitude,$longitude);
	//$address = $address?$address:'Not found'; 
	function getAddress($latitude,$longitude){
	    if(!empty($latitude) && !empty($longitude)){
	    $add_loc = array();
		//Send request and receive json data by address
		$geocodeFromLatLong = file_get_contents('https://maps.googleapis.com/maps/api/geocode/json?latlng='.trim($latitude).','.trim($longitude).'&sensor=false'); 
		$output = json_decode($geocodeFromLatLong);
		//echo "<pre>"; print_r($output);
		$status = $output->status;
		//Get address from json data
		$add_loc['address'] = ($status=="OK")?$output->results[0]->formatted_address:'';
		//echo "<pre>"; print_r($output->results[0]);die;
		//Return address of the given latitude and longitude
		if(isset($output->results[0])) {
		    $response = array();
		    foreach($output->results[0]->address_components as $addressComponet) {
			if(in_array('political', $addressComponet->types)) {
				$response[] = $addressComponet->long_name;
				//print_r($response); die;
			}
		    }
		    
		    if(isset($response[0])){ $first  =  $response[0];  } else { $first  = 'null'; }
		    if(isset($response[1])){ $second =  $response[1];  } else { $second = 'null'; } 
		    if(isset($response[2])){ $third  =  $response[2];  } else { $third  = 'null'; }
		    if(isset($response[3])){ $fourth =  $response[3];  } else { $fourth = 'null'; }
		    if(isset($response[4])){ $fifth  =  $response[4];  } else { $fifth  = 'null'; }

		    if( $first != 'null' && $second != 'null' && $third != 'null' && $fourth != 'null' && $fifth != 'null' ) {
			$add_loc['local_address'] = $first;
			$add_loc['city_address'] = $second;
			$add_loc['state_address'] = $fourth;
			$add_loc['country_address'] = $fifth;
		    }
		    else if ( $first != 'null' && $second != 'null' && $third != 'null' && $fourth != 'null' && $fifth == 'null'  ) {
			$add_loc['local_address'] = $first;
			$add_loc['city_address'] = $second;
			$add_loc['state_address'] = $third;
			$add_loc['country_address'] = $fourth;
		    }
		    else if ( $first != 'null' && $second != 'null' && $third != 'null' && $fourth == 'null' && $fifth == 'null' ) {
			$add_loc['city_address'] = $first;
			$add_loc['state_address'] = $second;
			$add_loc['country_address'] = $third;
		    }
		    else if ( $first != 'null' && $second != 'null' && $third == 'null' && $fourth == 'null' && $fifth == 'null'  ) {
			$add_loc['state_address'] = $first;
			$add_loc['country_address'] = $second;
		    }
		    else if ( $first != 'null' && $second == 'null' && $third == 'null' && $fourth == 'null' && $fifth == 'null'  ) {
			$add_loc['country_address'] = $first;
		    }
		  }
		if(!empty($add_loc)){
		    return $add_loc;
		    //print_r($add_loc);
		}else{
		    return false;
		}
	    }else{
		return false;   
	    }
	}

		
	$add_loc = getAddress($latitude,$longitude);
	//print_r($add_loc);
	$js1 = json_encode($add_loc['address']);
	$local_address = (isset($add_loc['local_address']) && $add_loc['local_address']) ? $add_loc['local_address']:'';
	$city_address = (isset($add_loc['city_address']) && $add_loc['city_address']) ? $add_loc['city_address']:'';
	$state_address = (isset($add_loc['state_address']) && $add_loc['state_address']) ? $add_loc['state_address']:'';
	$country_address = (isset($add_loc['country_address']) && $add_loc['country_address']) ? $add_loc['country_address']:'';
	$country_det = $local_address.", ".$city_address.", ".$state_address.", ".$country_address;
	setcookie('myCookieaddress', $country_det);
	//print_r($country_det);
	
	//echo $js1;location.reload();
	echo "<script>\n";
	echo 'var names = ' . $js1 . ";\n";
	echo "$('#location-search-val').val($('#location-search-val').val() + names)";
	echo "</script>\n";
         ?>
      <div class="modal fade" id="ad-model" role="dialog">
         <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content loc-pop">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title loc-share-title">Advertise Details</h4>
               </div>
               <div class="modal-body">
                  <div class="row">
                     <div class="col-md-12">
                        <form action="http://localhost/projects/2.3.0.2-compiled/index.php?route=common/home/add_adv" method="post" enctype="multipart/form-data" id="advertise-loc" class="form-horizontal" style="padding: 0px 15px;">
                           <div class="form-group" style="position: static;">
                              <label for="input-text-1">Name</label>
                              <input class="form-control" id="name" name="name" placeholder="Enter your Name" type="text" required>
                           </div>
                           <div class="form-group" style="">
                              <label for="input-id-2">Email</label>
                              <input class="form-control" id="email" name="email" placeholder="Enter your email" type="email" required>
                           </div>
                           <div class="form-group" style="position: static;">
                              <label for="input-id-3">Phone</label>
                              <input class="form-control" id="phone" name="phone" placeholder="Enter Phone Number" type="number" required>
                           </div>
                           <div class="form-group" style="position: static;">
                              <label for="input-id-4">Title</label>
                              <input class="form-control" id="title" name="title" placeholder="Enter tiltle" type="text" required>
                           </div>
                           <div class="form-group" style="position: static;">
                              <label for="input-file-1">Upload Image</label>
                              <input id="input-file-1" name="image" type="file">
                              <p>Image size: 280px * 180px.</p>
                           </div>
                           <div class="form-group" style="position: static;">
                              <label for="input-id-5">Link</label>
                              <input class="form-control" name="url" id="url" placeholder="Enter Link" type="text">
                           </div>
                           <div class="form-group" style="position: static;">
                              <button class="advertise-btn" type="button">Submit</button>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
               <div class="modal-footer">
                  <button class="" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               </div>
            </div>
         </div>
      </div>
      <div class="modal fade" id="_log-bon" role="dialog">
         <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content loc-pop">
               <div class="modal-body _sig_log">
                  <button type="button" class="close _bongl" data-dismiss="modal">&times;</button>
                  <div class="row _top-log-in">
                     <div class="col-md-8 _bonlg">
                        <?php $email = '';$password = ''; ?>
                        <h3>Login</h3>
                        <form action="index.php?route=account/login" method="post" id="main-log" class="form-horizontal" style="padding: 0px 15px;">
				 <ul class="_erroe-li">
				   <li><span id="reg-sucess" class="text-normals"></span></li>
				</ul>
                           <div class="_email-log-bon">
                              <input type="text" name="email" value="<?php echo $email; ?>" placeholder="Enter Email address" id="input-email" class="inputText" required/>
                           </div>
			    <ul class="_erroe-li">
				   <!--<li><span id="log-sucess" class="text-dangers"></span></li>
				   <li><span id="log-failure" class="text-dangers"></span></li>-->
				</ul>
                           <div class="_passwrd-log-bon">							 
                              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="Enter Password" id="input-password" class="inputText" required/>                              
			      <img src="http://localhost/projects/2.3.0.2-compiled/image/catalog/logo.jpg" style="width:50px; height:50px;" onmouseover="mouseoverPass();" onmouseout="mouseoutPass();" />
                           </div>
			    <div class="_passwrd-log-bon">
			        <input type="radio" name="gender" value="user"> Buyer
				<input type="radio" name="gender" value="seller"> Seller
			    </div>
                           <div class="_log-btn-btm" style="position: static;">
                              <button class="advertise-btn _btn-fin" id="log-btn-main-bon" type="submit">Login</button>
                           </div>
                        </form>
                        <div class="_log-btn-btm" style="position: static;padding: 0px 15px;">
                           <button class="advertise-btn _btn-fin _sgn-sec" type="submit">Signup</button>
                        </div>
			<div class="_log-btn-btm frgt-pass-hd">
			     <a class="frgt-pass" id="frgt-pass" type="submit">Forgot password?</a>
			 </div>
                     </div>
                     <div class="col-md-4">
                        <div>
                           <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                        </div>
                     </div>
                  </div>
                  <div class="row _top-sign-in" style="display:none;">
                     <div class="col-md-8 _bonlg">
                        <h3>Sign Up</h3>
                        <form id="sig_top_hd" class="form-horizontal" style="padding: 0px 15px;">
                           <div class="_state-log-bon">
                              <select name="zone_select" id="zone_select">
                                 <option value="">Select your State</option>
                                 <?php foreach ($zone_data as $zone) { ?>
                                 <option value="<?php echo $zone['zone_id']; ?>"><?php echo $zone['name']; ?></option>
                                 <?php } ?>
                              </select>
                           </div>
			   <ul class="_erroe-li">
                              <li><span id="zone-bon-error" class="text-dangers"></span></li>
                           </ul>
                           <div class="_email-log-bon">
                              <input type="tel" name="telephone" value="" class="inputText cal-exp" placeholder="Enter Phone Number" id="input-telephone" required disabled/>
                           </div>
			   <ul class="_erroe-li">
                              <li><span id="top-line-star" class="text-dangers"></span></li>
                           </ul>
                           <div class="_log-btn-btm" style="position: static;">
                              <button class="advertise-btn _btn-fin" id="sign-up-bon-top" type="button" disabled>Continue</button>
                           </div>
                        </form>
                        <div class="_log-btn-btm" style="position: static;padding: 0px 15px;">
                           <button class="advertise-btn _btn-fin _sgn-out" type="submit">Existing user? Login</button>
                        </div>
                        <div class="errors">
                           <ul class="_erroe-li">
                              <li><span id="top-line-star" class="text-dangers"></span></li>
                              <li><span id="zone-bon-error" class="text-dangers"></span></li>
                           </ul>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div>
                           <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                        </div>
                     </div>
                  </div>
                  <div class="row _top-sign-otp" style="display:none;">
                     <div class="col-md-8 _bonlg">
                        <h3>Sign Up</h3>
                        <form id="_top-sign-otp" class="form-horizontal" style="padding: 0px 15px;">
                           <input type="hidden" name="cus_prof" id="cus_prof" value="">
                           <div class="_state-log-bon" disabled>
                              <input type="tel" name="zone_select" value="" class="inputText" id="zone_select_ret" required disabled/>
                           </div>
                           <div class="_email-log-bon" disabled>
                              <input type="tel" name="telephone" value="" class="inputText" id="input-telephone_ret" required disabled/>
                           </div>
                           <div class="_email-log-bon">
                              <input type="tel" name="otp" value="" maxlength="4" class="inputText" id="otp" placeholder="Enter OTP Sent to above Number" required/>
                           </div>
                           <div class="_email-log-bon">
                              <input type="email" name="email" value="" class="inputText" id="input-email-otp" placeholder="Enter Email Id" required disabled/>
                           </div>
			   <ul class="_erroe-li">
                              <li><span id="email-error" class="text-dangers"></span></li>
                           </ul>
                           <div class="_passwrd-log-bon">
                              <input type="password" name="password" value="" id="input-password-otp" placeholder="Enter Password" class="inputText" required disabled/>
                           </div>
			   <ul class="_erroe-li">
                              <li><span id="norm-pas" class="text-dangers"></span></li>
                           </ul>
                           <div class="_again-passwrd-log-bon">
                              <input type="password" name="confirm" value="" id="input-confirm-otp" placeholder="Re-Enter Password" class="inputText" required disabled/>
                           </div>
			   <ul class="_erroe-li">
                              <li><span id="conf-pas" class="text-dangers"></span></li>
                           </ul>
			   <div class="_state-log-bon">
                              <select name="security_select" id="security_select" required>
                                 <option value="">Select your Security Quesion</option>
				 <?php foreach($security_question_data as $sec_ques) { ?>
					<option value="<?php echo $sec_ques['q_id']; ?>"><?php echo $sec_ques['q_name']; ?></option>
				 <?php } ?>		 
                              </select>
                           </div>
			    <ul class="_erroe-li">
                              <li><span id="security_select_alt" class="text-dangers"></span></li>
                           </ul>
			   <div class="_again-passwrd-log-bon security_answer" style="display:none">
                              <input type="text" name="security_answer" value="" id="security_answer" placeholder="Please enter security answer" class="inputText" required/>
                           </div>
			   <ul class="_erroe-li">
                              <li><span id="security_answer_alt" class="text-dangers"></span></li>
                           </ul>
                           <div class="_log-btn-btm" style="position: static;">
                              <button class="advertise-btn _btn-fin" id="sign-up-bon-top-prof" type="button" disabled>Signup</button>
                           </div>
                        </form>
                     </div>
                     <div class="col-md-4">                       
                        <div>
                           <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                        </div>
                     </div>
                  </div>
                  <div class="row _top-sign-upd" style="display:none;">
                     <div class="col-md-8 _bonlg">
		      <h3>Personal Details</h3>
                        <form id="top-sign-last" class="form-horizontal"  enctype="multipart/form-data" style="padding: 0px 15px;">
                           <input type="hidden" name="cus_d_up" id="cus_d_up" value="">
                           <div class="_email-log-bon">
                              <input type="text" name="firstname" value="" class="inputText" placeholder="Enter First Name" id="input-firstname" required/>
                           </div>
			   <ul class="_erroe-li">
                              <li><span id="fist-name-bon" class="text-dangers"></span></li>
                           </ul>
                           <div class="_passwrd-log-bon">
                              <input type="text" name="lastname" value="" placeholder="Enter Last Name" id="input-lastname" class="inputText" required/>
                           </div>
			   <ul class="_erroe-li">
                              <li><span id="last-name-bon" class="text-dangers"></span></li>
                           </ul>
                           <div class="_again-passwrd-log-bon">
                              <input type="text" name="address_1" value="" placeholder="Enter Address" id="input-address-1" class="inputText" required/>
                           </div>
			   <ul class="_erroe-li">
                              <li><span id="address-bon" class="text-dangers"></span></li>
                           </ul>			   
                           <div class="_log-btn-btm" style="position: static;">
                              <button class="advertise-btn _btn-fin" id="updat-bon-det" type="button">Submit</button>
                           </div>
                        </form>
                        <div class="_log-btn-btm" style="position: static;padding: 0px 15px;">
                           <button class="advertise-btn _btn-fin _skip-prof" type="submit">Skip</button>
                        </div>
                     </div>
                     <div class="col-md-4">                       
                        <div>
                           <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                        </div>
                     </div>
                  </div>
		  <div class="row _forget-bon"  style="display:none;">
                     <div class="col-md-8 _bonlg">
                        <h3>Forgot Password</h3>
                        <form id="forget-log-type" class="form-horizontal" style="padding: 0px 15px;">
                           <div class="_email-log-bon">
                              <input type="text" name="forgt-phn" value="" placeholder="Enter Phone Number" id="forgt-phn" class="inputText" required/>
                           </div>
			    <ul class="_erroe-li">
				   <li><span id="forgt-phn-failure" class="text-dangers"></span></li>
				</ul>
                           <div class="_log-btn-btm" style="position: static;">
                              <button class="advertise-btn _btn-fin" id="forget-btn-main-bon-type" type="button">Continue</button>
                           </div>
                        </form>
				<div class="_log-btn-btm frgt-pass-hd">
				     <a class="frgt-pass _resr-log-bon" id="frgt-pass" type="submit">Login</a>
				 </div>
                     </div>
                     <div class="col-md-4">
                        <div>
                           <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                        </div>
                     </div>
                  </div>
		  <div class="row _forget-bon-sec"  style="display:none;">
                     <div class="col-md-8 _bonlg">
                        <h3>Forgot Password</h3>
                        <form id="forget-log-sec" class="form-horizontal" style="padding: 0px 15px;">
			<input type="hidden" name="forgt-phn-sec" id="forgt-phn-sec" value="">
			<input type="hidden" name="otp-sec" id="otp-sec" value="0">
                           <div class="_email-log-bon">
                              <input type="text" name="forgt-phn" value="" placeholder="Enter Phone Number" id="forgt-phn-sec_nw" class="inputText" required disabled/>
                           </div>
                           <div class="_passwrd-log-bon">							 
                              <input type="text" name="forgt-phn-otp" value="" maxlength="6" placeholder="Enter forgot password OTP" id="forgt-phn-otp" class="inputText" required/>                              
                           </div>
			   <ul class="_erroe-li">
                              <li><span id="sec_otp_sec" class="text-dangers"></span></li>
                           </ul>
			   <div id="qus_ans">
				   <div class="_state-log-bon">
				     <input type="text" name="security_question_sec" value="" id="security_question_sec" class="inputText" required disabled/>
				   </div>
				   <div class="_again-passwrd-log-bon security_answer">
				      <input type="text" name="security_answer_sec" value="" id="security_answer_sec" placeholder="Please enter security answer" class="inputText" required/>
				   </div>
				   <ul class="_erroe-li">
				      <li><span id="security_answer_sec-er" class="text-dangers"></span></li>
				   </ul>
			   </div>
			   <div class="_log-btn-btm" style="position: static;">
                              <button class="advertise-btn _btn-fin" id="forget-btn-main-bon-sec" type="button">Continue</button>
                           </div>
                        </form>
                     </div>
                     <div class="col-md-4">
                        <div>
                           <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                        </div>
                     </div>
                  </div>
		  <div class="row _forget-bon-pass"  style="display:none;">
                     <div class="col-md-8 _bonlg">
                        <h3>Forgot Password</h3>
                        <form id="forget-log-pass" class="form-horizontal" style="padding: 0px 15px;">
			<input type="hidden" name="cus_ids" id="cus_ids" value="">
                           <div class="_email-log-bon">
                              <input type="text" name="password" value="" placeholder="Enter password" id="forgt-pass" class="inputText" required/>
                           </div>
			    <ul class="_erroe-li">
				   <li><span id="forgt-phn-pass-fail" class="text-dangers"></span></li>
				</ul>
                           <div class="_passwrd-log-bon">							 
                              <input type="text" name="confirm" value="" placeholder="Re-Enter password" id="forgt-pass-re" class="inputText" required/>                              
                           </div>
			    <ul class="_erroe-li">
				   <li><span id="forgt-phn-pass-re-fail" class="text-dangers"></span></li>
				</ul>
                           <div class="_log-btn-btm" style="position: static;">
                              <button class="advertise-btn _btn-fin" id="forget-btn-main-bon-pass" type="button">Submit</button>
                           </div>
                        </form>
                     </div>
                     <div class="col-md-4">
                        <div>
                           <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script>
         $(document).ready(function(){
             $("._sgn-sec").click(function(){		
         	$("._top-log-in").hide();
         	$("._top-sign-in").show();
             });
             $("._sgn-out").click(function(){
         	$("._top-sign-in").hide();				
         	$("._top-log-in").show();
             });
             $("#sign-up-bon-top-otp").click(function(){
         	var cus_d = $('#cus_d').val();
         	$('#cus_prof').val(cus_d);
         	$("._top-sign-otp").hide();
         	$("._top-sign-prof").show();
             });
              $("._skip-prof").click(function(){
         	$("._top-sign-upd").hide();
         	$("._top-log-in").show();
              });
             $("input#otp").keyup(function(){			    
         	    var lgt = $('#otp').val().length;			
         	if (lgt == 4) {
         	  $("#input-email-otp").removeAttr('disabled');
         	  $("#input-password-otp").removeAttr('disabled');
         	  $("#input-confirm-otp").removeAttr('disabled');
         	  $("#sign-up-bon-top-prof").removeAttr('disabled');
               };
             });
	     $("#frgt-pass").click(function(){		
         	$("._top-log-in").hide();
         	$("._forget-bon").show();
             });
	     $("._resr-log-bon").click(function(){		
         	$("._forget-bon").hide();
         	$("._top-log-in").show();
             });	     
         });
         
         $('#sign-up-bon-top').on('click', function() {
	 $('#top-line-star').html('');
         $.ajax({
         	url: 'index.php?route=common/header/new_login',
         	type: 'post',
         	dataType: 'json',
         	data: $("#sig_top_hd").serialize(),
         	success: function(json) {
         		if (json['success']) {
         			$('#cus_prof').val(json['success']);
				$('#zone_select_ret').val(json['zone_select']);
				$('#input-telephone_ret').val(json['telephone']);
         			$("._top-sign-in").hide();
         			$("._top-sign-otp").show();
         		}
         		if(json['error_warning']) {
         			$('#top-line-star').html('<i class="fa fa-times" aria-hidden="true"></i> ' + json['error_warning']);
         		}
         		if(json['error_telephone']) {
         			$('#top-line-star').html('<i class="fa fa-times" aria-hidden="true"></i> ' + json['error_telephone']);
         		}
			if(json['telephone_number']) {
         			$('#top-line-star').html('<i class="fa fa-times" aria-hidden="true"></i> ' + json['telephone_number']);
         		}
         	}
         });
         });
         $('#sign-up-bon-top-prof').on('click', function() {
         $.ajax({
         	url: 'index.php?route=common/header/new_login_update',
         	type: 'post',
         	dataType: 'json',
         	data: $("#_top-sign-otp").serialize(),
         	success: function(json) {
         		if (json['success']) {
         			$('#cus_d_up').val(json['success']);
         			$("._top-sign-otp").hide();
         			$("._top-sign-upd").show()
         		}
         		if(json['error_email']) {
         			$('#email-error').html('<i class="fa fa-times" aria-hidden="true"></i>'+json['error_email']);
         		}
         		if(json['error_warning']) {
         			$('#email-error').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['error_warning']);
         		}
         		if(json['error_password']) {
         			$('#norm-pas').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['error_password']);
         		}
         		if(json['error_confirm']) {
         			$('#conf-pas').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['error_confirm']);
         		}
			if(json['security_select']) {
         			$('#security_select_alt').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['security_select']);
         		}
			if(json['security_answer']) {
         			$('#security_answer_alt').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['security_answer']);
         		}
         	}
         });
         });
         $('#updat-bon-det').on('click', function() {
         $.ajax({
         	url: 'index.php?route=common/header/new_login_update_two',
         	type: 'post',
         	dataType: 'json',
         	data: $("#top-sign-last").serialize(),
         	success: function(json) {
         		if (json['success']) {
				$('#reg-sucess').html('<i class="fa fa-check" aria-hidden="true"></i><span>'+json['success']);
         			$("._top-sign-upd").hide();
         			$("._top-log-in").show();
         		}
         		if(json['error_firstname']) {
         			$('#fist-name-bon').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['error_firstname']);
         		}
         		if(json['lastname']) {
         			$('#last-name-bon').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['lastname']);
         		}
         		if(json['address_1']) {
         			$('#address-bon').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['address_1']);
         		}
         	}
         });
         });
	 $('#forget-btn-main-bon-type').on('click', function() {
	 $('.text-dangers').html('');
         $.ajax({
         	url: 'index.php?route=common/header/forgot_pass_log',
         	type: 'post',
         	dataType: 'json',
         	data: $("#forget-log-type").serialize(),
         	success: function(json) {
         		if (json['success']) {
				$('#forgt-phn-sec').val(json['success']);
				$('#forgt-phn-sec_nw').val(json['success']);
				$('#security_question_sec').val(json['q_name']);
         			$("._forget-bon").hide();
         			$("._forget-bon-sec").show();
				$("#qus_ans").hide();
         		}
         		if(json['forgt-phn-failure']) {
         			$('#forgt-phn-failure').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['forgt-phn-failure']);
         		}
         	}
         });
         });
	 $(document).ready(function(){
	 $("input#forgt-phn-otp").keyup(function(){			    
	     var lgt = $('#forgt-phn-otp').val().length;			
	 if (lgt == 6) {
	 $('.text-dangers').html('');
		 $.ajax({
			url: 'index.php?route=common/header/forgot_pass_sec',
			type: 'post',
			dataType: 'json',
			data: $("#forget-log-sec").serialize(),
			success: function(json) {
				if (json['success']) {
					$('#cus_ids').val(json['success']);
					$('#otp-sec').val(1);
					$("#qus_ans").show();
				}
				if(json['sec_otp_sec']) {
					$('#sec_otp_sec').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['sec_otp_sec']);
				}
			}
		 });
        };
	});
	});
	 $('#forget-btn-main-bon-sec').on('click', function() {
	 $('.text-dangers').html('');
         $.ajax({
         	url: 'index.php?route=common/header/forgot_pass_sec',
         	type: 'post',
         	dataType: 'json',
         	data: $("#forget-log-sec").serialize(),
         	success: function(json) {
         		if (json['success']) {
				$('#cus_ids').val(json['success']);
         			$("._forget-bon-sec").hide();
         			$("._forget-bon-pass").show();				
         		}
         		if(json['security_answer_sec']) {
         			$('#security_answer_sec-er').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['security_answer_sec']);
         		}
			if(json['sec_otp_sec']) {
         			$('#sec_otp_sec').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['sec_otp_sec']);
         		}
         	}
         });
         });

	$('#forget-btn-main-bon-pass').on('click', function() {
	 $('.text-dangers').html('');
         $.ajax({
         	url: 'index.php?route=common/header/forgot_pass_change',
         	type: 'post',
         	dataType: 'json',
         	data: $("#forget-log-pass").serialize(),
         	success: function(json) {
         		if (json['success']) {
				$('#reg-sucess').html('<i class="fa fa-check" aria-hidden="true"></i><span>'+json['success']);
         			$("._forget-bon-pass").hide();
         			$("._top-log-in").show();				
         		}
         		if(json['error_password']) {
         			$('#forgt-phn-pass-fail').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['error_password']);
         		}
			if(json['error_confirm']) {
         			$('#forgt-phn-pass-re-fail').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+json['error_confirm']);
         		}
         	}
         });
         });

         /*$('#log-btn-main-bon').on('click', function() {
         $.ajax({
         	url: 'index.php?route=account/login',
         	type: 'post',
         	dataType: 'json',
         	data: $("#main-log").serialize(),
         	success: function(data) {
         		if (data['success']) {
         			$("._top-log-in").hide();
         			$('#log-sucess').html('<i class="fa fa-check" aria-hidden="true"></i><span>'+data['success']);
         			jQuery(window).trigger('load'); 
         		}
         		if(data['error_warning']) {
         			$('#log-failure').html('<i class="fa fa-times" aria-hidden="true"></i><span>'+data['error_warning']);
         		}
         	}
         });
         });*/
      </script>
      <script type="text/javascript">
         /*
          * Google Maps: Latitude-Longitude Finder Tool
          * http://salman-w.blogspot.com/2009/03/latitude-longitude-finder-tool.html
          */
		

         function loadmap() {
         	// initialize map
         	if(document.getElementById("latitude").value != ''){
         		var map = new google.maps.Map(document.getElementById("map-canvas"), {				
         			center: new google.maps.LatLng(document.getElementById("latitude").value, document.getElementById("longitude").value),
         			zoom: 16,
         			mapTypeId: google.maps.MapTypeId.ROADMAP
         		});
         	} else {
         		var map = new google.maps.Map(document.getElementById("map-canvas"), {				
         			center: new google.maps.LatLng(25.074684, 55.228105),
         			zoom: 10,
         			mapTypeId: google.maps.MapTypeId.ROADMAP
         		});	
         	}
         	// initialize marker
         	var marker = new google.maps.Marker({
         		position: map.getCenter(),
         		draggable: true,
         		map: map
         	});
         	// intercept map and marker movementssss
         	google.maps.event.addListener(map, "idle", function() {
         		//marker.setPosition(map.getCenter());
         		document.getElementById("latitude").value = map.getCenter().lat().toFixed(6);
         		document.getElementById("longitude").value = map.getCenter().lng().toFixed(6);
			//document.getElementById("latitude_st").value = map.getCenter().lat().toFixed(6);
         		//document.getElementById("longitude_st").value = map.getCenter().lng().toFixed(6);
         	});
         	google.maps.event.addListener(marker, "dragend", function(mapEvent) {
         		map.panTo(mapEvent.latLng);
         	});
         	// initialize geocoder
         	var geocoder = new google.maps.Geocoder();
         	google.maps.event.addDomListener(document.getElementById("search-btn"), "click", function() {
         		geocoder.geocode({ address: document.getElementById("search-txt").value }, function(results, status) {
         			if (status == google.maps.GeocoderStatus.OK) {
         				var result = results[0];
         				document.getElementById("search-txt").value = result.formatted_address;
         				if (result.geometry.viewport) {
         					map.fitBounds(result.geometry.viewport);
         				} else {
         					map.setCenter(result.geometry.location);
         				}
         			} else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
         				alert("Sorry, geocoder API failed to locate the address.");
         			} else {
         				alert("Sorry, geocoder API failed with an error.");
         			}
         		});
         	});
         	google.maps.event.addDomListener(document.getElementById("search-txt"), "keydown", function(domEvent) {
         		if (domEvent.which === 13 || domEvent.keyCode === 13) {
         			google.maps.event.trigger(document.getElementById("search-btn"), "click");
         		}
         	});
         	// initialize geolocation
         	if (navigator.geolocation) {
         		google.maps.event.addDomListener(document.getElementById("detect-btn"), "click", function() {
         			navigator.geolocation.getCurrentPosition(function(position) {
         				map.setCenter(new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
         			}, function() {
         				alert("Sorry, geolocation API failed to detect your location.");
         			});
         		});
         		document.getElementById("detect-btn").disabled = false;
         	}
         }

	 function setCookiePosition(button) {
	    if(button == 'ok'){			
		var latlong = (document.getElementById("latitude").value+", "+document.getElementById("longitude").value);
		$.cookie('myCookie', latlong);	
		location.reload();
		return true;
	     } else { return false; }
	}
      </script>
      <script src="//maps.googleapis.com/maps/api/js?v=3&amp;sensor=false&amp;key=AIzaSyCd8_dkSlkxLyjEb0vv8AC6_zX6P7ios2g&amp;callback=loadmap" defer></script>
      <style>
         #map-search { position: absolute; top: 10px; left: 10px; right: 10px; }
         #search-txt { float: left; width: 73%; }
         #search-btn { float: left; width: 27%; }
         #detect-btn { float: right; width: 19%; }
         #map-canvas { position: sticky !important; top: 10px; bottom: 65px; left: 10px; right: 10px; width: 100%; height: 450px;}
         #map-output { position: absolute; bottom: 10px; left: 10px; right: 10px; }
         #map-output a { float: right; }
         .addlinks {
         border-bottom: 1px solid #ccc;
         margin: 0 auto;
         /*width: 67%;*/
         }
         /*.update_cancel {
         border: 0 none;
         left: 9%;
         position: absolute;
         top: 97%;
         }*/
         .btn12 {
         bottom: 0;
         left: 26%;
         position: relative;
         right: 0;
         /*top: -71px;*/
         }
      </style>
      <div class="modal fade" id="map_mod" role="dialog">
         <div class="modal-dialog map-box">
            <!-- Modal content-->
            <div class="modal-content">
               <div class="modal-header">
		<div class="form-group">
			<label class="col-sm-1 control-label">Enter Map Location</label>
			<div class="col-sm-3">
				<div id="map-search">
					<input id="search-txt" type="text" class="form-control" value="Chennai" maxlength="100">
					<input id="search-btn" type="button" value="Locate Address">												
				</div>
			</div>
		</div>
				 
                  <button type="button" class="btn btn-default _bon-bst-map" onclick="setCookiePosition('cancel')" data-dismiss="modal">Close</button>
				  <button type="button" class="btn btn-default _bon-bst-map _bon-ok-map" onclick="setCookiePosition('ok')" >Ok</button>
                  <h4 class="modal-title _bon-map">Choose Your Location</h4>
               </div>
               <div class="modal-body">
                  <div id="map-canvas"></div>
                  <!--<input type="text" class="form-control" name="latitude" id="latitude" value="<?php echo $latitude; ?>" />
                  <input type="text" class="form-control" name="longitude" id="longitude" value="<?php echo $longitude; ?>" />-->
		  
               </div>
               <div class="modal-footer">
				<div class="form-group">
					<label class="col-sm-1 control-label">Latitude</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" name="latitude" id="latitude" value="<?php echo $latitude; ?>" />												
					</div>
					<label class="col-sm-1 control-label">Longitude</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" name="longitude" id="longitude" value="<?php echo $longitude; ?>" />												
					</div>
				</div>			
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               </div>
            </div>
         </div>
      </div>
      <script>
         $('#map_mod').on('shown.bs.modal', function () {
         	//alert('test');
         	loadmap();
             //google.maps.event.trigger(map, "resize");
         });
         $("select#zone_select").change(function(){
         $('#top-line-star').html('');
         $('#zone-bon-error').html('');
         var zone_id = $(this).val()
         if((zone_id == 1503) || (zone_id == 1499)){
         $("#input-telephone").removeAttr('disabled');
         	  $("#sign-up-bon-top").removeAttr('disabled');
         }else{
         $('#zone-bon-error').html('<i class="fa fa-times" aria-hidden="true"></i><span>Please Wait, Will be comming soon...</span>');
         $("#input-telephone").attr('disabled','disabled');
         	  $("#sign-up-bon-top").attr('disabled','disabled');
         }
         });
	 $("select#security_select").change(function(){
		$('#security_select_alt').html('');
		$('#security_answer_alt').html('');
		$(".security_answer").show();
	 });
	 function mouseoverPass(obj) {
	  var obj = document.getElementById('input-password');
	  obj.type = "text";
	}
	function mouseoutPass(obj) {
	  var obj = document.getElementById('input-password');
	  obj.type = "password";
	}
      </script>

