					<?php if(isset($advertisement_store)) {
						if(count($advertisement_store) > 0) {
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
							<?php $count_adv= count($advertisement_store) + $count; ?>
							<script>var adv_id = "<?php echo $advertisement_ste['advertise_id']; ?>"; var count = "<?php echo $count_adv; ?>";</script>
						 <?php } 
						} else { 
							echo "no_record_found";   
						 } }?>


						<?php if(isset($products)) {
						if(count($products) > 0) { ?>
						<div class="row">
							<?php foreach ($products as $product) { ?>
							<div class="product-layout product-list advertise_count col-xs-12" id="<?php echo $product['product_id'];?>">
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
									<div class="button-group">
										<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
										<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
										<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
									</div>
								</div>
							</div>
							<?php $count_pro= count($products) + $count; ?>
							<script>var adv_id = "<?php echo $product['advertise_id']; ?>"; var count = "<?php echo $count_pro; ?>";</script>
							<?php } ?>
						</div>
						
						<?php } else { 
						
							echo "no_record_found";   
						} }?>