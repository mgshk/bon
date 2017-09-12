<div class="modal fade" id="pay_fr_mb" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body loc-share-top alt--res-pop">
				<img src="image/pay1.jpg" class="image-responsive">
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="expense_fr_mb" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body loc-share-top alt--res-pop">
				<img src="image/expense.jpg" class="image-responsive">
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="favr_fr_mb" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<?php echo $store_favouries; ?>
			</div>
		</div>
	</div>
</div>
<footer class="ft--mb-st">
<!--<ul>
<li><span class="bt-ts-nn-pay"><a href=""><img src="image/pay.png" class="img-responsive"></a></span></li>
<li><a href=""><i class="fa fa-star"></i><span class="re--ft">0</span><br><span>Favourites</span></a></li>
<li><a href=""><i class="fa fa-home"></i><br><span>Home</span></a></li>
<li><a href=""><i class="fa fa-heart"></i><span class="re--ft">0</span><br><span>Wish List</span></a></li>
<li><span class="bt-ts-nn-post"><a href=""><img src="image/post.png" class="img-responsive"></a></span></li>
</ul>-->
<ul>
<?php if(!$logged) { ?>
<li><a data-toggle="modal" data-target="#pay_fr_mb"><img src="image/mob/pay.png" class="img-responsive"><span>Pay</span></a></li>
<li><a data-toggle="modal" data-target="#_log-bon"><img src="image/mob/favorites.png" class="img-responsive"><span class="re--ft">0</span><span>Favourites</span></a></li>
<li><a href=""><img src="image/mob/home.png" class="img-responsive"><span>Home</span></a></li>
<li><a data-toggle="modal" data-target="#_log-bon"><img src="image/mob/wishlist.png" class="img-responsive"><span class="re--ft">0</span><span>Wish List</span></a></li>
<li><a data-toggle="modal" data-target="#login_frc_seller"><img src="image/mob/post_ad.png" class="img-responsive"><span>Post AD</span></a></li>
<?php }elseif($logged && $login_type != "buyer") { ?>
<li><a href="index.php?route=order/order#content"><img src="image/mob/orders.png" class="img-responsive"><span class="re--ft"><?php echo $order_total_pending; ?></span><span><span>Orders</span></a></li>
<li><a href="index.php?route=sellerproduct/product#content"><img src="image/mob/products.png" class="img-responsive"><span class="re--ft"><?php echo $seller_products_total; ?></span><span>Products</span></a></li>
<li><a href=""><img src="image/mob/home.png" class="img-responsive"><span>Home</span></a></li>
<li><a href="index.php?route=sellerreview/sellerreview#content"><img src="image/mob/reviews.png" class="img-responsive"><span class="re--ft"><?php echo $review_count; ?></span><span>Reviews</span></a></li>
<li><a href="index.php?route=selleradvertise/advertise/add#content"><img src="image/mob/post_ad.png" class="img-responsive"><span>Post AD</span></a></li>
<?php }elseif($logged && $login_type != "seller") { ?>
<li><a data-toggle="modal" data-target="#pay_fr_mb"><img src="image/mob/pay.png" class="img-responsive"><span>Pay</span></a></li>
<li><a data-toggle="modal" data-target="#favr_fr_mb"><img src="image/mob/favorites.png" class="img-responsive"><span id="fav_ret_m" class="re--ft"><?php echo count($store_favourites_front); ?></span><span>Favourites</span></a></li>
<li><a href=""><img src="image/mob/home.png" class="img-responsive"><span>Home</span></a></li>
<li><a href="index.php?route=account/wishlist"><img src="image/mob/wishlist.png" class="img-responsive"><span class="re--ft"><?php echo $text_wishlist; ?></span><span>Wish List</span></a></li>
<li><a data-toggle="modal" data-target="#expense_fr_mb"><img src="image/mob/expense_report.png" class="img-responsive"><span>Exp report</span></a></li>
<?php } ?>
</ul>
</footer>
<script>
$('input.favts2, input.favts1').on('change', function(){
		//alert($(this).data('name'));
		var fav_store_id = $(this).data('text');
		var fav_name = $(this).data('name');
		if($(this).is(":checked")) {
			var vat = 1;
		} else {
			var vat = 0;
		}
		//alert(fav_name);
		$.ajax({				
			url: "index.php?route=common/header/updatestore_favourites_front",
			type: 'post',
			dataType: 'json',
			data: {store_id:fav_store_id, value:vat, fav_name:fav_name},
			success: function(json) {
				if (json['success']) {
					//$('#cus_prof').val(json['success']);
				}
			}
		 });
});
     
</script>
<!-- <footer class="ft--ds-st">
</footer> -->
</body></html>