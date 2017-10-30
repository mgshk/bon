<?php if(isset($advertisement_national)) { 
	if(count($advertisement_national) > 0) {
	    foreach($advertisement_national as $advertisement_na) { ?>
            <div class="col-sm-12 advertise_count" id="<?php echo $advertisement_na['advertise_id']; ?>" >
               <div class="row">
                  <div class="hovereffect fis-des">
                    <?php if(file_exists("image/".$advertisement_na['offer_image'])){ ?>
						<img src="<?php echo $image_resize->resize($advertisement_na['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_na['offer_title']; ?>" alt="<?php echo $advertisement_na['offer_title']; ?>">
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
				<h2 class="advertise_title"><?php echo $advertisement_na['offer_title']; ?></h2>
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
				<div class="temp--mb">
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
				</div>
				<?php if((isset($advertisement_na['filtered']) && $advertisement_na['filtered'] =='1') ? $advertisement_na['filtered'] : '') { ?>
				<div class="col-sm-1 filtered_ads">
					<?php echo "Filtered"; ?>
				</div>
				<?php } ?>
			</a>
		</div>
               </div>
            </div>
	    <?php $count_na = count($advertisement_national) + $count; ?>
	    <script>var national_adv_id = "<?php echo $advertisement_na['advertise_id']; ?>"; var count = "<?php echo $count_na; ?>";</script>
	    <?php } } else { 
		echo "no_record_found"; 
	     } }?>

	<?php if(isset($advertisement_state)) {
	  if(count($advertisement_state) > 0) {
	    foreach($advertisement_state as $advertisement_st) { ?>
            <div class="col-sm-12 advertise_count" id="<?php echo $advertisement_st['advertise_id']; ?>" >
               <div class="row">
                  <div class="hovereffect fis-des">
                     <?php if(file_exists("image/".$advertisement_st['offer_image'])){ ?>
						<img src="<?php echo $image_resize->resize($advertisement_st['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_st['offer_title']; ?>" alt="<?php echo $advertisement_st['offer_title']; ?>">
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
				<h2 class="advertise_title"><?php echo $advertisement_st['offer_title']; ?></h2>
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
				<div class="temp--mb">
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
				</div>
				<?php if((isset($advertisement_st['filtered']) && $advertisement_st['filtered'] =='1') ? $advertisement_st['filtered'] : '') { ?>
				<div class="col-sm-1 filtered_ads">
					<?php echo "Filtered"; ?>
				</div>
				<?php } ?>
			</a>
		</div>
               </div>
            </div>
	    <?php $count_st = count($advertisement_state) + $count; ?>
	    <script>var state_adv_id = "<?php echo $advertisement_st['advertise_id']; ?>"; var count = "<?php echo $count_st; ?>";</script>
	    <?php } } else { 
		echo "no_record_found"; 
	     } }?>

	     <?php if(isset($advertisement_city)) {
	     if(count($advertisement_city) > 0) {
	    foreach($advertisement_city as $advertisement_ci) { ?>
            <div class="col-sm-12 advertise_count" id="<?php echo $advertisement_ci['advertise_id']; ?>">
               <div class="row">
                  <div class="hovereffect fis-des">
                     <?php if(file_exists("image/".$advertisement_ci['offer_image'])){ ?>
						<img src="<?php echo $image_resize->resize($advertisement_ci['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_ci['offer_title']; ?>" alt="<?php echo $advertisement_ci['offer_title']; ?>">
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
				<h2 class="advertise_title"><?php echo $advertisement_ci['offer_title']; ?></h2>
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
				<div class="temp--mb">
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
				</div>
				<?php if((isset($advertisement_ci['filtered']) && $advertisement_ci['filtered'] =='1') ? $advertisement_ci['filtered'] : '') { ?>
				<div class="col-sm-1 filtered_ads">
					<?php echo "Filtered"; ?>
				</div>
				<?php } ?>
			</a>
		</div>
               </div>
            </div>
	    <?php $count_ct = count($advertisement_city) + $count; ?>	    
	    <script>var city_adv_id = "<?php echo $advertisement_ci['advertise_id']; ?>"; var count = "<?php echo $count_ct; ?>";</script>
	    <?php } } else { 
		echo "no_record_found"; 
	     } }?>


	    <?php if(isset($advertisement_local)) { 
	    if(count($advertisement_local) > 0 && !empty($advertisement_local)) {
	    foreach($advertisement_local as $advertisement_lo) { ?>
            <div class="col-sm-12 advertise_count" id="<?php echo $advertisement_lo['advertise_id']; ?>" >
               <div class="row">
                  <div class="hovereffect fis-des">
                     <?php if(file_exists("image/".$advertisement_lo['offer_image'])){ ?>
						<img src="<?php echo $image_resize->resize($advertisement_lo['offer_image'], 993, 182); ?>" class="img-responsive" title="<?php echo $advertisement_lo['offer_title']; ?>" alt="<?php echo $advertisement_lo['offer_title']; ?>">
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
				<h2 class="advertise_title"><?php echo $advertisement_lo['offer_title']; ?></h2>
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
				<div class="temp--mb">
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
				</div>
				<?php if((isset($advertisement_lo['filtered']) && $advertisement_lo['filtered'] =='1') ? $advertisement_lo['filtered'] : '') { ?>
				<div class="col-sm-1 filtered_ads">
					<?php echo "Filtered"; ?>
				</div>
				<?php } ?>
			</a>
		</div>
               </div>
            </div>
	     <?php $count_lo = count($advertisement_local) + $count; ?>
	     <script>var local_adv_id = "<?php echo $advertisement_lo['advertise_id']; ?>"; var count = "<?php echo $count_lo; ?>";</script>
	     <?php } } else { 
		echo "no_record_found"; 
	     } }?> 
