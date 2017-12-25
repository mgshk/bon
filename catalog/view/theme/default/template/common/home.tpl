<?php echo $header; ?>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery.slimscroll.js"></script>
<script>
	$(function () {

		var availableTags = <?php //echo $auto_search_home; ?>
	  $("#search_val").autocomplete({
				source: availableTags
			});
	});

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

	.dropbtn:hover,
	.dropbtn:focus {
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
		box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
		z-index: 1;
	}

	.dropdown-content a {
		color: black;
		padding: 12px 16px;
		text-decoration: none;
		display: block;
	}

	.dropdown a:hover {
		background-color: #ddd
	}

	.show {
		display: block;
	}

	.view_desc_sl {
		border-top: 1px solid #bbbbbb;
	}
</style>
<style>
	/*
	.dropdowns-ss {
		background: url(image/all-categories.jpg) no-repeat scroll 0px 0px transparent;
		color: transparent !important;
		border: 1px solid #fff;
		height: 43px;
	}
	*/
	#search_val {
		border-top-left-radius: 0;
		border-bottom-left-radius: 0;
	}
</style>
<!--<div class="dropdown">
	<button onclick="myFunction()" class="dropbtn"><img src="image/books.png"></button>
	<div id="myDropdown" class="dropdown-content">
		<input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
		<?php foreach ($categories as $category) { ?>
			<a data-id="<?php echo $category['category_id']; ?>" onclick="pathChange(this);"><?php echo $category['name']; ?></a>
		<?php } ?>	    
	</div>
	</div>-->
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-9 header-ad">
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
							<div class="hovereffect fis-des">

								<?php if(file_exists("image/".$advertisement_top['offer_image'])){ ?>
								<img src="<?php echo $image_resize->resize($advertisement_top['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_top['offer_title']; ?>"
								 alt="<?php echo $advertisement_top['offer_title']; ?>">
								<?php } else { echo $advertisement_top['offer_image'];?>

								<img src="image/adv_default_image.jpg" class="img-responsive" title="<?php echo $advertisement_top['offer_title']; ?>" alt="<?php echo $advertisement_top['offer_title']; ?>">
								<?php } ?>
								<div class="overlay">
									<div class="carousel-caption">
										<div class="col-sm-12">
											<h2 class="advertise_title">
												<?php echo $advertisement_top['offer_title']; ?>
											</h2>
										</div>
										<a class="info hmg--sel ne--str view-det-adv" href="index.php?route=seller/seller/info&seller_id=<?php echo $advertisement_top['seller_id']; ?>&path=&counter=1"><img src="image/store_front.png" class="img-responsive"></a>
										<a class="info hmg--sel ne--opn view-det-adv cursor" data-id="<?php echo $advertisement_top['advertise_id']; ?>" onclick="viewDetAdv(this);"><i class="fa fa-arrows-alt"></i></a>
									</div>
								</div>
							</div>
							<div class="sec-mob">
								<a class="info view-det-adv" data-id="<?php echo $advertisement_top['advertise_id']; ?>" onclick="viewDetAdv(this);">
								<img src="<?php echo $image_resize->resize($advertisement_top['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_top['offer_title']; ?>" alt="<?php echo $advertisement_top['offer_title']; ?>">
							</a>
							</div>
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
						<img src="image/header-img.png" class="img-responsive" alt="header-ad">
						<div class="carousel-caption">
							<h3></h3>
							<!--<a class="info" href="<?php echo $advertisement_na['offer_url']; ?>">link here</a>-->
						</div>
					</div>
				</div>
			</div>
			<?php }?>
		</div>
		<div class="col-sm-3 home_faq_scroll">
			<marquee behavior="scroll" direction="up" onmouseover="stop();"  onmouseout="start();" scrollamount="1" height="112" width="100%" style="color:#999999;font-size: 12px">
				<u>FAQ</br></br>
				<a href="index.php?route=common/faq&qn=1" title="FAQ" style="color:#545454">1.	What is the purpose and uniqueness of this website?</br></a>
				<a href="index.php?route=common/faq&qn=2" title="FAQ" style="color:#545454">2.	Why BoN, what is the need?</br></a>
				<a href="index.php?route=common/faq&qn=3" title="FAQ" style="color:#545454">3.	As a seller how this website helps?</br></a>
				<a href="index.php?route=common/faq&qn=4" title="FAQ" style="color:#545454">4.	As a buyer how this website helps?</br></a>
				<a href="index.php?route=common/faq&qn=5" title="FAQ" style="color:#545454">5.	Being a Buyer can I use Seller feature or vice versa?</br></a>
				<a href="index.php?route=common/faq&qn=6" title="FAQ" style="color:#545454">6.	How is BoN good to both sellers and buyers?</br></a>
				<a href="index.php?route=common/faq&qn=7" title="FAQ" style="color:#545454">7.	I am a seller, is there usability restriction for any type of business?</br></a>
				<a href="index.php?route=common/faq&qn=8" title="FAQ" style="color:#545454">8.	Sellers nearby my place do not use BoN, can I wait for someone to join before me?</br></a>
				<a href="index.php?route=common/faq&qn=9" title="FAQ" style="color:#545454">9.	I am a store/entity owner (seller), how do I get mine added in the website?</br></a>
				<a href="index.php?route=common/faq&qn=10" title="FAQ" style="color:#545454">10.	If I want to buy something how do I go about it?</br></a>
				<a href="index.php?route=common/faq&qn=11" title="FAQ" style="color:#545454">11.	I do not see any stores around me in the website?</br></a>
				<a href="index.php?route=common/faq&qn=12" title="FAQ" style="color:#545454">12.	Do you charge one time or monthly fees to register my store?</br></a>
				<a href="index.php?route=common/faq&qn=13" title="FAQ" style="color:#545454">13.	Heard I can upload products or post advertisements for free in your website, is it true?</br></a>
				<a href="index.php?route=common/faq&qn=14" title="FAQ" style="color:#545454">14.	I think ideally this is the best approach but how are you going to get all stores added in your website?</br></a>
				<a href="index.php?route=common/faq&qn=15" title="FAQ" style="color:#545454">15.	If I have a feedback or get into any issues, whom or how should I contact?</br></a>
				<a href="index.php?route=common/faq&qn=16" title="FAQ" style="color:#545454">16.	Why the advertisement I posted is of low image quality (blurred)?</br></a>
				<a href="index.php?route=common/faq&qn=17" title="FAQ" style="color:#545454">17.	When do I get to use My Wallet/Pay/Expense Report feature?</br></a>
				<a href="index.php?route=common/faq&qn=18" title="FAQ" style="color:#545454">18.	Is there any other future improvements/plans you have?</br></a>
				<a href="index.php?route=common/faq&qn=19" title="FAQ" style="color:#545454">19.	Does BoN website work in all browsers?</br></a>
			</marquee>
		</div>
	</div>
</div>
<div class="container-fluid" id="fix_height">
	<div class="row">
		<div class="col-sm-9 category-center">
			<div class="fixme" style="z-index:123">
				<div class="sel-cat-home">
					<div id="search" class="input-group input-groupnew12">
						<form action="<?php echo $search_pst; ?>">
							<?php
								$path = (isset($_GET['path']) && $_GET['path']) ? $_GET['path']: '';
								?>
								<div class="col-md-2 col-xs-2 allcategory_col" title="Choose the category you want to filter from below advertisements or to search stores/entities around you." style="padding-left: 0px; width: 25%">
									<select name="path" id="path" onchange="pathChange(this);">
									<option value="">All Category</option>
									<?php foreach ($categories as $category) { 
										$selected = ($category['category_id'] == $path) ? "selected = selected" : ""; ?>
									<option value="<?php echo $category['category_id']; ?>" <?php echo $selected; ?>><?php echo $category['name']; ?></option>
									<?php } ?>
								</select>
								</div>
								<div hidden class="col-md-2 col-xs-3 allcategory_col">
									<select selected name="by_search" id="by_search">
									<option selected value="1">By All</option>
									<option value="2">By Category</option>
									<option value="3">By Store/Entity</option>
									<option value="4">By Product</option>
								</select>
								</div>
								<div class="col-md-10 col-xs-9 search_col" style="width:75%">
									<div class="form-group">
										<div class="cols-sm-10">
											<div class="input-group">
												<input type="text" class="form-control" name="search" id="search_val" placeholder="Search" />
												<span class="input-group-addon home-search cursor"><i class="fa fa-search fa" aria-hidden="true"></i></span>
											</div>
										</div>
									</div>
								</div>
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
							$geocodeFromLatLong = file_get_contents('https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCXvDvmhFTLZ5iJyGSQm3-3GEJg0G3iztk&latlng='.trim($latitude).','.trim($longitude).'&sensor=false'); 
							$data = json_decode($geocodeFromLatLong);
							$add_array  = $data->results;
							if(isset($add_array) && !empty($add_array)) {
								$add_array = $add_array[0];
								$add_array = $add_array->address_components;		
								//echo "<pre>";print_r($add_array);
								foreach ($add_array as $key) {
									if($key->types[0] == 'political') {
										if($key->types[2] == 'sublocality_level_1') { 
											$add_loc['local_address'] = $key->long_name; 
										}
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
					//print_r(isset$_COOKIE['myCookieend']);   
					
					if (isset($country_det)) { $address_det = explode(',', $country_det); } ?>
				<!--<div class="card hom--pg fixmee-st">-->
				<div class="_home_tab--sel--main">
					<ul class="_bon_ts1 fis-des">
						<?php if ($logged && $login_type != 'buyer') { ?>
						<a href="index.php?route=selleradvertise/advertise/add">
							<li class="tas_bon" role="presentation" title="Seller: Post new advertisement of your store/entity.">Post AD</li>
						</a>
						<?php } else { ?>
						<a class="cursor" data-toggle="modal" data-target="#login_frc_seller">
							<li class="tas_bon" role="presentation" title="Seller: Post new advertisement of your store/entity.">Post AD</li>
						</a>
						<?php } ?>
					</ul>
					<ul class="nav nav-tabs _bon_ts _bon_ts_home" role="tablist">
						<?php if($address_det[3] !='') {?>
						<li id="adv_home" class="tas_bon" role="presentation" title="Advertisements published for the whole country from the address you set.">
							<a href="#home" aria-controls="home" role="tab" data-toggle="tab">
								<?php echo $address_det[3]; ?>
							</a>
						</li>
						<?php } if($address_det[2] !='') {?>
						<li id="adv_profile" class="tas_bon" role="presentation" title="Advertisements pubished for the state from the address you set.">
							<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">
								<?php echo $address_det[2]; ?>
							</a>
						</li>
						<?php } if($address_det[1] !='') {?>
						<li id="adv_messages" class="tas_bon" role="presentation" title="Advertisements published for the city/district from the address you set.">
							<a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">
								<?php if ((trim($address_det[1]) == 'Yanam') || (trim($address_det[1]) == 'yanam')) { ?><?php echo 'Pondicherry'; ?><?php } else { ?><?php echo $address_det[1]; ?><?php } ?>
							</a>
						</li>
						<?php } ?>
						<li id="adv_settings" class="tas_bon active" role="presentation" title="Advertisements published within the range you set around you."><a href="#settings" aria-controls="settings" id="setting_tab" role="tab" data-toggle="tab"><?php echo 'Nearby ';if(isset($_COOKIE['myCookiestart']) || isset($_COOKIE['myCookieend'])){echo '<span>('.$_COOKIE['myCookiestart']. '-' .$_COOKIE['myCookieend'].' km)</span>';} else {echo '<span>(0-3 km)</span>';}//$address_det[0]; ?></a></li>
					</ul>
				</div>
			</div>
			<!-- Tab panes -->
			<div class="tab-content home-tt-r">
				<div role="tabpanel" class="tab-pane" id="home">
					<div class="col-sm-12">
						<div class="row">
							<p>Post your advertisement here, entire
								<?php if ($logged && $login_type != 'buyer') { ?>
								<a href="index.php?route=selleradvertise/advertise/add">
									<u>country</u>
								</a>
								<?php }else{ ?>
								<a class="cursor" data-toggle="modal" data-target="#login_frc_seller">
									<u>country</u>
								</a>
								<?php } ?> is waiting...</p>
						</div>
					</div>
					<span id="home_content">
						<?php if(count($advertisement_national) > 0) {
							foreach($advertisement_national as $advertisement_na) { ?>
						<div class="col-sm-12 advertise_count" id="<?php echo $advertisement_na['advertise_id']; ?>">
							<div class="row">
								<div class="hovereffect fis-des">
								<?php if(file_exists("image/".$advertisement_na['offer_image'])){ ?>
									<img src="<?php echo $image_resize->resize($advertisement_na['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_na['offer_title']; ?>"
									alt="<?php echo $advertisement_na['offer_title']; ?>">
								<?php } else { ?>
									 <img src="image/adv_default_image.jpg" class="img-responsive" title="<?php echo $advertisement_na['offer_title']; ?>"
									alt="<?php echo $advertisement_na['offer_title']; ?>">
								 <?php } ?>
									<div class="overlay">
										<div class="col-sm-12">
											<div class="col-sm-9">
												<h2 class="store_name">
													<?php echo $advertisement_na['nickname']; ?>
												</h2>
											</div>
											<div class="col-sm-3">
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
											<h2 class="advertise_title">
												<?php echo $advertisement_na['offer_title']; ?>
											</h2>
										</div>
										<a class="info hmg--sel ne--str view-det-adv" href="index.php?route=seller/seller/info&seller_id=<?php echo $advertisement_na['seller_id']; ?>&path=&counter=1"><img src="image/store_front.png" class="img-responsive"></a>
										<a class="info hmg--sel ne--opn view-det-adv cursor" data-id="<?php echo $advertisement_na['advertise_id']; ?>" onclick="viewDetAdv(this);"><i class="fa fa-arrows-alt"></i></a>
									</div>
									<?php if((isset($advertisement_na['filtered']) && $advertisement_na['filtered'] =='1') ? $advertisement_na['filtered'] : '') { ?>
									<div class="col-sm-1 filtered_ads">
										<?php echo "Filtered"; ?>
									</div>
									<?php } ?>
								</div>
								<div class="sec-mob">
									<a class="info view-det-adv" data-id="<?php echo $advertisement_na['advertise_id']; ?>" onclick="viewDetAdv(this);">
										<img src="<?php echo $image_resize->resize($advertisement_na['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_na['offer_title']; ?>" alt="<?php echo $advertisement_na['offer_title']; ?>">
										<!--<div class="temp--mb">
											<span style="float: left;">
												<?php echo substr($advertisement_na['nickname'], 0, 20); ?>
											</span>
					<span class="sub-mb--st" style="float: right;">
												<?php for ($i = 1; $i <= 5; $i++) { ?>
												<?php if ($advertisement_na['rating'] < $i) { ?>
												<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
												<?php } else { ?>
												<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
												<?php } ?>
												<?php } ?>
											</span>
				</div>-->
				<?php if((isset($advertisement_na['filtered']) && $advertisement_na['filtered'] =='1') ? $advertisement_na['filtered'] : '') { ?>
				<div class="col-sm-1 filtered_ads">
					<?php echo "Filtered"; ?>
				</div>
				<?php } ?>
				</a>
			</div>
		</div>
	</div>
	<?php $count_na = count($advertisement_national); ?>
	<script>
		var national_adv_id = "<?php echo $advertisement_na['advertise_id']; ?>"; var count_na = "<?php echo $count_na; ?>";
	</script>
	<?php } }  ?>
	</span>
</div>
<div role="tabpanel" class="tab-pane" id="profile">
	<div class="col-sm-12">
		<div class="row">
			<p>Post your advertisement here, entire
				<?php if ($logged && $login_type != 'buyer') { ?>
				<a href="index.php?route=selleradvertise/advertise/add">
					<u>state</u>
				</a>
				<?php }else{ ?>
				<a class="cursor" data-toggle="modal" data-target="#login_frc_seller">
					<u>state</u>
				</a>
				<?php } ?> is waiting...</p>
		</div>
	</div>
	<span id="profile_content">
						<?php if(count($advertisement_state) > 0) {
							foreach($advertisement_state as $advertisement_st) { ?>
						<div class="col-sm-12 advertise_count" id="<?php echo $advertisement_st['advertise_id']; ?>">
							<div class="row">
								<div class="hovereffect fis-des">
									<?php if(file_exists("image/".$advertisement_st['offer_image'])){ ?>
										<img src="<?php echo $image_resize->resize($advertisement_st['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_st['offer_title']; ?>"
										alt="<?php echo $advertisement_st['offer_title']; ?>">
									<?php } else { ?>
										<img src="image/adv_default_image.jpg" class="img-responsive" title="<?php echo $advertisement_st['offer_title']; ?>"
										alt="<?php echo $advertisement_st['offer_title']; ?>">
									<?php } ?>
									<div class="overlay">
										<div class="col-sm-12">
											<div class="col-sm-9">
												<h2 class="store_name">
													<?php echo $advertisement_st['nickname']; ?>
												</h2>
											</div>
											<div class="col-sm-3">
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
											<h2 class="advertise_title">
												<?php echo $advertisement_st['offer_title']; ?>
											</h2>
										</div>
										<a class="info hmg--sel ne--str view-det-adv" href="index.php?route=seller/seller/info&seller_id=<?php echo $advertisement_st['seller_id']; ?>&path=&counter=1"><img src="image/store_front.png" class="img-responsive"></a>
										<a class="info hmg--sel ne--opn view-det-adv cursor" data-id="<?php echo $advertisement_st['advertise_id']; ?>" onclick="viewDetAdv(this);"><i class="fa fa-arrows-alt"></i></a>
									</div>
									<?php if((isset($advertisement_st['filtered']) && $advertisement_st['filtered'] =='1') ? $advertisement_st['filtered'] : '') { ?>
									<div class="col-sm-1 filtered_ads">
										<?php echo "Filtered"; ?>
									</div>
									<?php } ?>
								</div>
								<div class="sec-mob">
									<a class="info view-det-adv" data-id="<?php echo $advertisement_st['advertise_id']; ?>" onclick="viewDetAdv(this);">
										<img src="<?php echo $image_resize->resize($advertisement_st['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_st['offer_title']; ?>" alt="<?php echo $advertisement_st['offer_title']; ?>">
										<!--<div class="temp--mb">
											<span style="float: left;">
												<?php echo substr($advertisement_st['nickname'], 0, 20); ?>
											</span>
	<span class="sub-mb--st" style="float: right;">
												<?php for ($i = 1; $i <= 5; $i++) { ?>
												<?php if ($advertisement_st['rating'] < $i) { ?>
												<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
												<?php } else { ?>
												<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
												<?php } ?>
												<?php } ?>
											</span>
</div>-->
<?php if((isset($advertisement_st['filtered']) && $advertisement_st['filtered'] =='1') ? $advertisement_st['filtered'] : '') { ?>
<div class="col-sm-1 filtered_ads">
	<?php echo "Filtered"; ?>
</div>
<?php } ?>
</a>
</div>
</div>
</div>
<?php $count_st = count($advertisement_state); ?>
<script>
		var state_adv_id = "<?php echo $advertisement_st['advertise_id']; ?>"; var count_st = "<?php echo $count_st; ?>";
</script>
<?php } }  ?>
</span>
</div>
<div role="tabpanel" class="tab-pane" id="messages">
	<div class="col-sm-12">
		<div class="row">
			<p>Post your advertisement here, entire
				<?php if ($logged && $login_type != 'buyer') { ?>
				<a href="index.php?route=selleradvertise/advertise/add">
					<u>city/district</u>
				</a>
				<?php }else{ ?>
				<a class="cursor" data-toggle="modal" data-target="#login_frc_seller">
					<u>city/district</u>
				</a>
				<?php } ?> is waiting...</p>
		</div>
	</div>
	<span id="messages_content">
						<?php if(count($advertisement_city) > 0) {
							foreach($advertisement_city as $advertisement_ci) { ?>
						<div class="col-sm-12 advertise_count" id="<?php echo $advertisement_ci['advertise_id']; ?>">
							<div class="row">
								<div class="hovereffect fis-des">
									<?php if(file_exists("image/".$advertisement_ci['offer_image'])){ ?>
										<img src="<?php echo $image_resize->resize($advertisement_ci['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_ci['offer_title']; ?>"
										alt="<?php echo $advertisement_ci['offer_title']; ?>">
									<?php } else { ?>
										<img src="image/adv_default_image.jpg" class="img-responsive" title="<?php echo $advertisement_ci['offer_title']; ?>"
										alt="<?php echo $advertisement_ci['offer_title']; ?>">
									<?php } ?>
									<div class="overlay">
										<div class="col-sm-12">
											<div class="col-sm-9">
												<h2 class="store_name">
													<?php echo $advertisement_ci['nickname']; ?>
												</h2>
											</div>
											<div class="col-sm-3">
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
											<h2 class="advertise_title">
												<?php echo $advertisement_ci['offer_title']; ?>
											</h2>
										</div>
										<a class="info hmg--sel ne--str view-det-adv" href="index.php?route=seller/seller/info&seller_id=<?php echo $advertisement_ci['seller_id']; ?>&path=&counter=1"><img src="image/store_front.png" class="img-responsive"></a>
										<a class="info hmg--sel ne--opn view-det-adv cursor" data-id="<?php echo $advertisement_ci['advertise_id']; ?>" onclick="viewDetAdv(this);"><i class="fa fa-arrows-alt"></i></a>
									</div>
									<?php if((isset($advertisement_ci['filtered']) && $advertisement_ci['filtered'] =='1') ? $advertisement_ci['filtered'] : '') { ?>
									<div class="col-sm-1 filtered_ads">
										<?php echo "Filtered"; ?>
									</div>
									<?php } ?>
								</div>
								<div class="sec-mob">
									<a class="info view-det-adv" data-id="<?php echo $advertisement_ci['advertise_id']; ?>" onclick="viewDetAdv(this);">
										<img src="<?php echo $image_resize->resize($advertisement_ci['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_ci['offer_title']; ?>" alt="<?php echo $advertisement_ci['offer_title']; ?>">
										<!--<div class="temp--mb">
											<span style="float: left;">
												<?php echo substr($advertisement_ci['nickname'], 0, 20); ?>
											</span>
	<span class="sub-mb--st" style="float: right;">
												<?php for ($i = 1; $i <= 5; $i++) { ?>
												<?php if ($advertisement_ci['rating'] < $i) { ?>
												<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
												<?php } else { ?>
												<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
												<?php } ?>
												<?php } ?>
											</span>
</div>-->
<?php if((isset($advertisement_ci['filtered']) && $advertisement_ci['filtered'] =='1') ? $advertisement_ci['filtered'] : '') { ?>
<div class="col-sm-1 filtered_ads">
	<?php echo "Filtered"; ?>
</div>
<?php } ?>
</a>
</div>
</div>
</div>
<?php $count_ct = count($advertisement_city); ?>
<script>
	var city_adv_id = "<?php echo $advertisement_ci['advertise_id']; ?>"; var count_ct = "<?php echo $count_ct; ?>";
</script>
<?php } }  ?>
</span>
</div>
<div role="tabpanel" class="tab-pane active" id="settings">
	<div class="col-sm-12">
		<div class="row">
			<p>Post your advertisement for
				<?php if ($logged && $login_type != 'buyer') { ?>
				<a href="index.php?route=selleradvertise/advertise/add">
					<u>free</u>
				</a>
				<?php }else{ ?>
				<a class="cursor" data-toggle="modal" data-target="#login_frc_seller">
					<u>free</u>
				</a>
				<?php } ?> here and let the buyers nearby see instantly...</p>
		</div>
	</div>
	<span id="settings_content">
						<?php if(count($advertisement_local) > 0 && !empty($advertisement_local)) {
							foreach($advertisement_local as $advertisement_lo) { ?>
						<div class="col-sm-12 advertise_count" id="<?php echo $advertisement_lo['advertise_id']; ?>">
							<div class="row">
								<div class="hovereffect fis-des">
									<?php if(file_exists("image/".$advertisement_lo['offer_image'])){ ?>
										<img src="<?php echo $image_resize->resize($advertisement_lo['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_lo['offer_title']; ?>"
										alt="<?php echo $advertisement_lo['offer_title']; ?>">
									<?php } else { ?>
										<img src="image/adv_default_image.jpg" class="img-responsive" title="<?php echo $advertisement_lo['offer_title']; ?>"
										alt="<?php echo $advertisement_lo['offer_title']; ?>">
									<?php } ?>
									<div class="overlay">
										<div class="col-sm-12">
											<div class="col-sm-9">
												<h2 class="store_name">
													<?php echo $advertisement_lo['nickname']; ?>
												</h2>
											</div>
											<div class="col-sm-3">
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
											<h2 class="advertise_title">
												<?php echo $advertisement_lo['offer_title']; ?>
											</h2>
										</div>
										<a class="info hmg--sel ne--str view-det-adv" href="index.php?route=seller/seller/info&seller_id=<?php echo $advertisement_lo['seller_id']; ?>&path=&counter=1"><img src="image/store_front.png" class="img-responsive"></a>
										<a class="info hmg--sel ne--opn view-det-adv cursor" data-id="<?php echo $advertisement_lo['advertise_id']; ?>" onclick="viewDetAdv(this);"><i class="fa fa-arrows-alt"></i></a>
									</div>
									<?php if((isset($advertisement_lo['filtered']) && $advertisement_lo['filtered'] =='1') ? $advertisement_lo['filtered'] : '') { ?>
									<div class="col-sm-1 filtered_ads">
										<?php echo "Filtered"; ?>
									</div>
									<?php } ?>
								</div>
								<div class="sec-mob">
									<a class="info view-det-adv" data-id="<?php echo $advertisement_lo['advertise_id']; ?>" onclick="viewDetAdv(this);">
										<img src="<?php echo $image_resize->resize($advertisement_lo['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_lo['offer_title']; ?>" alt="<?php echo $advertisement_lo['offer_title']; ?>">
										<!--<div class="temp--mb">
											<span style="float: left;">
												<?php echo substr($advertisement_lo['nickname'], 0, 20); ?>
											</span>
	<span class="sub-mb--st" style="float: right;">
												<?php for ($i = 1; $i <= 5; $i++) { ?>
												<?php if ($advertisement_lo['rating'] < $i) { ?>
												<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
												<?php } else { ?>
												<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
												<?php } ?>
												<?php } ?>
											</span>
</div>-->
<?php if((isset($advertisement_lo['filtered']) && $advertisement_lo['filtered'] =='1') ? $advertisement_lo['filtered'] : '') { ?>
<div class="col-sm-1 filtered_ads">
	<?php echo "Filtered"; ?>
</div>
<?php } ?>
</a>
</div>
</div>
</div>
<?php $count_lo = count($advertisement_local); ?>
<script>
	var local_adv_id = "<?php echo $advertisement_lo['advertise_id']; ?>"; var count_lo = "<?php echo $count_lo; ?>";
</script>
<?php } }  ?>
</span>
</div>
<?php if( (isset($advertisement_national) && !empty($advertisement_national)) || (isset($advertisement_state) && !empty($advertisement_state)) || (isset($advertisement_city) && !empty($advertisement_city)) || (isset($advertisement_local) && !empty($advertisement_local))) { ?>
<p id="loader_page" style="display:none;"><img src="catalog/view/theme/default/image/ajax_loader.gif"></p>
<?php } ?>
</div>
<!--</div>-->
</div>
<div class="col-sm-3 videos hidden-xs">
	<div class="hidden-xs">
				<iframe width="100%" height="100%" src="https://www.youtube.com/embed/3lkR8tqc5rE" 
				allowfullscreen="allowfullscreen"
        		mozallowfullscreen="mozallowfullscreen" 
        		msallowfullscreen="msallowfullscreen" 
        		oallowfullscreen="oallowfullscreen" 
        		webkitallowfullscreen="webkitallowfullscreen">
				</iframe>
			</div>
	<div class="hidden-xs" id="english_video">
		<iframe width="100%" height="120%" src="https://www.youtube.com/embed/obrwo0jtKCQ"
		allowfullscreen="allowfullscreen"
        mozallowfullscreen="mozallowfullscreen" 
        msallowfullscreen="msallowfullscreen" 
        oallowfullscreen="oallowfullscreen" 
        webkitallowfullscreen="webkitallowfullscreen">
		</iframe>
	</div>
	<div class="hidden-xs" id="tamil_video">
		<iframe width="100%" height="120%" src="https://www.youtube.com/embed/VRE2A1esNrU"
		allowfullscreen="allowfullscreen"
        mozallowfullscreen="mozallowfullscreen" 
        msallowfullscreen="msallowfullscreen" 
        oallowfullscreen="oallowfullscreen" 
        webkitallowfullscreen="webkitallowfullscreen">
		</iframe>
	</div>
</div>
<div class="modal fade" id="ad_details" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<!--h4 class="modal-title loc-share-title">Advertise Details</h4>-->
			</div>
			<div class="modal-body loc-share-topps" id="ad_det_id">
			</div>
		</div>
	</div>
</div>
<script>
	//$(".chosen-select").chosen();

</script>
<script>
	function viewDetAdv(val) {
		//$('a.view-det-adv').on('click', function() {
		var data_id = $(val).data('id');
		$.ajax({
			url: 'index.php?route=selleradvertise/advertise/get_single_advertise',
			type: 'post',
			dataType: 'json',
			data: { data_id: data_id },
			success: function (json) {
				var img = json['offer_image_original'];
				var str_lnk = 'index.php?route=seller/seller/info&seller_id=' + json['seller_id'] + '&path=&counter=1';
				if (json['success']) {
					if (json['advertise_id']) {
						$('#ad_det_id').html('<a href=\"' + str_lnk + '\"><h4><strong>' + json['nickname'] + '</strong></h4></a><h4><strong></strong>' + json['offer_title'] + '</h4><img src=\"image/' + img + '\" alt=\"' + json['offer_title'] + '\" class=\"img-thumbnail img-responsive\" onerror=\"this.onerror=null;this.src=\'image/adv_default_image.jpg\';\"/><p><strong></strong>' + json['offer_desc'] + '<p><strong></strong><a href=' + json['offer_url'] + '>' + json['offer_url'] + '</a></p><div class="view_desc_sl"><p>Terms & Conditions</p><p>- The advertisement provided by the "' + json['nickname'] + '" is true to best of their knowledge.</p><p>- BoN Online Services holds no responsibility of the advertisement information.</p></div>');
					}
					$('#ad_details').modal('toggle');

				}
			}
		});
	}
	 //});

</script>
<script>
	var tabs = new Array();
	var path = '';
	var seconds_time = 1000;
	var tab_id = '';
	var id = '';
	var count = '';
	var timeout;
	var tabpane_position = $("#home");//.position();

	var liArr = $.makeArray($('.nav-tabs li'));
	var tabPaneArr = $.makeArray($('.tab-pane'));
	var intervalTime = null;
	var intLevel = 0;

	var mTimer = null;
	var hTimer = null;

	changeTab();
	function changeTab() {
		intervalTime = setInterval(function () {
			$('.nav-tabs li, .tab-pane').removeClass('active');
			$(liArr[intLevel]).addClass('active');
			$(tabPaneArr[intLevel]).addClass('active');
			intLevel++;
			if (intLevel == 4)
				intLevel = 0;
		}, 5000);
	}


	function pathChange(val) { //$('#path').on('change', function() {
		path = $(val).val(); //alert(path); //$(val).data('id'); alert(path);
		$('.nav-tabs li.active').removeClass('active');
		$('.tab-content div.tab-pane').removeClass('active');
		$('.nav-tabs li#adv_settings').addClass('active');
		$('.tab-content div#settings').addClass('active');
		//changeTab();
		//window.location.href = "index.php?route=common/home&path="+path;
		MakeUrl(path, tab_id);
	}//);
	$(".home-search").click(function () {
		path = $("#path").val();
		var search = $("#search_val").val();
		var by_search = $("#by_search").val();
		window.location.href = "index.php?route=seller/seller&path=" + path + "&searcha=" + search + "&by_search=" + by_search;
	});


	var is_loading = false;
	var limit = 6; // limit items per page	

	tab_id = 'home';
	if (typeof (national_adv_id) != "undefined" && national_adv_id !== null) {
		var id = national_adv_id;
	}
	if (typeof (count_na) != "undefined" && count_na !== null) {
		var count = count_na;
	}


	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		var target = $(e.target).attr("href") // activated tab		
		target = target.replace('#', '');
		//alert(target);
		tab_id = target;
		id = $("#" + tab_id + " div:first-child").attr("id");
		count = $("#" + tab_id + " div.advertise_count").length;
		is_loading = false;
		//alert(tab_id+','+id+','+count); 
		MakeUrl(path, tab_id);
	});

	$('#adv_home,#adv_home,#adv_home,#adv_home').click(function (e) {
		var target = $(e.target).attr("href") // activated tab		
		target = target.replace('#', '');
		tab_id = target;
		id = $("#" + tab_id + " div:first-child").attr("id");
		count = $("#" + tab_id + " div.advertise_count").length;
		is_loading = false;
		//alert(tab_id+','+id+','+count);
		MakeUrl(path, tab_id);
	});

	function MakeUrl(path, tab_id) {
		var limit = 4;
		if (tab_id == '') {
			tab_id = 'settings';
		}
		if ((typeof ($.cookie('myCookiestart')) != "undefined" && $.cookie('myCookiestart') != '') && (typeof ($.cookie('myCookiestart')) != "undefined" && $.cookie('myCookieend') != '')) {
			$("#setting_tab").html('Nearby <span>(' + $.cookie('myCookiestart') + '-' + $.cookie('myCookieend') + ' km)</span>');
		}
		//alert($( "#setting_tab" ).html());
		is_loading = true;
		count = 0;
		$.ajax({
			url: "index.php?route=common/home/getLoadMore&path=" + path + "&tab_id=" + tab_id + "&id=" + id + "&count=" + count,
			type: 'GET',
			success: function (data) {
				$('#' + tab_id + "_content").empty();
				var str = $.trim(data);
				if (str == 'no_record_found') {
					// $('#loader_page').hide();
					// if (tab_id == "home") {
					// 	$('#' + tab_id).append('<h4 style="color: #00ACEC">Post your advertisement here, entire <u>country</u> is waiting...</h4>');
					// }else if (tab_id == "profile"){
					// 	$('#' + tab_id).append('<h4 style="color: #00ACEC">Post your advertisement here, entire <u>state</u> is waiting...</h4>');
					// }else if (tab_id == "messages"){
					// 	$('#' + tab_id).append('<h4 style="color: #00ACEC">Post your advertisement here, entire <u>city/district</u> is waiting...</h4>');
					// }else if (tab_id == "settings"){
					// 	$('#' + tab_id).append('<h4 style="color: #00ACEC">Post your advertisement for <u>free</u> here and let the buyers nearby see instantly...</h4>');	
					// }else {
					// 	$('#' + tab_id).append('<h4 style="color: #00ACEC">No Advertisement Yet...</h4>');
					// }

					is_loading = true;
					count = '';
					tab_id = '';
					id = '';
				} else {
					$('#loader_page').hide();
					$('#' + tab_id + "_content").append(data);
					is_loading = false;
				}
			}
		});
	}


	$(function () {
		$("html, body").animate({ scrollTop: 0 }, "fast");
		$(window).scroll(function () {
			if (tab_id) {
				if (is_loading == false) {
					if ($(window).scrollTop() + $(window).height() >= $(document).height() - 300) {
						is_loading = true;
						//$('#loader_page').show();
						$.ajax({
							url: "index.php?route=common/home/getLoadMore&path=" + path + "&tab_id=" + tab_id + "&id=" + id + "&count=" + count,
							type: 'GET',
							success: function (data) {
								var str = $.trim(data);
								if (str == 'no_record_found') {
									$('#loader_page').hide();
									is_loading = true;
									count = '';
									tab_id = '';
									id = '';
								} else {
									$('#loader_page').hide();
									$('#' + tab_id + "_content").append(data);

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
		if (dropbtn_class == 'dropdown-content') {
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


	if ($(window).width() < 767) {
		$("#path").addClass("dropdowns-ss");
	}
	var fixmeTop = $('.fixme').offset().top;
	$(window).scroll(function () {
		var currentScroll = $(window).scrollTop();
		if (currentScroll >= fixmeTop) {
			$('.fixme').css({
				position: 'sticky',
				top: '0',

			});
		} else {
			$('.fixme').css({
				position: 'static'
			});
		}
	});

	var $tab = $('.fixme');
	var body_height = $tab.height();
	//alert(body_height);

	var window_height = $(window).height();
	//alert(window_height);

	var tab_height = parseInt(window_height) - parseInt(body_height);
	//$('.home-tt-r').slimscroll({ height: tab_height });
	// $('.home-tt-r .tab-pane').css({
	// 	height: tab_height
	// });
	//$('.home-tt-r .tab-pane').slimscroll();

	//$('.home-tt-r .tab-pane').css('overflow-y', 'scroll');

	$('#testDiv').slimscroll({
		height: 'auto'
	});


	//$('select.dropdowns-ss').on('change', function () {
	//	if (this.value != '') {
	//		$('.dropdowns-ss').css('background', 'url(image/all-categories-open.jpg) no-repeat scroll 0px 0px transparent')
	//	} else {
	//		$('.dropdowns-ss').css('background', 'url(image/all-categories.jpg) no-repeat scroll 0px 0px transparent')
	//	}
	//});


	$(document).ready(function () {
		$(".nav-tabs, .slimScrollDiv").hover(function () {
			clearInterval(intervalTime);

		});

		$(".nav-tabs, .slimScrollDiv").mousemove(function () {
			clearInterval(intervalTime);
		});

		// $('#english_video').show();
		// $('#tamil_video').hide();



	});
	// function showEnglish() {
	// 	$('#english_video').show();
	// 	$('#tamil_video').hide();
	// }
	// function showTamil() {
	// 	$('#english_video').hide();
	// 	$('#tamil_video').show();
	// }

</script>
<?php echo $footer; ?>