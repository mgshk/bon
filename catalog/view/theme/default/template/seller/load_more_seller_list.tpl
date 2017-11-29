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
			<?php if( $category['image'] != '') { ?>
			<a href="<?php echo $category['href']; ?>"><img src="image/<?php echo $category['image']; ?>" class="img-responsive" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" style="width:280px; height:130px;"></a>
			<?php } else { ?>
			<a href="<?php echo $category['href']; ?>"><img src="image/no-image.jpg" class="img-responsive" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" style="width:280px; height:130px;"></a>
			<?php } ?>
			<?php if((isset($category['filtered']) && $category['filtered'] !='0') ? $category['filtered'] : '') { ?>
			<div class="col-sm-1 filtered_ads">
				<?php echo "Featured"; ?>
			</div>
			<?php } ?>
		     </div>
                     <div class="col-xs-6">			
			<?php if( $category['nickname'] != '') { ?>
			<h3 class="nw-rule-store-name"><a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>"><?php echo $category['nickname']; ?></a></h3>
			<?php } else { ?>
			<h3 class="nw-rule-store-name"><a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></h3>
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
			<?php if( $category['seller_address'] != '') { ?>
			<p class="nw-rule-address"><i class="fa fa-location-arrow" aria-hidden="true"></i><span><?php echo $category['seller_address']; ?></span></p>
			<?php } ?>
			<?php if( $category['telephone'] != '') { ?>
			<p class="nw-rule-phone_no"><i class="fa fa-phone" aria-hidden="true"></i><span> <a href="callto:<?php echo $category['telephone']; ?>"><?php echo $category['telephone']; ?></a></span> </p>
			<?php } ?>
			<?php if( $category['description'] != '') { ?>
			<!-- <p><i class="fa fa-info" aria-hidden="true"></i><span><?php //echo $category['description']; ?></span> </p> -->
			<?php } ?>
		     </div>
                     <div class="col-xs-3">
			<span class="lenth-dist"><?php if(($category['lat'] && $category['lng']) != '') { ?>
			<span class="nw-rule-loc"><a target="_blank" style="font-size: 12px" href="https://www.google.co.in/maps/place/<?php echo $category['lat']; ?>,<?php echo $category['lng']; ?>"><i class="fa fa-map-marker" aria-hidden="true"></i> Location on map &nbsp; 
			<?php //if($category['filtered'] =='0') { ?>
			<?php echo round($category['distance'], 2); ?> Km  
			<?php //} ?></a></span>
			<?php } ?></span>			<?php if( $category['store_ads'] != '') { ?>
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
						<a href="<?php echo $category['href']; ?>" class="seller--rr"><img src="image/<?php echo $category['image']; ?>" class="img-responsive" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" style="width:140px; height:90px;"></a>
						<?php } else { ?>
						<a href="<?php echo $category['href']; ?>" class="seller--rr"><img src="image/no-image.jpg" class="img-responsive" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" style="width:140px; height:90px;"></a>
						<?php } ?>		       
						<?php if((isset($category['filtered']) && $category['filtered'] !='0') ? $category['filtered'] : '') { ?>
						<div class="col-sm-1 filtered_ads">
							<?php echo "Featured"; ?>
						</div>
						<?php } ?>
						<p class="img--sell-lst"><?php if( $category['store_ads'] != '') { ?><?php echo $category['store_ads']; ?> Ad(s)<?php } ?></p>
					</div>
					<div class="col-xs-6 sell-ret">
						<?php if( $category['nickname'] != '') { ?>
						<h3 class="nw-rule-store-name"><a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>"><?php echo $category['nickname']; ?></a></h3>
						<?php } else { ?>
						<h3 class="nw-rule-store-name"><a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></h3>
						<?php } ?>
						<span class="lenth-distt"><?php if(($category['lat'] && $category['lng']) != '') { ?>
						<span class="nw-rule-loc"><a target="_blank" style="font-size: 12px" href="https://www.google.co.in/maps/place/<?php echo $category['lat']; ?>,<?php echo $category['lng']; ?>"><i class="fa fa-map-marker" aria-hidden="true"></i> Loc on map &nbsp; <?php if($category['filtered'] =='0') { ?>
						<?php echo round($category['distance'], 2); ?> Km  
						<?php } ?></a></span>
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
						<p class="nw-rule-address"><i class="fa fa-location-arrow" aria-hidden="true"></i><span><?php echo $category['seller_address']; ?></span></p>
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
				<!--<p><i class="fa fa-info" aria-hidden="true"></i><span><?php //echo $category['description']; ?></span> </p>-->
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