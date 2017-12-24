<?php if (isset($categories)) { 
	if (count($categories) > 0) { ?>
<?php foreach ($categories as $category) { //print_r($category);?>
<?php //if ($category['seller']) { ?>
<?php //foreach (array_chunk($category['seller'], 4) as $sellers) { ?>
<?php //foreach ($sellers as $seller) { ?>
<div class="widget main-txt-grp fis-des" id="<?php echo $category['id']; ?>">
	<div class="blog-widget">
		<div class="widget-post widget_post_mailtitle">
                     <div class="col-xs-3">			
                        <?php 
                        //echo implode(' ', $category);
                        
                        if( $category['image'] != '') { ?>
                        <a href="<?php echo $category['href']; ?>"><img src="image/<?php echo $category['image']; ?>" class="img-responsive" title="<?php echo $category['nickname']; ?>" alt="<?php echo $category['nickname']; ?>" style="width:280px; height:130px;"></a>
                        <?php } else { ?>
                        <a href="<?php echo $category['href']; ?>"><img src="image/no_store_img.jpg" class="img-responsive" title="<?php echo $category['nickname']; ?>" alt="<?php echo $category['nickname']; ?>" style="width:280px; height:130px;"></a>
                        <?php } ?>	
                                            <?php if( $category['seller_verified'] == '1') { ?>
                        <img style="position: absolute; top: 105px; left: 135px" src="image/verified.png" class="img-responsive">
                        <?php } ?>
                        <?php if((isset($category['filtered']) && $category['filtered'] !='0') ? $category['filtered'] : '') { ?>
                                 <img style="position: absolute; top: 105px; left: 20px" src="image/featured.png" class="img-responsive">
                        <!--<div class="filtered_ads">
                           <?php echo "Featured"; ?>
                        </div>-->
                        <?php } ?>
                     </div>
                     <div class="col-xs-6">			
                        <?php if( $category['nickname'] != '') { ?>
                        <h3 class="nw-rule-store-name"><a style="color: #000000" href="<?php echo $category['href']; ?>" title="<?php echo $category['nickname']; ?>"><?php echo $category['nickname']; ?></a></h3>
                        <?php } else { ?>
                        <h3 class="nw-rule-store-name"><a style="color: #000000" href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></h3>
                        <?php } ?>
                        <?php //if( $category['rating'] != '') { ?>
                        <div>
                           <?php for ($i = 1; $i <= 5; $i++) { ?>
                           <?php if ($category['rating'] < $i) { ?>
                           <div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
                           <?php } else { ?>
                           <div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
                           <?php } ?>
                           <?php } ?> &nbsp; <?php if($category['review_count'] != ''){ ?><span><?php echo $category['review_count']; ?> Votes</span><?php } else { ?> 0 Votes <?php } ?>
                        </div>
                        <?php //} ?>					
                        <?php if( $category['telephone'] != '') { ?>
                        <p class="nw-rule-phone_no"><i class="fa fa-phone" aria-hidden="true"></i><span> <a style="font-size: 12px;" href="callto:<?php echo $category['telephone']; ?>" title="<?php echo $category['telephone']; ?>"><?php echo $category['telephone']; ?></a></span> </p>
                        <?php } ?>
                        <?php if( $category['seller_address'] != '') { ?>
                        <p class="nw-rule-address"><i class="fa fa-location-arrow" aria-hidden="true"></i><span><a target="_blank" style="font-size: 12px;" href="https://www.google.co.in/maps/place/<?php echo $category['lat']; ?>,<?php echo $category['lng']; ?>" title="<?php echo $category['seller_address']; ?>"><?php echo $category['seller_address']; ?></a></span></p>
                        <?php } ?>
                        <?php //if( $category['description'] != '') { ?>
                        <!--<p><i class="fa fa-info" aria-hidden="true"></i><span><?php echo $category['description']; ?></span> </p>-->
                        <?php //} ?>
                     </div>
                     <div class="col-xs-3">
                        <span class="lenth-dist"><?php if(($category['lat'] && $category['lng']) != '') { ?>
                        <span class="nw-rule-loc"><a target="_blank" style="font-size: 12px" href="https://www.google.co.in/maps/place/<?php echo $category['lat']; ?>,<?php echo $category['lng']; ?>"><i class="fa fa-map-marker" aria-hidden="true"></i> Location on map &nbsp; 
                        <?php //if($category['filtered'] =='0') { ?>
                        <?php echo round($category['distance'], 2); ?> Km  
                        <?php //} ?></a></span>
                        <?php } ?></span>					 
                        <?php if( $category['store_ads'] != '') { ?>
                        </br></br></br>
                        <p class="right-str-cnt"><span><?php echo $category['store_ads']; ?> Ad(s)</span></p>
                        <?php } ?>
                     </div>	
		</div>
	</div>
</div>
<div class="widget main-txt-grp sec-mob seller--inf-pg" id="<?php echo $category['id']; ?>">
	<div class="blog-widget">
		<div class="widget-post widget_post_mailtitle">
			<div class="col-xs-12">
				<div class="row sellr-list">
					<div class="col-xs-6">			
						<?php if( $category['image'] != '') { ?>
						<a href="<?php echo $category['href']; ?>" class="seller--rr"><img src="image/<?php echo $category['image']; ?>" class="img-responsive" title="<?php echo $category['nickname']; ?>" alt="<?php echo $category['nickname']; ?>" style="width:140px; height:90px;"></a>
						<?php } else { ?>
						<a href="<?php echo $category['href']; ?>" class="seller--rr"><img src="image/no-image.jpg" class="img-responsive" title="<?php echo $category['nickname']; ?>" alt="<?php echo $category['nickname']; ?>" style="width:140px; height:90px;"></a>
						<?php } ?>
						<?php if( $category['seller_verified'] == '1') { ?>
						   <img style="position: absolute; top: 67px; left: 111px" src="image/verified.png" class="img-responsive">
						<?php } ?>
						<?php if((isset($category['filtered']) && $category['filtered'] !='0') ? $category['filtered'] : '') { ?>
						   <img style="position: absolute; top: 67px; left: 10px" src="image/featured.png" class="img-responsive">
						<!--<div class="col-sm-1 filtered_ads">
						   <img style="position: absolute; top: 67px; left: 5px" src="image/featured.png" class="img-responsive">
						   <?php echo "Featured"; ?>
						</div>-->
						<?php } ?>
						<p class="img--sell-lst"><?php if( $category['store_ads'] != '') { ?><?php echo $category['store_ads']; ?> Ad(s)<?php } ?></p>
					</div>
					<div class="col-xs-6 sell-ret">
						<?php if( $category['nickname'] != '') { ?>
						<h3 class="nw-rule-store-name"><a href="<?php echo $category['href']; ?>" title="<?php echo $category['nickname']; ?>"><?php echo $category['nickname']; ?></a></h3>
						<?php } else { ?>
						<h3 class="nw-rule-store-name"><a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></h3>
						<?php } ?>
						<span class="lenth-distt"><?php if(($category['lat'] && $category['lng']) != '') { ?>
						<span class="nw-rule-loc"><a target="_blank" style="font-size: 12px" href="https://www.google.co.in/maps/place/<?php echo $category['lat']; ?>,<?php echo $category['lng']; ?>"><i class="fa fa-map-marker" aria-hidden="true"></i> Loc on map &nbsp; 
						<?php //if($category['filtered'] =='0') { ?>
						<?php echo round($category['distance'], 2); ?> Km  
						<?php //} ?></a></span>
						<?php } ?></span>
						<?php //if( $category['rating'] != '') { ?>
						<div>
						   <?php for ($i = 1; $i <= 5; $i++) { ?>
						   <?php if ($category['rating'] < $i) { ?>
						   <div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
						   <?php } else { ?>
						   <div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
						   <?php } ?>
						   <?php } ?> &nbsp; <?php if($category['review_count'] != ''){ ?><span><?php echo $category['review_count']; ?> Votes</span><?php } else { ?> 0 Votes <?php } ?>
						</div>
						<?php //} ?>		       		       
						<?php if( $category['telephone'] != '') { ?>
						<p class="nw-rule-phone_no"><i class="fa fa-phone" aria-hidden="true"></i><span> <a href="callto:<?php echo $category['telephone']; ?>"><?php echo $category['telephone']; ?></a></span> </p>
						<?php } ?>		       
						<?php if( $category['seller_address'] != '') { ?>
						<p class="nw-rule-address"><i class="fa fa-location-arrow" aria-hidden="true"></i><span><a target="_blank" style="font-size: 12px" href="https://www.google.co.in/maps/place/<?php echo $category['lat']; ?>,<?php echo $category['lng']; ?>"><?php echo $category['seller_address']; ?></a></span></p>
						<?php } ?>
					</div>
				</div>
			</div>
			<!--<div class="col-xs-12">
				<div class="row sellr-list">
					<div class="col-xs-6">
					</div>
					<div class="col-xs-6">
					</div>
				</div>
			</div>
			<div class="col-xs-12 sell-ret">
				<?php //if( $category['description'] != '') { ?>
				<p><i class="fa fa-info" aria-hidden="true"></i><span><?php //echo $category['description']; ?></span> </p>
				<?php //} ?>
			</div>-->
		</div>
	</div>
</div>
<?php $count = count($categories) + $count; ?>	    
<script>var cat_id = "<?php echo $category['id']; ?>"; var count = "<?php echo $count; ?>";</script>
<?php } } else {
	echo "no_record_found"; 
	     } } ?>