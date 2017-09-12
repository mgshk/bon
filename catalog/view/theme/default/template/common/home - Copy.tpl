

<?php echo $header; ?>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
  $( function() {
    var availableTags = <?php //echo $auto_search_home; ?>
    $( "#searcha" ).autocomplete({
      source: availableTags
    });
  } );
  </script>
<?php //echo $left_menu; ?>
<div class="container-fluid">
 <div class="row">
    <div class="col-sm-12 header-ad">
    <?php if(count($advertisement_top_banner) > 0) { ?>
       <!--<img src="image/header-img.png" class="img-responsive" title="header-ad" alt="header-ad">-->
       <div id="myCarousel" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
		<?php
		$i = 0;
		foreach($advertisement_top_banner as $advertisement_top) {
		?>
			<li data-target="#myCarousel" data-slide-to="<?php echo $i; ?>" class="<?php echo ($i == 0) ? 'active' : '';?>"></li>
		<?php
		$i++;
		} ?>
	    <!--  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	     <li data-target="#myCarousel" data-slide-to="1"></li>
	     <li data-target="#myCarousel" data-slide-to="2"></li> -->
	  </ol>
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
	  <?php
		$i = 0;
		foreach($advertisement_top_banner as $advertisement_top) {
		?>
		<div class="item <?php echo ($i == 0) ? 'active' : ''; ?>">
			<img src="<?php echo $image_resize->resize($advertisement_top['offer_image'], 1324, 182); ?>" class="img-responsive" title="<?php echo $advertisement_top['offer_title']; ?>" alt="<?php echo $advertisement_top['offer_title']; ?>" >
			
		</div>
		<?php
		$i++;
	  } ?>
	  </div>
	  <!-- Left and right controls -->
	  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	  <span class="sr-only">Next</span>
	  </a>
	  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	  <span class="sr-only">Next</span>
	  </a>
	  </div>
	  <?php } else {?>
	  <div id="myCarousel" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">			
			<li data-target="#myCarousel" data-slide-to="<?php $key ?>" class="active"></li>                     
		  </ol>
		  <!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
	  
		    <div class="item active">
			<img src="image/header-img.png" class="img-responsive" title="header-ad" alt="header-ad">
			<div class="carousel-caption">
			   <h3>Tamil</h3>
			</div>
		     </div>
		</div>
	  </div>
	<?php }?>
    </div>
 </div>
</div>
<div class="col-sm-12 category-center">
   <div class="sel-cat-home">
      <div id="search" class="input-group">         
	 <form action="<?php //echo $search_pst; ?>">
	 <?php
		$path = (isset($_GET['path']) && $_GET['path']) ? $_GET['path']: '';
	 ?>
	 <select name="path" id="path" >
            <option value="">All Category</option>
            <?php foreach ($categories as $category) { 
	    $selected = ($category['category_id'] == $path) ? "selected = selected" : ""; ?>
            <option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?>><?php echo $category['name']; ?></option>
            <?php } ?>
         </select>
         <!-- .cd-dropdown-wrapper
         <select name="category_select" id="category_select" data-placeholder="Choose a Country..." class="chosen-select" multiple tabindex="4">
            <option value="">All Category</option>
            <?php foreach ($categories as $category) { ?>
            <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
            <?php } ?>
         </select> -->
	 <div class="ui-widget">
	  <input name="search" id="searcha" value="" placeholder="Search" class="" type="text">
	 </div>
	 <select name="by_search" id="by_search" >
        <option value="1">By All</option>
	    <option value="2">By Category</option>
	    <option value="3">By Store/Entity</option>
	    <option value="4">By Product</option>            
         </select>
		 
         <span class="input-group-btn">
         <button type="button" class="btn home-search btn-default"><i class="fa fa-search"></i></button>	
         </span>
	 </form>
      </div>
   </div>
   <!-- Nav tabs -->
   <?php 
   
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
	function getAddress1($latitude,$longitude){
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
				
			}
		    }
		    //print_r($response);
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


	$add_loc = getAddress1($latitude,$longitude);
	//print_r($add_loc);
	$js1 = json_encode($add_loc['address']);
	$local_address = (isset($add_loc['local_address']) && $add_loc['local_address']) ? $add_loc['local_address']:'';
	$city_address = (isset($add_loc['city_address']) && $add_loc['city_address']) ? $add_loc['city_address']:'';
	$state_address = (isset($add_loc['state_address']) && $add_loc['state_address']) ? $add_loc['state_address']:'';
	$country_address = (isset($add_loc['country_address']) && $add_loc['country_address']) ? $add_loc['country_address']:'';
	$country_det = $local_address.", ".$city_address.", ".$state_address.", ".$country_address;
	setcookie('myCookieaddress', $country_det);
	//print_r($country_det);   

	if (isset($country_det)) { $address_det = explode(',', $country_det); } ?>
   <div class="card">
      <ul class="nav nav-tabs _bon_ts" role="tablist">
      <?php //if ($logged) { ?>
         <!-- <li class="tas_bon" role="presentation"><a href="index.php?route=selleradvertise/advertise/add" >Post ad</a></li>-->
      <?php //} else { ?>
	 <!--<li class="tas_bon" role="presentation"><a style="cursor:pointer" data-toggle="modal" data-target="#_log-bon">Post ad</a></li>-->
      <?php //} ?>
	 <li id="adv_home" class="tas_bon active" role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">India<?php //echo $address_det[3]; ?></a></li>
         <li id="adv_profile" class="tas_bon" role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><?php echo $address_det[2]; ?></a></li>
         <li id="adv_messages" class="tas_bon" role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><?php echo $address_det[1]; ?></a></li>
         <li id="adv_settings" class="tas_bon" role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Local<?php //echo $address_det[0]; ?></a></li>
      </ul>
      <!-- Tab panes -->
      <div class="tab-content">
         <div role="tabpanel" class="tab-pane active" id="home">
	  <?php if(count($advertisement_national) > 0) {
	    foreach($advertisement_national as $advertisement_na) { ?>
            <div class="col-sm-12 advertise_count" id="<?php echo $advertisement_na['advertise_id']; ?>" >
               <div class="row">
                  <div class="hovereffect">
                     <img src="<?php echo $image_resize->resize($advertisement_na['offer_image'], 1324, 182); ?>" class="img-responsive" title="<?php echo $advertisement_na['offer_title']; ?>" alt="<?php echo $advertisement_na['offer_title']; ?>">
                     <div class="overlay">
			<div class="col-sm-12">
				<div class="col-sm-10">
					<h2 class="store_name">
						<?php echo $advertisement_na['nickname']; ?>				
					</h2>
				</div>
				<div class="col-sm-2">
					<h2 class="store_rating">
						<div>
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($advertisement_na['rating'] < $i) { ?>
							<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } else { ?>
							<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } ?>
							<?php } ?>
						</div>
					</h2>
				</div>
			</div>
			<div class="col-sm-12">
				<h2 class="advertise_title"><?php echo $advertisement_na['offer_title']; ?></h2>
			</div>
			
                        <a class="info" href="<?php echo $advertisement_na['offer_url']; ?>">link here</a>			
                     </div>
		     <?php if((isset($advertisement_na['filtered']) && $advertisement_na['filtered'] =='1') ? $advertisement_na['filtered'] : '') { ?>
			<div class="col-sm-1 filtered_ads">
				<?php echo "Filtered"; ?>
			</div>
			<?php } ?>
                  </div>
               </div>
            </div>
	    <?php $count_na = count($advertisement_national); ?>
	    <script>var national_adv_id = "<?php echo $advertisement_na['advertise_id']; ?>"; var count_na = "<?php echo $count_na; ?>";</script>
	    <?php } } else { ?>
	    <div class="col-sm-12">
               <div class="row">
                  <p>No Advertisement Yet...</p>
               </div>
            </div>    
	    <?php } ?>	   
         </div>
         <div role="tabpanel" class="tab-pane" id="profile">
            <?php if(count($advertisement_state) > 0) {
	    foreach($advertisement_state as $advertisement_st) { ?>
            <div class="col-sm-12 advertise_count" id="<?php echo $advertisement_st['advertise_id']; ?>" >
               <div class="row">
                  <div class="hovereffect">
                     <img src="<?php echo $image_resize->resize($advertisement_st['offer_image'], 1324, 182); ?>" class="img-responsive" title="<?php echo $advertisement_st['offer_title']; ?>" alt="<?php echo $advertisement_st['offer_title']; ?>">
                     <div class="overlay">
			<div class="col-sm-12">
				<div class="col-sm-10">
					<h2 class="store_name">
						<?php echo $advertisement_st['nickname']; ?>				
					</h2>
				</div>
				<div class="col-sm-2">
					<h2 class="store_rating">
						<div>
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($advertisement_st['rating'] < $i) { ?>
							<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } else { ?>
							<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } ?>
							<?php } ?>
						</div>
					</h2>
				</div>
			</div>
			<div class="col-sm-12">
				<h2 class="advertise_title"><?php echo $advertisement_st['offer_title']; ?></h2>
			</div>
			
                        <a class="info" href="<?php echo $advertisement_st['offer_url']; ?>">link here</a>
                     </div>
		     <?php if((isset($advertisement_st['filtered']) && $advertisement_st['filtered'] =='1') ? $advertisement_st['filtered'] : '') { ?>
			<div class="col-sm-1 filtered_ads">
				<?php echo "Filtered"; ?>
			</div>
			<?php } ?>
                  </div>
               </div>
            </div>
	     <?php $count_st = count($advertisement_state); ?>	    
	    <script>var state_adv_id = "<?php echo $advertisement_st['advertise_id']; ?>"; var count_st = "<?php echo $count_st; ?>";</script>
	    <?php } } else { ?>
	    <div class="col-sm-12">
               <div class="row">
                   <p>No Advertisement Yet...</p>
               </div>
            </div>    
	    <?php } ?>	    
         </div>
         <div role="tabpanel" class="tab-pane" id="messages">
            <?php if(count($advertisement_city) > 0) {
	    foreach($advertisement_city as $advertisement_ci) { ?>
            <div class="col-sm-12 advertise_count" id="<?php echo $advertisement_ci['advertise_id']; ?>">
               <div class="row">
                  <div class="hovereffect">
                     <img src="<?php echo $image_resize->resize($advertisement_ci['offer_image'], 1324, 182); ?>" class="img-responsive" title="<?php echo $advertisement_ci['offer_title']; ?>" alt="<?php echo $advertisement_ci['offer_title']; ?>">
                     <div class="overlay">
			<div class="col-sm-12">
				<div class="col-sm-10">
					<h2 class="store_name">
						<?php echo $advertisement_ci['nickname']; ?>				
					</h2>
				</div>
				<div class="col-sm-2">
					<h2 class="store_rating">
						<div>
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($advertisement_ci['rating'] < $i) { ?>
							<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } else { ?>
							<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } ?>
							<?php } ?>
						</div>
					</h2>
				</div>
			</div>
			<div class="col-sm-12">
				<h2 class="advertise_title"><?php echo $advertisement_ci['offer_title']; ?></h2>
			</div>
			
                        <a class="info" href="<?php echo $advertisement_ci['offer_url']; ?>">link here</a>
                     </div>
		     <?php if((isset($advertisement_ci['filtered']) && $advertisement_ci['filtered'] =='1') ? $advertisement_ci['filtered'] : '') { ?>
			<div class="col-sm-1 filtered_ads">
				<?php echo "Filtered"; ?>
			</div>
			<?php } ?>
                  </div>
               </div>
            </div>
	    <?php $count_ct = count($advertisement_city); ?>
	    <script>var city_adv_id = "<?php echo $advertisement_ci['advertise_id']; ?>"; var count_ct = "<?php echo $count_ct; ?>";</script>
	   <?php } } else { ?>
	    <div class="col-sm-12">
               <div class="row">
                   <p>No Advertisement Yet...</p>
               </div>
            </div>    
	    <?php } ?>	   
         </div>
         <div role="tabpanel" class="tab-pane" id="settings">
	 <?php if(count($advertisement_local) > 0 && !empty($advertisement_local)) {
	    foreach($advertisement_local as $advertisement_lo) { ?>
            <div class="col-sm-12 advertise_count" id="<?php echo $advertisement_lo['advertise_id']; ?>" >
               <div class="row">
                  <div class="hovereffect">
                     <img src="<?php echo $image_resize->resize($advertisement_lo['offer_image'], 1324, 182); ?>" class="img-responsive" title="<?php echo $advertisement_lo['offer_title']; ?>" alt="<?php echo $advertisement_lo['offer_title']; ?>">
                     <div class="overlay">
			<div class="col-sm-12">
				<div class="col-sm-10">
					<h2 class="store_name">
						<?php echo $advertisement_lo['nickname']; ?>				
					</h2>
				</div>
				<div class="col-sm-2">
					<h2 class="store_rating">
						<div>
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($advertisement_lo['rating'] < $i) { ?>
							<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } else { ?>
							<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } ?>
							<?php } ?>
						</div>
					</h2>
				</div>
			</div>
			<div class="col-sm-12">
				<h2 class="advertise_title"><?php echo $advertisement_lo['offer_title']; ?></h2>
			</div>
			
                        <a class="info" href="<?php echo $advertisement_lo['offer_url']; ?>">link here</a>
                     </div>
		     <?php if((isset($advertisement_lo['filtered']) && $advertisement_lo['filtered'] =='1') ? $advertisement_lo['filtered'] : '') { ?>
			<div class="col-sm-1 filtered_ads">
				<?php echo "Filtered"; ?>
			</div>
			<?php } ?>
                  </div>
               </div>
            </div>
	    <?php $count_lo = count($advertisement_local); ?>	    
	    <script>var local_adv_id = "<?php echo $advertisement_lo['advertise_id']; ?>"; var count_lo = "<?php echo $count_lo; ?>";</script>
	   <?php } } else { ?>
	    <div class="col-sm-12">
               <div class="row">
                   <p>No Advertisement Yet...</p>
               </div>
            </div>    
	    <?php } ?>	     
         </div>
	  <?php if( (isset($advertisement_national) && !empty($advertisement_national)) || (isset($advertisement_state) && !empty($advertisement_state)) || (isset($advertisement_city) && !empty($advertisement_city)) || (isset($advertisement_local) && !empty($advertisement_local))) { ?>
		<p id="loader_page"><img src="catalog/view/theme/default/image/ajax_loader.gif"></p>
	    <?php } ?>
      </div>
   </div>
</div>
<!--<div class="col-sm-3 right-banner-ad center">
   <a href="" ><img src="image/right-banner.png" class="img-responsive" title="real-estae" alt="real-estae"></a>
   </div>-->
</div>
<script>
   

	
   $(".chosen-select").chosen();
	
</script>
<script>
	
	var tabs = new Array();
	var tab_id = '';
	var id = '';
	var count = ''; 
	var timeout;	
	var tabpane_position = $("#home");//.position();
	$(".tab-pane").on("mousemove", function (e) {
		 var offset = $(".tab-pane").offset();
	  clearTimeout(timeout);
	  timeout = setTimeout(function(){
		var tabs = $('.nav-tabs > li'),
		active = tabs.filter('.active'),
		next = active.next('li'),
		toClick = next.length ? next.find('a') : tabs.eq(0).find('a');		
			toClick.trigger('click');
			$(".tab-pane").trigger('mousemove');
		}, 5000);	    
	});
	

	$(document).ready(function(){
		$(".tab-pane").trigger('mousemove');
	});
	
	/*var mousemove = true;	
	$(".tab-pane").mousemove(function(event){
		mousemove = false;		
	});	
	
	var tabCarousel = setInterval(function() {
	       var tabs = $('.nav-tabs > li'),
		active = tabs.filter('.active'),
		next = active.next('li'),
		toClick = next.length ? next.find('a') : tabs.eq(0).find('a');	
		alert(mousemove);
		if(mousemove == true) { alert(mousemove);
			toClick.trigger('click');
		}
	 }, 6000);*/
	

	$(document).ready(function(){
             $(".home-search").click(function(){
			var path = $( "#path" ).val();
			var search = $( "#searcha" ).val();
			var by_search = $( "#by_search" ).val();
         	window.location.href = "index.php?route=seller/seller&path="+path+"&searcha="+search+"&by_search="+by_search;
             });
	     $('#path').on('change', function() {
			var path = $( "#path" ).val();
         	window.location.href = "index.php?route=common/home&path="+path;
             });
	  });	  

	  
	var is_loading = false; 
	var limit = 6; // limit items per page	
	 
	tab_id = 'home';
	var id = national_adv_id;
	var count = count_na;

	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		var target = $(e.target).attr("href") // activated tab		
		target = target.replace('#','');
		tab_id = target;
		id = $("#"+tab_id+" div:first-child").attr("id");
		count = $("#"+tab_id+" div.advertise_count").length;
                is_loading = false;
		//alert(tab_id+','+id+','+count);
	});
	
	$('#adv_home,#adv_home,#adv_home,#adv_home').click(function (e) {
		var target = $(e.target).attr("href") // activated tab		
		target = target.replace('#','');
		tab_id = target;
		id = $("#"+tab_id+" div:first-child").attr("id");
		count = $("#"+tab_id+" div.advertise_count").length;
                is_loading = false;
		//alert(tab_id+','+id+','+count);
	});
	

	$(function() {			 
		$(window).scroll(function() {
		if(tab_id) {
			if (is_loading == false) { 					
				if($(window).scrollTop() + $(window).height() >= $(document).height() - 300) {
					is_loading = true;
					$('#loader_page').show(); 
					$.ajax({
					    url: "index.php?route=common/home/getLoadMore&tab_id="+tab_id+"&id="+id+"&count="+count,
					    type: 'GET',
					    //data: {last_id:last_id, limit:limit, search_option1: search_option1, search_option: search_option, search_value: search_value, category: categoryUrl, sub_category: sub_categoryUrl, country_id: countryUrl, city_id: cityUrl, location: areaUrl, address: addressUrl, map: $('#map').val()},
					    success:function(data){	
						var str = $.trim(data);
						if(str == 'no_record_found') {
							$('#loader_page').hide();
							is_loading = true;
							count = '';
							tab_id = '';
							id = '';
						} else {
							$('#loader_page').hide();							
							$('#'+tab_id).append(data);										
													
							is_loading = false;						
						}
					    }
					});
				}
			}			
			//is_loading = true;
		} else {			
			return false;			
		}
		});		
		
	});	

	
</script>
</body>
</html>