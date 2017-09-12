

<?php echo $header; ?>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   $( function() {
     var availableTags = <?php //echo $auto_search_home; ?>
     $( "#search_val" ).autocomplete({
       source: availableTags
     });
   } );
</script>

<style>
.dropbtn {
    /*background-color: #4CAF50;
    color: white;*/
    padding: 16px;
    font-size: 10px;
    border: none;
    cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #3e8e41;
}
#myInput {
    border-box: box-sizing;
    background-image: url('searchicon.png');
    background-position: 14px 12px;
    background-repeat: no-repeat;
    font-size: 16px;
    padding: 14px 20px 12px 45px;
    border: none;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f6f6f6;
    min-width: 230px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #ddd}

.show {display:block;}
</style>
<div class="dropdown">
<button onclick="myFunction()" class="dropbtn"><img src="image/books.png"></button>
 <div id="myDropdown" class="dropdown-content">
    <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
	<?php foreach ($categories as $category) { 
	 // href="#<?php echo $category['category_id']; ?>" $selected = ($category['category_id'] == $path) ? "selected = selected" : ""; ?>
	<a data-id="<?php echo $category['category_id']; ?>" onclick="pathChange(this)"><?php echo $category['name']; ?></a>
	<?php } ?>
    <!-- <a href="#about">About</a>
    <a href="#base">Base</a>
    <a href="#blog">Blog</a>
    <a href="#contact">Contact</a>
    <a href="#custom">Custom</a>
    <a href="#support">Support</a>
    <a href="#tools">Tools</a> -->
  </div>
  </div>
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
<style>


</style>
<div class="col-sm-12 category-center">
   <div class="sel-cat-home">
      <div id="search" class="input-group input-groupnew12">
         <form action="<?php echo $search_pst; ?>">
            <?php
               $path = (isset($_GET['path']) && $_GET['path']) ? $_GET['path']: '';
               ?>
			   <div class="col-md-2 allcategory_col">
            <select name="path" id="path" >
               <option value="">All Category</option>
               <?php foreach ($categories as $category) { 
                  $selected = ($category['category_id'] == $path) ? "selected = selected" : ""; ?>
               <option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?>><?php echo $category['name']; ?></option>
               <?php } ?>
            </select>
			
			</div>
			 <div class="col-md-2 allcategory_col">
            <select name="by_search" id="by_search" >
               <option value="1">By All</option>
               <option value="2">By Category</option>
               <option value="3">By Store/Entity</option>
               <option value="4">By Product</option>
            </select>
				</div>
				 <div class="col-md-8 search_col">
            <div class="form-group">
				<div class="cols-sm-10">
					<div class="input-group">
						
						<input type="text" class="form-control" name="search" id="search_val"  placeholder="Search"/>
						<span class="input-group-addon home-search"><i class="fa fa-search fa" aria-hidden="true"></i></span>
					</div>
				</div>
			</div>

			</div>
           <!-- <span class="input-group-btn">
            <button type="button" class="btn home-search btn-default"><i class="fa fa-search"></i></button>	
            </span> -->
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
      function getAddress1($latitude,$longitude){
      if(!empty($latitude) && !empty($longitude)){
      $add_loc = array();
      //Send request and receive json data by address
      $geocodeFromLatLong = file_get_contents('https://maps.googleapis.com/maps/api/geocode/json?latlng='.trim($latitude).','.trim($longitude).'&sensor=false'); 
      $data = json_decode($geocodeFromLatLong);
      $add_array  = $data->results;
      if(isset($add_array) && !empty($add_array)) {
	      $add_array = $add_array[0];
	      $add_array = $add_array->address_components;		
	      //echo "<pre>";print_r($add_array);
	      foreach ($add_array as $key) {
	      if($key->types[0] == 'political') {
	      if($key->types[2] == 'sublocality_level_1') { $add_loc['local_address'] = $key->long_name; }
	      }
	      if($key->types[0] == 'administrative_area_level_2')
	      {
	      $add_loc['city_address'] = $key->long_name;
	      }
	      if($key->types[0] == 'administrative_area_level_1')
	      {
	      $add_loc['state_address'] = $key->long_name;
	      }
	      if($key->types[0] == 'country')
	      {
	      $add_loc['country_address'] = $key->long_name;
	      }
	      }
       }
      if(!empty($add_loc)){
      return $add_loc;		   
      }else{
      return false;
      }
      }else{
      return false;   
      }
      }
      
      
      $add_loc = getAddress1($latitude,$longitude);
      //print_r($add_loc);	
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
         <?php if($address_det[3] !='') {?>
         <li id="adv_home" class="tas_bon active" role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><?php echo $address_det[3]; ?></a></li>
         <?php } if($address_det[2] !='') {?>
         <li id="adv_profile" class="tas_bon" role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><?php echo $address_det[2]; ?></a></li>
         <?php } if($address_det[1] !='') {?>
         <li id="adv_messages" class="tas_bon" role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><?php echo $address_det[1]; ?></a></li>
         <?php } ?>
         <li id="adv_settings" class="tas_bon" role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab"><?php echo 'Local';//$address_det[0]; ?></a></li>
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
                        <a class="info view-det-adv" data-id="<?php echo $advertisement_na['advertise_id']; ?>" onclick="viewDetAdv(this);">link here</a>			
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
                        <a class="info view-det-adv" data-id="<?php echo $advertisement_st['advertise_id']; ?>" onclick="viewDetAdv(this);">link here</a>
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
                        <a class="info view-det-adv" data-id="<?php echo $advertisement_ci['advertise_id']; ?>" onclick="viewDetAdv(this);">link here</a>
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
                        <a class="info view-det-adv" data-id="<?php echo $advertisement_lo['advertise_id']; ?>" onclick="viewDetAdv(this);" >link here</a>
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
<div class="modal fade" id="ad_details" role="dialog">
 <div class="modal-dialog">
	<div class="modal-content loc-pop">
	   <div class="modal-header">
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
		  <h4 class="modal-title loc-share-title">Advertise Details</h4>
	   </div>
	   <div class="modal-body loc-share-top" id=ad_det_id>   
	   </div>
	</div>
 </div>
</div>
<script>
   $(".chosen-select").chosen();
</script>
<script>
function viewDetAdv(val) {
 //$('a.view-det-adv').on('click', function() {
 var data_id = $(val).data('id');
 $.ajax({
	url: 'index.php?route=selleradvertise/advertise/get_single_advertise',
	type: 'post',
	dataType: 'json',
	data: {data_id: data_id},
	success: function(json) {
		var img = json['offer_image_original'];
		var str_lnk = 'index.php?route=seller/seller/info&seller_id='+json['seller_id']+'&path=&counter=1';
		if (json['success']) {
			if(json['advertise_id']) {
				$('#ad_det_id').html('<h3>'+json['offer_title']+'</h3><img src=\"image/'+img+'\" alt=\"'+json['offer_title']+'\" class=\"img-thumbnail img-responsive\" /><p>'+json['offer_desc']+'</p><p>'+json['offer_url']+'</p><a href=\"'+str_lnk+'\">Store</a>');
         		}
			$('#ad_details').modal('toggle');
			
		}
	}
 }); }
 //});   
</script>
<script>
   var tabs = new Array();
   var path = '';
   var seconds_time = 5000;
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
		var r = (-0.5)+(Math.random()*(1000.99));
		 //alert('before'+r);
   		$(".tab-pane").trigger('mousemove');
   	}, seconds_time);
	//alert('after'+timeout);
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
   	//alert(mousemove);
   	if(mousemove == true) { //alert(mousemove);
   		toClick.trigger('click');
   	}
    }, 6000);*/
   
   
  function pathChange(path) { //$('#path').on('change', function() {
    //path = $( "#path" ).val();
    $('.nav-tabs li.active').removeClass('active');
    $('.tab-content div.tab-pane').removeClass('active');	     
    $('.nav-tabs li#adv_settings').addClass('active');
    $('.tab-content div#settings').addClass('active');
   //window.location.href = "index.php?route=common/home&path="+path;
    MakeUrl(path, tab_id);
}//);
$(".home-search").click(function(){
	path = $( "#path" ).val();
	var search = $( "#search_val" ).val();
	var by_search = $( "#by_search" ).val();
	window.location.href = "index.php?route=seller/seller&path="+path+"&searcha="+search+"&by_search="+by_search;
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
	MakeUrl(path, tab_id);
   });
   
   $('#adv_home,#adv_home,#adv_home,#adv_home').click(function (e) {
   	var target = $(e.target).attr("href") // activated tab		
   	target = target.replace('#','');
   	tab_id = target;
   	id = $("#"+tab_id+" div:first-child").attr("id");
   	count = $("#"+tab_id+" div.advertise_count").length;
                  is_loading = false;
   	//alert(tab_id+','+id+','+count);
	MakeUrl(path, tab_id);
   });

   function MakeUrl(path, tab_id) { 
	var limit = 4;
	if(tab_id =='') {
		tab_id = 'settings';
	}
	is_loading = true;
	count = 0;
	$.ajax({
		url: "index.php?route=common/home/getLoadMore&path="+path+"&tab_id="+tab_id+"&id="+id+"&count="+count,
		type: 'GET',
		 success:function(data){
			$('#'+tab_id).empty();
			var str = $.trim(data);
			if(str == 'no_record_found') { 
				$('#loader_page').hide();
				$('#'+tab_id).append('<p>No Advertisement Yet...</p>');	
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
   
   
   $(function() {
	$("html, body").animate({ scrollTop: 0 }, "fast");
   	$(window).scroll(function() {
   	if(tab_id) {
   		if (is_loading == false) { 					
   			if($(window).scrollTop() + $(window).height() >= $(document).height() - 300) {
   				is_loading = true;
   				$('#loader_page').show(); 
   				$.ajax({
   				    url: "index.php?route=common/home/getLoadMore&path="+path+"&tab_id="+tab_id+"&id="+id+"&count="+count,
   				    type: 'GET',
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
	function myFunction() {
	    var dropbtn_class = $('.dropdown-content').attr('class');
	    if(dropbtn_class == 'dropdown-content') {
	    $('.dropbtn').empty();
	     $('.dropbtn').append('<img src="image/open-book.png" />');	     
	    } else { 
	     $('.dropbtn').empty();
	     $('.dropbtn').append('<img src="image/books.png" />');	
	    }
	    document.getElementById("myDropdown").classList.toggle("show");
	}

	function filterFunction() {
	    
	    var input, filter, ul, li, a, i;
	    input = document.getElementById("myInput");
	    filter = input.value.toUpperCase();
	    div = document.getElementById("myDropdown");
	    a = div.getElementsByTagName("a");
	    for (i = 0; i < a.length; i++) {
		if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
		    a[i].style.display = "";
		} else {
		    a[i].style.display = "none";
		}
	    }  
	}
   
</script>
</body>
</html>

