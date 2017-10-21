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
					//$("#startKilometer").val($.cookie('myCookiestart'));
					$("#spnStart").text($.cookie('myCookiestart'))
					//$("#endKilometer").val($.cookie('myCookieend'));
					$("#spnEnd").text($.cookie('myCookieend'))
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

					//$("#startKilometer").val($.cookie('myCookiestart'));
					$("#spnStart").text($.cookie('myCookiestart'));
					//$("#endKilometer").val($.cookie('myCookieend'));
					$("#spnEnd").text($.cookie('myCookieend'));
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

					//$("#startKilometer").val($start_km);
					$("#spnStart").text($start_km);
					//$("#endKilometer").val($end_km);
					$("#spnEnd").text($end_km);

				}

			} else {
				//alert('The value of myCookie is now "'+ $.cookie('myCookiestart')+ $.cookie('myCookieend')+ '". Now, reload the page, PHP should read it correctly.');
				//$("#startKilometer").val($("#slider-range").slider("values", 0));
				//$("#endKilometer").val($("#slider-range").slider("values", 1));
				$("#spnStart").text($("#slider-range").slider("values", 0));
				$("#spnEnd").text($("#slider-range").slider("values", 1));
				

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
					<a href="<?php echo $home; ?>"><img src="image/bon-logo-header-des.png<?php //echo $logo; ?>" title="Search and shopping simplified online anywhere and everywhere" alt="<?php echo $name; ?>" class="img-responsive" /></a>
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
						<div class="frr--list cursor free_listBtn_logged" title="Sign-up and add your store in few minitues for public view.">Free Listing</div>
						<?php } else { ?>
						<div class="free--list-bon">
							<a href="index.php?route=sellerprofile/sellerprofile&tab_section=store_detail#content">
								<div class="frr--list cursor" title="Sign-up and add your store in few minitues for public view.">Free Listing</div>
							</a>
						</div>
						<?php } ?>
						<?php } else { ?>
						<div class="frr--list cursor free_listBtn" title="Sign-up and add your store in few minitues for public view.">Free Listing</div>
						<?php } ?>
					</div>
					<div class="col-sm-9">
						<div id="top-links" class="nav pull-right">
							<ul class="list-inline">
								<li>
									<?php if ($logged && $login_type != 'buyer') { ?>
									<a href="index.php?route=selleradvertise/advertise/add">Advertise &nbsp;&nbsp;|</a>
									<?php } else { ?>
									<a class="cursor" data-toggle="modal" data-target="#login_frc_seller">Advertise &nbsp;&nbsp;|</a>
									<?php } ?>
								</li>
								<li><a href="<?php echo HTTP_SERVER; ?>">Home &nbsp;&nbsp;|</a></li>
								<?php if (!$logged) { ?>
								<li><a class="cursor _bon--login">Login or Sign up<?php //echo $text_login; ?> &nbsp;&nbsp;|</a></li>
								<?php } ?>
								<?php if ($logged) { ?>
								<li class="dropdown">
									<?php if($seller_info['firstname']) { ?>
									<a href="<?php echo $seller_profile; ?>" title="<?php echo $text_seller_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
										<?php //echo $text_seller_account; ?>Hi,
										<?php if (strlen($seller_info['firstname']) > 9){ echo substr($seller_info['firstname'], 0, 7) . '...';} else { echo $seller_info['firstname'];} ?> <span class="caret"></span> &nbsp;&nbsp;| </a>
									<?php } else { ?>
									<a href="<?php echo $seller_profile; ?>" title="<?php echo $text_seller_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
										<?php //echo $text_seller_account; ?>Hi, User <span class="caret"></span> &nbsp;&nbsp;| </a>
									<?php } ?>
									<ul class="dropdown-menu dropdown-menu-right" style="background-color: gainsboro;">
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
										<li style="border-top: 1px solid #cacaca;">
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
										<li style="border-top: 1px solid #cacaca;">
											<a href="<?php echo $logout; ?>">
												<?php echo $text_logout; ?>
											</a>
										</li>
										<?php } ?>
										<?php } ?>
									</ul>
								</li>
								<?php } ?>
								<li><a href="#" title="Contact Us" data-toggle="modal" data-target="#site_contact_main">Contact Us &nbsp;&nbsp;|</a></li>
								<li>
									<div class="addthis_toolbox addthis_default_style" data-url="<?php echo HTTP_SERVER; ?>"><a class="atc_s addthis_button_compact">Share &nbsp;&nbsp;|<span></span></a></div>
									<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
								</li>
								<li><a class="cursor" data-toggle="modal" data-target="#site_feedback_main" title="Feedback">Feedback |</a></li>
								<li><a href="index.php?route=common/faq" title="FAQ">FAQ &nbsp;&nbsp;|</a></li>
								<li><a href="#">How to</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row sec-mob main-mob--res">
					<?php if((isset($_GET['route']) && ($_GET['route'] != 'seller/seller/info' && $_GET['route'] != 'account/wishlist' && $_GET['route'] != 'checkout/checkout' && $_GET['route'] != 'checkout/cart')) || !isset($_GET['route'])) { ?>
					<div class="col-xs-4">
						<!--<div class="row">-->
						<div id="logo">
							<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img style="height: 39px;" src="image/bon-logo-header-res.png<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
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
								<a href="index.php?route=selleradvertise/advertise/add">Advertise &nbsp;&nbsp;</a>
								<?php } else { ?>
								<a class="cursor" data-toggle="modal" data-target="#login_frc_seller">Advertise &nbsp;&nbsp;</a>
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
								<ul class="content-one" style="background-color: gainsboro;">
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
									<li style="border-top: 1px solid #cacaca;">
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
									<li style="border-top: 1px solid #cacaca;">
										<a href="<?php echo $logout; ?>">
											<?php echo $text_logout; ?>
										</a>
									</li>
									<?php } ?>
									<?php } ?>
								</ul>
							</li>
							<?php } ?>
							<li><a href="#" title="Contact Us" data-toggle="modal" data-target="#site_contact_main">Contact Us</a></li>
							<li>
								<div class="addthis_toolbox addthis_default_style" data-url="<?php echo HTTP_SERVER; ?>"><a class="atc_s addthis_button_compact">Share<span></span></a></div>
								<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
							</li>
							<li><a class="cursor" data-toggle="modal" data-target="#site_feedback_main" title="Feedback">Feedback</a></li>
							<li><a href="index.php?route=common/faq" title="FAQ">FAQ</a></li>
							<li><a href="#" >How to</a></li>
						</ul>
				</div>
				</div>
				<div class="row header-sec">
					<?php if((isset($_GET['route']) && ($_GET['route'] == 'common/home' || $_GET['route'] == 'seller/seller')) || !isset($_GET['route'])) { ?>
					<div class="col-sm-4 mit--hd">
						<div class="header-heading" title="Choose your current or desired location to search advertisements and stores/entities.">
							<div class="ui-icon-video" id="location-search">
								<div class="new-text-top">
									<input class="cursor" type="button" data-toggle="modal" onClick="showMyModalSetTitle(this.value)" placeholder="Current Location"
									 id="location-search-val">
									<span class="top-current-loc"><a class="cursor" type="button" data-toggle="modal" data-target="#map_mod"><i class="fa fa-map-marker"></i></a></span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3 header-center-kms" title="Set the range to find advertisements and stores/entities you are looking for around you.">
						<strong>Range: <span id="spnStart"></span> to <span id="spnEnd"></span> Kilometers</strong>
						<form method="post" action="">
							<div class="col-sm-1" style="display: none;"></div>
							<div class="col-sm-9"></div>
							<div class="col-sm-1" style="display: none;"></div>
							<div id="slider-range"></div>
							<br/>
							<div class="km--set" style="display:none">
								<a class="cursor" id="kms_set"><i class="fa fa-refresh" aria-hidden="true"></i></a>
							</div>
							<!--<div >
							 	<input type="text" class="startkilometer" name="startKilometer" id="startKilometer" value="" readonly>
							 	<input type="text" class="endkilometer" name="endKilometer" id="endKilometer" value="" readonly>
							</div>-->
						</form>
					</div>
					<?php //} elseif((isset($_GET['route']) && ($_GET['route'] == 'seller/seller/info'))) { ?>
					<?php } else { ?>
					<div class="col-sm-7">
					</div>
					<?php } ?>
					
					<div class="col-sm-4 str--fv fis-des tttt">
						<?php if($login_type == 'seller') { ?>
						<div class="pull-left">
							<a class="cursor free-list-top--bon" data-toggle="modal" data-target="#login_frc_buyer"> <span class="hidden-xs hidden-sm hidden-md" title="Buyer: View your favourite store/entity list.">Favourites (0)</span></a>
						</div>
						<?php } else { ?>
						<?php echo $store_favouries; ?>
						<?php } ?>
						<?php if(!$logged) { ?>
						<a class="free-list-top--bon cursor _bon--login" title="Buyer: View and track your wished products from specific store/entity.">Wish List (0)</a>
						<?php } else { ?>
						<?php if($login_type == 'seller') { ?>
						<a class="free-list-top--bon cursor" data-toggle="modal" data-target="#login_frc_buyer" title="Buyer: View and track your wished products from specific store/entity.">Wish List (0)</a>
						<?php } else { ?>
						<a class="free-list-top--bon" href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
							<?php echo $text_wishlist; ?>
						</a>
						<?php } } ?>
					</div>
					<?php if($login_type == 'seller') { ?>
					<div class="col-sm-1 mit--hd fis-des header_cart">
						<div id="cart" class="btn-group btn-block">
							<button class="btn btn-inverse btn-block btn-lg" data-toggle="modal" data-target="#login_frc_buyer" title="View/Checkout products you added from stores/entities to your cart."><span id="cart-total">0</span></button>
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
					pageReload = true;
				}

				getAddress(latlong, $('#location-search-val'), pageReload);
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
					<!--	<p class="left">Pioneer in buy (o) near!</p>
						<p class="right">A new age is BoN!</p>-->
					<img src="image/weblaunch.gif" class="img-responsive top-atou-lc">
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
							<h3>Login</h3>
							<form id="main-log-bon" class="form-horizontal" style="padding: 0px 15px;">
								<div id="loginErrorMsg" class="alert alert-danger" style="display:none;"></div>
								<div id="reg-sucess" class="alert alert-success" style="display:none;"></div>
								<div class="_email-log-bon">
									<input type="text" name="email" value="" placeholder="Phone number" id="input-email" class="inputText" autocomplete="off" maxlength="10" required/>
								</div>
								<div class="_passwrd-log-bon">
									<input type="password" name="password" value="" placeholder="Password" id="input-password" class="inputText" maxlength="20" required/>
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
								<div id="errorTopMsg" class="alert alert-danger" style="display:none;"></div>
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
									<input type="tel" autocomplete="off" name="telephone" value="" class="inputText cal-exp" placeholder="Enter the phone number" id="input-telephone" maxlength="10" required/>
								</div>
								<div id="LoadingImage" style="display: none"><img src="image/loader-sms.gif" class="img-responsive" /></div>
								<div class="_log-btn-btm" style="position: static;">
									<button class="advertise-btn _btn-fin" id="sign-up-bon-top" type="button">Continue</button>
								</div>
							</form>
							<div class="_log-btn-btm" style="position: static;padding: 0px 15px;">
								<button class="advertise-btn _btn-fin _sgn-out" type="submit">Existing user? Login</button>
							</div>
							<div class="errors">
								<ul class="_erroe-li">
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
								<div id="top-line-star-otp" class="alert alert-danger" style="display:none;"></div>
								<input type="hidden" name="cus_prof" id="cus_prof" value="">
								<div class="_state-log-bon" disabled>
									<input type="tel" name="zone_select" value="" class="inputText" id="zone_select_ret" required disabled/>
								</div>
								<div class="_email-log-bon" disabled>
									<input type="tel" name="telephone" value="" class="inputText" id="input-telephone_ret" autocomplete="off" required disabled/>
								</div>
								<div class="_email-log-bon">
									<input type="tel" autocomplete="off" name="otp" value="" maxlength="6" class="inputText" id="otp" placeholder="Enter the OTP sent to above mobile number"
									 required/>
								</div>
								<div class="_email-log-bon">
									<input style="border: none;border-bottom: 1px solid #e0e0e0; " type="email" name="email" value="" class="inputText" id="input-email-otp" maxlength="96" 
									 placeholder="Email ID" required disabled autocomplete="off"/>
								</div>
								<div class="_passwrd-log-bon">
									<input type="password" maxlength="20" name="password" value="" id="input-password-otp" placeholder="Enter password" class="inputText" required
									 disabled/>
								</div>
								<div class="_again-passwrd-log-bon">
									<input type="password" maxlength="20" name="confirm" value="" id="input-confirm-otp" placeholder="Re-Enter password" class="inputText" required
									 disabled/>
								</div>
								<div class="_state-log-bon">
									<select name="security_select" id="security_select" disabled required>
										<option value="0">Select your Security Quesion</option>
										<?php foreach($security_question_data as $sec_ques) { ?>
										<option value="<?php echo $sec_ques['q_id']; ?>"><?php echo $sec_ques['q_name']; ?></option>
										<?php } ?>
									</select>
								</div>
								<div class="_again-passwrd-log-bon security_answer" style="display:none">
									<input type="text" autocomplete="off" name="security_answer" value="" id="security_answer" placeholder="Please enter the security answer" class="inputText" maxlength="250"
									 required/>
								</div>
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
							<form id="top-sign-last" class="form-horizontal" enctype="multipart/form-data" style="padding: 0px 15px;" autocomplete="off">
								<div id="signUpErrorMsg" class="alert alert-danger" style="display:none;"></div>
                                <div id="signUpSuccessMsg" class="alert alert-success" style="display:none;"></div>
								<input type="hidden" name="cus_d_up" id="cus_d_up" value="">
								<input type="hidden" name="login_type" id="login_type" />
								<div class="_email-log-bon">
									<input type="text" name="firstname" autocomplete="off" value="" class="inputText" placeholder="First name" id="input-firstname" required/>
								</div>
								<div class="_passwrd-log-bon">
									<input type="text" name="lastname" autocomplete="off" value="" placeholder="Last name" id="input-lastname" class="inputText" required/>
								</div>
								<div class="_again-passwrd-log-bon">
									<input type="text" name="address_1" autocomplete="off" value="" placeholder="Address 1" id="input-address-1" class="inputText" required/>
								</div>
								<div class="_email-log-bon">
									<input type="text" name="address_2" autocomplete="off" value="" class="inputText" placeholder="Address 2" id="address_2" required/>
								</div>
								<div class="_email-log-bon">
									<input type="hidden" name="country_id" value="99" />
									<select name="header_country_id" id="header_country_id" class="form-control" disabled>
										<option value="">Select your country</option>
										<?php foreach ($countries as $country) { ?>
											<?php $selected = ($country['country_id'] == '99') ? "selected = selected" : ""; ?>
											<option value="<?php echo $country['country_id']; ?>" <?php echo $selected; ?>><?php echo $country['name']; ?></option> 
										<?php } ?>
									</select>
								</div>
								<div class="_email-log-bon">
									<select name="zone_id" id="header_zone_id" class="form-control"></select>
								</div>
								<div class="_email-log-bon">
									<select name="city_id" id="header_city_id" class="form-control"></select>
								</div>
								<div class="_email-log-bon">
									<input type="text" name="postcode" autocomplete="off" value="" class="inputText" placeholder="Postcode" id="input-postcode" required/>
								</div>
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
								<div id="forgt-phn-failure" class="alert alert-danger" style="display:none;"></div>
								<div class="_email-log-bon">
									<input type="text" name="forgt-phn" value="" placeholder="Enter the phone number" id="forgt-phn" class="inputText" autocomplete="off" required/>
								</div>
								<div id="LoadingImage1" style="display: none"><img src="image/loader-sms.gif" class="img-responsive" /></div>
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
								<div id="frgt_otp_error" class="alert alert-danger" style="display:none;"></div>
								<input type="hidden" name="forgt-phn-sec" id="forgt-phn-sec" value="">
								<input type="hidden" name="otp-sec" id="otp-sec" value="0">
								<div class="_email-log-bon">
									<input type="text" maxlength="10" autocomplete="off" name="forgt-phn" value="" placeholder="Enter the phone number" id="forgt-phn-sec_nw" class="inputText" required disabled/>
								</div>
								<div class="_passwrd-log-bon">
									<input type="text" autocomplete="off" name="forgt-phn-otp" value="" maxlength="6" placeholder="Enter the OTP sent to above mobile number" id="forgt-phn-otp" class="inputText" required/>
								</div>
								<div id="qus_ans">
									<div class="_state-log-bon">
										<input type="text" autocomplete="off" name="security_question_sec" value="" id="security_question_sec" class="inputText" required disabled/>
									</div>
									<div class="_again-passwrd-log-bon security_answer">
										<input type="text" autocomplete="off" name="security_answer_sec" value="" id="security_answer_sec" placeholder="Please enter the security answer" class="inputText" required/>
									</div>
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
								<div id="forgt-phn-pass-fail" class="alert alert-danger" style="display:none;"></div>
								<input type="hidden" name="cus_ids" id="cus_ids" value="">
								<div class="_email-log-bon">
									<input type="text" name="password" value="" placeholder="Enter new password" id="forgt-pass" class="inputText" required/>
								</div>
								<div class="_passwrd-log-bon">
									<input type="text" name="confirm" value="" placeholder="Re-Enter new password" id="forgt-pass-re" class="inputText" required/>
								</div>
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
			
			$("#frgt-pass").click(function () {
				$("._top-log-in").hide();
				$("._forget-bon").show();
			});
			$("._resr-log-bon").click(function () {
				$("._forget-bon").hide();
				$("._top-log-in").show();
			});
		});

		function loacation() {
			location.reload();
		}

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
							<input type="text" id="us11-address" class="form-control" placeholder="Location" />
						</div>

						<div class="col-xs-12 col-sm-6 col-md-6">
							<button type="button" class="close pull-right" data-dismiss="modal" aria-label="Close">
          					<span aria-hidden="true">&times;</span>
        			</button>
							<a class="linkMap pull-right" onclick="showLatArea()">Search By Latitude & Longitude</a>
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
					<input type="text" id="divFormattedAddress" class="form-control" readonly="true" />
				</div>
				<div class="modal-footer">
					<a class="linkMap pull-left" onclick="getLocation()"  data-dismiss="modal">Get current location</a>
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
					<p>If you are facing any issue or have a concern or want to leave a feedback. Use <a class="cursor" onclick="showFeedbackModal()" title="Feedback"><u>Feedback</u></a> menu.</p>
					<p>For any other information or queries please send email to <u>bononlineservices@buyonear.in</u>. We will respond in 24 to 48
						hours.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- contact modal -->

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
						//$('#site_feed_alt').html('');
						//$('#site_feed_alt').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i>' + json['success'] + '</div>');
						$('#site_feed_alt').html('');
						$('#site_feed_alt').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i>' + json['success'] + '</div>');
				      
						setTimeout(function() {
						  $('#site_feedback_main').modal('toggle');
						  $('#site_feed_alt').html('');
						}, 3000);
					}
					if (json['error']) {
						$('#site_feed_alt').html('');
						$('#site_feed_alt').html('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>' + json['error'] + '</div>');

						setTimeout(function() {
						  $('#site_feed_alt').html('');
						}, 3000);
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

		function showFeedbackModal() {
			$('#site_contact_main').modal('hide');
			$('#site_feedback_main').modal('show');
		}

		$('#showLocationArea').show();
		$('#showLatLongArea').hide();

		function showLocArea() {
			$('#showLocationArea').show();
			$('#showLatLongArea').hide();
		}

		function showLatArea() {
			$('#showLocationArea').hide();
			$('#showLatLongArea').show();
		}
	</script>

	<?php  unset($_SESSION['payment_success']); ?>