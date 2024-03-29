

<?php echo $header; ?>
<div class="container-fluid">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<?php if ($success) { ?>
	<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
	<?php } ?>
	<div class="row">
		<?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>">			
		<div class="container-fluid">
			<?php echo $content_top; ?>
			<div class="pull-right">
				<?php //if($product_limit['product_limit'] != '0') { ?>
				<?php //if($seller_advertise_total < $advertise_limit ) { ?>
				<a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
				<?php //} ?>
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-advertise').submit() : false;"><i class="fa fa-trash-o"></i></button>
			</div>
			<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
			<?php } ?>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
				</div>
				<div class="panel-body">					
					<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-advertise">
						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
										<td class="text-center"><?php echo $column_image; ?></td>
										<td class="text-left"><?php echo $column_name; ?></td>									
										<td class="text-left"><?php echo $column_status; ?></td>
										<td class="text-right"><?php echo $column_action; ?></td>
									</tr>
								</thead>
								<tbody>
									<?php if ($advertises) { ?>
									<?php foreach ($advertises as $advertise) { ?>
									<tr>
										<td class="text-center"><?php if (in_array($advertise['advertise_id'], $selected)) { ?>
											<input type="checkbox" name="selected[]" value="<?php echo $advertise['advertise_id']; ?>" checked="checked" />
											<?php } else { ?>
											<input type="checkbox" name="selected[]" value="<?php echo $advertise['advertise_id']; ?>" />
											<?php } ?>
										</td>
										<td class="text-center"><?php if ($advertise['offer_image']) { ?>
											<img src="<?php echo $advertise['offer_image']; ?>" alt="<?php echo $advertise['offer_title']; ?>" class="img-thumbnail" />
											<?php } else { ?>
											<span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
											<?php } ?>
										</td>
										<td class="text-left"><?php echo $advertise['offer_title']; ?></td>										
										<td class="text-left"><?php if($advertise['status'] == 'submitted'){ ?><span class="label label-success"><?php echo $advertise['status']; ?></span><?php } else { ?><?php echo $advertise['status']; } ?></td>
										<td class="text-right"><a href="<?php echo $advertise['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
									</tr>
									<?php } ?>
									<?php } else { ?>
									<tr>
										<td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
									</tr>
									<?php } ?>
								</tbody>
							</table>
						</div>
					</form>
					<div class="row">
						<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
						<div class="col-sm-6 text-right"><?php echo $results; ?></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('#button-filter').on('click', function() {
		var url = 'index.php?route=sellerproduct/product';
	
		var filter_name = $('input[name=\'filter_name\']').val();
	
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}
	
		var filter_model = $('input[name=\'filter_model\']').val();
	
		if (filter_model) {
			url += '&filter_model=' + encodeURIComponent(filter_model);
		}
	
		var filter_price = $('input[name=\'filter_price\']').val();
	
		if (filter_price) {
			url += '&filter_price=' + encodeURIComponent(filter_price);
		}
	
		var filter_quantity = $('input[name=\'filter_quantity\']').val();
	
		if (filter_quantity) {
			url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
		}
	
		var filter_status = $('select[name=\'filter_status\']').val();
	
		if (filter_status != '*') {
			url += '&filter_status=' + encodeURIComponent(filter_status);
		}
	
		location = url;
	});
	//-->
</script>
</div></div>
<?php echo $footer; ?>

