<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8">
	<![endif]-->
<!--[if IE 9 ]>
	<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9">
		<![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>
		<?php echo $title; ?>
	</title>
	<base href="<?php echo $base; ?>" />
	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>
	<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/jquery/jquery-ui.js"></script>
	<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
	<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
	<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
	<!--Mega Menu-->
	<link rel="stylesheet" href="catalog/view/javascript/mega-menu/reset.css">
	<!-- CSS reset -->
	<link rel="stylesheet" href="catalog/view/javascript/mega-menu/style.css">
	<!-- Resource style -->
	<!--End Mega Menu-->
	<!-- -->
	<link href="catalog/view/javascript/chosen/chosen.css" rel="stylesheet" media="screen" />
	<script src="catalog/view/javascript/chosen/chosen.jquery.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXvDvmhFTLZ5iJyGSQm3-3GEJg0G3iztk&libraries=places"></script>
	<script src="catalog/view/javascript/locationpicker.jquery.js"></script>

	<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
	<link rel="stylesheet" href="catalog/view/javascript/custom.css">
	<?php foreach ($styles as $style) { ?>
	<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>"
	/>
	<?php } ?>
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
		$(document).ready(function () {
			<?php if(isset($_SESSION['payment_success'])) { ?>
				alert("<?php echo $_SESSION['payment_success']; ?>");
				<?php } ?>
				});

		var $start_km = "<?php echo (!isset($_COOKIE['myCookiestart'])) ? '0': $_COOKIE['myCookiestart']; ?>";
		var $end_km = "<?php echo (!isset($_COOKIE['myCookieend'])) ? '3': $_COOKIE['myCookieend']; ?>";

		$(function () {
			var qs = (function (a) {
				if (a == "") return {};
				var b = {};
				for (var i = 0; i < a.length; ++i) {
					var p = a[i].split('=', 2);
					if (p.length == 1)
						b[p[0]] = "";
					else
						b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
				}
				return b;
			})(window.location.search.substr(1).split('&'));

			$("#slider-range").slider({
				range: true,
				min: 0,
				max: 20,
				values: [$start_km, $end_km],
				slide: function (event, ui) {
					$.cookie('myCookiestart', ui.values[0]);
					$.cookie('myCookieend', ui.values[1]);
					$("#amount").val($.cookie('myCookiestart'));
					$("#amount1").val($.cookie('myCookieend'));
				},
				change: function (event, ui) {
					var currentPath = qs["route"];

					if ((currentPath == 'common/home') || (typeof (currentPath) == "undefined") || (currentPath == '')) {
						$('.nav-tabs li.active').removeClass('active');
						$('.tab-content div.tab-pane').removeClass('active');
						$('.nav-tabs li#adv_settings').addClass('active');
						$('.tab-content div#settings').addClass('active');
						MakeUrl(path, tab_id = 'settings');
					} else if (currentPath == 'seller/seller') {
						location.reload();
					}
				}

			});

			if (($start_km != '') && ($end_km != '')) { //alert("456");
				if ((typeof ($.cookie('myCookiestart')) != "undefined" && $.cookie('myCookiestart') != '') && (typeof ($.cookie('myCookiestart')) != "undefined" && $.cookie('myCookieend') != '')) {

					$("#amount").val($.cookie('myCookiestart'));
					$("#amount1").val($.cookie('myCookieend'));

					var left1 = ($.cookie('myCookiestart') * 5);
					var left2 = ($.cookie('myCookieend') * 5);
					var differece = ((parseInt($.cookie('myCookieend')) - parseInt($.cookie('myCookiestart'))) * 5);
					$('#slider-range span:first').css('left', left1 + '%');
					$('#slider-range span:last').css('left', left2 + '%');

					$('.ui-slider-range').css('left', left1 + '%');
					$('.ui-slider-range').css('width', differece + '%');
					//alert('The value of myCookie is now "'+ $.cookie('myCookiestart')+ $.cookie('myCookieend')+ '". Now, reload the page, PHP should read it correctly.');
				} else {
					//alert('The value of myCookie is now "'+ $.cookie('myCookiestart')+ $.cookie('myCookieend')+ '". Now, reload the page, PHP should read it correctly.');
					$("#amount").val($start_km);
					$("#amount1").val($end_km);

				}

			} else {
				//alert('The value of myCookie is now "'+ $.cookie('myCookiestart')+ $.cookie('myCookieend')+ '". Now, reload the page, PHP should read it correctly.');
				$("#amount").val($("#slider-range").slider("values", 0));
				$("#amount1").val($("#slider-range").slider("values", 1));

			}

		});


		$(document).ready(function () {


			$("#kms_set").click(function () { //alert("test");


			});
		});
	</script>
	<script type="text/javascript">
		$(window).load(function () {
			$("#pre_loader").fadeOut(1000);
		});
	</script>
	<style>
		.dropdown-submenu:hover>.dropdown-menu {
			display: block;
		}

		.rrt-bon-sub {
			left: 100%;
			top: 37%;
		}

		#pre_loader {
			position: fixed;
			left: 0px;
			top: 0px;
			width: 100%;
			height: 100%;
			z-index: 9999;
			background: url('image/pre-loader.gif') 50% 50% no-repeat rgb(249, 249, 249);
		}

		#pre_loaderr {
			text-align: -moz-center;
		}

		.content-one,
		.content-two {
			display: none;
		}

		.rrt-bon-sub li {
			background: #fff;
		}

		.modal-open .modal {
			overflow-y: scroll;
		}

		.free--list-bon a {
			color: #fff
		}

		.free--list-bon a:hover {
			color: #fff
		}

		.cursor_none {
			cursor: default;
		}
	</style>
</head>

<body class="<?php echo $class; ?>">
	<div id="pre_loader"></div>
	<div class="container-fluid main--head">
		<div class="row top-header-new">
			<div class="col-sm-2 fis-des mit--hd">
				<div id="logo">
					<?php if ($logo) { ?>
					<a href="<?php echo $home; ?>"><img src="image/bon-logo-header-des.png<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
					<?php } else { ?>
					<h1>
						<a href="<?php echo $home; ?>">
							<?php echo $name; ?>
						</a>
					</h1>
					<?php } ?>
				</div>
			</div>
			<div class="col-sm-10">
				<div class="row fis-des">
					<div class="col-sm-1"></div>
					<div class="col-sm-2">
						<?php if ($logged) { 
										if($seller_info['nickname']) { ?>
						<div class="frr--list cursor free_listBtn_logged">Free Listing</div>
						<?php } else { ?>
						<div class="free--list-bon">
							<a href="index.php?route=sellerprofile/sellerprofile&tab_section=store_detail#content">
								<div class="frr--list cursor">Free Listing</div>
							</a>
						</div>
						<?php } ?>
						<?php } else { ?>
						<div class="frr--list cursor free_listBtn">Free Listing</div>
						<?php } ?>
					</div>
					<div class="col-sm-9">
						<div id="top-links" class="nav pull-right">
							<ul class="list-inline">
								<li>
									<?php if ($logged && $login_type != 'buyer') { ?>
									<a href="index.php?route=selleradvertise/advertise/add">Advertise &nbsp;&nbsp;&nbsp;|</a>
									<?php } else { ?>
									<a class="cursor" data-toggle="modal" data-target="#login_frc_seller">Advertise &nbsp;&nbsp;&nbsp;|</a>
									<?php } ?>
								</li>
								<li><a href="<?php echo HTTP_SERVER; ?>">Home &nbsp;&nbsp;&nbsp;|</a></li>
								<?php if (!$logged) { ?>
								<li><a class="cursor _bon--login">Login or Sign up<?php //echo $text_login; ?> &nbsp;&nbsp;&nbsp;|</a></li>
								<?php } ?>
								<?php if ($logged) { ?>
								<li class="dropdown">
									<?php if($seller_info['firstname']) { ?>
									<a href="<?php echo $seller_profile; ?>" title="<?php echo $text_seller_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
										<?php //echo $text_seller_account; ?>Hi,
										<?php if (strlen($seller_info['firstname']) > 9){ echo substr($seller_info['firstname'], 0, 7) . '...';} else { echo $seller_info['firstname'];} ?> <span class="caret"></span> &nbsp;&nbsp;&nbsp;| </a>
									<?php } else { ?>
									<a href="<?php echo $seller_profile; ?>" title="<?php echo $text_seller_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
										<?php //echo $text_seller_account; ?>Hi, User <span class="caret"></span> &nbsp;&nbsp;&nbsp;| </a>
									<?php } ?>
									<ul class="dropdown-menu dropdown-menu-right" style="background-color: wheat;">
										<li><a href="<?php echo $seller_profile; ?>&tab_section=profile#content">My Profile</a></li>
										<?php if($login_type == 'seller') { ?>
										<li><a href="<?php echo $seller_profile; ?>&tab_section=store_detail#content">Store/Entity detail</a></li>
										<?php if($seller_info['seller_approved'] != 0) { ?>
										<li><a href="<?php echo $seller_profile; ?>&tab_section=product#content">Products</a></li>
										<!--<li><a href="<?php echo $seller_profile; ?>&tab_section=store#content">Advertisements</a></li>-->
										<li class="dropdown-submenu cursor_none">
											<a>Advertisements <i class="fa fa-chevron-right"></i></a>
											<ul class="dropdown-menu rrt-bon-sub">
												<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=draft#content">Draft</a></li>
												<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=submitted#content">Submitted</a></li>
												<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=approved#content">Approved</a></li>
												<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=live#content">Live</a></li>
												<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=yet_to_live#content">Yet to go live</a></li>
												<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=rejected#content">Rejected</a></li>
												<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=archive#content">Archive</a></li>
												<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=trash#content">Trash</a></li>
											</ul>
										</li>
										<li><a href="<?php echo $seller_profile; ?>&tab_section=qr_code#content">QR-code</a></li>
										<li><a href="<?php echo $seller_order; ?>#content">Orders</a></li>
										<li><a href="index.php?route=sellerreview/sellerreview#content">Reviews</a></li>
										<?php } ?>
										<?php if($logged) { ?>
										<li style="border-top: 1px solid #000;">
											<a href="<?php echo $logout; ?>">
												<?php echo $text_logout; ?>
											</a>
										</li>
										<?php } ?>
										<?php } else { ?>
										<li><a href="index.php?route=account/order&tab_section=order_history#content">My Orders</a></li>
										<li><a href="<?php echo $seller_profile; ?>&tab_section=my_wallet#content">My Wallet</a></li>
										<li><a href="<?php echo $seller_profile; ?>&tab_section=expense_report#content">Expense Report</a></li>
										<?php if($logged) { ?>
										<li style="border-top: 1px solid #000;">
											<a href="<?php echo $logout; ?>">
												<?php echo $text_logout; ?>
											</a>
										</li>
										<?php } ?>
										<?php } ?>
									</ul>
								</li>
								<?php } ?>
								<li><a href="#" title="Contact Us" data-toggle="modal" data-target="#site_contact_main">Contact Us &nbsp;&nbsp;&nbsp;|</a></li>
								<li>
									<div class="addthis_toolbox addthis_default_style" data-url="<?php echo HTTP_SERVER; ?>"><a class="atc_s addthis_button_compact">Share &nbsp;&nbsp;&nbsp;|<span></span></a></div>
									<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
								</li>
								<li><a class="cursor" data-toggle="modal" data-target="#site_feedback_main" title="Feedback">Feedback |</a></li>
								<li><a href="#" data-toggle="modal" data-target="#site_faq_main" title="FAQ">FAQ &nbsp;&nbsp;&nbsp;|</a></li>
								<li><a href="#" title="Help">Help</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row sec-mob main-mob--res">
					<?php if((isset($_GET['route']) && ($_GET['route'] != 'seller/seller/info' && $_GET['route'] != 'account/wishlist' && $_GET['route'] != 'checkout/checkout' && $_GET['route'] != 'checkout/cart')) || !isset($_GET['route'])) { ?>
					<div class="col-xs-5">
						<!--<div class="row">-->
						<div id="logo">
							<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img style="height: 39px;" src="image/bon-logo-header-res.jpg<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
							<?php } else { ?>
							<h1>
								<a href="<?php echo $home; ?>">
									<?php echo $name; ?>
								</a>
							</h1>
							<?php } ?>
						</div>
						<!--</div>-->
					</div>
					<div class="col-xs-4">
						<?php if ($logged) { 
										if($seller_info['nickname']) { ?>
						<div class="frr--list cursor free_listBtn_logged">Free Listing</div>
						<?php } else { ?>
						<div class="free--list-bon">
							<a href="index.php?route=sellerprofile/sellerprofile&tab_section=store_detail#content">
								<div class="frr--list cursor">Free Listing</div>
							</a>
						</div>
						<?php } ?>
						<?php } else { ?>
						<div class="frr--list cursor free_listBtn">Free Listing</div>
						<?php } ?>
					</div>
					<div class="col-xs-2">
						<?php echo $cart; ?>
					</div>
					<?php } else { ?>
					<div class="col-xs-11" style="margin-top: 15px;"><button class="btn btn-primary pull-left" onclick="goBack()">Back</button></div>
					<?php } ?>
					<div class="col-xs-1">
					</div>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>                        
									</button>
					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="mob-menu">
							<li>
								<?php if ($logged && $login_type != 'buyer') { ?>
								<a href="index.php?route=selleradvertise/advertise/add">Advertise &nbsp;&nbsp;&nbsp;</a>
								<?php } else { ?>
								<a class="cursor" data-toggle="modal" data-target="#login_frc_seller">Advertise &nbsp;&nbsp;&nbsp;</a>
								<?php } ?>
							</li>
							<li><a href="<?php echo HTTP_SERVER; ?>">Home</a></li>
							<?php if (!$logged) { ?>
							<li><a class="cursor _bon--login">Login or Sign up<?php //echo $text_login; ?></a></li>
							<?php } ?>
							<?php if ($logged && $isseller) { ?>
							<li id="res_tete">
								<?php if($seller_info['firstname']) { ?>
								<a class="expand-one" title="<?php echo $text_seller_account; ?>">
									<?php //echo $text_seller_account; ?>Hi,
									<?php if (strlen($seller_info['firstname']) > 9){ echo substr($seller_info['firstname'], 0, 7) . '...';} else { echo $seller_info['firstname'];} ?> <span class="caret"></span></a>
								<?php } else { ?>
								<a class="expand-one" title="<?php echo $text_seller_account; ?>">
									<?php //echo $text_seller_account; ?>Hi, User <span class="caret"></span></a>
								<?php } ?>
								<ul class="content-one" style="background-color: wheat;">
									<li><a href="<?php echo $seller_profile; ?>&tab_section=profile#content">My Profile</a></li>
									<?php if($login_type == 'seller') { ?>
									<li><a href="<?php echo $seller_profile; ?>&tab_section=store_detail#content">Store/Entity detail</a></li>
									<li><a href="<?php echo $seller_profile; ?>&tab_section=product#content">Products</a></li>
									<!--<li><a href="<?php echo $seller_profile; ?>&tab_section=store#content">Advertisements</a></li>-->
									<li class="dropdown-submenu res-set-mob cursor">
										<a class="expand-two">Advertisements <i class="fa fa-chevron-right"></i></a>
										<ul class="content-two rrt-bon-sub">
											<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=draft#content">Draft</a></li>
											<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=submitted#content">Submitted</a></li>
											<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=approved#content">Approved</a></li>
											<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=live#content">Live</a></li>
											<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=yet_to_live#content">Yet to go live</a></li>
											<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=rejected#content">Rejected</a></li>
											<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=archive#content">Archive</a></li>
											<li><a href="<?php echo $seller_profile; ?>&tab_section=store&inner_store=trash#content">Trash</a></li>
										</ul>
									</li>
									<li><a href="<?php echo $seller_profile; ?>&tab_section=qr_code#content">QR-code</a></li>
									<li><a href="<?php echo $seller_order; ?>#content">Orders</a></li>
									<li><a href="index.php?route=sellerreview/sellerreview#content">Reviews</a></li>
									<?php if($logged) { ?>
									<li style="border-top: 1px solid #000;">
										<a href="<?php echo $logout; ?>">
											<?php echo $text_logout; ?>
										</a>
									</li>
									<?php } ?>
									<?php } else { ?>
									<li><a href="index.php?route=account/order&tab_section=order_history#content">My Orders</a></li>
									<li><a href="<?php echo $seller_profile; ?>&tab_section=my_wallet#content">My Wallet</a></li>
									<li><a href="<?php echo $seller_profile; ?>&tab_section=expense_report#content">Expense Report</a></li>
									<?php if($logged) { ?>
									<li style="border-top: 1px solid #000;">
										<a href="<?php echo $logout; ?>">
											<?php echo $text_logout; ?>
										</a>
									</li>
									<?php } ?>
									<?php } ?>
								</ul>
							</li>
							<?php } ?>
							<li><a href="#" title="Contact Us">Contact Us</a></li>
							<li>
								<div class="addthis_toolbox addthis_default_style" data-url="<?php echo HTTP_SERVER; ?>"><a class="atc_s addthis_button_compact">Share<span></span></a></div>
								<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
							</li>
							<li><a class="cursor" data-toggle="modal" data-target="#site_feedback_main" title="Feedback">Feedback</a></li>
							<li><a href="#" title="FAQ">FAQ</a></li>
							<li><a href="#" title="Help">Help</a></li>
						</ul>
					</div>
				</div>
				<div class="row header-sec">
					<?php if((isset($_GET['route']) && ($_GET['route'] == 'common/home' || $_GET['route'] == 'seller/seller')) || !isset($_GET['route'])) { ?>
					<div class="col-sm-4 mit--hd">
						<div class="header-heading">
							<div class="ui-icon-video" id="location-search">
								<div class="new-text-top">
									<input class="cursor" type="button" data-toggle="modal" onClick="showMyModalSetTitle(this.value)" placeholder="Current Location"
									 id="location-search-val">
									<span class="top-current-loc"><a class="cursor" type="button" data-toggle="modal" data-target="#map_mod"><i class="fa fa-map-marker"></i></a></span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3 header-center-kms">
						<strong>Range in kilometers (km)</strong>
						<form method="post" action="">
							<div class="col-sm-1" style="display: none;"></div>
							<div class="col-sm-9"></div>
							<div class="col-sm-1" style="display: none;"></div>
							<div id="slider-range"></div>
							<br/>
							<div class="km--set" style="display:none">
								<a class="cursor" id="kms_set"><i class="fa fa-refresh" aria-hidden="true"></i></a>
							</div>
							<input type="text" name="amount" id="amount" value="" readonly>
							<input type="text" name="amount1" id="amount1" value="" readonly>
						</form>
					</div>
					<?php //} elseif((isset($_GET['route']) && ($_GET['route'] == 'seller/seller/info'))) { ?>
					<?php } else { ?>
					<div class="col-sm-7">
					</div>
					<?php } ?>
					<div class="col-sm-2 fis-des">
						<?php if($login_type == 'seller') { ?>
						<div class="btn-group btn-block str--fv">
							<a class="cursor free-list-top--bon" data-toggle="modal" data-target="#login_frc_buyer"> <span class="hidden-xs hidden-sm hidden-md">Favourites (0)</span></a>
						</div>
						<?php } else { ?>
						<?php echo $store_favouries; ?>
						<?php } ?>
					</div>
					<div class="col-sm-2 str--fv fis-des tttt">
						<?php if(!$logged) { ?>
						<a class="free-list-top--bon cursor _bon--login">Wish List (0)</a>
						<?php } else { ?>
						<?php if($login_type == 'seller') { ?>
						<a class="free-list-top--bon cursor" data-toggle="modal" data-target="#login_frc_buyer">Wish List (0)</a>
						<?php } else { ?>
						<a class="free-list-top--bon" href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
							<?php echo $text_wishlist; ?>
						</a>
						<?php } } ?>
					</div>
					<?php if($login_type == 'seller') { ?>
					<div class="col-sm-1 mit--hd fis-des header_cart">
						<div id="cart" class="btn-group btn-block">
							<button class="btn btn-inverse btn-block btn-lg" data-toggle="modal" data-target="#login_frc_buyer"><span id="cart-total">0</span></button>
						</div>
					</div>
					<?php } else { ?>
					<div class="col-sm-1 mit--hd fis-des header_cart">
						<?php echo $cart; ?>
					</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
	<p id="demo"></p>
	<script>
		$(document).ready(function () {
			if (!$.cookie('myCookie')) {
				getAddress("13.0826802,80.27071840000008", $('#location-search-val'), false);
			}
			else {
				getAddress($.cookie('myCookie'), $('#location-search-val'), false);
			}
		});

		function getLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showPosition);
			} else {
				alert("Geolocation is not supported by this browser.");
			}
		}

		function showPosition(position) {
			if ((position.coords.latitude && position.coords.longitude) != '') {

				var latitude = position.coords.latitude;
				var longitude = position.coords.longitude;
				var latlong = (latitude + ", " + longitude);
				if ($('#map_mod').attr("target") == "sellerprofile") {
					sessionStorage.setItem("myStoreAddress", latlong);
					pageReload = false;
				}
				else {
					$.cookie('myCookie', latlong);
				}

				getAddress(latlong, $('#location-search-val'), true);
				$('#myModal').hide();
			}
		}

		function getAddress(latLong, element, pageReload) {

			if (!pageReload) {
				var url = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCXvDvmhFTLZ5iJyGSQm3-3GEJg0G3iztk&libraries=places&latlng=" + latLong + "&sensor=false";
				$.getJSON(url, function (data) {
					if (data.results) {
						var address = data.results[0].formatted_address;
						element.val(address);

						$.cookie('myCookieAddress', address);
					}
				})
			} else {
				location.reload();
			}

		}
	</script>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog main--ts-rt">
			<!-- Modal content-->
			<div class="modal-content loc-pop">
				<!--<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title loc-share-title">Let's start Searching from here</h4>
								</div>-->
				<div class="modal-body loc-share-top stt--rrpp">
					<img src="image/bon_logo.jpg" class="img-responsive top-atou-lc" title="BoN" alt="BoN">
					<div class="top-lc--mid">
						<p class="left">Pioneer in buy (o) near!</p>
						<p class="right">A new age is BoN!</p>
					</div>
					<button class="tet--nt btn" id="auto_detect" onclick="getLocation()">Auto detect my location</button>
					<p class="bottom_10">OR</p>
					<!-- <button class="tet--nt" id="map_detect" data-toggle="modal" data-target="#map_mod">Choose on map</button> -->
					<button type="button" onClick="showMyModalSetTitle()" class="btn">Choose on map</button>
				</div>
				<!--<div class="modal-footer">
								<button class="" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>-->
			</div>
		</div>
	</div>
	<div class="modal fade" id="login_frc_buyer" role="dialog">
		<div class="modal-dialog main--ts-rt">
			<div class="modal-content loc-pop">
				<div class="modal-body loc-share-top alt--res-pop">
					<p>Please login as a buyer and retry.</p><br/>
					<button class="alt--res-bt btn btn-primary b1" data-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="login_frc_seller" role="dialog">
		<div class="modal-dialog main--ts-rt">
			<div class="modal-content loc-pop">
				<div class="modal-body loc-share-top alt--res-pop">
					<p>Please login as a seller and retry.</p><br/>
					<button class="alt--res-bt btn btn-primary b1" data-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('input.favts2, input.favts1').on('change', function () {
			var fav_store_id = $(this).data('text');
			var fav_name = $(this).data('name');
			if ($(this).is(":checked")) {
				var vat = 1;
			} else {
				var vat = 0;
			}
			$.ajax({
				url: "index.php?route=common/header/updatestore_favourites_front",
				type: 'post',
				dataType: 'json',
				data: { store_id: fav_store_id, value: vat, fav_name: fav_name },
				success: function (json) {
				}
			});
		});
	</script>
	<script>
		function goBack() {
			window.history.back();
		}
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
							<form action="index.php?route=common/home/add_adv" method="post" enctype="multipart/form-data" id="advertise-loc" class="form-horizontal"
							 style="padding: 0px 15px;">
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
						<div class="col-md-8 _bonlg clear">
							<?php $email = '';$password = ''; ?>
							<h3>Login</h3>
							<!-- <form action="index.php?route=account/login" method="post" id="main-log" class="form-horizontal" style="padding: 0px 15px;"> -->
							<form id="main-log-bon" class="form-horizontal" style="padding: 0px 15px;">
								<ul class="_erroe-li">
									<li><span id="zone-bon-error-login" class="text-dangers"></span></li>
								</ul>
								<div class="_email-log-bon">
									<input type="text" name="email" value="<?php echo $email; ?>" placeholder="Phone number" id="input-email" class="inputText"
									 required/>
								</div>
								<ul class="_erroe-li">
									<!--<li><span id="log-sucess" class="text-dangers"></span></li>
													<li><span id="log-failure" class="text-dangers"></span></li>-->
								</ul>
								<div class="_passwrd-log-bon">
									<input type="password" name="password" value="<?php echo $password; ?>" placeholder="Password" id="input-password" class="inputText"
									 required/>
									<!--<img src="image/catalog/logo.jpg" style="width:50px; height:50px;" onmouseover="mouseoverPass();" onmouseout="mouseoutPass();" />-->
								</div>
								<div class="_passwrd-log-bon _login_type-log-bon">
									<span>										
												<input checked type="radio" name="login_type" id="buyer" value="buyer"> 
												<label for="buyer">Buyer</label>
												</span>
									<span style="float:right;">
												<input type="radio" name="login_type" id="seller" value="seller"> 
												<label for="seller">Seller</label>
												</span>
									<!--<span><input type="radio" name="gender" value="user"> Buyer</span>
													<span style="float:right;"><input type="radio" name="gender" value="seller"> Seller</span>-->
								</div>
								<div class="_log-btn-btm" style="position: static;">
									<button class="advertise-btn _btn-fin" id="log-btn-main-bon" type="button">Login</button>
								</div>
							</form>
							<div class="_log-btn-btm" style="position: static;padding: 0px 15px;">
								<button class="advertise-btn _btn-fin _sgn-sec" type="submit">Signup</button>
							</div>
							<div class="_log-btn-btm frgt-pass-hd">
								<a class="frgt-pass" id="frgt-pass" type="submit">Forgot password?</a>
							</div>
						</div>
						<div class="col-md-4 clear">
							<div>
								<img src="image/bon-logo-header-des.png<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"
								/>
							</div>
						</div>
					</div>
					<div class="row _top-sign-in" style="display:none;">
						<div class="col-md-8 _bonlg clear">
							<h3>Sign Up</h3>
							<form id="sig_top_hd" class="form-horizontal" style="padding: 0px 15px;">
								<div class="_state-log-bon">
									<select name="zone_select" id="zone_select">
													<option value="">Select your State</option>
													<?php foreach ($zone_data as $zone) { ?>
													<?php $selected = ($zone['zone_id'] == '1503') ? "selected = selected" : ""; ?>
													<option value="<?php echo $zone['zone_id']; ?>" <?php echo $selected; ?>><?php echo $zone['name']; ?></option>
													<?php } ?>
												</select>
								</div>
								<ul class="_erroe-li">
									<li><span id="zone-bon-error" class="text-dangers"></span></li>
								</ul>
								<div class="_email-log-bon">
									<input type="tel" name="telephone" value="" class="inputText cal-exp" placeholder="Enter the phone number" id="input-telephone"
									 required/>
								</div>
								<div id="LoadingImage" style="display: none"><img src="image/loader-sms.gif" class="img-responsive" /></div>
								<ul class="_erroe-li">
									<li><span id="top-line-star" class="text-dangers"></span></li>
								</ul>
								<div class="_log-btn-btm" style="position: static;">
									<button class="advertise-btn _btn-fin" id="sign-up-bon-top" type="button">Continue</button>
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
						<div class="col-md-4 clear">
							<div>
								<img src="image/bon-logo-header-des.png<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"
								/>
							</div>
						</div>
					</div>
					<div class="row _top-sign-otp" style="display:none;">
						<div class="col-md-8 _bonlg clear">
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
									<input type="tel" name="otp" value="" maxlength="6" class="inputText" id="otp" placeholder="Enter the OTP sent to above mobile number"
									 required/>
								</div>
								<ul class="_erroe-li">
									<li><span id="top-line-star-otp" class="text-dangers"></span></li>
								</ul>
								<div class="_email-log-bon">
									<input style="border: none;border-bottom: 1px solid #e0e0e0; " type="email" name="email" value="" class="inputText" id="input-email-otp"
									 placeholder="Email ID" required disabled/>
								</div>
								<ul class="_erroe-li">
									<li><span id="email-error" class="text-dangers"></span></li>
								</ul>
								<div class="_passwrd-log-bon">
									<input type="password" name="password" value="" id="input-password-otp" placeholder="Enter password" class="inputText" required
									 disabled/>
								</div>
								<ul class="_erroe-li">
									<li><span id="norm-pas" class="text-dangers"></span></li>
								</ul>
								<div class="_again-passwrd-log-bon">
									<input type="password" name="confirm" value="" id="input-confirm-otp" placeholder="Re-Enter password" class="inputText" required
									 disabled/>
								</div>
								<ul class="_erroe-li">
									<li><span id="conf-pas" class="text-dangers"></span></li>
								</ul>
								<div class="_state-log-bon">
									<select name="security_select" id="security_select" disabled required>
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
									<input type="text" name="security_answer" value="" id="security_answer" placeholder="Please enter the security answer" class="inputText"
									 required/>
								</div>
								<ul class="_erroe-li">
									<li><span id="security_answer_alt" class="text-dangers"></span></li>
								</ul>
								<div class="_log-btn-btm" style="position: static;">
									<button class="advertise-btn _btn-fin" id="sign-up-bon-top-prof" type="button" disabled>Signup</button>
								</div>
								<div class="_log-btn-btm" style="position: static;">
									<button class="advertise-btn _btn-fin _sgn-outt" type="submit">Existing user? Login</button>
								</div>
							</form>
						</div>
						<div class="col-md-4 clear">
							<div>
								<img src="image/bon-logo-header-des.png<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"
								/>
							</div>
						</div>
					</div>
					<div class="row _top-sign-upd" style="display:none;">
						<div class="col-md-8 _bonlg clear">
							<h3>Personal Details</h3>
							<form id="top-sign-last" class="form-horizontal" enctype="multipart/form-data" style="padding: 0px 15px;">
								<input type="hidden" name="cus_d_up" id="cus_d_up" value="">
								<div class="_email-log-bon">
									<input type="text" name="firstname" value="" class="inputText" placeholder="First name" id="input-firstname" required/>
								</div>
								<ul class="_erroe-li">
									<li><span id="fist-name-bon" class="text-dangers"></span></li>
								</ul>
								<div class="_passwrd-log-bon">
									<input type="text" name="lastname" value="" placeholder="Last name" id="input-lastname" class="inputText" required/>
								</div>
								<ul class="_erroe-li">
									<li><span id="last-name-bon" class="text-dangers"></span></li>
								</ul>
								<div class="_again-passwrd-log-bon">
									<input type="text" name="address_1" value="" placeholder="Address" id="input-address-1" class="inputText" required/>
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
						<div class="col-md-4 clear">
							<div>
								<img src="image/bon-logo-header-des.png<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"
								/>
							</div>
						</div>
					</div>
					<div class="row _forget-bon" style="display:none;">
						<div class="col-md-8 _bonlg clear">
							<h3>Forgot Password</h3>
							<form id="forget-log-type" class="form-horizontal" style="padding: 0px 15px;">
								<div class="_email-log-bon">
									<input type="text" name="forgt-phn" value="" placeholder="Enter the phone number" id="forgt-phn" class="inputText" required/>
								</div>
								<div id="LoadingImage1" style="display: none"><img src="image/loader-sms.gif" class="img-responsive" /></div>
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
						<div class="col-md-4 clear">
							<div>
								<img src="image/bon-logo-header-des.png<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"
								/>
							</div>
						</div>
					</div>
					<div class="row _forget-bon-sec" style="display:none;">
						<div class="col-md-8 _bonlg clear">
							<h3>Forgot Password</h3>
							<form id="forget-log-sec" class="form-horizontal" style="padding: 0px 15px;">
								<input type="hidden" name="forgt-phn-sec" id="forgt-phn-sec" value="">
								<input type="hidden" name="otp-sec" id="otp-sec" value="0">
								<div class="_email-log-bon">
									<input type="text" name="forgt-phn" value="" placeholder="Enter the phone number" id="forgt-phn-sec_nw" class="inputText"
									 required disabled/>
								</div>
								<div class="_passwrd-log-bon">
									<input type="text" name="forgt-phn-otp" value="" maxlength="6" placeholder="Enter the OTP sent to above mobile number" id="forgt-phn-otp"
									 class="inputText" required/>
								</div>
								<ul class="_erroe-li">
									<li><span id="sec_otp_sec" class="text-dangers"></span></li>
								</ul>
								<div id="qus_ans">
									<div class="_state-log-bon">
										<input type="text" name="security_question_sec" value="" id="security_question_sec" class="inputText" required disabled/>
									</div>
									<div class="_again-passwrd-log-bon security_answer">
										<input type="text" name="security_answer_sec" value="" id="security_answer_sec" placeholder="Please enter the security answer"
										 class="inputText" required/>
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
						<div class="col-md-4 clear">
							<div>
								<img src="image/bon-logo-header-des.png<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"
								/>
							</div>
						</div>
					</div>
					<div class="row _forget-bon-pass" style="display:none;">
						<div class="col-md-8 _bonlg clear">
							<h3>Forgot Password</h3>
							<form id="forget-log-pass" class="form-horizontal" style="padding: 0px 15px;">
								<input type="hidden" name="cus_ids" id="cus_ids" value="">
								<div class="_email-log-bon">
									<input type="text" name="password" value="" placeholder="Enter new password" id="forgt-pass" class="inputText" required/>
								</div>
								<ul class="_erroe-li">
									<li><span id="forgt-phn-pass-fail" class="text-dangers"></span></li>
								</ul>
								<div class="_passwrd-log-bon">
									<input type="text" name="confirm" value="" placeholder="Re-Enter new password" id="forgt-pass-re" class="inputText" required/>
								</div>
								<ul class="_erroe-li">
									<li><span id="forgt-phn-pass-re-fail" class="text-dangers"></span></li>
								</ul>
								<div class="_log-btn-btm" style="position: static;">
									<button class="advertise-btn _btn-fin" id="forget-btn-main-bon-pass" type="button">Submit</button>
								</div>
							</form>
						</div>
						<div class="col-md-4 clear">
							<div>
								<img src="image/bon-logo-header-des.png<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"
								/>
							</div>
						</div>
					</div>
					<div class="row _alreary_logged" style="display:none;">
						<div class="col-md-12 _bonlg clear">
							<p>You have already logged in. To register a new store/entity, please logout and retry.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function () {

			$(".free_listBtn_logged").click(function () {
				$('#_log-bon').modal('show');
				$("._top-log-in").hide();
				$("._alreary_logged").show();
				$('._sig_log').show().css('height', '100px');
			});
			$(".free_listBtn").click(function () {
				$('#_log-bon').modal('show');
				$("._top-log-in").hide();
				$("._top-sign-in").show();
			});
			$("._bon--login").click(function () {

				$('#_log-bon').modal({
					backdrop: 'static',
					keyboard: false
				})
				$('#_log-bon').modal('show');
				//$("._top-sign-in").hide();
				//$("._top-log-in").show();
			});
		});
		$(document).ready(function () {
			$("._sgn-sec").click(function () {
				$("._top-log-in").hide();
				$("._top-sign-in").show();
			});
			$("._sgn-out").click(function () {
				$("._top-sign-in").hide();
				$("._top-log-in").show();
			});
			$("._sgn-outt").click(function () {
				$('.text-dangers').html('');
				$('#_top-sign-otp').trigger("reset");
				$("._top-sign-otp").hide();
				$("._top-log-in").show();
			});
			$("#sign-up-bon-top-otp").click(function () {
				var cus_d = $('#cus_d').val();
				$('#cus_prof').val(cus_d);
				$("._top-sign-otp").hide();
				$("._top-sign-prof").show();
			});
			$("._skip-prof").click(function () {
				$('.text-dangers').html('');
				$('#_top-sign-otp').trigger("reset");
				$('#top-sign-last').trigger("reset");
				$("._top-sign-upd").hide();
				$("._top-log-in").show();
			});
			$("input#otp").keyup(function () {
				var lgt = $('#otp').val().length;
				if (lgt == 6) {
					$('#top-line-star-otp').html('');
					$.ajax({
						url: 'index.php?route=common/header/code_check',
						type: 'post',
						dataType: 'json',
						data: $("#_top-sign-otp").serialize(),
						success: function (json) {
							if (json['success']) {//alert("fgggs");
								$("#input-email-otp").removeAttr('disabled');
								$("#input-password-otp").removeAttr('disabled');
								$("#input-confirm-otp").removeAttr('disabled');
								$("#security_select").removeAttr('disabled');
								$("#sign-up-bon-top-prof").removeAttr('disabled');
							}
							if (json['error_warning']) {
								$('#top-line-star-otp').html('<i class="fa fa-times" aria-hidden="true"></i> ' + json['error_warning']);
							}
						}
					});

					//$("#input-email-otp").removeAttr('disabled');
					//$("#input-password-otp").removeAttr('disabled');
					//$("#input-confirm-otp").removeAttr('disabled');
					//$("#sign-up-bon-top-prof").removeAttr('disabled');
				};
			});
			$("#frgt-pass").click(function () {
				$("._top-log-in").hide();
				$("._forget-bon").show();
			});
			$("._resr-log-bon").click(function () {
				$("._forget-bon").hide();
				$("._top-log-in").show();
			});
		});

		//Login pop with mobile num
		$('#main-log-bon input').on('keydown', function (e) {
			if (e.keyCode == 13) {
				$('#log-btn-main-bon').trigger('click');
			}
		});
		$('#log-btn-main-bon').click(function () {
			$('#zone-bon-error-login').html('');
			$.ajax({
				url: 'index.php?route=account/login/login',
				type: 'post',
				dataType: 'json',
				data: $("#main-log-bon").serialize(),
				success: function (json) {
					//$('#modal-quicksignup .form-group').removeClass('has-error');								

					if (json['error']) {
						$('#zone-bon-error-login').html('<i class="fa fa-times" aria-hidden="true"></i> ' + json['error']);
						$('#main-log-bon #input-email').focus();
					}
					if (json['success']) {
						loacation();
						$('#_log-bon').modal('hide');
					}

				}
			});
		});

		function loacation() {
			location.reload();
		}

		$('#sign-up-bon-top').on('click', function () {
			$('#top-line-star').html('');
			$("#LoadingImage").show();
			$.ajax({
				url: 'index.php?route=common/header/new_login',
				type: 'post',
				dataType: 'json',
				data: $("#sig_top_hd").serialize(),
				success: function (json) {
					if (json['success']) {
						$("#LoadingImage").hide();
						$('#cus_prof').val(json['success']);
						var zon_id = json['zone_select'];
						if (zon_id == 1503) {
							$('#zone_select_ret').val('Tamil nadu');
						} else if (zon_id == 1499) {
							$('#zone_select_ret').val('Puducherry');
						}
						$('#input-telephone_ret').val(json['telephone']);
						$("._top-sign-in").hide();
						$("._top-sign-otp").show();
					}
					if (json['error_warning']) {
						$("#LoadingImage").hide();
						$('#top-line-star').html('<i class="fa fa-times" aria-hidden="true"></i> ' + json['error_warning']);
					}
					if (json['error_telephone']) {
						$("#LoadingImage").hide();
						$('#top-line-star').html('<i class="fa fa-times" aria-hidden="true"></i> ' + json['error_telephone']);
					}
					if (json['telephone_number']) {
						$("#LoadingImage").hide();
						$('#top-line-star').html('<i class="fa fa-times" aria-hidden="true"></i> ' + json['telephone_number']);
					}
				}
			});
		});
		$('#sign-up-bon-top-prof').on('click', function () {
			$('#email-error').html('');
			$('#norm-pas').html('');
			$('#conf-pas').html('');
			$('#security_select_alt').html('');
			$('#security_answer_alt').html('');
			$.ajax({
				url: 'index.php?route=common/header/new_login_update',
				type: 'post',
				dataType: 'json',
				data: $("#_top-sign-otp").serialize(),
				success: function (json) {
					if (json['success']) {
						$('#cus_d_up').val(json['success']);
						$("._top-sign-otp").hide();
						$("._top-sign-upd").show()
					}
					if (json['error_email_empty']) {
						$('#email-error').html('<i class="fa fa-times" aria-hidden="true"></i>' + json['error_email']);
					}
					if (json['error_email']) {
						$('#email-error').html('<i class="fa fa-times" aria-hidden="true"></i>' + json['error_email']);
					}
					if (json['error_warning']) {
						$('#email-error').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['error_warning']);
					}
					if (json['error_password']) {
						$('#norm-pas').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['error_password']);
					}
					if (json['error_confirm']) {
						$('#conf-pas').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['error_confirm']);
					}
					if (json['security_select']) {
						$('#security_select_alt').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['security_select']);
					}
					if (json['security_answer']) {
						$('#security_answer_alt').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['security_answer']);
					}
				}
			});
		});
		$('#updat-bon-det').on('click', function () {
			$.ajax({
				url: 'index.php?route=common/header/new_login_update_two',
				type: 'post',
				dataType: 'json',
				data: $("#top-sign-last").serialize(),
				success: function (json) {
					if (json['success']) {
						$('#_top-sign-otp').trigger("reset");
						$('#top-sign-last').trigger("reset");
						$('#reg-sucess').html('<i class="fa fa-check" aria-hidden="true"></i><span>' + json['success']);
						$("._top-sign-upd").hide();
						$("._top-log-in").show();
					}
					if (json['error_firstname']) {
						$('#fist-name-bon').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['error_firstname']);
					}
					if (json['lastname']) {
						$('#last-name-bon').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['lastname']);
					}
					if (json['error_address_1']) {
						$('#address-bon').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['error_address_1']);
					}
				}
			});
		});
		$('#forget-btn-main-bon-type').on('click', function () {
			$('.text-dangers').html('');
			$("#LoadingImage1").show();
			$.ajax({
				url: 'index.php?route=common/header/forgot_pass_log',
				type: 'post',
				dataType: 'json',
				data: $("#forget-log-type").serialize(),
				success: function (json) {
					if (json['success']) {
						$("#LoadingImage1").hide();
						$('#forgt-phn-sec').val(json['success']);
						$('#forgt-phn-sec_nw').val(json['success']);
						$('#security_question_sec').val(json['q_name']);
						$("._forget-bon").hide();
						$("._forget-bon-sec").show();
						$("#qus_ans").hide();
					}
					if (json['forgt-phn-failure']) {
						$("#LoadingImage1").hide();
						$('#forgt-phn-failure').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['forgt-phn-failure']);
					}
				}
			});
		});
		$(document).ready(function () {
			$("input#forgt-phn-otp").keyup(function () {
				var lgt = $('#forgt-phn-otp').val().length;
				if (lgt == 6) {
					$('.text-dangers').html('');
					$.ajax({
						url: 'index.php?route=common/header/forgot_pass_sec',
						type: 'post',
						dataType: 'json',
						data: $("#forget-log-sec").serialize(),
						success: function (json) {
							if (json['success']) {
								$('#cus_ids').val(json['success']);
								$('#otp-sec').val(1);
								$("#qus_ans").show();
							}
							if (json['sec_otp_sec']) {
								$('#sec_otp_sec').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['sec_otp_sec']);
							}
						}
					});
				};
			});
		});
		$('#forget-btn-main-bon-sec').on('click', function () {
			$('.text-dangers').html('');
			$.ajax({
				url: 'index.php?route=common/header/forgot_pass_sec',
				type: 'post',
				dataType: 'json',
				data: $("#forget-log-sec").serialize(),
				success: function (json) {
					if (json['success']) {
						$('#cus_ids').val(json['success']);
						$("._forget-bon-sec").hide();
						$("._forget-bon-pass").show();
					}
					if (json['security_answer_sec']) {
						$('#security_answer_sec-er').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['security_answer_sec']);
					}
					if (json['sec_otp_sec']) {
						$('#sec_otp_sec').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['sec_otp_sec']);
					}
				}
			});
		});

		$('#forget-btn-main-bon-pass').on('click', function () {
			$('.text-dangers').html('');
			$.ajax({
				url: 'index.php?route=common/header/forgot_pass_change',
				type: 'post',
				dataType: 'json',
				data: $("#forget-log-pass").serialize(),
				success: function (json) {
					if (json['success']) {
						$('#reg-sucess').html('<i class="fa fa-check" aria-hidden="true"></i><span>' + json['success']);
						$("._forget-bon-pass").hide();
						$("._top-log-in").show();
					}
					if (json['error_password']) {
						$('#forgt-phn-pass-fail').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['error_password']);
					}
					if (json['error_confirm']) {
						$('#forgt-phn-pass-re-fail').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['error_confirm']);
					}
				}
			});
		});



		function setCookiePosition(button) {
			if (button == 'ok') {
				var latlong = (document.getElementById("latitude").value + ", " + document.getElementById("longitude").value);
				$.cookie('myCookie', latlong);
				location.reload();
				return true;
			} else { return false; }
		}
	</script>
	<style>
		#examples a {
			text-decoration: underline;
		}

		#geocomplete {
			width: 200px
		}

		.map_canvas {
			width: 600px;
			height: 400px;
			margin: 10px 20px 10px 0;
		}

		#multiple li {
			cursor: pointer;
			text-decoration: underline;
		}

		#geocomplete {
			width: 200px
		}

		.map_canvas {
			width: 100%;
			height: 400px;
			margin: 10px 20px 10px 0;
		}

		.pac-container.pac-logo {
			z-index: 2147483647;
		}
		/*fieldset { width: 320px; margin-top: 20px}
					fieldset strong { display: block; margin: 0.5em 0 0em; }
					fieldset input { width: 95%; }*/

		ul span {
			color: #999;
		}

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
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header map-header">

				<div class="row" id="showLocationArea">
					<div class="col-xs-12 col-sm-6 col-md-6">
					<input type="text" id="us11-address" class="form-control" placeholder="location" />
					<span class="input-group-addon mapsearch cursor" data-dismiss="modal" onclick="getLocation()"><i class="fa fa-search fa" aria-hidden="true"></i></span>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-6">
					<button type="button" class="close pull-right" data-dismiss="modal" aria-label="Close">
          					<span aria-hidden="true">&times;</span>
        			</button>
					<a class="linkMap pull-right" onclick="showLatArea()">Search by latitude longitude</a>
					</div>

				</div>

				<div class="row" id="showLatLongArea">
				<div class="col-xs-5 col-sm-5 col-md-3 right0">
					<input type="text" id="us11-lat" class="form-control" placeholder="Latitude" />
				</div>

				<div class="col-xs-5 col-sm-5 col-md-3 right0">
					<input type="text" id="us11-lon" class="form-control" placeholder="Langitude" />
				</div>

				<div class="col-xs-2 col-sm-2 col-md-2">
					<span class="input-group-addon mapsearch cursor" data-dismiss="modal" onclick="getLocation()"><i class="fa fa-search fa" aria-hidden="true"></i></span>
				</div>

				<div class="col-xs-12 col-sm-2 col-md-4">
				<button type="button" class="close pull-right" data-dismiss="modal" aria-label="Close">
          					<span aria-hidden="true">&times;</span>
        		</button>
				<a class="linkMap pull-right" onclick="showLocArea()">Search by location</a>
				</div>

				</div>
					

				</div>
				<div class="modal-body relative-pos">
					<div id="us11"></div>
					<input type="text" id="divFormattedAddress" class="form-control" />
				</div>
				<div class="modal-footer">
				<button type="button" class="btn btn-primary getloc pull-left" data-dismiss="modal" onclick="getLocation()">Get current location</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="setPosition()">Ok</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function () {
			function renderMap(lat, lan) {
				$('#us11').locationpicker({
					location: {
						latitude: lat,
						longitude: lan
					},
					radius: 0,
					inputBinding: {
						latitudeInput: $('#us11-lat'),
						longitudeInput: $('#us11-lon'),
						locationNameInput: $('#us11-address')
					},
					enableAutocomplete: true,
					onchanged: function (currentLocation, radius, isMarkerDropped) {
						getAddress(currentLocation.latitude + ", " + currentLocation.longitude, $("#divFormattedAddress"), false);
					}

				});
			}
			$('#map_mod').on('shown.bs.modal', function (e) {
				if (e.relatedTarget) {
					if (e.relatedTarget.id == "search-btn_st")
						$('#map_mod').attr("target", "sellerprofile");
					else
						$('#map_mod').attr("target", "home");
				}
				else
					$('#map_mod').attr("page_reload", "home");

				if ($('#map_mod').attr("target") == "sellerprofile") {
					if (sessionStorage.getItem("myStoreAddress")) {
						var latLangCookie = sessionStorage.getItem("myStoreAddress").split(',');
						renderMap(latLangCookie[0], latLangCookie[1]);
						getAddress(latLangCookie, $("#divFormattedAddress"), false);
					}
					else {
						var latLangCookie = "13.0826802, 80.27071840000008";
						renderMap(13.0826802, 80.27071840000008);
						getAddress(latLangCookie, $("#divFormattedAddress"), false);
					}
				}
				else {
					if ($.cookie("myCookie")) {
						var latLangCookie = $.cookie("myCookie").split(',');
						renderMap(latLangCookie[0], latLangCookie[1]);
						getAddress(latLangCookie, $("#divFormattedAddress"), false);
					}
					else {
						var latLangCookie = "13.0826802, 80.27071840000008";
						renderMap(13.0826802, 80.27071840000008);
						getAddress(latLangCookie, $("#divFormattedAddress"), false);
					}
				}
				$('#us11').locationpicker('autosize');
			});
		});
		function setPosition() {
			var latitude = $('#us11-lat').val();
			var longitude = $('#us11-lon').val();
			var latlong = (latitude + ", " + longitude);

			if ($('#map_mod').attr("target") == "sellerprofile") {
				sessionStorage.setItem("myStoreAddress", latlong);
			}
			else {
				$.cookie('myCookie', latlong);
				//alert('The value of myCookie is now "' + $.cookie('myCookie') + '". Now, reload the page, PHP should read it correctly.');
				location.reload();
			}
		}


		$("select#zone_select").change(function () {
			$('#top-line-star').html('');
			$('#zone-bon-error').html('');
			var zone_id = $(this).val()
			if ((zone_id == 1503) || (zone_id == 1499)) {
				$("#input-telephone").removeAttr('disabled');
				$("#sign-up-bon-top").removeAttr('disabled');
			} else {
				$('#zone-bon-error').html('<i class="fa fa-times" aria-hidden="true"></i><span>Currently available in Tamilnadu and Pondicherry only. Will be launched in above place soon.</span>');
				$("#input-telephone").attr('disabled', 'disabled');
				$("#sign-up-bon-top").attr('disabled', 'disabled');
			}
		});
		$("select#security_select").change(function () {
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

	<!-- feedback modal -->
	<div class="modal fade" id="site_feedback_main" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content loc-pop">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title loc-share-title">Feedback</h4>
				</div>
				<div class="modal-body site-feedback-top">
					<form action="" method="post" enctype="multipart/form-data" id="site_feedback_main_ll" class="form-horizontal">
						<div class="form-group">
							<div id="site_feed_alt"></div>
						</div>
						<div class="form-group">
							<input type="text" name="fd_mobile_num" id="fd_mobile_num" value="" placeholder="Mobile number" required>
						</div>
						<div class="form-group">
							<input type="text" name="fd_email" id="fd_email" value="" placeholder="Email ID" required>
						</div>
						<div class="form-group">
							<textarea type="text" name="feedback" id="fd_feedback" value="" placeholder="Your concern/issue/feedback is valuable to us. Will be addressed shortly."></textarea>
						</div>
						<div class="form-group">
							<button class="favv-str-btn btn" type="button" id="button_site_feedback">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- feedback modal -->

	<!-- contact modal -->
	<div class="modal fade" id="site_contact_main" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title loc-share-title">Contact us</h4>
				</div>
				<div class="modal-body contact-modal">
					<p>If you are facing any issue or have a concern or want to leave a <a class="cursor" onclick="showFeedbackModal()" title="Feedback">Feedback</a>.</p>
					<p>For anyother information or queries please send email to bononlineservices@buyonear.in. We will respond in 24 to 48 hours.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- contact modal -->

	<!-- faq modal -->
	<div class="modal fade" id="site_faq_main" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content loc-pop">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title loc-share-title">FAQ</h4>
				</div>
				<div class="modal-body">

				<div class="slectLang">
					<label><span>Select language: </span> 
					<select class="form-control langu" onchange="toggleFaq()" id="faqLanguage">
						<option value="english">English</option>
						<option value="tamil">Tamil</option>
					</select>
					</label>
				</div>

				<div id="englishFaq">
					
					<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
          What is the purpose and uniqueness of this website?
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>Purpose:</h4>
        <p>Helps business of any level to promote in all places, irrespective of any number of competencies. Sellers can post their advertisement for free or they are allowed to bid and choose a desired position from the existing AD list. Buyers can view posted offers/advertisements instantly depending on the category needed. It acts as online exhibition favouring both sellers and buyers.</p>
        <h4>Uniqueness:</h4>
        <p>BoN treats all stores/entities at a same level, shows no partiality to low or high return stores/entities in seeking commission charges. It is the ONLY place for sellers with trading mind and buyers who likes to save their money, with no effort.</p>
		<p>Buyers mostly have a good opinion on few stores/entities. It is not practical or possible to analyse all stores/entities at the same time. This leads to lose their money and satisfaction on most or all the time. Using BoN alias buyonear.in buyers now can prevent this from happening.
		</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
          Why BoN, what is the need?
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse in">
      <div class="panel-body">
        <p>World is slowly (rather quickly) moving online. Business is not the same as how it was 10 or 20 years back. It will surely not be the same like how it is now sooner. So think online think BoN before it is too late. It is FREE.</p>
		<p>It is the single place to complete your search and get the best you want near you or from the place you are looking for. It will not force you to believe the best is what it shows on the item you are interested. </p>
		<p>“LET’S START SEARCHING FROM HERE!” before we do with untrusted, unreliable and unknown sellers.</p>
		<p>It is a centralized online exhibition. Where sellers meet buyers online, especially with lot many offers. The earlier you enrol, the more benefits you get.
		</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
          As a seller how this website helps?
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>Seller:</h4>
        <ul>
		<li>i. No technical knowledge required.</li>
		<li>ii. Irrespective of the level, move your business online.</li>
		<li>iii. BoN allows seller to add products, post advertisements, track buyer’s order and get buyer reviews without any effort. BoN takes care of marketing on your behalf.</li>
		<li>iv. Post advertisements and get immediate attention from buyers.</li>
		<li>v. Top the listing by featuring your store/entity to get more attention from buyers.</li>
		<li>vi. Add your products with offers or discounts if you have, for buyers to easily pick.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
          As a buyer how this website helps?
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>Buyer:</h4>
        <ul>
		<li>i.	Saves your money, time and effort.</li>
		<li>ii.	Most or all buyers though few may prefer online shopping sometimes, likes to do shopping themselves near them or from a place they want to. Buyers likes to spend their hard earned money wisely barring few percentage of it. BoN helps buyers do the same in a lot better and easier way.</li>
		<li>iii. Easy to filter advertisements and store/entity listing based on the needed category.</li>
		<li>iv.	Since it is free, brings all stores/entities near you to your hand.</li>
		<li>v.	It is the single place to complete your search and get the best you want near you or from the place you are looking for. It will not force you to believe the best is what it shows on the item you are interested.</li>
		<li>vi.	It is much more than a telephone directory.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
          Being a buyer can I use “Seller” feature or vice versa?
        </a>
      </h4>
    </div>
    <div id="collapseFive" class="panel-collapse collapse">
      <div class="panel-body">
        <p>Of course you can. While signing up, BoN will not ask whether you are a seller or buyer. Need to provide only at the time of logging into BoN with your credentials.</p>
		<p>Every seller is naturally a buyer too to run his daily life. Also most buyers who are house wives or new entrepreneurs, are willing to start own or home based business. More than money, marketing efforts makes them not to. For them BoN is the answer, it takes their business outside with no effort making them succeed in no time.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
          How is BoN good to both sellers and buyers?
        </a>
      </h4>
    </div>
    <div id="collapseSix" class="panel-collapse collapse">
      <div class="panel-body">
        <p>It is good to both sellers and buyers.</p>
		<p><strong>Assuming case 1:</strong></p>
		<p>All sellers are using BoN.</p>
		<p>Hurray!! Buyers job is made easier now, they get their best with low price in few minutes without a sweat like how they want it to be done before BoN.</p>
		<p><strong>Assuming case 2:</strong></p>
		<p>All buyers are using BoN.</p>
		<p>Hurray!! Sellers job is made easier now, they get all buyers to see what they are offering. BoN makes their visibility lot higher hence increasing their sales. It covers almost all essence of business to achieve more profit.</p>
		<p>It's a win-win situation to both Buyers and Sellers. Hence both needs to get others join as fast as they could to make it a big success for both of them.</p> 
		<p>Sellers who knows BoN should register and ask their usual Buyers to use BoN, to let them know offers every time sellers post instantly.</p>
		<p>Buyers who knows BoN should use and ask sellers nearby or whom they meet often to join BoN, to let other buyers know their offers.</p> 
		<p>It needs a push from both to make a good profit/savings.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">
          I am a seller, is there usability restriction for any type of business?
        </a>
      </h4>
    </div>
    <div id="collapseSeven" class="panel-collapse collapse">
      <div class="panel-body">
        <p>NO, it is for all types of businesses.</p>
		<p>It is the best approach for all sellers, especially to new sellers or to whom who really means business. Sellers who go by their names might think twice before joining BoN at first but seeing buyers using BoN makes them realise names matter less. And Sellers who doesn't have much buyers using BoN in their area will make them buy with the price they set.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">
          Sellers nearby my place do not use BoN, can I wait for someone to join before me?
        </a>
      </h4>
    </div>
    <div id="collapseEight" class="panel-collapse collapse">
      <div class="panel-body">
        <p>Considering the advantage and feature, it only takes less or no time in reaching everyone.</p>
		<p>If you delay, it is advantage to your competitor, so it's wise to join now itself. It is FREE. No need to pay for joining or for adding products or for posting AD's.</p>
		<p>Moreover you get lot more visibility and no fight!</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">
			I am a store/entity owner (seller), how do I get mine added in the website?
        </a>
      </h4>
    </div>
    <div id="collapseNine" class="panel-collapse collapse">
      <div class="panel-body">
        <p>It only takes few minutes to add your store/entity and get benefited. Please follow below simple steps.</p>
        <ul>
		<li>i.	Sign-up and login as a seller.</li>
		<li>ii.	In your account enter detail about your business. (Business name, banner, category(s), location, etc.)</li>
		<li>iii.	After approval you get added.</li>
		</ul>
		<p>Own a personal webstore for no cost and no marketing worries.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">
			If I want to buy something how do I go about it?
        </a>
      </h4>
    </div>
    <div id="collapseTen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>It just needs below simple steps.</p>
		<ul>
		<li>i.	Login as a buyer.</li>
		<li>ii.	Choose the category in home page to filter advertisements. Pick the store/entity which attracts you and find the product. Add it to your cart.</li>
		<li>iii.	Also you can search for the item you are interested. From the store/entity search result, find the item and add it to your cart.</li>
		<li>iv.	Proceed to check out.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">
			I do not see any stores around me in the website?
        </a>
      </h4>
    </div>
    <div id="collapseEleven" class="panel-collapse collapse">
      <div class="panel-body">
        <p>You do not see only because of below two reasons.</p>
        <ul>
		<li>i.	From the range you set, there is no available store/entity near you.
		Alter the range and search again. If you still do not find any, you can modify the location in home page and repeat your search.</li>
		<li>ii.	Stores/entities have not joined BoN.
		Since it is free, only possibility will be unawareness by sellers. Make them aware and join BoN for yours and others benefit.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve">
			Do you charge one time or monthly fees to register my store?
        </a>
      </h4>
    </div>
    <div id="collapseTwelve" class="panel-collapse collapse">
      <div class="panel-body">
        <p>NO, it is absolutely free to join and register your store/entity in BoN.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThirteen">
			Heard I can upload products or post advertisements for free in your website, is it true!?
        </a>
      </h4>
    </div>
    <div id="collapseThirteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>YES, it is free to upload products and post your advertisements.</p> 
		<p>Also since BoN covers all level of businesses from low to high returns, bidding approach is followed to make every seller happy. You can bid and choose a position from the existing AD list to post your advertisement according to your budget.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFourteen">
			I think ideally this is the best approach but how are you going to get all stores added in your website?
        </a>
      </h4>
    </div>
    <div id="collapseFourteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>It is free and more helpful for both sellers and buyers. We just need to spread the news.</p> 
		<p>Stage is beautifully set, gates are open for all, no entry fee for anyone and exit with more benefits… what else we need!!!</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFifteen">
			If I have a feedback or get into any issues, whom or how should I contact?
        </a>
      </h4>
    </div>
    <div id="collapseFifteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>You can post your feedback or issues or concerns in the ‘Feedback’. We will respond immediately.</p> 
		<p>If you want to pass any other information, please send email to bononlineservices@buyonear.in. We will respond in 24 to 48 hours.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSixteen">
			Why the advertisement I posted is of low image quality (blurred)?
        </a>
      </h4>
    </div>
    <div id="collapseSixteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>Please make sure below points before submitting the advertisement for BoN’s approval to get good image quality and high response.</p>
        <ul>
		<li>i.	Title should be clear and short.</li> 
		<li>ii.	Cropped image quality should be bright, easily understandable and of high image quality.</li>
		<li>iii.	Provide detailed description about the advertisement in ‘Description’ field. This is not mandatory.</li>
		<li>iv.	Provide URL if you have.</li>
		</ul>
		<p>True and good quality advertisement will surely increase the attention and your ranking which in turn increases your sales.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeventeen">
			When do I get to use My Wallet/Pay/Expense Report feature?
        </a>
      </h4>
    </div>
    <div id="collapseSeventeen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>They are under development. It needs minor adjustments according to the usability and feedback by the users.</p>
		<p>Once the design or approach is finalized after considering feedbacks by the users, will be released.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEighteen">
			Is there any other future improvements/plans you have?
        </a>
      </h4>
    </div>
    <div id="collapseEighteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>Yes, there are many more surprising ideas to be implemented sooner. Please await surprises to unfold and provide your cooperation in spreading the news at this time for everyone’s benefit.</p>
		<p>Let us work together for a better living.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNineteen">
			Does BoN website work in all browsers?
        </a>
      </h4>
    </div>
    <div id="collapseNineteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>BoN works very well in google chrome, internet explorer and firefox browser. Though we tested extensively in all three browsers, if you happen to get into any issues in one try in other browsers.</p>
		<p>Mobile app development is currently in progress. We are working hard to get them released for user’s convenience.</p>
		<p>You may post your issue in ‘Feedback’ menu if it does not work in any browsers.</p>
      </div>
    </div>
  </div>

</div>

</div>
<!-- english -->

<!-- tamil -->
	<div id="tamilFaq">

		<div class="panel-group" id="accordion1">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne1">
          இந்த வலைத்தளத்தின் நோக்கம் மற்றும் தனித்துவம் என்ன?
        </a>
      </h4>
    </div>
    <div id="collapseOne1" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>நோக்கம்:</h4>
        <p>எத்தகைய வணிகமாக (குறு, சிறு மற்றும் பெருந்தொழில்) இருந்தாலும், எந்த இடத்தில இருந்தாலும், எவ்வளவு போட்டியாளர்கள் இருந்தாலும் உங்களின் விற்பனையை ஊக்குவிக்க BoN (buyonear.in) இணையத்தளம் உதவும். விற்பனையாளர்கள் தங்கள் விளம்பரங்களை “இலவசமாக” பதிவு செய்யலாம் அல்லது ஏற்கனவே இருக்கும் விளம்பரப் பட்டியலில் இருந்து பிடித்த இடத்தை தகுந்த ஏலத்திற்கு தேர்வு செய்ய அனுமதிக்கப்படுகிறார்கள்.</p>
        <p>வாடிக்கையாளர்கள், வெளியிடப்பட்ட சலுகைகளை/விளம்பரங்களை உடனடியாக தேவையான வகைக்கேற்ப பார்க்க முடியும். விற்பனையாளர்கள் மற்றும் வாடிக்கையாளர்கள் ஆகிய இருவருக்கும் சாதகமான ஆன்லைன் கண்காட்சியாக இது செயல்படுகிறது.</p>
        <h4>தனித்தன்மை:</h4>
        <p>BoN அனைத்துக் கடைகளையும் / நிறுவனங்களையும் ஒரே அளவில் பார்க்கிறது, கமிஷன் கட்டணத்திர்காக குறைந்த அல்லது அதிகமான வருமானம் உள்ள கடைகள் / நிறுவனங்களுக்கு எந்தப் பாரபட்சமும் பார்க்காது. இது வணிகம் விரும்பும் விற்பனையாளர்களுக்கு மற்றும் சேமிக்கும் வாடிக்கையாளர்களுக்கு ஒரே சிறந்த இடம்.</p>
		<p>வாடிக்கையாளர்கள் பெரும்பாலும் ஒரு சில கடைகளின் / நிறுவனங்களின் மீதே நன் மதிப்பு கொண்டிருப்பர். ஒரே நேரத்தில் அணைத்து கடைகளையும் / நிறுவனங்களையும் ஆராய மாட்டார்கள், அது நடைமுறைக்கு சாத்தியமும் அல்ல. பல அல்லது எல்லா நேரங்களிலும் இது அவர்களுக்கு நஷ்டத்தையும் கஷ்டத்தையுமே தரும். BoN / buyonear.in உபயோகித்தால் இதை தவிர்க்கலாம்.</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo2">
          ஏன் BoN, தேவை என்ன?
        </a>
      </h4>
    </div>
    <div id="collapseTwo2" class="panel-collapse collapse in">
      <div class="panel-body">
        <p>உலகம் மெதுவாக (மாறாக விரைவாக) ஆன்லைனை நோக்கி நகர்கிறது. இப்போதைய வணிகம் 10 அல்லது 20 ஆண்டுகளுக்கு முன்பு இருந்ததைவிட அதிகம் மாறிவிட்டது. இது நிலைக்கும் என்றும் சொல்லிவிட முடியாது, மாறிக்கொன்டே இருக்கும். அதனால் தாமதிக்காமல் ஆன்லைனுக்கு வாருங்கள், BoN’க்கு வாருங்கள். BoN முற்றிலும் இலவசம்.</p>
		<p>இது உங்கள் தேடலை எளிமையாக்கி, உங்கள் அருகில் அல்லது நீங்கள் விரும்பிய இடத்திலிருந்து விரும்பியதை பெற சிறந்த ஒரே இடம். நீங்கள் விரும்பியதை பெற உங்களை நம்பவிக்கும் நோக்கத்தோடு BoN எவ்வித முயற்சியும் செய்யாது. அறிமுகமில்லாத நம்பிக்கையில்லாத விற்பனையாளரிடம் தேடுவதற்குமுன் “LET’S START SEARCHING FROM HERE”!</p>
		<p>இது ஒரு மையப்படுத்தப்பட்ட ஆன்லைன் கண்காட்சி ஆகும், குறிப்பாக நிறைய சலுகைகளுடன். விரைவில் சேர்ந்திடுங்கள் அதிக பயனடைந்திடுங்கள்.</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree3">
          விற்பனையாளர்களுக்கு இந்த வலைத்தளம் எப்படி உதவுகிறது?
        </a>
      </h4>
    </div>
    <div id="collapseThree3" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>விற்பனையாளர்கள்:</h4>
        <ul>
		<li>i. தொழில்நுட்ப அறிவு தேவை இல்லை.</li>
		<li>ii.	எத்தகைய வணிகமாக (குறு, சிறு மற்றும் பெருந்தொழில்) இருந்தாலும், ஆன்லைனுக்கு நகர்த்துங்கள்.</li>
		<li>iii. BoN விற்பனையாளரின் பொருட்களை சேர்க்க, விளம்பரங்களை பதிவேற்ற, விற்பனையாளர்கள் ஆர்டர்களை கண்காணிக்க மற்றும் விற்பனையாளர்கள் மதிப்பை பெற எளிதாக அனுமதிக்கிறது. BoN உங்கள் சார்பாக வணிக விளம்பரத்தை கவனித்துக்கொள்கிறது.</li>
		<li>iv.	விளம்பரங்களை பதிவு செய்து வாடிக்கையாளர்களின் உடனடி கவனத்திற்கு கொண்டு செல்லும்.</li>
		<li>v.	கடை நிறுவன பட்டியலில் முதன்மை பெற்று வாடிக்கையாளர்களின் கவனத்தை பெற உதவும் </li>
		<li>vi.	நீங்கள் விற்கும் பொருட்களின் சலுகைகள் மற்றும் தள்ளுபடிகள் மூலம் வாடிக்கையாளர்களை ஈர்க்கலாம்.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour4">
          வாடிக்கையாளர்களுக்கு இந்த வலைத்தளம் எப்படி உதவுகிறது?
        </a>
      </h4>
    </div>
    <div id="collapseFour4" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>வாடிக்கையாளர்கள்:</h4>
        <ul>
		<li>i.	உங்கள் பணம், நேரம் மற்றும் முயற்சி சேமிக்கப்படுகிறது.</li>
		<li>ii.	சில அல்லது பெரும்பாலான வாடிக்கையாளர்கள் ஆன்லைன் ஷாப்பிங்கை விரும்பலாம், மற்ற நேரங்களில் அவர்கள் அருகிலோ அல்லது விரும்பிய இடத்திலோ ஷாப்பிங் செய்யவே விரும்புவர். வாடிக்கையாளர்கள் சில சதவிகிதம் தவிர்த்து தங்கள் கடின உழைப்பினால் பெற்ற பணத்தை மிக புத்திசாலித்தனமாக செலவழிக்கவே விரும்புவர். BoN வாடிக்கையாளர்களின் எண்ணத்திற்கு ஏற்றவாறு ஒத்துழைத்து பயனளிக்கிறது.</li>
		<li>iii.	விளம்பரம் மற்றும் கடை/நிறுவன பட்டியலை தேவைக்கேற்ற வகையின் அடிப்படையில் வடிகட்ட (Filter) உதவுகிறது.</li>
		<li>iv.	இது இலவசம் என்பதால் அருகிலுள்ள கடை/நிறுவனங்களை உங்கள் முன்னே கொண்டு வரும்.</li>
		<li>v.	இது உங்கள் தேடலை எளிமையாக்கி, உங்கள் அருகில் அல்லது நீங்கள் விரும்பிய இடத்திலிருந்து விரும்பியதை பெற சிறந்த ஒரே இடம். நீங்கள் விரும்பியதை பெற உங்களை நம்பவிக்கும் நோக்கத்தோடு BoN எவ்வித முயற்சியும் செய்யாது.</li>
		<li>vi.	இது தொலைபேசி புத்தகத்தைவிட (Telephone Directory) மிக பயனுள்ளது.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive5">
          வடிக்கையாளராகிய நான் விற்பனையாளர் அம்சத்தை அல்லது விற்பனையாளராகிய நான் வாடிக்கையாளர் அம்சத்தை உபயோகப்படுத்த முடியுமா?
        </a>
      </h4>
    </div>
    <div id="collapseFive5" class="panel-collapse collapse">
      <div class="panel-body">
        <p>கண்டிப்பாக முடியம். பதிவு செய்யும் போது நீங்கள் ஒரு விற்பனையாளரா அல்லது வாடிக்கையாளரா என்பதை BoN கேட்காது. உங்கள் சான்றுகளுடன் BoN’ல் உள்நுழையும் நேரத்தில் மட்டுமே வழங்க வேண்டும்.</p>
		<p>ஒவ்வொரு விற்பனையாளரும் தினசரி வாழ்க்கையை நடத்துவதற்கு இயற்கையாக ஒரு வாடிக்கையாளரே. மேலும் வீட்டின் மனைவி அல்லது புதிய தொழில் முனைவோர் போன்ற பெரும்பாலானோர் சொந்த அல்லது வீட்டில் இருந்தபடியே தொழில் ஆரம்பிக்க எண்ணம் இருந்தாலும் மார்க்கெட்டிங் முயற்சியின் மேல் உள்ள பயத்தினாலேயே அவ்வெண்ணத்தை கைவிடுவர். அவர்களுக்கு BoN’எ பதில், இது வெளிஉலகிற்கு எந்த ஒரு முயற்சியுமின்றி கொண்டுசென்று உங்களை வெற்றியடைய செய்யும்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix6">
          விற்பனையாளர்களுக்கும் வாடிக்கையாளர்களுக்கும் இது எவ்வாறு நல்லது?
        </a>
      </h4>
    </div>
    <div id="collapseSix6" class="panel-collapse collapse">
      <div class="panel-body">
        <p>இது விற்பனையாளரகள் மற்றும் வாடிக்கையாளர்கள் இருவருக்கும் பயன் அளிக்கிறது.</p>
		<p><strong>முதல் அனுமானிப்பு (Assuming case 1):</strong></p>
		<p>அணைத்து விற்பனையாளர்களும் BoN’ஐ உபயோகிக்கின்றனர். </p>
		<p>அற்புதம்!! வாடிக்கையாளர்களின் வேலை இப்போது எளிதானது, அவர்கள் குறைந்த விலையில் குறைந்த நேரத்தில் குறைந்த முயற்சியில் BoN’ற்கு முன்னாள் எவ்வாறு செய்ய நினைத்தார்களோ அதை BoN’ன் மூலம் எளிதாக செய்ய முடியும்.</p>
		<p><strong>இரண்டாவது அனுமானிப்பு (Assuming case 2):</strong></p>
		<p>அணைத்து வாடிக்கையாளர்களும் BoN’ஐ உபயோகிக்கின்றனர்.</p>
		<p>அற்புதம்!! விற்பனையாளர்களின் வேலை இப்போது எளிதானது, வாடிக்கையாளர்களை எளிதாக அவர்களின் விளம்பரங்களின் மூலம் அணுகலாம். BoN விற்பனையாளர்கள் ஈர்ப்பை அதிகரித்து அவர்களின் விற்பனையை உயர்த்துகிறது. இது கிட்டத்தட்ட வணிகத்தின் அணைத்து பிரிவுகளையும் கவனித்து விற்பனையாளர்களின் இலாபத்தை உயர்த்துகிறது.</p>
		<p>இதனால் விற்பனையாளர் மற்றும் வாடிக்கையாளர் இருவருக்கும் பயனளிக்கிறது. அதனால் இருவரும் சேர்ந்து மற்றவர்களை Bon’ல் சேர உதவி செய்து வெற்றி காண வேண்டும்.</p> 
		<p>விற்பனையாளர் BoN’ல் சேர்ந்து அவர்களின் அன்றாட வாடிக்கையாளர்களை BoN’ஐ உபயோகப்படுத்துமாறு கேட்டு கொண்டு அவர்களின் வெளியிட்ட விளம்பரங்களை கண்டு பயன் பெற செய்ய வேண்டும்.</p>
		<p>வாடிக்கையாளர் BoN’ல் சேர்ந்து அவர்களின் அன்றாட விற்பனையாளர்களை BoN’ல் சேரச் சொல்லி அவர்களின் விளம்பரங்களை மற்ற வாடிக்கையாளர்களுக்கும் தெரியப் படுத்த வேண்டும்.</p> 
		<p>நல்ல இலாபம் / சேமிப்பு பெறுவதற்கு இருவரின் ஈடுபாடும் தேவை.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven7">
          நான் ஒரு விற்பனையாளர், சில வகை வியாபாரங்களுக்கு ஏதாவது பொருந்தக்கூடிய கட்டுப்பாடு இருக்கிறதா?
        </a>
      </h4>
    </div>
    <div id="collapseSeven7" class="panel-collapse collapse">
      <div class="panel-body">
        <p>இல்லை, இது அணைத்து வகை வியாபாரங்களுக்குமானது. </p>
		<p>இது எல்லா விற்பனையாளர்களுக்கும் சிறந்த அணுகுமுறை, குறிப்பாக புதிய விற்பனையாளர்களுக்கும் மற்றும் வணிக குறிக்கோளுடனான விற்பனையாளர்களுக்கும். தனது பெயரினால் நடத்தும் வியாபார வணிகர்கள் முதலில் BoN’ல் சேர யோசிக்கலாம் அனால் வாடிக்கையாளர்கள் BoN’ஐ உபயோகிப்பிப்பதை கண்டு தனது பெயரைவிட வாடிக்கையாளர்களை கவர்வதையே வியாபார யுக்தி என்று உணர்ந்து கொள்வர். மற்றும் BoN’ஐ உபயோகிக்காத வாடிக்கையாளர்கள் மத்தியில் விற்பனையாளர்கள் தான் வைத்த விலையே சரி என கருதலாம். </p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEight8">
          அருகிலுள்ள விற்பனையாளர்கள் என் இடத்தில் BoN‘ஐப் பயன்படுத்துவதில்லை, நான் சேருவதற்கு முன் யாராவது சேர காத்திருக்கலாமா?
        </a>
      </h4>
    </div>
    <div id="collapseEight8" class="panel-collapse collapse">
      <div class="panel-body">
        <p>BoN’ன் நன்மை மற்றும் வசதியைக் கருத்தில் கொண்டு, குறைவான அல்லது உடனே அனைவரையும் சென்றடைந்திடும்.</p>
		<p>விற்பனையாளர்கள் தாமதித்தால் அவர்களின் போட்டியாளர்களுக்கு சாதகமாகிவிடும், அதனால் உடனே BoN’ல் சேர்வது நல்லது. இது முற்றிலும் இலவசம். BoN’ல் சேர்வதற்கோ அல்லது தங்கள் பொருட்களை சேர்ப்பதற்கோ அல்லது விளம்பரத்தை பதிவிறக்குவதற்கோ எவ்வித கட்டணமும் வசூலிக்க படமாட்டாது.</p>
		<p>மேலும் போட்டியின்றி உங்கள் வணிகத்தை முன்னிறுத்தலாம்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNine9">
			நான் கடை/நிறுவன உரிமையாளர் (விற்பனையாளர்), நான் எப்படி BoN இணையத்தளத்தில் சேரலாம்?
        </a>
      </h4>
    </div>
    <div id="collapseNine9" class="panel-collapse collapse">
      <div class="panel-body">
        <p>நான் கடை/நிறுவன உரிமையாளர் (விற்பனையாளர்), நான் எப்படி BoN இணையத்தளத்தில் சேரலாம்?</p>
        <ul>
		<li>i.	BoN’ல் பதிந்து விற்பனையாளராக உள்நுழையவும்.</li>
		<li>ii.	உங்கள் ‘My Account’ல் வியாபாரத்தைப் பற்றிய விவரங்களை கொடுக்கவும். (Business name, banner, category(s), location, etc.)</li>
		<li>iii.	BoN’ன் ஒப்புதலுக்குப் பிறகு நீங்கள் சேர்க்கப்படுவீர்கள்.</li>
		</ul>
		<p>சொந்த இணையதள அங்காடியை எந்த செலவுமில்லாமல் மார்க்கெட்டிங் பற்றி சிறிதும் கவலையின்றி உரிமம் பெற்று பயனடையலாம்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTen10">
			நான் ஏதாவது ஒன்றை வாங்க வேண்டுமென்றால் எவ்வாறு BoN இணைய தளத்தைப் பயன்படுத்த முடியும்?
        </a>
      </h4>
    </div>
    <div id="collapseTen10" class="panel-collapse collapse">
      <div class="panel-body">
        <p>கீழுள்ள எளிய வழிமுறைகளை பின்பற்றவும்.</p>
		<ul>
		<li>i.	BoN’ல் பதிந்து வாடிக்கையாளராக உள்நுழையவும். </li>
		<li>ii.	விளம்பரங்களை வடிகட்ட, முகப்புப் பக்கத்தில் வகைகளைத் தேர்வுசெய்யவும். உங்களை ஈர்க்கும் கடை/நிறுவனத்தை தேர்ந்தெடுத்து விரும்பிய பொருளை தேடிடவும். தேடிய பொருளை உங்கள் cart’ல் (Add to cart) சேர்க்கவும்.</li>
		<li>iii.	மேலும் நீங்கள் விரும்பும் பொருளை முகப்பு பக்கத்தில் தேடலாம். தங்களது கடை/ நிறுவனம் தேடல் முடிவில் பொருட்களை தேடி cart’ல் (Add to cart) சேர்க்கவும்.</li>
		<li>iv.	Cart’ல் சேர்த்த பொருளை வாங்கவும்.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven11">
			வலைத்தளத்தில் என்னைக் சுற்றி எந்த கடை/நிறுவனங்களையும் நான் காணவில்லை?
        </a>
      </h4>
    </div>
    <div id="collapseEleven11" class="panel-collapse collapse">
      <div class="panel-body">
        <p>நீங்கள் கீழுள்ள இரண்டு காரணங்களால் மட்டுமே காணவில்லை.</p>
        <ul>
		<li>i.	நீங்கள் அமைத்த வரம்பிலிருந்து, உங்கள் அருகில் எந்த கடை/நிறுவனமோ இல்லை. வரம்பை மாற்றி மீண்டும் தேடவும். நீங்கள் இன்னும் காணவில்லை என்றால், நீங்கள் முகப்பு பக்கத்தில் இடம் மாற்றி மறுபடியும் தேடி முயற்சிக்கவும். </li>
		<li>ii.	கடைகள்/நிறுவனங்கள் BoN’ல் இணைந்திருக்கவில்லை.
	இது இலவசம் என்பதால் விற்பனையாளர்களின் அறியாமையே காரணமாக இருக்க முடியும். அவர்களுக்கு அறியப்படுத்தி மற்றும் BoN’ல் இனைய செய்து உங்களுக்கும் மற்றவர்களுக்கும் பயன் பெற உதவவும்.
</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve12">
			நீங்கள் என் கடையை பதிவு செய்ய ஒரு முறை அல்லது மாத கட்டணம் வசூலிக்கிறீர்களா?
        </a>
      </h4>
    </div>
    <div id="collapseTwelve12" class="panel-collapse collapse">
      <div class="panel-body">
        <p>இல்லை, BoN’ல் சேர மற்றும் தங்களது கடை/நிறுவனத்தை பதிவு செய்ய முற்றிலும் “இலவசமாகும்”.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThirteen13">
			உங்கள் வலைத்தளத்தில் இலவசமாக பொருட்களைப் பதிவேற்றலாம் அல்லது விளம்பரங்களை வெளியிடலாம் என்பதை நான் கேள்விப்பட்டிருக்கிறேன், இது உண்மைதானா?
        </a>
      </h4>
    </div>
    <div id="collapseThirteen13" class="panel-collapse collapse">
      <div class="panel-body">
        <p>ஆம், உங்கள் பொருட்களை சேர்க்க மற்றும் விளம்பரங்களை பதிவேற்ற முற்றிலும் இலவசம். </p> 
		<p>மேலும் BoN’ன் கவனத்தில் குறைந்தது முதல் அதிக வருவாய் ஈட்டும் கடை/நிறுவனம் உள்ளது என்பதினால், அணைத்து விற்பனையாளர்களையும் மகிழ்விக்க ஏல அணுகுமுறை பின்பற்றப்படுகிறது. நீங்கள் ஏற்கனவே உள்ள பட்டியலிலிருந்து விரும்பிய இடத்தை பட்ஜெட்டின்படி தேர்வு செய்து தங்களது விளம்பரத்தை பதிவேற்றலாம்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFourteen14">
			இது தான் சிறந்த அணுகுமுறை என்று நான் நினைக்கிறேன், ஆனால் நீங்கள் BoN வலைத்தளத்தில் எப்படி அனைத்து கடைகளையும் சேர்க்க போகிறீர்கள்?
        </a>
      </h4>
    </div>
    <div id="collapseFourteen14" class="panel-collapse collapse">
      <div class="panel-body">
        <p>இது முற்றிலும் இலவசம் மற்றும் விற்பனையாளர்களுக்கும் வாடிக்கையாளர்களுக்கும் மிகவும் பயனுள்ளது என்பதால் அணைவருக்கும் தெரியப்படுத்த வேண்டும்.</p> 
		<p>மேடை அற்புதமாக அமைத்தாகிவிட்டது, கதவுகள் எல்லோருக்கும் திறந்துவிடப்பட்டுவிட்டது, நுழைவு கட்டணம் யாருக்கும் இல்லை மற்றும் முடிவில் அதிக பலனை பெற்றிடலாம்… வேறென்ன தேவை நமக்கு!!!</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFifteen15">
			என் பின்னூட்டம் (Feedback) அல்லது எந்தவொரு விஷயத்திற்காகவும் நான் தொடர்பு கொள்ள வேண்டும் என்றால் யாரை தொடர்பு கொள்ள வேண்டும்?
        </a>
      </h4>
    </div>
    <div id="collapseFifteen15" class="panel-collapse collapse">
      <div class="panel-body">
        <p>உங்கள் கருத்துகளை, பிரச்சனைகளை மற்றும் அக்கறைகளை முகப்பு பக்கத்திலுள்ள 'Feedback' menu’வில் பதிவு செய்யுங்கள். நாங்கள் உடனடியாக பதிலளிக்கிறோம்.</p>
<p>வேறு எந்த தகவலையும் அனுப்ப விரும்பினால், கொடுக்கப்பட்டுள்ள மின்னஞ்சலுக்கு அனுப்பவும் bononlineservices@buyonear.in. நாங்கள் 24 முதல் 48 மணி நேரத்தில் பதிலளிப்போம்.
</p> 

      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSixteen16">நான் வெளியிடும் விளம்பரம் நேரலையில் பார்க்கும்போது, அது குறைந்த பட தரமாக (மங்கலாக) காண்பிக்கிறதே?
        </a>
      </h4>
    </div>
    <div id="collapseSixteen16" class="panel-collapse collapse">
      <div class="panel-body">
        <p>BoN’ன் விளம்பர ஒப்புதல், நல்ல படத் தரம் மற்றும் விற்பனையாளர்கள் கவனத்தை எளிதில் பெறுவதற்கு முன் கீழே உள்ள புள்ளிகளை உறுதி செய்யுங்கள்.</p>
        <ul>
		<li>i.	தலைப்பு தெளிவாகவும் குறுகியதாகவும் இருக்க வேண்டும். </li> 
		<li>ii.	குறுக்கிடப்பட்ட படத் தரம் பிரகாசமானதாகவும், எளிதில் புரிந்துகொள்ளக்கூடியதாகவும், உயர்ந்த தரமானதாகவும் இருக்க வேண்டும்.</li>
		<li>iii.	'Description'ல் விளம்பரம் குறித்த விரிவான விளக்கத்தை வழங்கவும். இது கட்டாயமில்லை.</li>
		<li>iv.	URL’s உங்களிடமிருந்தால் வழங்கவும்.</li>
		</ul>
		<p>உண்மையான மற்றும் நல்ல தரமான விளம்பரமாக இருப்பின் நிச்சயம் வாடிக்கையாளரின் கவனத்தை அதிகரிக்கும் மற்றும் உங்கள் தரவரிசையையும் உங்கள் விற்பனையையும் அதிகரிக்கும்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeventeen17">
			நான் எப்போது My Wallet/Pay/Expense Report’ஐ பயன்படுத்த முடியும்?
        </a>
      </h4>
    </div>
    <div id="collapseSeventeen17" class="panel-collapse collapse">
      <div class="panel-body">
        <p>அவை வளர்ச்சியில் உள்ளன. பயனர்களின் பயன்பாட்டினைக் கருத்திற்கொண்டு சிறு மற்றம் செய்ய வேண்டிருக்கிறது.</p>
		<p>பயனர்களின் கருத்துக்களை கருத்தில் கொண்டு வடிவமைப்பு மற்றும் அணுகுமுறை முடிக்கப்பட்டவுடன், வெளியிடப்படும்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEighteen18">
			மேம்பாடுகள்/திட்டங்கள் ஏதாயினும் எதிர்காலத்தில் இருக்கிறதா?
        </a>
      </h4>
    </div>
    <div id="collapseEighteen18" class="panel-collapse collapse">
      <div class="panel-body">
        <p>ஆம், இன்னும் பல ஆச்சரியமான யோசனைகள் விரைவில் செயல்படுத்தப்பட உள்ளன. தயவு செய்து ஆச்சரியங்களுக்கு காத்திருங்கள் மற்றும் அனைவருக்கும் நன்மைக்கான செய்தியை பரப்புவதில் உங்கள் ஒத்துழைப்பை வழங்கவும்.
</p>
		<p>அனைவரின் நல் வாழ்க்கைக்கு ஒன்றாக செயல்படுவோம்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNineteen19">
			BoN வலைத்தளம் அனைத்து ப்ரவுசர்களிலும் வேலை செயகிறதா?
        </a>
      </h4>
    </div>
    <div id="collapseNineteen19" class="panel-collapse collapse">
      <div class="panel-body">
        <p>கூகுள் குரோம், இன்டர்நெட் எஸ்ப்ளோரர் மற்றும் ஃபயர்ஃபாக்ஸ் ப்ரவுசர்களில் BoN வலைத்தளம் நன்றாக செயல்படுகிறது. நாங்கள் மூன்று ப்ரவுசர்களிலும் விரிவாக சோதனை செய்திருந்தாலும், எந்த ஒரு பிரௌசரிலும் எதேனும் சிக்கலை சந்திக்க நேர்ந்தால் மற்ற பிரௌசரில் முயற்சிக்கவும்.</p>

<p>Mobile app தற்போது வளர்ச்சியில் உள்ளது. பயனரின் வசதிக்காக அவற்றை வெளியிட கடினமாக உழைத்துக்கொண்டிருக்குகிறோம்.
</p>
		<p>மூன்று ப்ரவுசர்களிலும் செயல்படாவிட்டால் உங்கள் சிக்கலை ‘Feedback’ menu’வில் பதிவுசெய்யுங்கள்.</p>
      </div>
    </div>
  </div>

</div>



	</div>
<!-- tamil -->



				</div>
			</div>
		</div>
	</div>
	<!-- faq modal -->
	<script>
		$('#button_site_feedback').on('click', function () {
			$.ajax({
				url: 'index.php?route=common/header/site_feedback',
				type: 'post',
				dataType: 'json',
				data: $("#site_feedback_main_ll").serialize(),
				success: function (json) {
					if (json['success']) {
						$('#site_feedback_main_ll').each(function () {
							this.reset();
						});
						$('#site_feed_alt').html('');
						$('#site_feed_alt').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i>' + json['success'] + '</div>');
					}
					if (json['error']) {
						$('#site_feed_alt').html('');
						$('#site_feed_alt').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>' + json['error'] + '</div>');
					}
				}
			});
		});
		//$( ".res-set-mob" ).click(function() {
		$('.expand-one').click(function () {
			$('.content-one').slideToggle('slow');
		});
		$('.expand-two').click(function () {
			$('.content-two').slideToggle('slow');
		});
		//});
		$('.tet--nt').on('click', function () {
			var ids = this.id;
			if (ids = 'auto_detect') {
				$('#' + ids).addClass("main--pop-fst");
			}
		});

		function showMyModalSetTitle(v) {
			if (v != 'undefined') {
				$('#geocomplete').val(v);
			}

			$('#map_mod').modal('show');


			$("#geocomplete").bind("geocode:dragged", function (event, latLng) {
				$("input[name=lat]").val(latLng.lat());
				$("input[name=lng]").val(latLng.lng());
				$("#reset").show();
			});

			$("#reset").click(function () {
				$("#geocomplete").geocomplete("resetMarker");
				$("#reset").hide();
				return false;
			});

			$("#find_nw").click(function () {
				$("#geocomplete").trigger("geocode");
			}).click();
		}

		function showFeedbackModal(){
			$('#site_contact_main').modal('hide');
			$('#site_feedback_main').modal('show');
		}

		$('#englishFaq').show();
		$('#tamilFaq').hide();

		function toggleFaq(){
			var faqvalue = $('#faqLanguage').val();
			if(faqvalue === 'english'){
				$('#englishFaq').show();
				$('#tamilFaq').hide();
			} else {
				$('#englishFaq').hide();
				$('#tamilFaq').show();
			}
		}

		$('#showLocationArea').show();
		$('#showLatLongArea').hide();

		function showLocArea(){
			$('#showLocationArea').show();
			$('#showLatLongArea').hide();
		}

		function showLatArea(){
			$('#showLocationArea').hide();
			$('#showLatLongArea').show();
		}
	</script>

	<?php  unset($_SESSION['payment_success']); ?>