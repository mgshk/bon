<?php echo $header; ?>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
   .pstnst {
   top: 9px;
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
   background: rgba(1,149,255,0.55);
   position: relative;
   padding-top: 5px;
   padding-bottom: 5px;
   border-radius: 5px;
   }
   .dtlwpr.pstnst.col-xs-12.btnnav > li {
   float: left;
   padding-left: 38px;
   color: #fff;
   text-align: center;
   }
   .thumbnail > img {
   filter: blur(1px);
   position: relative;
   }
   .thumbnail > h2 {
   font-size: 60px;
   margin-left: 65px;
   position: absolute;
   text-align: center;
   top: 130px;
   }
   .addthis_counter a.atc_s{
   padding: 0px;
   font-size: 12px;
   }
   .addthis_counter .atc_s {
   background: none;
   }
   .addthis_counter .atc_s:hover {
   background-color: #74c5ff;
   }
   .addthis_toolbox a{
   margin-bottom: -5px;
   }
   .addthis_counter.addthis_pill_style a.atc_s{
   display: none;
   }
   .addthis_counter.addthis_pill_style.addthis_nonzero a.addthis_button_expanded {
   display: none !important	;
   }
   .dropdown-content {
   display: none;
   position: absolute;
   min-width: 110px;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   z-index: 1;
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
   .accord ul, .accord ul li {
   list-style-type: none;
   }
   .accord ul li a {
   color: #6E440A;
   text-decoration: none;
   }
   .accord ul li a:hover {
   color: #523205;
   text-decoration: none;
   }
   .accord ul li span {
       color: red;
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
   .btr-str{margin-top:36px;}
   .seller--ret .col-sm-3, .seller--ret .col-sm-6 {
   padding-left: 10px;
   padding-right: 10px;
   }
   .gray--app {background: #c2c2c2 !important;}
   .gray--app input{background: #c2c2c2 !important; color: gray !important;}
   .gray--app a{background: #c2c2c2 !important; color: gray !important;}
   .bon-navbar-input {
   padding: 7px 16px;
   border-radius: 2px 0 0 2px;
   border: 1px solid #ccc;
   border-right: none;
   outline: 0 none;
   font-size: 13px;
   }
   .bon-navbar-button {
   background-color: #74c5ff;
   border: 1px solid #74c5ff;
   border-radius: 0 2px 2px 0;
   color: #fff;
   padding: 10px 0;
   height: 36px;
   cursor: pointer;
   }
   .bon-prd--sc label{margin-top: 8px;}

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
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 14px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
.cat--sel{margin-left: 10px;margin-right: 10px;}
.cat--sel i{font-size: 28px; color: #23a1d1;font-weight: bold;}
.prod--res-m i{font-size: 25px;}
.sort--txt{width: 12%;float: left;padding-left: 8px;}
.cnt--txt{width: 88%;float: left;padding-right: 40px;}
.txt--mar-sel{margin-top: 20px; margin-bottom: 65px;}
</style>
<?php echo $seller_left_menu; ?>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div id="Accord" class="accord">
	<ul>
		<?php foreach ($categories as $category) { ?>
		<li id="<?php echo $category['category_id']; ?>">
			<a href="<?php echo $category['href']; ?>&tab_section=product_tab" class=""><?php echo $category['name']; ?></a>
			<?php if ($category['children']) { ?>
			<ul class="sub">
				<?php foreach ($category['children'] as $child) { ?>									
				<li id="<?php echo $child['category_id']; ?>" >
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

<div class="col-sm-10">
   <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
   </ul>
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
            <div class="col-sm-3">
               <span class="str-name-land"><?php echo $nickname; ?></span>
               <?php if(!empty($store_timings_front)) { ?>
               <?php $days = array("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"); ?>					  
               <?php foreach($days as $day) {
                  $str_tmg = unserialize($store_timings_front[strtolower($day)]);					
                  if($str_tmg['day'] == strtolower(date("l"))) {//print_r($str_tmg);
                  $store_time_single = $str_tmg['from'][0]." - ".$str_tmg['to'][0];
                  if(count($str_tmg['from']) == 2) {
                  $store_time_single .= "<br>".$str_tmg['from'][1]." - ".$str_tmg['to'][1];
                  } ?>
               <p  class="str-timings-tdy">Today <br><?php echo $store_time_single; ?> <a style="cursor: pointer;" data-toggle="modal" data-target="#store_timing">(View all)</a></p>
               <?php } } } ?>
               <p class="store-del"><?php echo $delivery_type; ?></p>
               <p class="pay--str"><a style="cursor:pointer" data-toggle="modal" data-target="#_pay_wallet" class="pay_wallet_bt">Pay</a></p>
            </div>
            <div class="col-sm-6">
               <div class="new-store-banner">
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
                           <img src="<?php echo $seller_images; ?>" class="img-responsive" title="<?php echo $seller_name; ?>" alt="<?php echo $seller_name; ?>" >							
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
               <ul class="dtlwpr pstnst col-xs-12 btnnav">
                  <li><a class="cursor" data-toggle="modal" data-target="#store_information"><i class="fa fa-info"></i><br/> Information</a></li>
                  <li><a target="_blank" href="https://www.google.co.in/maps/place/<?php echo $lat; ?>, <?php echo $lng; ?>"><i class="fa fa-map-marker" ></i><br/> Map</a></li>
                  <!--<li class="tooltip1"><i class="fa fa-location-arrow"></i><br/>Address<span class="tooltiptext1"><?php echo $seller_address; ?></span></li>-->
                  <?php if($cus_logged) { ?>
                  <?php if(!empty($store_favourites)) { ?>
                  <li><a class="cursor" class="favourities-rem"><i class="fa fa-heart"></i><br/> Favourites</a></li>
                  <?php } else { ?>
                  <li><a class="cursor" data-toggle="modal" data-target="#store_favourites"><i class="fa fa-heart"></i><br/> Favourites</a></li>
                  <?php } ?>							
                  <?php } else {?>							
                  <li><a class="cursor" data-toggle="modal" data-target="#_log-bon"><i class="fa fa-heart"></i><br/> Favourites</a></li>
                  <?php } ?>
                  <li>
                     <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_counter addthis_pill_style"><a class="atc_s addthis_button_compact"><i class="fa fa-share-alt"></i><br>share<span></span></a></a></div>
                     <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                  </li>
                  <li><a class="cursor" data-toggle="modal" data-target="#_str_feedbck"><i class="fa fa-commenting-o"></i><br/> Feedback</a></li>
		  
                  <li <?php echo ($ins !='' && $goo !='' && $twi !='' && $fac !='' && $web !='') ? '': 'disiabled'; ?> class="dropdown">
                     <i class="fa fa-cube" ></i><br/>Portals
                     <div class="dropdown-content"> 
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
                  </li>
               </ul>
            </div>
            <div class="col-sm-3">
               <div>
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($seller_rating < $i) { ?>
                  <div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
                  <?php } else { ?>
                  <div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
                  <?php } ?>
                  <?php } ?> &nbsp; <?php if($review_count != ''){ ?><span class="str-votes"><?php echo $review_count; ?> Votes</span><?php } else { ?> 0 Votes <?php } ?>
               </div>
               <p class="rating-str">
                  <img alt="" title="" src="https://chart.googleapis.com/chart?cht=bhs&chs=220x120&chco=0195ff&chbh=a,5,15&chds=0,100&chxt=y&chxl=0:|Poor|Average|Good|Very Good|Excellent&chxr=1,0,100,1&chm=N%20*f1*%20%25,000000,0,-1,12|r,FFFFFF,0,-0.01,2|R,FFFFFF,0,0.01,1&chd=t:<?php echo $rating_chart; ?>&chxp=1,10,30,50,70,90&chxtc=1,10&chxs=0,000000,13,-1,t,FFFFFF&chof=gif">
               </p>
               <?php if($cus_logged) { ?>
               <div class="btr-str"><a class="rev-btn" style="cursor: pointer;" data-toggle="modal" data-target="#review_rate">Rate & Write a review <i class="fa fa-pencil" aria-hidden="true"></i></a></div>
               <?php } else { ?>
               <div class="btr-str"><a class="rev-btn" style="cursor:pointer" data-toggle="modal" data-target="#_log-bon">Rate & Write a review <i class="fa fa-pencil" aria-hidden="true"></i></a></div>
               <?php } ?>	       
            </div>
         </div>
         <div class="col-sm-12 sec-mob">	 
            <div class="col-sm-6">
               <div class="new-store-banner">
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
                           <img src="<?php echo $seller_images; ?>" class="img-responsive" title="<?php echo $seller_name; ?>" alt="<?php echo $seller_name; ?>" >							
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
		   <li><a class="cursor" data-toggle="modal" data-target="#store_information"><i class="fa fa-info"></i><br/> Information</a></li>
		   <li><a target="_blank" href="https://www.google.co.in/maps/place/<?php echo $lat; ?>, <?php echo $lng; ?>"><i class="fa fa-map-marker" ></i><br/> Map</a></li>
		   <?php if($cus_logged) { ?>
		   <?php if(!empty($store_favourites)) { ?>
		   <li><a class="cursor" class="favourities-rem"><i class="fa fa-heart"></i><br/> Favourites</a></li>
		   <?php } else { ?>
		   <li><a class="cursor" data-toggle="modal" data-target="#store_favourites"><i class="fa fa-heart"></i><br/> Favourites</a></li>
		   <?php } ?>							
		   <?php } else {?>							
		   <li><a class="cursor" data-toggle="modal" data-target="#_log-bon"><i class="fa fa-heart"></i><br/> Favourites</a></li>
		   <?php } ?>
		   <li><a class="cursor" data-toggle="modal" data-target="#_str_feedbck"><i class="fa fa-commenting-o"></i><br/> Feedback</a></li>
		   <li>
		      <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_counter addthis_pill_style"><a class="atc_s addthis_button_compact"><i class="fa fa-share-alt"></i><br>share<span></span></a></a></div>
		      <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
		   </li>		   
		   <li class="dropdown">
		      <i class="fa fa-cube" ></i><br/>Portals
		      <div class="dropdown-content">
			 <a href="#">Link 1</a>
			 <a href="#">Link 2</a>
			 <a href="#">Link 3</a>
		      </div>
		   </li>
		</ul>
		<div class="str-name-land"><?php echo $nickname; ?>
		</div>               
	       <div>
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($seller_rating < $i) { ?>
                  <div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
                  <?php } else { ?>
                  <div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
                  <?php } ?>
                  <?php } ?> &nbsp; <?php if($review_count != ''){ ?><span class="str-votes"><?php echo $review_count; ?> Votes</span><?php } else { ?> 0 Votes <?php } ?>
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
               <p  class="str-timings-tdy">Today <br><?php echo $store_time_single; ?> <a style="cursor: pointer;" data-toggle="modal" data-target="#store_timing">(View all)</a></p>
               <?php } } } ?>
               <!--<a href="index.php?route=seller/seller/pay_wallet&seller_id=<?php echo $_GET['seller_id']; ?>&path=<?php echo $_GET['path']; ?>" class="pay_wallet_bt">Pay</a>-->
               <p class="store-del"><?php echo $delivery_type; ?></p>
	       <div class="sell--btn-pg">
		       <a style="cursor:pointer" data-toggle="modal" data-target="#_pay_wallet" class="pay_wallet_bt"><p class="pay--str"  style="margin-right:5px;">Pay</p></a>
		       <?php if($cus_logged) { ?>
		       <a class="pay_wallet_bt" style="cursor: pointer;" data-toggle="modal" data-target="#review_rate"><p class="pay--str">Rate & Write a review <i class="fa fa-pencil" aria-hidden="true"></i></p></a>
		       <?php } else { ?>
		       <a class="pay_wallet_bt" style="cursor:pointer" data-toggle="modal" data-target="#_log-bon"><p class="pay--str">Rate & Write a review <i class="fa fa-pencil" aria-hidden="true"></i></p></a>
		       <?php } ?>
		</div>
            </div>
      </div>
      <ul class="nav nav-tabs">
         <li id="adv_tab" class="<?php if(isset($_GET['tab_section']) != 'product_tab'){ echo 'active'; }?>"><a href="#tab-sellerads" data-toggle="tab"><?php echo $tab_sellerads; ?></a></li>
         <?php if($allow_products == 1) { ?>
         <li id="product_tab" class="<?php if(isset($_GET['tab_section']) == 'product_tab'){ echo 'active'; }?>"><a href="#tab-sellerproducts" data-toggle="tab"><?php echo $tab_sellerproducts; ?> (<?php echo $seller_products_total; ?>)</a></li>
         <?php } ?>
         <li><a href="#tab-sellerreview" data-toggle="tab"><?php echo $tab_sellerreview; ?></a></li>
      </ul>
      <div class="tab-content">
         <div class="tab-pane <?php if(isset($_GET['tab_section']) != 'product_tab'){ echo 'active'; }?>" id="tab-sellerads">
            <?php if(count($advertisement_store) > 0) {
               foreach($advertisement_store as $advertisement_ste) { ?>
            <div class="col-sm-12 advertise_count" style="margin-top: 10px;" id="<?php echo $advertisement_ste['advertise_id']; ?>">
               <div class="row">
                  <div class="hovereffect">
                     <img src="<?php echo $image_resize->resize($advertisement_ste['offer_image'], 1324, 182); ?>" class="img-responsive" title="<?php echo $advertisement_ste['offer_title']; ?>" alt="<?php echo $advertisement_ste['offer_title']; ?>">
                     <div class="overlay">
                        <div class="col-sm-12">
                           <h2 class="advertise_title"><?php echo $advertisement_ste['offer_title']; ?></h2>
                        </div>
                        <a class="info" href="<?php echo $advertisement_ste['offer_url']; ?>">link here</a>			
                     </div>
                  </div>
               </div>
            </div>
            <?php $count_adv = count($advertisement_store); ?>	    
            <script>var adv_id = "<?php echo $advertisement_ste['advertise_id']; ?>"; var count_adv = "<?php echo $count_adv; ?>";</script>
            <?php } } else { ?>
            <div class="col-sm-12">
               <div class="row">
                  <p>No Advertisement Yet...</p>
               </div>
            </div>
            <?php } ?>
         </div>
         <div class="tab-pane <?php if(isset($_GET['tab_section']) == 'product_tab'){ echo 'active'; }?>" id="tab-sellerproducts">
            <div class="row bon-prd--sc">		
               <div class="col-sm-2">
                  <div class="btn-group hidden-xs">
                     <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                     <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
                  </div>
               </div>
	       <div class="">	       
		       <div class="bon-navbar-search smallsearch col-sm-3 col-xs-12" style="display: inline-flex; margin-bottom:10px;">
			     <span class="cat--sel cursor sec-mob" onclick="openNav()"><i class="fa fa-angle-right"></i></span>
			     <input class="bon-navbar-input col-xs-11" type="" placeholder="Search for Products" name="">
			     <button class="bon-navbar-button col-xs-1">
				<svg width="15px" height="15px">
				   <path d="M11.618 9.897l4.224 4.212c.092.09.1.23.02.312l-1.464 1.46c-.08.08-.222.072-.314-.02L9.868 11.66M6.486 10.9c-2.42 0-4.38-1.955-4.38-4.367 0-2.413 1.96-4.37 4.38-4.37s4.38 1.957 4.38 4.37c0 2.412-1.96 4.368-4.38 4.368m0-10.834C2.904.066 0 2.96 0 6.533 0 10.105 2.904 13 6.486 13s6.487-2.895 6.487-6.467c0-3.572-2.905-6.467-6.487-6.467 "></path>
				</svg>
			     </button>
			     <a href="index.php?route=seller/seller/info&seller_id=<?php echo $_GET['seller_id']; ?>&path=" class="prod--res-m" style="margin-left:20px;"><i class="fa fa-refresh"></i></a>
		       </div>
		       <div class="col-xs-2  col-md-1 text-right">
			  <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
		       </div>
		       <div class="col-xs-4  col-md-2 text-right">
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
		       <div class="col-xs-2  col-md-1 text-right">
			  <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
		       </div>
		       <div class="col-xs-4 col-md-2 text-right">
			  <select id="input-limit" class="form-control" onchange="location = this.value;">
			     <?php foreach ($limits as $limits) { ?>
			     <?php if ($limits['value'] == $limit) { ?>
			     <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
			     <?php } else { ?>
			     <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
			     <?php } ?>
			     <?php } ?>
			  </select>
		       </div>
	       </div>
	       <!--<div class="sec-mob">
			<span class="cat--sel cursor" onclick="openNav()"><i class="fa fa-angle-right"></i></span>
		       <div class="bon-navbar-search smallsearch col-sm-3 col-xs-10" style="float:right;margin-right: 30px;display: inline-flex;">		     
			     <input class="bon-navbar-input col-xs-11" type="" placeholder="Search for Products" name="">
			     <button class="bon-navbar-button col-xs-1">
				<svg width="15px" height="15px">
				   <path d="M11.618 9.897l4.224 4.212c.092.09.1.23.02.312l-1.464 1.46c-.08.08-.222.072-.314-.02L9.868 11.66M6.486 10.9c-2.42 0-4.38-1.955-4.38-4.367 0-2.413 1.96-4.37 4.38-4.37s4.38 1.957 4.38 4.37c0 2.412-1.96 4.368-4.38 4.368m0-10.834C2.904.066 0 2.96 0 6.533 0 10.105 2.904 13 6.486 13s6.487-2.895 6.487-6.467c0-3.572-2.905-6.467-6.487-6.467 "></path>
				</svg>
			     </button>
			     <a href="index.php?route=seller/seller/info&seller_id=<?php echo $_GET['seller_id']; ?>&path=<?php echo $_GET['path']; ?>" class="prod--res-m" style="margin-left:20px;"><i class="fa fa-refresh"></i></a>
		       </div>
		       <div class="txt--mar-sel">
			       <div class="sort--txt text-left">
				  <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
			       </div>
			       <div class="cnt--txt text-right">
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
		       <div>
			       <div class="sort--txt text-left">
				  <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
			       </div>
			       <div class="cnt--txt text-right">
				  <select id="input-limit" class="form-control" onchange="location = this.value;">
				     <?php foreach ($limits as $limits) { ?>
				     <?php if ($limits['value'] == $limit) { ?>
				     <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
				     <?php } else { ?>
				     <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
				     <?php } ?>
				     <?php } ?>
				  </select>
			       </div>
		       </div>
	       </div>-->
	       
            </div>
            <br />								
            <div class="row" id="tab-sellerproducts1">
               <div class="col-sm-3 fis-des">
					<div id="Accord" class="accord">
					<ul>
						<?php foreach ($categories as $category) { ?>
						<li id="<?php echo $category['category_id']; ?>">
							<a href="<?php echo $category['href']; ?>&tab_section=product_tab" class=""><?php echo $category['name']; ?></a>
							<?php if ($category['children']) { ?>
							<ul class="sub">
								<?php foreach ($category['children'] as $child) { ?>									
								<li id="<?php echo $child['category_id']; ?>" >
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
                  <?php if ($products) { ?>
                  <?php foreach ($products as $product) { ?>
                  <div class="product-layout product-list advertise_countt col-sm-4" id="<?php echo $product['product_id'];?>">
                     <div class="product-thumb">
                        <div class="image"><a href="<?php echo $product['href']; ?>&tab_section=product_tab"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                        <div class="caption">
                           <h4><a href="<?php echo $product['href']; ?>&tab_section=product_tab"><?php echo $product['name']; ?></a></h4>
                           <p><?php echo $product['description']; ?></p>
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
                        <div class="button-group">
                           <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                           <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                        </div>
                        <?php } ?>
                     </div>
                  </div>
                  <?php  
                     if(isset($products) && count($products) > 0) {
                     	$count_pro = count($products); ?>	    
                  <script>var product_id = "<?php echo $product['product_id']; ?>"; var count_pro = "<?php echo $count_pro; ?>";</script>
                  <?php } } ?>
               </div>
               <!-- <div class="row">
                  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                  </div>-->
               <?php } else { ?>
               <p>No Product Yet...</p>
			   <?php } ?>
			<?php if( (isset($advertisement_store) && !empty($advertisement_store)) || (isset($products) && !empty($products))) { ?>
			<p id="loader_page"><img src="catalog/view/theme/default/image/ajax_loader.gif"></p>
			<?php } ?>
            </div>
            <!-- <div class="buttons">
               <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
               </div>-->
	    
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
   <!--<div class="card-seller-info hovercard well">
      <div class="card-seller-info-background">
      	<img class="card-seller-info-bkimg" alt="" src="<?php echo $seller_banner; ?>">
      </div>
      <div class="useravatar">
      	<img alt="" src="<?php echo $seller_image; ?>">
      </div>
      <div class="card-seller-info-info">
      	<span class="card-seller-info-title"><?php echo $seller_name; ?></span>
      	<div>
      		<?php for ($i = 1; $i <= 5; $i++) { ?>
      		<?php if ($seller_rating < $i) { ?>
      		<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
      		<?php } else { ?>
      		<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
      		<?php } ?>
      		<?php } ?>
      	</div>
      </div>
      </div>
      <div class="stats cf">
      <div class="stat">
      	<strong><?php echo $seller_products_total; ?></strong>
      	<?php echo $text_products_number; ?>
      </div>
      <div class="stat">
      	<strong><?php echo $seller_date_added; ?></strong>
      	<?php echo $text_seller_years; ?>
      </div>
      <div class="stat">
      	<div class="status-upload">
      		<ul>
      			<li><a title="" href="<?php echo $sellertwitter; ?>" target="_blank" data-placement="bottom" data-original-title="Audio"><i class="fa fa-twitter"></i></a></li>
      		</ul>
      	</div>
      </div>
      <div class="stat">
      	<div class="status-upload">
      		<ul>
      			<li><a title="" href="<?php echo $sellergoogleplus; ?>" target="_blank" data-placement="bottom" data-original-title="Audio"><i class="fa fa-google-plus"></i></a></li>
      		</ul>
      	</div>
      </div>
      <div class="stat">
      	<div class="status-upload">
      		<ul>
      			<li><a title="" href="<?php echo $sellerfacebook; ?>" target="_blank" data-placement="bottom" data-original-title="Audio"><i class="fa fa-facebook"></i></a></li>
      		</ul>
      	</div>
      </div>
      <div class="stat">
      	<div class="status-upload">
      		<ul>
      			<li><a title="" href="<?php echo $sellerinstagram; ?>" target="_blank" data-placement="bottom" data-original-title="Audio"><i class="fa fa-instagram"></i></a></li>
      		</ul>
      	</div>
      </div>
      </div>
      <div class="well">
      <?php echo $seller_description; ?>
      </div>
      <?php if ($products) { ?>
      <div class="row">
      <div class="col-sm-3">
      	<div class="btn-group hidden-xs">
      		<button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
      		<button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
      	</div>
      </div>
      <div class="col-sm-1 col-sm-offset-2 text-right">
      	<label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
      </div>
      <div class="col-sm-3 text-right">
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
      <div class="col-sm-1 text-right">
      	<label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
      </div>
      <div class="col-sm-2 text-right">
      	<select id="input-limit" class="form-control" onchange="location = this.value;">
      		<?php foreach ($limits as $limits) { ?>
      		<?php if ($limits['value'] == $limit) { ?>
      		<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
      		<?php } else { ?>
      		<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
      		<?php } ?>
      		<?php } ?>
      	</select>
      </div>
      </div>
      <br />
      <div class="row">
      <?php foreach ($products as $product) { ?>
      <div class="product-layout product-list col-xs-12">
      	<div class="product-thumb">
      		<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      		<div class="caption">
      			<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
      			<p><?php echo $product['description']; ?></p>
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
      				<?php if ($product['tax']) { ?>
      				<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
      				<?php } ?>
      			</p>
      			<?php } ?>
      		</div>
      		<div class="button-group">
      			<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
      			<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
      			<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      		</div>
      	</div>
      </div>
      <?php } ?>
      </div>
      <div class="row">
      <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
      <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
      <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>-->
   <!--<ul class="nav nav-tabs">
      <li class="active"><a href="#tab-sellerreview" data-toggle="tab"><?php echo $tab_sellerreview; ?></a></li>
      </ul>
      <div class="tab-content">
      <div class="tab-pane active" id="tab-sellerreview">
      </div>
      </div>
      <div class="tab-content">
      <div class="tab-pane active" id="tab-sellerreview">
      	<form class="form-horizontal" id="form-sellerreview">
      		<div id="sellerreview"></div>
      		<?php if ($sellerreviewstatus){ ?>
      		<h2><?php echo $text_write; ?></h2>
      		<?php if ($sellerreviewguest){ ?>
      		<div class="form-group required">
      			<div class="col-sm-12">
      				<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
      				<input type="text" name="name" value="" id="input-name" class="form-control" />
      			</div>
      		</div>
      		<div class="form-group required">
      			<div class="col-sm-12">
      				<label class="control-label" for="input-sellerreview"><?php echo $entry_sellerreview; ?></label>
      				<textarea name="text" rows="5" id="input-sellerreview" class="form-control"></textarea>
      				<div class="help-block"><?php echo $text_note; ?></div>
      			</div>
      		</div>
      		<div class="form-group required">
      			<div class="col-sm-12">
      				<label class="control-label"><?php echo $entry_rating; ?></label>
      				&nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
      				<input type="radio" name="rating" value="1" />
      				&nbsp;
      				<input type="radio" name="rating" value="2" />
      				&nbsp;
      				<input type="radio" name="rating" value="3" />
      				&nbsp;
      				<input type="radio" name="rating" value="4" />
      				&nbsp;
      				<input type="radio" name="rating" value="5" />
      				&nbsp;<?php echo $entry_good; ?>
      			</div>
      		</div>
      		<?php echo $captcha; ?>
      		<div class="buttons clearfix">
      			<div class="pull-right">
      				<button type="button" id="button-sellerreview" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
      			</div>
      		</div>
      		<?php } else { ?>
      		<?php echo $text_seller_login; ?>
      		<?php } ?>
      		<?php }?>
      	</form>
      </div>
      </div>-->
   <?php //echo $content_bottom; ?>
</div>
<?php //echo $column_right; ?>
</div>
</div>
<div class="modal fade" id="_str_feedbck" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content loc-pop">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title loc-share-title">Store Feedback</h4>
         </div>
         <div class="modal-body _wallet-share-top">
	    <form action="" method="post" enctype="multipart/form-data" id="form_str_feedbck" class="form-horizontal">
               <div id="str_feedbck_alt"></div>
               <div class="_str_feedbck">
			<div class="form-group">
				<select class="form-control" name="sel_subject" id="sel_subject">
					<option value="1">Not removing expired offers.</option>
					<option value="2">Posting false advertisements.</option>
					<option value="3">Location on map is not correct.</option>
					<option value="4">Store/Entity information provided is not accurate.</option>
					<option value="5">Report abuse.</option>
					<option value="6">Actual and posted information about products does not match.</option>
					<option value="7">Need to update/add products information.</option>
					<option value="8">Store/Entity is shut down.</option>
				</select>
			</div>
			<div class="form-group">
				<textarea style="height:85px;" type="text" name="str_feedback" id="str_feedback" value="" placeholder=""></textarea>
			</div>   
			<button type="button" id="button_store_feedback">Submit</button>
			<button type="button" data-dismiss="modal">Cancel</button>
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
            <h4 class="modal-title loc-share-title">Pay Wallet</h4>
         </div>
         <div class="modal-body _wallet-share-top">
            <form id="form_wallet_bal" action="" method="post">
               <div id="wallet_bal_alt"></div>
               <div class="_wallet_tp_bt">
                  <?php if(!empty($store_favourites)) { ?>
                  <span class="_wall_left"><a style="cursor: pointer;color:#93d1ea;" title="You already added this to your favourites." class="store_favourites">Add to favourites</a></span>
                  <?php } else {?>
                  <span class="_wall_left"><a cursor: pointer; data-toggle="modal" data-target="#store_favourites">Add to favourites</a></span>
                  <?php } ?>
                  <span class="_wall_right"><a>Expense Report</a></span>
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
                  <span class="_wall_left_in next_btn" style="cursor: pointer;"><a style="color:#93d1ea;">Next</a></span>
                  <span class="_wall_right_in"><a style="cursor: pointer;" data-dismiss="modal">Cancel</a></span>
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
            <h4 class="modal-title loc-share-title">Store Information</h4>
         </div>
         <div class="modal-body timing-share-top">
            <?php if($nickname != '') { ?>
            <h4><?php echo $nickname; ?></h4>
            <?php } ?>
            <?php if($seller_address != '') { ?>
            <p><?php echo $seller_address; ?></p>
            <?php } ?>
            <?php if($store_mobile_num != '') { ?>
            <p><?php echo $store_mobile_num; ?></p>
            <?php } ?>
            <?php if($store_ll_num != '') { ?>
            <p><?php echo $store_ll_num; ?></p>
            <?php } ?>
            <?php if($store_email != '') { ?>
            <p><?php echo $store_email; ?></p>
            <?php } ?>
            <?php if($description != '') { ?>
            <p><?php echo $description; ?></p>
            <?php } ?>
            <?php if($owner_name != '') { ?>
            <p><?php echo $owner_name; ?></p>
            <?php } ?>
            <?php if($seller_image != '') { ?>
            <img src="<?php echo $seller_image; ?>">
            <?php } ?>
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
            <h4 class="modal-title loc-share-title">Store Favourites</h4>
         </div>
         <div class="modal-body timing-share-top">
            <p>Do you want to add this to your favourites?</p>
            <div id="store_fav_alt"></div>
            <form class="form-horizontal" id="form-store-favourites">
               <input type="checkbox" name="email" value="1" <?php if(isset($store_favourites['email']) != '0'){echo "checked";} ?>> Allow to send email to you?<br/>
               <input type="checkbox" name="notification" value="1" <?php if(isset($store_favourites['notification']) != '0'){echo "checked";} ?>> Allow to send Mobile notification to you?<br/>
               <button type="button" id="button-store_favourites" data-loading-text="<?php echo $text_loading; ?>">Yes</button>
               <button type="button" data-dismiss="modal">Cancel</button>
            </form>
         </div>
      </div>
   </div>
</div>
<div class="modal fade" id="store_timing" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content loc-pop">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title loc-share-title">Store Timings</h4>
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
                  <td><span class="days-str"><?php echo ucfirst($str_tmg['day']); ?></span></td>
                  <td> : </td>
                  <td><span class="timg-str"><?php echo $store_time_mule; ?></span></td>
               </tr>
               <?php } else { ?>
               <tr>
                  <td><span class="days-str"><?php echo ucfirst($str_tmg['day']); ?></span></td>
                  <td> : </td>
                  <td><span class="timg-str"><?php echo ucfirst($str_tmg['status']); ?></span></td>
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
            <h4 class="modal-title loc-share-title">Rate Your Review</h4>
         </div>
         <div class="modal-body review-frm-top">
            <form class="form-horizontal" id="form-sellerreview">
               <div id="sellerreview_alt"></div>
               <?php if ($sellerreviewstatus){ ?>
               <h2><?php //echo $text_write; ?></h2>
               <?php if ($sellerreviewguest){ ?>
               <div class="form-group required">
                  <div class="col-sm-12">
                     <!--<label class="control-label" for="input-phone"><?php echo $entry_phone; ?></label>
                        <input type="text" name="phone" value="<?php echo $customer_number; ?>" id="input-phone" class="form-control" placeholder="<?php echo $entry_phone; ?>"/>-->
                     <span><?php echo $customer_number; ?></span>
                  </div>
               </div>
               <div class="form-group required">
                  <div class="col-sm-12">
                     <!--<label class="control-label"><?php echo $entry_rating; ?></label>-->
                     &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                     <?php $rate_count = array("1", "2", "3", "4", "5"); ?>
                     <?php foreach($rate_count as $cnt) { 
                        $selected = (isset($seller_review_single['rating']) == $cnt) ? "checked = checked" : "";?>
                     <input type="radio" name="rating" <?php echo $selected; ?> value="<?php echo $cnt; ?>" />&nbsp;
                     <?php } ?>
                     <?php echo $entry_good; ?>
                  </div>
               </div>
               <div class="form-group required">
                  <div class="col-sm-12">
                     <!--<label class="control-label" for="input-sellerreview"><?php echo $entry_sellerreview; ?></label>-->
                     <textarea name="text" rows="5" id="input-sellerreview" class="form-control" placeholder="<?php echo $entry_sellerreview; ?>"><?php echo isset($seller_review_single['text']); ?></textarea>
                     <div class="help-block"><?php //echo $text_note; ?></div>
                  </div>
               </div>
               <?php echo $captcha; ?>
               <div class="buttons clearfix">
                  <div class="pull-right">
                     <button type="button" id="button-sellerreview" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary">Submit<?php //echo $button_continue; ?></button>
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
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "400px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
<script>
   $(".favourities-rem").click(function(){
       alert("You already added this to your favourites.");
   });
   
   $("#enter_amt").on('keyup',function(){	
       $(".next_btn").empty();
        if (/\D/g.test(this.value))
   	{		    
   	    this.value = this.value.replace(/\D/g, '');
   	}
        if($(this).val().length > 0) {
   	$(".next_btn").append('<a class="next_btn_wallet" onclick="nextWalletBalance()">Next</a>');
        } else {
   	$(".next_btn").append('<a style="color:#93d1ea;">Next</a>');
        }
   });
   
   function nextWalletBalance() {
   	form_wallet_bal
   	$.ajax({
   		url: 'index.php?route=seller/seller/check_wallet_balance',
   		type: 'post',
   		dataType: 'json',
   		data: $("#form_wallet_bal").serialize(),
   		success: function(json) {
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
<script type="text/javascript"><!--
   $('#sellerreview').delegate('.pagination a', 'click', function(e) {
       e.preventDefault();
   
       $('#sellerreview').fadeOut('slow');
   
       $('#sellerreview').load(this.href);
   
       $('#sellerreview').fadeIn('slow');
   });
   
   $('#sellerreview').load('index.php?route=seller/seller/sellerreview&seller_id=<?php echo $seller_id; ?>');
   
   $('#button-sellerreview').on('click', function() {//alert("test");
   	$.ajax({
   		url: 'index.php?route=seller/seller/write&seller_id=<?php echo $seller_id; ?>',
   		type: 'post',
   		dataType: 'json',
   		data: $("#form-sellerreview").serialize(),
   		beforeSend: function() {
   			$('#button-sellerreview').button('loading');
   		},
   		complete: function() {
   			$('#button-sellerreview').button('reset');
   			//document.getElementById("#review_rate").reset();
   		},
   		success: function(json) {
   			$('.alert-success, .alert-danger').remove();
   
   			if (json['error']) {
   				$('#sellerreview_alt').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
   			}
   
   			if (json['success']) {
   				$('#sellerreview_alt').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
   
   				//$('input[name=\'name\']').val('');
   				//$('input[name=\'phone\']').val('');
   				//$('textarea[name=\'text\']').val('');
   				//$('input[name=\'rating\']:checked').prop('checked', false);
   			}
   		}
   	});
   });
   
   $('#button_store_feedback').on('click', function() {//alert("test");
   	$.ajax({
   		url: 'index.php?route=seller/seller/store_feedback&seller_id=<?php echo $seller_id; ?>',
   		type: 'post',
   		dataType: 'json',
   		data: $("#form_str_feedbck").serialize(),
   		success: function(json) {
   			if (json['error']) {
				$('#str_feedbck_alt').html('');
   				$('#str_feedbck_alt').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
   			}
   
   			if (json['success']) {
				$('#str_feedbck_alt').html('');
   				$('#str_feedbck_alt').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
   
   				//$('input[name=\'name\']').val('');
   				//$('input[name=\'phone\']').val('');
   				//$('textarea[name=\'text\']').val('');
   				//$('input[name=\'rating\']:checked').prop('checked', false);
   			}
   		}
   	});
   });
   
   $(document).ready(function() {
   	$('.thumbnails').magnificPopup({
   		type:'image',
   		delegate: 'a',
   		gallery: {
   			enabled:true
   		}
   	});
   });
   //-->
</script>
<script type="text/javascript">
   $('#button-store_favourites').on('click', function() {//alert("test");
   	$.ajax({
   		url: 'index.php?route=seller/seller/store_favourites&seller_id=<?php echo $seller_id; ?>',
   		type: 'post',
   		dataType: 'json',
   		data: $("#form-store-favourites").serialize(),
   		beforeSend: function() {
   			$('#button-store_favourites').button('loading');
   		},
   		complete: function() {
   			$('#button-store_favourites').button('reset');
   		},
   		success: function(json) {
   			$('.alert-success, .alert-danger').remove();
   
   			if (json['error']) {
   				$('#store_fav_alt').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
   			}
   
   			if (json['success']) {
				setTimeout(function () {
					$('#favouries_str > a').html('<span id="fav-total"> Favourites (' + json['total'] + ')</span>');
				}, 100);
   				$('#favouries_str > ul').load('index.php?route=common/favourites/info ul li');
   				$('#store_fav_alt').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
   				
   
   				//$('input[name=\'name\']').val('');
   				//$('input[name=\'phone\']').val('');
   				//$('textarea[name=\'text\']').val('');
   				//$('input[name=\'rating\']:checked').prop('checked', false);
   			}
   		}
   	});
   });
   
   $(document).ready(function() {
   $('.thumbnails').magnificPopup({
   	type:'image',
   	delegate: 'a',
   	gallery: {
   		enabled:true
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
   	if(cat_id != '') {
   	    $.each( cat_ids, function( key, value ) {
   	       alert($('ul li#'+value).attr('class'));	 
   		 $('ul li#'+value).removeClass('expand');
   		 $('ul li#'+value).addClass( "collapse" );
   		 $('ul li#'+value+' span').on('click', 'li.collapse span ', function (e) {
   			$(this).text('[ - ]').parent().addClass('collapse').removeClass('expand').find('>ul').slideDown();
   			e.stopImmediatePropagation();
   		  });
   		  $('ul li#'+value+' span').click(); 
   		  $('ul li#'+value+' span').on('click', 'li.expand span', function (e) {
   			$(this).text('[ + ]').parent().addClass('expand').removeClass('collapse').find('>ul').slideUp();
   			e.stopImmediatePropagation();
   		  });
   		   $('ul li#'+value+' span').click(); 		 
   	    });
   	}
     
   });
   
     
   var is_loading = false; 
   var limit = 6; // limit items per page	
    
   var seller_id="<?php echo $seller_id; ?>";
   var tab_id= "tab-sellerproducts";
   var id = adv_id;
   var count = count_adv;
   
   $('#adv_tab,#product_tab').click(function (e) {
   	var target = $(e.target).attr("href") // activated tab		
   	target = target.replace('#','');
   	tab_id = target;
   	//$('#tab-sellerreview').removeclass("active");
   	if(tab_id == 'tab-sellerproducts') {
   		id = $("#"+tab_id+"1 div:first-child").attr("id");
   	} else {
   		id = $("#"+tab_id+" div:first-child").attr("id");
   	}
   	count = $("#"+tab_id+" div.advertise_count").length;
                  is_loading = false;
   	//alert(tab_id+','+id+','+count);
   });
   
   $('#tab-sellerreview').click(function () {
   	$('#product_tab').removeclass("active");
   	//$('#tab-sellerreview').css("display", "block");
   });
   
   $(function() {			 
   	$(window).scroll(function() {
   	if(id) {
   		if (is_loading == false) {						
   			if($(window).scrollTop() + $(window).height() >= $(document).height() - 300) {
   				is_loading = true;
   				$('#loader_page').show();
   				$.ajax({
   				    url: "index.php?route=seller/seller/advertisement_store_info&count="+count+"&seller_id="+seller_id,
   				    type: 'GET',					    
   				    success:function(data){ 
   						var str = $.trim(data);	//alert(str);
   						if(str == 'no_record_found') {
   							$('#loader_page').hide();
   							is_loading = true;
   							count = '';
   							tab_id = '';
   							id = '';
   						} else {
   							$('#loader_page').hide();							
   							$('#tab-sellerads').append(data);									
   													
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
<?php //echo $footer; ?>