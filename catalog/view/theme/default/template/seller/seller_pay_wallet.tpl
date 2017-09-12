

<?php echo $header; ?>
<style>
img{
margin: 0 auto;
}
</style>
<?php //echo $seller_left_menu; ?>
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
	<div id="content" class="<?php echo $class; ?>">
		<?php echo $content_top; ?>
		<div class="col-sm-12">
			<img class="img-responsive" src="image/pay-bt.jpg" title="Pay Wallet" alt="Pay Wallet">
		</div>
	</div>
</div>
<?php //echo $footer; ?>

