					<?php if(isset($advertisement_store)) {
						if(count($advertisement_store) > 0) {
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
							<?php $count_adv= count($advertisement_store) + $count; ?>
							<script>var adv_id = "<?php echo $advertisement_ste['advertise_id']; ?>"; var count = "<?php echo $count_adv; ?>";</script>
						 <?php } 
						} else { 
							echo "no_record_found";   
						 } }?>


							<?php if (isset($products)) { ?>
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
											<?php if ($product['special'] == $product['price']) { ?>
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
							<?php } ?>
						</div>
