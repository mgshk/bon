<div id="favouries_str" class="btn-group btn-block str--fv favouries_str">
<?php if($cus_logged) { ?>
  <a class="fis-dess cursor free-list-top--bon" data-toggle="dropdown" class="btn btn-inverse btn-block btn-lg dropdown-toggle" aria-expanded="true"><span id="fav-total">Favourites (<?php echo count($store_favourites_front); ?>)</span></span></a>
<?php } else { ?>
  <a class="fis-dess cursor free-list-top--bon" data-toggle="modal" data-target="#_log-bon"> <span class="hidden-xs hidden-sm hidden-md">Favourites (0)</span></a>
<?php } ?>  
  <ul class="dropdown-menu pull-right">
	<li>
	<?php if($store_favourites_front) { ?>
      <table class="table table-striped fis-des">
	<tbody>		
	<?php foreach($store_favourites_front as $store_favourites) { ?>
	<form action="" method="post" id="<?php echo $store_favourites['customer_id']; ?>" class="form-horizontal" >
	<tr>
	  <td class="text-center">
	  <?php $store_link = "index.php?route=seller/seller/info&seller_id=".$store_favourites['customer_id']."&path="; ?>
	  <?php if($store_favourites['banner'] != '') { ?>
		<a href="<?php echo $store_link; ?>"><img src="<?php echo $image_resize->resize($store_favourites['banner'], 100, 100); ?>" alt="<?php echo $store_favourites['nickname']; ?>" title="<?php echo $store_favourites['nickname']; ?>" class="img-thumbnail"></a>
	  <?php } else { ?>
		<a href="<?php echo $store_link; ?>"><img src="<?php echo $image_resize->resize('no_image.png', 100, 100); ?>" alt="<?php echo $store_favourites['nickname']; ?>" title="<?php echo $store_favourites['nickname']; ?>" class="img-thumbnail"></a>	  
	<?php } ?>
	  </td>
	  <td class="text-left">
		<a class="fav--strs-ft" href="<?php echo $store_link; ?>"><?php echo $store_favourites['nickname']; ?></a><br>
		<small><input class="favts1" type="checkbox" data-text="<?php echo $store_favourites['customer_id']; ?>" id="fav_email" data-name="email" name="email" value="1" <?php if($store_favourites['email']) {echo "checked";} ?>> Send me AD update notification.</small><br/>
		<!--<small><input class="favts2" type="checkbox" data-text="<?php echo $store_favourites['customer_id']; ?>" id="fav_notification" data-name="notification" name="notification" value="1" <?php if($store_favourites['notification']) {echo "checked";} ?>> Send Notification</small>-->
	  </td>
	  <td class="text-center"><button type="button" onclick="favourite.remove('<?php echo $store_favourites['customer_id']; ?>');" title="Remove" class="btn-xs"><i class="fa fa-times"></i></button></td>
	</tr>
	<?php } ?>
	</tbody>
	</table>
	<?php } else { ?>
	<p class="fis-dess empty--fav">No favourite store/entity.</p>
      <?php } ?>
    </li>    
      </ul>
      <ul class="sec-mob">
	<li>
	<?php if($store_favourites_front) { ?>
      <table class="table table-striped sec-mob">
	<tbody>		
	<?php foreach($store_favourites_front as $store_favourites) { ?>
	<form action="" method="post" id="<?php echo $store_favourites['customer_id']; ?>" class="form-horizontal" >
	<tr>
	  <td class="text-center">
	  <?php $store_link = "index.php?route=seller/seller/info&seller_id=".$store_favourites['customer_id']."&path="; ?>
	  <?php if($store_favourites['banner'] != '') { ?>
		<a href="<?php echo $store_link; ?>"><img src="<?php echo $image_resize->resize($store_favourites['banner'], 100, 100); ?>" alt="<?php echo $store_favourites['nickname']; ?>" title="<?php echo $store_favourites['nickname']; ?>" class="img-thumbnail"></a>
	  <?php } else { ?>
		<a href="<?php echo $store_link; ?>"><img src="<?php echo $image_resize->resize('no_image.png', 100, 100); ?>" alt="<?php echo $store_favourites['nickname']; ?>" title="<?php echo $store_favourites['nickname']; ?>" class="img-thumbnail"></a>
	  <?php } ?>
	  </td>
	  <td class="text-left">
		<a class="fav--strs-ft" href="<?php echo $store_link; ?>"><?php echo $store_favourites['nickname']; ?></a><br>
		<small><input class="favts1" type="checkbox" data-text="<?php echo $store_favourites['customer_id']; ?>" id="fav_email" data-name="email" name="email" value="1" <?php if($store_favourites['email']) {echo "checked";} ?>> Send me AD update notification.</small><br/>
		<!--<small><input class="favts2" type="checkbox" data-text="<?php echo $store_favourites['customer_id']; ?>" id="fav_notification" data-name="notification" name="notification" value="1" <?php if($store_favourites['notification']) {echo "checked";} ?>> Send Notification</small>-->
	  </td>
	  <td class="text-center"><button type="button" onclick="favourite.remove('<?php echo $store_favourites['customer_id']; ?>');" title="Remove" class="btn-xs"><i class="fa fa-times"></i></button></td>
	</tr>
	<?php } ?>
	</tbody>
	</table>
	<?php } else { ?>
	<p class="sec-mob empty--fav">No favourite store/entity.</p>
      <?php } ?>
    </li>    
      </ul>      
</div>