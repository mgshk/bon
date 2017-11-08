<?php echo $header; ?>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	.pstnst {
		top: 0px;
		display: table;
		padding: 0;
		position: absolute;
		table-layout: fixed;
		z-index: 1;
	}

	.wrtrvw {
		display: table-cell;
		float: none;
		height: 100px;
		position: relative;
		vertical-align: middle;
		width: auto;
	}

	.dtlwpr.pstnst.col-xs-12.btnnav {
		background: rgba(1, 149, 255, 0.55);
		position: relative;
		padding-top: 5px;
		padding-bottom: 5px;
		border-radius: 5px;
		width: 100%;
	}

	.thumbnail>img {
		filter: blur(1px);
		position: relative;
	}

	.thumbnail>h2 {
		font-size: 60px;
		margin-left: 65px;
		position: absolute;
		text-align: center;
		top: 130px;
	}

	.addthis_counter a.atc_s {
		padding: 0px;
		font-size: 12px;
	}

	.addthis_counter .atc_s {
		background: none;
	}

	.addthis_counter .atc_s:hover {
		background-color: #74c5ff;
	}

	.addthis_toolbox a {
		margin-bottom: -5px;
	}

	.addthis_counter.addthis_pill_style a.atc_s {
		display: none;
	}

	.addthis_counter.addthis_pill_style.addthis_nonzero a.addthis_button_expanded {
		display: none !important;
	}

	.dropdown-content {
		display: none;
		position: absolute;
		min-width: 110px;
		box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
		z-index: 1233;
		border: 1px solid #ccc;
	}

	.dropdown-content a {
		display: block;
		padding: 3px;
		text-align: left;
		text-decoration: none;
	}

	.dropdown:hover .dropdown-content {
		display: block;
	}

	#Accord .collapse {
		display: block;
	}

	.accord ul,
	.accord ul li {
		list-style-type: none;
	}

	.accord ul li a {
		color: #000;
		text-decoration: none;
	}

	.accord ul li a:hover {
		color: #ccc;
		text-decoration: none;
	}

	.accord ul li span {
		color: #000;
		cursor: pointer;
		float: right;
	}

	.pay_wallet_bt {
		color: #fff;
		font-size: 15px;
	}

	.pay_wallet_bt:hover {
		color: #fff;
	}

	.store-del {
		margin-top: 20px;
	}

	.btr-str {
		margin-top: 36px;
	}

	.seller--ret .col-sm-3,
	.seller--ret .col-sm-6 {
		padding-left: 10px;
		padding-right: 10px;
	}

	.gray--app {
		background: #c2c2c2 !important;
	}

	.gray--app input {
		background: #c2c2c2 !important;
		color: gray !important;
	}

	.gray--app a {
		background: #c2c2c2 !important;
		color: gray !important;
	}

	.bon-navbar-input {
		padding: 7px 16px;
		border-radius: 2px 0 0 2px;
		border: 1px solid #ccc;
		border-right: none;
		outline: 0 none;
		font-size: 13px;
	}

	.bon-navbar-button {
		background-color: #F6F6F6;
		border: 1px solid #d1d1d1;
		border-radius: 0 2px 2px 0;
		color: #666666;
		padding: 10px 0;
		height: 36px;
		cursor: pointer;
	}

	.bon-prd--sc label {
		margin-top: 8px;
	}

	.sidenav {
		height: 100%;
		width: 0;
		position: fixed;
		z-index: 1;
		top: 0;
		left: 0;
		background-color: #fff;
		overflow-x: hidden;
		transition: 0.5s;
		padding-top: 60px;
		z-index: 15;
	}

	.sidenav a {
		padding: 0px 0px 5px 10px;
		text-decoration: none;
		font-size: 14px;
		color: #818181;
		display: block;
		transition: 0.3s;
	}

	.sidenav a:hover,
	.offcanvas a:focus {
		color: #f1f1f1;
	}

	.sidenav .closebtn {
		position: absolute;
		top: 0;
		right: 25px;
		font-size: 36px;
		margin-left: 50px;
		margin-top: 5px;
	}

	@media screen and (max-height: 450px) {
		.sidenav {
			padding-top: 15px;
		}
		.sidenav a {
			font-size: 14px;
		}
	}

	.cat--sel {
		margin-left: 10px;
		margin-right: 10px;
	}

	.cat--sel i {
		font-size: 28px;
		color: #000;
		font-weight: bold;
	}

	.sort--txt {
		width: 12%;
		float: left;
		padding-left: 8px;
	}

	.cnt--txt {
		width: 88%;
		float: left;
		padding-right: 40px;
	}

	.txt--mar-sel {
		margin-top: 20px;
		margin-bottom: 65px;
	}

	.fa-disabled {
		opacity: 0.6;
		cursor: not-allowed;
	}
</style>
<?php echo $seller_left_menu; ?>
<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<div id="Accord" class="accord">
		<ul>
			<?php foreach ($categories as $category) { ?>
			<li id="<?php echo $category['category_id']; ?>">
				<a href="<?php echo $category['href']; ?>&tab_section=product_tab" class="">
					<?php echo $category['name']; ?>
				</a>
				<?php if ($category['children']) { ?>
				<ul class="sub">
					<?php foreach ($category['children'] as $child) { ?>
					<li id="<?php echo $child['category_id']; ?>">
						<a href="<?php echo $child['href']; ?>&tab_section=product_tab" class="">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
						<?php if ($child['children_lv3']) { ?>
						<ul class="sub">
							<?php foreach ($child['children_lv3'] as $child_lv3) { ?>
							<li id="<?php echo $child_lv3['category_id']; ?>"><a href="<?php echo $child_lv3['href']; ?>&tab_section=product_tab" class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8600; <?php echo $child_lv3['name']; ?></a></li>
							<?php } ?>
						</ul>
						<?php } ?>
					</li>
					<?php } ?>
				</ul>
				<?php } ?>
			</li>
			<?php } ?>
		</ul>
	</div>
</div>
<div class="col-sm-9">
	<!--<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>-->
	<div class="row">
		<?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<link href="catalog/view/theme/default/stylesheet/alkod_stylesheet.css" rel="stylesheet">
		<div id="content" class="<?php echo $class; ?> seller--ret">
			<?php echo $content_top; ?>
			<div class="col-sm-12 fis-des">
				<div class="row">
					<div class="col-sm-3">
						<span class="str-name-land"><?php echo substr($nickname, 0, 25); ?></span>
						<?php if(!empty($store_timings_front)) { ?>
						<?php $days = array("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"); ?>
						<?php foreach($days as $day) {
							$str_tmg = unserialize($store_timings_front[strtolower($day)]);					
							if($str_tmg['day'] == strtolower(date("l"))) {//print_r($str_tmg);
							$store_time_single = $str_tmg['from'][0]." - ".$str_tmg['to'][0];
							if(count($str_tmg['from']) == 2) {
							$store_time_single .= "<br>".$str_tmg['from'][1]." - ".$str_tmg['to'][1];
							} ?>
						<p class="str-timings-tdy">Today <br>
							<?php echo $store_time_single; ?> <a style="cursor: pointer;" data-toggle="modal" data-target="#store_timing">(View all)</a></p>
						<?php } } } ?>
						<p class="store-del">
							<?php echo $delivery_type; ?>
						</p>
					</div>
					<div class="col-sm-6">
						<?php if( $seller_verified == '1') { ?>
						<img src="image/verified.png" class="img-responsive" style="float: right;">
						<?php } ?>
						<div class="new-store-banner">
							<div id="myCarousel" class="carousel slide" data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<?php
										$i = 0;
										foreach($seller_images_full as $seller_images) {
										if($seller_images != '') {
										?>
										<li data-target="#myCarousel" data-slide-to="<?php echo $i; ?>" class="<?php echo ($i == 0) ? 'active' : '';?>"></li>
										<?php
										$i++;
										} } ?>
								</ol>
								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									<?php
										$i = 0;
										foreach($seller_images_full as $seller_images) {
										if($seller_images != '') {
										?>
										<div class="item <?php echo ($i == 0) ? 'active' : ''; ?>">
											<img src="<?php echo $seller_images; ?>" class="img-responsive" title="<?php echo $seller_name; ?>" alt="<?php echo $seller_name; ?>">
										</div>
										<?php
										$i++;
										  } } ?>
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
						</div>
					</div>
					<div class="col-sm-3">
						<div>
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($seller_rating < $i) { ?>
							<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } else { ?>
							<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } ?>
							<?php } ?> &nbsp;
							<?php if($review_count != ''){ ?><span class="str-votes"><a href="" onclick="$('a[href=\'#tab-sellerreview\']').trigger('click'); return false;"><?php echo $review_count; ?> Votes </a></span>
							<?php } else { ?><a href="" onclick="$('a[href=\'#tab-sellerreview\']').trigger('click'); return false;"> 0 Votes </a>
							<?php } ?>
						</div>
						<p class="rating-str">
							<img alt="" title="" src="https://chart.googleapis.com/chart?cht=bhs&chs=220x120&chco=0195ff&chbh=a,5,15&chds=0,100&chxt=y&chxl=0:|Poor|Average|Good|Very Good|Excellent&chxr=1,0,100,1&chm=N%20*f1*%20%25,000000,0,-1,12|r,FFFFFF,0,-0.01,2|R,FFFFFF,0,0.01,1&chd=t:<?php echo $rating_chart; ?>&chxp=1,10,30,50,70,90&chxtc=1,10&chxs=0,000000,13,-1,t,FFFFFF&chof=gif">
						</p>
					</div>
				</div>
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-sm-3">
						<?php if($cus_logged && $login_type != 'seller') { ?>
						<p><a style="cursor:pointer" data-toggle="modal" data-target="#_pay_wallet" class="pay_wallet_bt pay--str">Pay</a></p>
						<?php } else { ?>
						<p><a style="cursor:pointer" data-toggle="modal" data-target="#login_frc_buyer" class="pay_wallet_bt pay--str">Pay</a></p>
						<?php } ?>
					</div>
					<div class="col-sm-6">
						<ul class="dtlwpr pstnst col-xs-12 btnnav" style="z-index:3;">
							<li><a class="cursor" data-toggle="modal" data-target="#store_information"><i class="fa fa-info"></i><br/> Info</a></li>
							<li><a target="_blank" href="https://www.google.co.in/maps/place/<?php echo $lat; ?>, <?php echo $lng; ?>"><i class="fa fa-map-marker" ></i><br/> Map</a></li>
							<!--<li class="tooltip1"><i class="fa fa-location-arrow"></i><br/>Address<span class="tooltiptext1"><?php echo $seller_address; ?></span></li>-->
							<?php if($cus_logged && $login_type != 'seller') { ?>
							<?php if(!empty($store_favourites)) { ?>
							<li><a class="cursor" class="favourities-rem" data-toggle="modal" data-target="#already_str_fav"><img style="margin: 0 auto;" src="image/fav_str.jpg" class="img-responsive"> Favourites</a></li>
							<?php } else { ?>
							<li><a class="cursor" data-toggle="modal" data-target="#store_favourites"><img style="margin: 0 auto;" src="image/fav_str.jpg" class="img-responsive"> Favourites</a></li>
							<?php } ?>
							<?php } else {?>
							<li><a class="cursor" data-toggle="modal" data-target="#login_frc_buyer"><img style="margin: 0 auto;" src="image/fav_str.jpg" class="img-responsive"> Favourites</a></li>
							<?php } ?>
							<li>
								<div class="addthis_toolbox addthis_default_style" data-url="<?php //echo $share; ?>"><a class="addthis_counter addthis_pill_style"><a class="atc_s addthis_button_compact"><i class="fa fa-share-alt"></i><br>share<span></span></a></a>
								</div>
								<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
							</li>
							<?php if($cus_logged && $login_type != 'seller') { ?>
							<li><a class="cursor" data-toggle="modal" data-target="#_str_feedbck"><i class="fa fa-commenting-o"></i><br/> Feedback</a></li>
							<?php } else { ?>
							<li><a class="cursor" data-toggle="modal" data-target="#login_frc_buyer"><i class="fa fa-commenting-o"></i><br/> Feedback</a></li>
							<?php } ?>
							<li <?php echo ($ins !='' && $goo !='' && $twi !='' && $fac !='' && $web !='' ) ? '': 'disabled'; ?> class="dropdown">
								<?php if ($ins !='' && $goo !='' && $twi !='' && $fac !='' && $web !='' )  { ?>
								<i class="fa fa-cube"></i><br/>Portals
									
								<div class="dropdown-content portals-set">
									<?php if($ins != '') { ?>
									<a target="_blank" href="<?php echo $ins; ?>"><i class="fa fa-instagram" aria-hidden="true"></i> Instagram</a>
									<?php }if($goo != '') { ?>
									<a target="_blank" href="<?php echo $goo; ?>"><i class="fa fa-google-plus" aria-hidden="true"></i> Googleplus</a>
									<?php }if($twi != '') { ?>
									<a target="_blank" href="<?php echo $twi; ?>"><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</a>
									<?php }if($fac != '') { ?>
									<a target="_blank" href="<?php echo $fac; ?>"><i class="fa fa-facebook" aria-hidden="true"></i> Facebook</a>
									<?php }if($web != '') { ?>
									<a target="_blank" href="<?php echo $web; ?>"><i class="fa fa-globe" aria-hidden="true"></i> Website</a>
									<?php } ?>
								</div>
								<?php } else { ?> 
								<span class="fa-disabled"><i class="fa fa-cube"></i><br/>Portals</span>
								<?php }?> 
							</li>
						</ul>
					</div>
					<div class="col-sm-3">
						<?php if($cus_logged && $login_type != 'seller') { ?>
						<p><a class="rev-btn pay--str" style="cursor: pointer;" data-toggle="modal" data-target="#review_rate">Rate & Write a review <i class="fa fa-pencil" aria-hidden="true"></i></a></p>
						<?php } else { ?>
						<p><a class="rev-btn pay--str" style="cursor:pointer" data-toggle="modal" data-target="#login_frc_buyer">Rate & Write a review <i class="fa fa-pencil" aria-hidden="true"></i></a></p>
						<?php } ?>
					</div>
				</div>
			</div>
			<div class="col-sm-12 sec-mob mb--seller-pds">
				<div class="row">
					<div class="col-sm-6">
						<div class="new-store-banner">
							<?php if( $seller_verified == '1') { ?>
							<img src="image/verified.png" class="img-responsive" style="float: right;">
							<?php } ?>
							<div id="myCarousel" class="carousel slide" data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<?php
									$i = 0;
									foreach($seller_images_full as $seller_images) {
									?>
										<li data-target="#myCarousel" data-slide-to="<?php echo $i; ?>" class="<?php echo ($i == 0) ? 'active' : '';?>"></li>
										<?php
									$i++;
									} ?>
								</ol>
								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									<?php
									$i = 0;
									foreach($seller_images_full as $seller_images) {
									?>
										<div class="item <?php echo ($i == 0) ? 'active' : ''; ?>">
											<img src="<?php echo $seller_images; ?>" class="img-responsive" title="<?php echo $seller_name; ?>" alt="<?php echo $seller_name; ?>">
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
						</div>
					</div>
					<div class="col-sm-3">
						<ul class="dtlwpr pstnst col-xs-12 btnnav">
							<li><a class="cursor" data-toggle="modal" data-target="#store_information"><i class="fa fa-info"></i><br/> Info</a></li>
							<li><a target="_blank" href="https://www.google.co.in/maps/place/<?php echo $lat; ?>, <?php echo $lng; ?>"><i class="fa fa-map-marker" ></i><br/> Map</a></li>
							<!--<li class="tooltip1"><i class="fa fa-location-arrow"></i><br/>Address<span class="tooltiptext1"><?php echo $seller_address; ?></span></li>-->
							<?php if($cus_logged && $login_type != 'seller') { ?>
							<?php if(!empty($store_favourites)) { ?>
							<li><a class="cursor" class="favourities-rem"><img style="margin: 0 auto;" src="image/fav_str.jpg" class="img-responsive"> Favourites</a></li>
							<?php } else { ?>
							<li><a class="cursor" data-toggle="modal" data-target="#store_favourites"><img style="margin: 0 auto;" src="image/fav_str.jpg" class="img-responsive"> Favourites</a></li>
							<?php } ?>
							<?php } else {?>
							<li><a class="cursor" data-toggle="modal" data-target="#login_frc_buyer"><img style="margin: 0 auto;" src="image/fav_str.jpg" class="img-responsive"> Favourites</a></li>
							<?php } ?>
							<li>
								<div class="addthis_toolbox addthis_default_style" data-url="<?php //echo $share; ?>"><a class="addthis_counter addthis_pill_style"><a class="atc_s addthis_button_compact"><i class="fa fa-share-alt"></i><br>share<span></span></a></a>
								</div>
								<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
							</li>
							<?php if($cus_logged && $login_type != 'seller') { ?>
							<li><a class="cursor" data-toggle="modal" data-target="#_str_feedbck"><i class="fa fa-commenting-o"></i><br/> Feedback</a></li>
							<?php } else { ?>
							<li><a class="cursor" data-toggle="modal" data-target="#login_frc_buyer"><i class="fa fa-commenting-o"></i><br/> Feedback</a></li>
							<?php } ?>
							<li class="cursor" data-toggle="modal" data-target="#_str_portals">
								<i class="fa fa-cube"></i><br/>Portals
							</li>
						</ul>
						<div class="str-name-land">
							<?php echo substr($nickname, 0, 25); ?>
						</div>
						<div>
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($seller_rating < $i) { ?>
							<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } else { ?>
							<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
							<?php } ?>
							<?php } ?> &nbsp;
							<?php if($review_count != ''){ ?><span class="str-votes"><a href="" onclick="$('a[href=\'#tab-sellerreview\']').trigger('click'); return false;"><?php echo $review_count; ?> Votes</a></span>
							<?php } else { ?><a href="" onclick="$('a[href=\'#tab-sellerreview\']').trigger('click'); return false;"> 0 Votes </a>
							<?php } ?>
						</div>
						<?php if(!empty($store_timings_front)) { ?>
						<?php $days = array("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"); ?>
						<?php foreach($days as $day) { //print_r(strtolower(date("l")));
						$str_tmg = unserialize($store_timings_front[strtolower($day)]);					
						if($str_tmg['day'] == strtolower(date("l"))) {//print_r($str_tmg);
						$store_time_single = $str_tmg['from'][0]." - ".$str_tmg['to'][0];
						if(count($str_tmg['from']) == 2) {
						$store_time_single .= "<br>".$str_tmg['from'][1]." - ".$str_tmg['to'][1];
						} ?>
						<p class="str-timings-tdy">Today <br>
							<?php echo $store_time_single; ?> <a style="cursor: pointer;" data-toggle="modal" data-target="#store_timing">(View all)</a></p>
						<?php } } } ?>
						<!--<a href="index.php?route=seller/seller/pay_wallet&seller_id=<?php echo $_GET['seller_id']; ?>&path=<?php echo $_GET['path']; ?>" class="pay_wallet_bt">Pay</a>-->
						<p class="store-del">
							<?php echo $delivery_type; ?>
						</p>
						<div class="sell--btn-pg">
							<p>
								<?php if($cus_logged && $login_type != 'seller') { ?>
								<a style="cursor:pointer" data-toggle="modal" data-target="#_pay_wallet" class="pay_wallet_bt pay--str">Pay</a>
								<?php } else { ?>
								<a style="cursor:pointer" data-toggle="modal" data-target="#login_frc_buyer" class="pay_wallet_bt pay--str">Pay</a>
								<?php } ?>
							</p>
							<?php if($cus_logged && $login_type != 'seller') { ?>
							<p><a class="pay_wallet_bt pay--str" style="cursor: pointer;" data-toggle="modal" data-target="#review_rate">Write a review <i class="fa fa-pencil" aria-hidden="true"></i></a></p>
							<?php } else { ?>
							<p><a class="pay_wallet_bt pay--str" style="cursor:pointer" data-toggle="modal" data-target="#login_frc_buyer">Write a review <i class="fa fa-pencil" aria-hidden="true"></i></a></p>
							<?php } ?>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12 fixmee seet-alg" style="z-index: 1; background: rgb(255, 255, 255);">
				<div class="row">
					<ul class="nav nav-pills nav-tabs nav-tab-drop" style="z-index:99">
						<li id="adv_tab" class="<?php if(isset($_GET['tab_section']) != 'product_tab'){ echo 'active'; }?>">
							<a href="#tab-sellerads" data-toggle="tab">
								<?php echo $tab_sellerads; ?>
							</a>
						</li>
						<?php if($allow_products == 1) { ?>
						<li id="product_tab" class="<?php if(isset($_GET['tab_section']) == 'product_tab'){ echo 'active'; }?>">
							<a href="#tab-sellerproducts" data-toggle="tab">
								<?php echo $tab_sellerproducts; ?> (
								<?php echo $seller_products_total; ?>)</a>
						</li>
						<?php } ?>
						<li>
							<a href="#tab-sellerreview" data-toggle="tab">
								<?php echo $tab_sellerreview; ?>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="tab-content">
					<div class="tab-pane <?php if(isset($_GET['tab_section']) != 'product_tab'){ echo 'active'; }?>" id="tab-sellerads">
						<?php if(count($advertisement_store) > 0) {
					foreach($advertisement_store as $advertisement_ste) { ?>
						<div class="col-sm-12 advertise_count" style="margin-top: 10px;" id="<?php echo $advertisement_ste['advertise_id']; ?>">
							<div class="row">
								<div class="hovereffect fis-des">
									<?php if(file_exists("image/".$advertisement_ste['offer_image'])){ ?>
										<img src="<?php echo $image_resize->resize($advertisement_ste['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_ste['offer_title']; ?>"
									 	alt="<?php echo $advertisement_ste['offer_title']; ?>">
									<?php } else { ?>
										<img src="image/adv_default_image.jpg" class="img-responsive" title="<?php echo $advertisement_ste['offer_title']; ?>"
										alt="<?php echo $advertisement_ste['offer_title']; ?>">
									<?php } ?>
									<div class="overlay">
										<div class="col-sm-12">
											<h2 class="advertise_title">
												<?php echo $advertisement_ste['offer_title']; ?>
											</h2>
										</div>
										<a class="info str-sell--ad cursor" data-id="<?php echo $advertisement_ste['advertise_id']; ?>" onclick="viewDetAdv(this);"><i class="fa fa-arrows-alt"></i></a>
									</div>
								</div>
								<div class="sec-mob">
									<a class="info view-det-adv" data-id="<?php echo $advertisement_ste['advertise_id']; ?>" onclick="viewDetAdv(this);">
									<img src="<?php echo $image_resize->resize($advertisement_ste['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_ste['offer_title']; ?>" alt="<?php echo $advertisement_ste['offer_title']; ?>">									
								</a>
								</div>
							</div>
						</div>
						<?php $count_adv = count($advertisement_store); ?>
						<script>
							var adv_id = "<?php echo $advertisement_ste['advertise_id']; ?>"; var count_adv = "<?php echo $count_adv; ?>";
						</script>
						<?php } } else { ?>
						<script>
							var adv_id = "";
							var count_adv = "";
						</script>
						<div class="col-sm-12">
							<div class="row">
								<p>No Advertisement Yet...</p>
							</div>
						</div>
						<?php } ?>
					</div>
					<div class="tab-pane <?php if(isset($_GET['tab_section']) == 'product_tab'){ echo 'active'; }?>" id="tab-sellerproducts">
						<div class="row bon-prd--sc fixmee-sec" style="z-index: 1; background: #fff;">
							<div class="col-sm-3 fis-des cat-sp">
								<div class="">
									<button onclick="catShow()" class="dropbtn">Categories <span><i class="fa fa-chevron-right" aria-hidden="true"></i></span></button>
									<div id="catDropdown" class="dropdown-content">
										<div id="Accord" class="accord">
											<ul>
												<?php foreach ($categories as $category) { ?>
												<li id="<?php echo $category['category_id']; ?>">
													<a href="<?php echo $category['href']; ?>&tab_section=product_tab" class="">
														<?php echo $category['name']; ?>
													</a>
													<?php if ($category['children']) { ?>
													<ul class="sub">
														<?php foreach ($category['children'] as $child) { ?>
														<li id="<?php echo $child['category_id']; ?>">
															<a href="<?php echo $child['href']; ?>&tab_section=product_tab" class="">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
															<?php if ($child['children_lv3']) { ?>
															<ul class="sub">
																<?php foreach ($child['children_lv3'] as $child_lv3) { ?>
																<li id="<?php echo $child_lv3['category_id']; ?>"><a href="<?php echo $child_lv3['href']; ?>&tab_section=product_tab" class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8600; <?php echo $child_lv3['name']; ?></a></li>
																<?php } ?>
															</ul>
															<?php } ?>
														</li>
														<?php } ?>
													</ul>
													<?php } ?>
												</li>
												<?php } ?>
											</ul>
										</div>
									</div>
								</div>

							</div>
							<div class="">
								<div class="bon-navbar-search smallsearch col-sm-5 col-xs-12" style="display: inline-flex; margin-bottom:10px;">
									<span class="cat--sel cursor sec-mob" onclick="openNav()"><i class="fa fa-angle-right"></i></span>
									<input class="bon-navbar-input col-xs-11" type="text" placeholder="Search for Products" id="prod_search" name="prod_search"
									 value="<?php echo $prod_search; ?>">
									<button id="prod_search_bt" class="bon-navbar-button col-xs-1">
								<i class="fa fa-search"></i>
								</button>
								</div>
								<div class="col-xs-4  col-md-2 text-center">
									<label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
								</div>
								<div class="col-xs-8  col-md-2 text-right">
									<select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
									<?php foreach ($sorts as $sorts) { ?>
									<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
									<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
								</div>
							</div>
						</div>
						<br />
						<div class="row" id="tab-sellerproducts">
							<?php if ($products) { ?>
							<?php foreach ($products as $product) { ?>
							<div class="product-layout product-grid advertise_count col-md-3 col-sm-6 col-xs-12" id="<?php echo $product['product_id'];?>">
								<div class="product-thumb">
									<div class="image"><a href="<?php echo $product['href']; ?>&tab_section=product_tab"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
									<div class="caption">
										<h4>
											<a href="<?php echo $product['href']; ?>&tab_section=product_tab">
												<?php echo $product['name']; ?>
											</a>
										</h4>
										<p>
											<?php echo $product['description']; ?>
										</p>
										<?php if ($product['rating']) { ?>
										<div class="rating">
											<?php for ($i = 1; $i <= 5; $i++) { ?>
											<?php if ($product['rating'] < $i) { ?>
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
											<?php } else { ?>
											<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
											<?php } ?>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if ($product['price']) { ?>
										<p class="price">
											<?php if (!$product['special']) { ?>
											<?php echo $product['price']; ?>
											<?php } else { ?>
											<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
											<?php } ?>
											<!--<?php if ($product['tax']) { ?>
												<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
												<?php } ?>-->
										</p>
										<?php } ?>
									</div>
									<?php if($allow_cart == 1) { ?>
									<?php if(!$cus_logged) { ?>
									<div class="button-group">
										<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
										<button type="button" title="<?php echo $button_wishlist; ?>" data-toggle="modal" data-target="#login_frc_buyer"><i class="fa fa-heart"></i></button>
									</div>
									<?php } elseif($cus_logged && $login_type != 'seller') { ?>
									<div class="button-group">
										<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
										<button type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
									</div>
									<?php } else { ?>
									<div class="button-group">
										<button type="button" data-toggle="modal" data-target="#login_frc_buyer"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
										<button type="button" title="<?php echo $button_wishlist; ?>" data-toggle="modal" data-target="#login_frc_buyer"><i class="fa fa-heart"></i></button>
									</div>
									<?php } } ?>
								</div>
							</div>

							<?php } ?>
							<?php  
								if(isset($products) && count($products) > 0) {
									$count_pro = count($products); ?>
							<script>
								var product_id = "<?php echo $product['product_id']; ?>"; var count_pro = "<?php echo $count_pro; ?>";
							</script>
							<?php } ?>
							<?php } else { ?>
							<p>No Product Yet...</p>
							<?php } ?>
							<?php if( (isset($advertisement_store) && !empty($advertisement_store)) || (isset($products) && !empty($products))) { ?>
							<p id="loader_page" style="display:none;"><img src="catalog/view/theme/default/image/ajax_loader.gif"></p>
							<?php } ?>
						</div>
					</div>
					<div class="tab-pane" id="tab-sellerreview">
						<div class="sec-mob">
							<p class="rating-str">
								<img alt="" title="" src="https://chart.googleapis.com/chart?cht=bhs&chs=220x120&chco=0195ff&chbh=a,5,15&chds=0,100&chxt=y&chxl=0:|Poor|Average|Good|Very Good|Excellent&chxr=1,0,100,1&chm=N%20*f1*%20%25,000000,0,-1,12|r,FFFFFF,0,-0.01,2|R,FFFFFF,0,0.01,1&chd=t:<?php echo $rating_chart; ?>&chxp=1,10,30,50,70,90&chxtc=1,10&chxs=0,000000,13,-1,t,FFFFFF&chof=gif">
							</p>
						</div>
						<div id="sellerreview"></div>
					</div>
				</div>
			</div>
		</div>
		<?php //echo $content_bottom; ?>
	</div>
	<?php //echo $column_right; ?>
</div>
<div class="col-sm-3"></div>
<div class="modal fade" id="_str_portals" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<!--<h4 class="modal-title loc-share-title">Store/Entity portals</h4>-->
			</div>
			<div class="modal-body _wallet-share-top second--str--feeds">
				<div class="portals-set">
					<?php if($ins != '') { ?>
					<a target="_blank" href="<?php echo $ins; ?>"><i class="fa fa-instagram" aria-hidden="true"></i> Instagram</a>
					<?php }if($goo != '') { ?>
					<a target="_blank" href="<?php echo $goo; ?>"><i class="fa fa-google-plus" aria-hidden="true"></i> Googleplus</a>
					<?php }if($twi != '') { ?>
					<a target="_blank" href="<?php echo $twi; ?>"><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</a>
					<?php }if($fac != '') { ?>
					<a target="_blank" href="<?php echo $fac; ?>"><i class="fa fa-facebook" aria-hidden="true"></i> Facebook</a>
					<?php }if($web != '') { ?>
					<a target="_blank" href="<?php echo $web; ?>"><i class="fa fa-globe" aria-hidden="true"></i> Website</a>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="_str_feedbck" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title loc-share-title">Store/Entity Feedback</h4>
			</div>
			<div class="modal-body _wallet-share-top second--str--feeds">
				<form action="" method="post" enctype="multipart/form-data" id="form_str_feedbck" class="form-horizontal">
					<div id="str_feedbck_alt_rr"></div>
					<div class="_str_feedbck">
						<div class="form-group">
							<select class="form-control" name="sel_subject" id="sel_subject">
								<option value="1">I love this store/entity.</option>
								<option value="2">Not removing expired offers.</option>
								<option value="3">Posting false advertisements.</option>
								<option value="4">Location on map is not correct.</option>
								<option value="5">Store/Entity information provided is not accurate.</option>
								<option value="6">Report abuse.</option>
								<option value="7">Actual and posted information about products does not match.</option>
								<option value="8">Need to update/add products information.</option>
								<option value="9">Store/Entity is shut down.</option>
								<option value="10">Not belong to this category . (Please mention the category name down).</option>
							</select>
						</div>
						<div class="form-group">
							<textarea style="height:85px;" type="text" name="str_feedback" id="str_feedback" value="" placeholder=""></textarea>
						</div>
						<div class="form-group">
							<button type="button" class="favv-str-btn seet--feeds btn" id="button_store_feedback">Submit</button>
							<button type="button" class="favv-str-btn seet--feeds btn" data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="_pay_wallet" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title loc-share-title">Pay</h4>
			</div>
			<div class="modal-body _wallet-share-top">
				<form id="form_wallet_bal" action="" method="post">
					<div id="wallet_bal_alt"></div>
					<div class="_wallet_tp_btt">
						<?php if(!empty($store_favourites)) { ?>
						<span class="_wall_left"><a style="cursor: default;color:#93d1ea;" title="You already added this to your favourites." class="store_favourites pay--expp cursor">Add this to your favourites</a></span>
						<?php } else {?>
						<span class="_wall_left"><a class="cursor pay--expp btn btn-primary" data-toggle="modal" data-target="#store_favourites">Add this to your favourites</a></span>
						<?php } ?>
						<span class="_wall_right"><a class="cursor pay--expp btn btn-primary" data-toggle="modal" data-target="#expense_fr_mb">Your expense report</a></span>
					</div>
					<div class="_wall_bal">
						My Wallet balance = 0 ₹
					</div>
					<div class="_wall_bal_in">
						<input name="enter_amt" id="enter_amt" class="form-control" type="text" placeholder="Enter Amount">
					</div>
					<div class="_wall_grp_rad">
						<div class="radio">
							<label><input type="radio" checked name="optradio" value="others">Others</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="optradio" value="groceries">Groceries</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="optradio" value="rent">Rent</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="optradio" value="dining_out">Dining out</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="optradio" value="clothing">Clothing</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="optradio" value="houshold_utils">Houshold utils</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="optradio" value="gas">Gas</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="optradio" value="entertinment">Entertinment</label>
						</div>
					</div>
					<div class="_wallet_tp_bt">
						<span class="_wall_left_in next_btn"><a class="btn btn-primary">Next</a></span>
						<span class="_wall_right_in"><a class="btn btn-primary" data-dismiss="modal">Cancel</a></span>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="store_information" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title loc-share-title">Store/Entity Information</h4>
			</div>
			<div class="modal-body timing-share-top str--gen--inf table-responsive">
				<table class="table">
					<tr>
						<?php if($nickname != '') { ?>
						<td>
							<h4>Store Name</h4>
						</td>
						<td>
							<?php echo substr($nickname, 0, 25); ?>
						</td>
						<?php } ?>
					</tr>
					<tr>
						<?php if($owner_name != '') { ?>
						<td>
							<p>Owner name</p>
						</td>
						<td>
							<?php echo $owner_name; ?>
						</td>
						<?php } ?>
					</tr>
					<tr>
						<?php if($seller_image != '') { ?>
						<td>
							<p>Profile Photo</p>
						</td>
						<td> <img src="<?php echo $seller_image; ?>"></td>
						<?php } ?>
					</tr>
					<tr>
						<?php if($seller_address != '') { ?>
						<td>
							<p>Store Address</p>
						</td>
						<td>
							<?php echo $seller_address; ?>
						</td>
						<?php } ?>
					</tr>
					<tr>
						<?php if($store_mobile_num != '') { ?>
						<td>
							<p>Mobile no.</p>
						</td>
						<td>
							<?php echo $store_mobile_num; ?>
						</td>
						<?php } ?>
					</tr>
					<tr>
						<?php if($store_ll_num != '') { ?>
						<td>
							<p>Land-line no.</p>
						</td>
						<td>
							<?php echo $store_ll_num; ?>
						</td>
						<?php } ?>
					</tr>
					<tr>
						<?php if($store_email != '') { ?>
						<td>
							<p>E-Mail ID</p>
						</td>
						<td>
							<a href="mailto:<?php echo $store_email; ?>">
								<?php echo $store_email; ?>
							</a>
						</td>
						<?php } ?>
					</tr>
					<tr>
						<?php if($description != '') { ?>
						<td>
							<p>Description</p>
						</td>
						<td style="word-break: break-all;">
							<?php echo $description; ?>
						</td>
						<?php } ?>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="store_favourites" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title loc-share-title">Add to favourites</h4>
			</div>
			<div class="modal-body timing-share-top" style="text-align: left;">
				<p>Do you want to add this to your favourites?</p>
				<br/>
				<div id="store_fav_alt"></div>
				<form class="form-horizontal" id="form-store-favourites">
					<input type="checkbox" name="email" value="1" <?php if(isset($store_favourites[ 'email']) !='0' ){echo "checked";} ?>>
					Allow to send AD update notification to you?<br/>
					<span style="font-style: italic;">(Applicable only for paid advertisment)</span>
					<!--<input type="checkbox" name="notification" value="1" <?php if(isset($store_favourites['notification']) != '0'){echo "checked";} ?>> Allow to send Mobile notification to you?--><br/>
					<br/>
					<button type="button" class="favv-str-btn btn" id="button-store_favourites" data-loading-text="<?php echo $text_loading; ?>">Yes</button>
					<button type="button" class="favv-str-btn btn" data-dismiss="modal">Cancel</button>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="store_timing" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content loc-pop str--tngs">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title loc-share-title">Hours of operation</h4>
			</div>
			<div class="modal-body timing-share-top">
				<table>
					<?php $days = array("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"); ?>
					<?php //print_r($store_timings_front);?>
					<?php foreach($days as $day) { //print_r($day);
						$str_tmg = unserialize($store_timings_front[strtolower($day)]); 
						if($str_tmg['status'] == "open") {
						$store_time_mule = $str_tmg['from'][0]." - ".$str_tmg['to'][0];
						if(count($str_tmg['from']) == 2) {
						$store_time_mule .= "<br>".$str_tmg['from'][1]." - ".$str_tmg['to'][1]; 
						} ?>
					<tr>
						<td style="text-align: center"><span class="days-str"><?php echo ucfirst($str_tmg['day']); ?></span></td>
						<td style="text-align: center"> : </td>
						<td style="text-align: left"><span class="timg-str"><?php echo $store_time_mule; ?></span></td>
					</tr>
					<?php } else { ?>
					<tr>
						<td style="text-align: center"><span class="days-str"><?php echo ucfirst($str_tmg['day']); ?></span></td>
						<td style="text-align: center"> : </td>
						<td style="text-align: left"><span class="timg-str"><?php echo ucfirst($str_tmg['status']); ?></span></td>
					</tr>
					<?php } } ?>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="review_rate" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title loc-share-title">Rate & Write a review</h4>
			</div>
			<div class="modal-body review-frm-top">
				<form class="form-horizontal" id="form-sellerreview">
					<div id="sellerreview_alt"></div>
					<?php if ($sellerreviewstatus){ ?>
					<h2>
						<?php //echo $text_write; ?>
					</h2>
					<?php if ($sellerreviewguest){ ?>
					<div class="form-group required">
						<div class="col-sm-12">
							<!--<label class="control-label" for="input-phone"><?php echo $entry_phone; ?></label>
								<input type="text" name="phone" value="<?php echo $customer_number; ?>" id="input-phone" class="form-control" placeholder="<?php echo $entry_phone; ?>"/>-->
							<span><?php echo $customer_number; ?></span>
						</div>
					</div>
					<div class="form-group required">
						<!--<label class="control-label"><?php echo $entry_rating; ?></label>-->
						&nbsp;&nbsp;&nbsp;
						<?php echo $entry_bad; ?>&nbsp;
						<?php $rate_count = array("1", "2", "3", "4", "5"); ?>
						<?php foreach($rate_count as $cnt) { 
							$selected = (isset($seller_review_single['rating']) == $cnt) ? "checked = checked" : "";?>
						<input type="radio" name="rate_rating" <?php echo $selected; ?> value="
						<?php echo $cnt; ?>" />&nbsp;
						<?php } ?>
						<?php echo $entry_good; ?>
					</div>
					<div class="form-group required">
						<div class="col-sm-12">
							<!--<label class="control-label" for="input-sellerreview"><?php echo $entry_sellerreview; ?></label>-->
							<textarea name="text" rows="5" id="input-sellerreview" class="form-control" placeholder="<?php echo $entry_sellerreview; ?>"><?php echo isset($seller_review_single['text']); ?></textarea>
							<div class="help-block">
								<?php //echo $text_note; ?>
							</div>
						</div>
					</div>
					<?php echo $captcha; ?>
					<div class="buttons clearfix">
						<div class="pull-right">
							<button type="button" id="button-sellerreview" data-loading-text="<?php echo $text_loading; ?>" class="favv-str-btn btn btn-primary">Submit<?php //echo $button_continue; ?></button>
						</div>
					</div>
					<?php } else { ?>
					<?php echo $text_seller_login; ?>
					<?php } ?>
					<?php }?>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="ad_details" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<!--<h4 class="modal-title loc-share-title">Advertise Details</h4>-->
			</div>
			<div class="modal-body loc-share-topps" id="ad_det_id">
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="already_str_fav" role="dialog">
	<div class="modal-dialog main--ts-rt">
		<div class="modal-content loc-pop">
			<div class="modal-body loc-share-top alt--res-pop">
				<p>This store is already in your favourites list.</p><br/>
				<button class="alt--res-bt btn btn-primary b1" data-dismiss="modal">Ok</button>
			</div>
		</div>
	</div>
</div>
<script>
								$(document).ready(function () {
									var fixmeTop = $('.fixmee').offset().top;
									$(window).scroll(function () {
										var currentScroll = $(window).scrollTop();
										if (currentScroll >= fixmeTop) {
											$('.fixmee').css({
												position: 'sticky',
												top: '0',

											});
										} else {
											$('.fixmee').css({
												position: 'static'
											});
										}
									});
									var fixmeTop = $('.fixmee-sec').offset().top;
									var tab_height = $(".seet-alg").height();
									$(window).scroll(function () {
										var currentScroll = $(window).scrollTop();
										if (currentScroll >= fixmeTop) {
											$('.fixmee-sec').css({
												position: 'sticky',
												top: tab_height,

											});
										} else {
											$('.fixmee-sec').css({
												position: 'static'
											});
										}
									});
									$('.nav-tabs').tabdrop({text:"More"});
								});

</script>
<script>
	var doc_width = $(document).width();
	function openNav() {
		document.getElementById("mySidenav").style.width = doc_width + "px";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
	}

</script>
<script>
	$(".favourities-rem").click(function () {
		alert("You already added this to your favourites.");
	});

	$("#enter_amt").on('keyup', function () {
		var value = $(this).val();
		value = value.replace(/^(0*)/, "");
		$(this).val(value);
		$(".next_btn").empty();
		if (/\D/g.test(this.value)) {
			this.value = this.value.replace(/\D/g, '');
		}
		if ($(this).val().length > 0) {
			$(".next_btn").append('<a class="next_btn_wallet" onclick="nextWalletBalance()">Next</a>');
		} else {
			$(".next_btn").append('<a style="color:#93d1ea;cursor:	default;">Next</a>');
		}
	});

	function nextWalletBalance() {
		form_wallet_bal
		$.ajax({
			url: 'index.php?route=seller/seller/check_wallet_balance',
			type: 'post',
			dataType: 'json',
			data: $("#form_wallet_bal").serialize(),
			success: function (json) {
				$('.alert-success, .alert-danger').remove();
				if (json['error']) {
					$('#wallet_bal_alt').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}
				if (json['success']) {
					$('#wallet_bal_alt').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				}
			}
		});
	}

</script>
<script type="text/javascript">
	<!--
		$('#sellerreview').delegate('.pagination a', 'click', function (e) {
			e.preventDefault();

			$('#sellerreview').fadeOut('slow');

			$('#sellerreview').load(this.href);

			$('#sellerreview').fadeIn('slow');
		});

	$('#sellerreview').load('index.php?route=seller/seller/sellerreview&seller_id=<?php echo $seller_id; ?>');

	$('#button-sellerreview').on('click', function () {//alert("test");
		$.ajax({
			url: 'index.php?route=seller/seller/write&seller_id=<?php echo $seller_id; ?>',
			type: 'post',
			dataType: 'json',
			data: $("#form-sellerreview").serialize(),
			beforeSend: function () {
				//$('#button-sellerreview').button('loading');
			},
			complete: function () {
				//$('#button-sellerreview').button('reset');
				//document.getElementById("#review_rate").reset();
			},
			success: function (json) {
				$('.alert-success, .alert-danger').remove();

				if (json['error']) {
					$('#sellerreview_alt').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}

				if (json['success']) {
					$('#sellerreview_alt').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					$('#form-sellerreview').trigger("reset");
					//$('#review_rate').modal('toggle');
				}
			}
		});
	});

	$('#button_store_feedback').on('click', function () {//alert("test");
		$.ajax({
			url: 'index.php?route=seller/seller/store_feedback&seller_id=<?php echo $seller_id; ?>',
			type: 'post',
			dataType: 'json',
			data: $("#form_str_feedbck").serialize(),
			success: function (json) {
				$('#str_feedbck_alt_rr').html('');
				if (json['error']) {
					$('#str_feedbck_alt_rr').html('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}

				if (json['success']) {
					$('#str_feedbck_alt_rr').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					$('#form_str_feedbck').trigger("reset");
					//$('#_str_feedbck').modal('toggle');
				}
			}
		});
	});

	$(document).ready(function () {
		$('.thumbnails').magnificPopup({
			type: 'image',
			delegate: 'a',
			gallery: {
				enabled: true
			}
		});
	});
	//-->

</script>
<script type="text/javascript">
	$('#button-store_favourites').on('click', function () {//alert("test");
		$.ajax({
			url: 'index.php?route=seller/seller/store_favourites&seller_id=<?php echo $seller_id; ?>',
			type: 'post',
			dataType: 'json',
			data: $("#form-store-favourites").serialize(),
			beforeSend: function () {
				$('#button-store_favourites').button('loading');
			},
			complete: function () {
				$('#button-store_favourites').button('reset');
			},
			success: function (json) {
				$('.alert-success, .alert-danger').remove();

				if (json['error']) {
					$('#store_fav_alt').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}

				if (json['success']) {
					setTimeout(function () {
						$('#favouries_str > a').html('<span id="fav-total"> Favourites (' + json['total'] + ')</span>');
						$('#fav_ret_m').html(json['total']);
					}, 100);
					$('#favouries_str > ul').load('index.php?route=common/favourites/info ul li');
					$('#store_fav_alt').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				}
			}
		});
	});

	$(document).ready(function () {
		$('.thumbnails').magnificPopup({
			type: 'image',
			delegate: 'a',
			gallery: {
				enabled: true
			}
		});
	});

</script>
<script type="text/javascript">
	jQuery(document).ready(function ($) {
		$('.accord ul li:has(ul)').addClass('expand').find('ul').hide();
		$('.accord ul li.expand>a').after('<span>[ + ]</span>');

		$('.accord ul').on('click', 'li.collapse span ', function (e) {
			$(this).text('[ + ]').parent().addClass('expand').removeClass('collapse').find('>ul').slideUp();
			e.stopImmediatePropagation();
		});

		$('.accord ul').on('click', 'li.expand span', function (e) {
			$(this).text('[ - ]').parent().addClass('collapse').removeClass('expand').find('>ul').slideDown();
			e.stopImmediatePropagation();
		});

		$('.accord ul').on('click', 'li.collapse li:not(.collapse)', function (e) {
			e.stopImmediatePropagation();
		});
	});
	jQuery(document).ready(function ($) {
		var cat_id = "<?php echo $_GET['path']; ?>";
		var cat_ids = cat_id.split('_');
		if (cat_id != '') {
			$.each(cat_ids, function (key, value) {
				//alert($('ul li#'+value).attr('class'));
				if ($('ul li#' + value).attr('class') != "undefined" && $('ul li#' + value).attr('class') != '') {
					$('ul li#' + value).removeClass('expand');
					$('ul li#' + value).addClass("collapse");
					$('ul li#' + value + ' span').on('click', 'li.collapse span ', function (e) {
						$(this).text('[ - ]').parent().addClass('collapse').removeClass('expand').find('>ul').slideDown();
						e.stopImmediatePropagation();
					});
					if ($(window).width() < 767) {
						$('ul li#' + value + ' span').click();
					}
					$('ul li#' + value + ' span').on('click', 'li.expand span', function (e) {
						$(this).text('[ + ]').parent().addClass('expand').removeClass('collapse').find('>ul').slideUp();
						e.stopImmediatePropagation();
					});
					$('ul li#' + value + ' span').click();
				}
			});
		}

	});


	var is_loading = false;
	var limit = 6; // limit items per page	

	var seller_id = "<?php echo $seller_id; ?>";
	var tab = $('.nav-tabs li, .tab-pane').attr('id');
	if (tab = 'adv_tab') {
		var tab_id = "tab-sellerproducts";
	} else if (tab = 'adv_tab') {
		var tab_id = "tab-sellerproducts";
	}
	if (adv_id != '') {
		var id = adv_id;
	} else {
		var id = '';
	}

	var count = count_adv;

	$('#adv_tab,#product_tab').click(function (e) {
		var target = $(e.target).attr("href") // activated tab		
		target = target.replace('#', '');
		tab_id = target;
		//$('#tab-sellerreview').removeclass("active");
		if (tab_id == 'tab-sellerproducts') {
			id = 1;//$("#"+tab_id+" div:first-child").attr("id");
		} else {
			id = $("#" + tab_id + " div:first-child").attr("id");
		}
		count = $("#" + tab_id + " div.advertise_count").length;
		is_loading = false;
		//alert(tab_id+','+id+','+count);
	});

	$('#tab-sellerreview').click(function () {
		$('#product_tab').removeclass("active");
		//$('#tab-sellerreview').css("display", "block"); 
	});

	$(function () {
		$(window).scroll(function () { //alert(id);
			if (id) {
				if (is_loading == false) {
					if ($(window).scrollTop() + $(window).height() >= $(document).height() - 300) {
						is_loading = true;
						//$('#loader_page').show();
						$.ajax({
							url: "index.php?route=seller/seller/advertisement_store_info&count=" + count + "&seller_id=" + seller_id,
							type: 'GET',
							success: function (data) {
								var str = $.trim(data);	//alert(str);
								if (str == 'no_record_found') {
									$('#loader_page').hide();
									is_loading = true;
									count = '';
									tab_id = '';
									id = '';
								} else {
									$('#loader_page').hide();
									//$('#tab-sellerads').append(data);									

									is_loading = false;
								}
							}
						});
					}
				}

			} else {
				return false;
			}
		});

	});

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
						$('#ad_det_id').html('<h4><strong>' + json['nickname'] + '</strong></h4><h4><strong></strong>' + json['offer_title'] + '</h4><img src=\"image/' + img + '\" alt=\"' + json['offer_title'] + '\" class=\"img-thumbnail img-responsive\" /><p><strong></strong>' + json['offer_desc'] + '</p><p><strong></strong><a href=' + json['offer_url'] + '>' + json['offer_url'] + '</a></p>');
					}
					$('#ad_details').modal('toggle');

				}
			}
		});
	}
	//});   
	function catShow() {
		document.getElementById("catDropdown").classList.toggle("show");
	}

</script>

<script>
	//Product search text box
	$("#prod_search_bt").click(function () {
		var search_val = $('#prod_search').val();
		window.location = "index.php?route=seller/seller/info&path=<?php echo $path; ?>&seller_id=<?php echo $seller_id; ?>&tab_section=<?php echo $tab_section; ?>&prod_search=" + search_val;
	});

</script>
<?php echo $footer; ?>