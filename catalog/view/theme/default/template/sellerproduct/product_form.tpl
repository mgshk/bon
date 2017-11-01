<?php echo $header; ?>
<div class="container-fluid">
  <!--<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>-->
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>



<link href="admin/view/javascript/summernote/summernote.css" rel="stylesheet">
<script type="text/javascript" src="admin/view/javascript/summernote/summernote.js"></script>

<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
  <div class="page-header">
    <div class="container-fluid" style="margin-bottom:10px;">
      <div class="pull-left">
	<a href="<?php echo $cancel; ?>" class="btn btn-primary pull-left"><< Back</a>
    </div>
    <div class="pull-right">
	<button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
      <h1><?php //echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>                    
            <?php if($config_multiseller_tab_image){ ?>
            <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
             <?php } ?>			 
            <?php //if($config_multiseller_tab_reward_points){ ?>
            <li><a href="#tab-advanced" data-toggle="tab"><?php echo $tab_advanced; ?></a></li>
             <?php //} ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">  
			<?php foreach ($languages as $language) { ?>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="product_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
				  <?php } ?>
			<?php if($config_multiseller_categories){ ?>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
				<div class="col-sm-10">
				  <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
				  <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
					<?php foreach ($product_categories as $product_category) { ?>
					<div id="product-category<?php echo $product_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_category['name']; ?>
					  <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
					</div>
					<?php } ?>
				  </div>
				</div>
			  </div>
			  <?php }else{  ?>
				<?php foreach ($product_categories as $product_category) { ?>

				  <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />

				<?php } ?>
			<?php } ?>
			<?php if($config_multiseller_price){ ?>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
				
				</div>
			  </div>
			  <?php }else{ ?>
				<input type="hidden" type="text" name="price" value="<?php echo $discount; ?>" />
			  <?php } ?>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-price"><?php echo $entry_discount; ?></label>
				<div class="col-sm-3">
				  <input type="number" name="discount_price" value="<?php echo $discount_price; ?>" placeholder="<?php echo $entry_discount; ?>" id="input-discount_price" class="form-control" />
				</div>
				<div class="col-sm-3">
				  <select name="discount_type" id="input-discount_type" class="form-control">
					<?php if ($discount_type == 'rs') { ?>
					<option value="rs" selected="selected">in Rs</option>
					<option value="%">in %</option>
					<?php } elseif ($discount_type == '%') { ?>
					<option value="rs">in Rs</option>
					<option value="%" selected="selected">in %</option>
					<?php } else { ?>
					<option value="rs">in Rs</option>
					<option value="%">in %</option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-price"><?php echo $entry_special_price; ?></label>
				<div class="col-sm-3">
				  <span id="special_price"><?php echo $special_price; ?></span>
				  <input type="hidden" name="special_price" value="<?php echo $special_price; ?>" id="input-special_price" class="form-control" />
				</div>
			  </div>
			 <div class="form-group">
			<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
			<div class="col-sm-10">
			  <select name="status" id="input-status" class="form-control">
				<?php if ($status) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		  </div>
		  <div class="form-group" <?php if(!$config_multiseller_stors){ echo 'style="display: none;visibility: hidden;"'; } ?> >
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <?php if (in_array(0, $product_store)) { ?>
                        <input type="checkbox" name="product_store[]" value="0" checked="checked" />
                        <?php echo $text_default; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="product_store[]" value="0" />
                        <?php echo $text_default; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($store['store_id'], $product_store)) { ?>
                        <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
		  </div>
		  <div class="tab-pane" id="tab-image">
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_image; ?></td>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <tr>
                      <td class="text-left"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" /></td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <div class="table-responsive">
                <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_additional_image; ?></td>
                      <td class="text-right"><?php echo $entry_sort_order; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $image_row = 0; ?>
                    <?php foreach ($product_images as $product_image) { ?>
                    <tr id="image-row<?php echo $image_row; ?>">
                      <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                      <td class="text-right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
                      <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $image_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>			
            <div class="tab-pane" id="tab-advanced">
              <?php if($config_multiseller_model){ ?>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
                  <?php if ($error_model) { ?>
                  <div class="text-danger"><?php echo $error_model; ?></div>
                  <?php } ?>
                </div>
              </div>
              <?php }else{ ?>
                <input type="hidden" type="text" name="model" value="<?php echo $model; ?>" />
              <?php } ?>
			  <?php if($config_multiseller_quantity){ ?>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
                </div>
              </div>
                <?php }else{ ?>
                  <input type="hidden" type="text" name="quantity" value="<?php echo $quantity; ?>" />
              <?php } ?>
			  <?php if($config_multiseller_subtract_stok){ ?>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-subtract"><?php echo $entry_subtract; ?></label>
                <div class="col-sm-10">
                  <select name="subtract" id="input-subtract" class="form-control">
                    <?php if ($subtract) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <?php }else{ ?>
                <select name="subtract" id="input-subtract" class="form-control" style="display: none;">
                  <option value="0" selected="selected"></option>
                  <?php if ($subtract) { ?>
                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                  <?php } ?>
                </select>
              <?php } ?>
			   <?php if($config_multiseller_dimensions){ ?>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length"><?php echo $entry_dimension; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-4">
                      <input type="text" name="length" value="<?php echo $length; ?>" placeholder="<?php echo $entry_length; ?>" id="input-length" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
                    </div>
                  </div>
                </div>
              </div>
              <?php }else{ ?>
                <input type="hidden" type="text" name="length" value="<?php echo $length; ?>" />

                  <input type="hidden" type="text" name="width" value="<?php echo $width; ?>" />

                    <input type="hidden" type="text" name="height" value="<?php echo $height; ?>" />
              <?php } ?>
			  <?php if($config_multiseller_length_class){ ?>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
                <div class="col-sm-10">
                  <select name="length_class_id" id="input-length-class" class="form-control">
                    <?php foreach ($length_classes as $length_class) { ?>
                    <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <?php }else{ ?>
                <select name="length_class_id" style="display: none;">
                  <option value="<?php echo $length_class_id; ?>" selected="selected"></option>
                </select>
              <?php } ?>
              <?php if($config_multiseller_weight){ ?>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight"><?php echo $entry_weight; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="weight" value="<?php echo $weight; ?>" placeholder="<?php echo $entry_weight; ?>" id="input-weight" class="form-control" />
                </div>
              </div>
              <?php }else{ ?>
                <input type="hidden" type="text" name="weight" value="<?php echo $weight; ?>" />
              <?php } ?>
              <?php if($config_multiseller_weight_class){ ?>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
                <div class="col-sm-10">
                  <select name="weight_class_id" id="input-weight-class" class="form-control">
                    <?php foreach ($weight_classes as $weight_class) { ?>
                    <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <?php }else{ ?>
                <select name="weight_class_id" style="display: none;">
                  <option value="<?php echo $weight_class_id; ?>" selected="selected"></option>
                </select>
              <?php } ?>
			 </div>			  
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</div>
<script type="text/javascript">
$("input#input-price").keyup(function(){
	var price = $('#input-price').val();
	var dsp = $('#input-discount_price').val();
	var dst = $('select#input-discount_type').val();
	if((price && dsp && dst) != '') {
		if(dst == 'rs') {
			var final_price = (price - dsp);
			$('#special_price').html('');
			$('#special_price').html(final_price);
			$('#input-special_price').val(final_price);
		} else if (dst == '%') {
			var final_price = (price - (price*(dsp/100)));
			$('#special_price').html('');
			$('#special_price').html(final_price);
			$('#input-special_price').val(final_price);
		}
	}
});
$("input#input-discount_price").keyup(function(){			    
	var price = $('#input-price').val();
	var dsp = $('#input-discount_price').val();
	var dst = $('select#input-discount_type').val();
	if(dst == 'rs') {
		var final_price = (price - dsp);
		$('#special_price').html('');
		$('#special_price').html(final_price);
		$('#input-special_price').val(final_price);
	} else if (dst == '%') {
		var final_price = (price - (price*(dsp/100)));
		$('#special_price').html('');
		$('#special_price').html(final_price);
		$('#input-special_price').val(final_price);
	}
});
$('select#input-discount_type').on('change', function() {
    var price = $('#input-price').val();
	var dsp = $('#input-discount_price').val();
	var dst = $('select#input-discount_type').val();
	if(dst == 'rs') {
		var final_price = (price - dsp);
		$('#special_price').html('');
		$('#special_price').html(final_price);
		$('#input-special_price').val(final_price);
	} else if (dst == '%') {
		var final_price = (price - (price*(dsp/100)));
		$('#special_price').html('');
		$('#special_price').html(final_price);
		$('#input-special_price').val(final_price);
	}
})
</script>



   <script type="text/javascript">
// <?php foreach ($languages as $language) { ?>
// $('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
// <?php } ?>
 </script>
   <script type="text/javascript">
// // Manufacturer
// $('input[name=\'manufacturer\']').autocomplete({
// 	'source': function(request, response) {
// 		$.ajax({
// 			url: 'index.php?route=sellerproduct/product/manufacturer_autocomplete&filter_name=' +  encodeURIComponent(request),
// 			dataType: 'json',
// 			success: function(json) {
// 				json.unshift({
// 					manufacturer_id: 0,
// 					name: '<?php echo $text_none; ?>'
// 				});

// 				response($.map(json, function(item) {
// 					return {
// 						label: item['name'],
// 						value: item['manufacturer_id']
// 					}
// 				}));
// 			}
// 		});
// 	},
// 	'select': function(item) {
// 		$('input[name=\'manufacturer\']').val(item['label']);
// 		$('input[name=\'manufacturer_id\']').val(item['value']);
// 	}
// });

// Category
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=sellerproduct/product/category_autocomplete&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'category\']').val('');

		$('#product-category' + item['value']).remove();

		$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// // Filter
// $('input[name=\'filter\']').autocomplete({
// 	'source': function(request, response) {
// 		$.ajax({
// 			url: 'index.php?route=sellerproduct/filter/autocomplete&filter_name=' +  encodeURIComponent(request),
// 			dataType: 'json',
// 			success: function(json) {
// 				response($.map(json, function(item) {
// 					return {
// 						label: item['name'],
// 						value: item['filter_id']
// 					}
// 				}));
// 			}
// 		});
// 	},
// 	'select': function(item) {
// 		$('input[name=\'filter\']').val('');

// 		$('#product-filter' + item['value']).remove();

// 		$('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');
// 	}
// });

// $('#product-filter').delegate('.fa-minus-circle', 'click', function() {
// 	$(this).parent().remove();
// });

// // Downloads
// $('input[name=\'download\']').autocomplete({
// 	'source': function(request, response) {
// 		$.ajax({
// 			url: 'index.php?route=sellerproduct/product/download_autocomplete&filter_name=' +  encodeURIComponent(request),
// 			dataType: 'json',
// 			success: function(json) {
// 				response($.map(json, function(item) {
// 					return {
// 						label: item['name'],
// 						value: item['download_id']
// 					}
// 				}));
// 			}
// 		});
// 	},
// 	'select': function(item) {
// 		$('input[name=\'download\']').val('');

// 		$('#product-download' + item['value']).remove();

// 		$('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_download[]" value="' + item['value'] + '" /></div>');
// 	}
// });

// $('#product-download').delegate('.fa-minus-circle', 'click', function() {
// 	$(this).parent().remove();
// });

// // Related
// $('input[name=\'related\']').autocomplete({
// 	'source': function(request, response) {
// 		$.ajax({
// 			url: 'index.php?route=sellerproduct/product/autocomplete&filter_name=' +  encodeURIComponent(request),
// 			dataType: 'json',
// 			success: function(json) {
// 				response($.map(json, function(item) {
// 					return {
// 						label: item['name'],
// 						value: item['product_id']
// 					}
// 				}));
// 			}
// 		});
// 	},
// 	'select': function(item) {
// 		$('input[name=\'related\']').val('');

// 		$('#product-related' + item['value']).remove();

// 		$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');
// 	}
// });

// $('#product-related').delegate('.fa-minus-circle', 'click', function() {
// 	$(this).parent().remove();
// });
 </script>
   <script type="text/javascript">
// var attribute_row = <?php echo $attribute_row; ?>;

// function addAttribute() {
//     html  = '<tr id="attribute-row' + attribute_row + '">';
// 	html += '  <td class="text-left"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
// 	html += '  <td class="text-left">';
// 	<?php foreach ($languages as $language) { ?>
// 	html += '<div class="input-group"><span class="input-group-addon"><img src="admin/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
//     <?php } ?>
// 	html += '  </td>';
// 	html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
//     html += '</tr>';

// 	$('#attribute tbody').append(html);

// 	attributeautocomplete(attribute_row);

// 	attribute_row++;
// }

// function attributeautocomplete(attribute_row) {
// 	$('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
// 		'source': function(request, response) {
// 			$.ajax({
// 				url: 'index.php?route=sellerproduct/product/attribute_autocomplete&filter_name=' +  encodeURIComponent(request),
// 				dataType: 'json',
// 				success: function(json) {
// 					response($.map(json, function(item) {
// 						return {
// 							category: item.attribute_group,
// 							label: item.name,
// 							value: item.attribute_id
// 						}
// 					}));
// 				}
// 			});
// 		},
// 		'select': function(item) {
// 			$('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
// 			$('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
// 		}
// 	});
// }

// $('#attribute tbody tr').each(function(index, element) {
// 	attributeautocomplete(index);
// });
 </script>
   <script type="text/javascript">
// var option_row = <?php echo $option_row; ?>;

// $('input[name=\'option\']').autocomplete({
// 	'source': function(request, response) {
// 		$.ajax({
// 			url: 'index.php?route=sellerproduct/product/option_autocomplete&filter_name=' +  encodeURIComponent(request),
// 			dataType: 'json',
// 			success: function(json) {
// 				response($.map(json, function(item) {
// 					return {
// 						category: item['category'],
// 						label: item['name'],
// 						value: item['option_id'],
// 						type: item['type'],
// 						option_value: item['option_value']
// 					}
// 				}));
// 			}
// 		});
// 	},
// 	'select': function(item) {
// 		html  = '<div class="tab-pane" id="tab-option' + option_row + '">';
// 		html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
// 		html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + item['label'] + '" />';
// 		html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
// 		html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + item['type'] + '" />';

// 		html += '	<div class="form-group">';
// 		html += '	  <label class="col-sm-2 control-label" for="input-required' + option_row + '"><?php echo $entry_required; ?></label>';
// 		html += '	  <div class="col-sm-10"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
// 		html += '	      <option value="1"><?php echo $text_yes; ?></option>';
// 		html += '	      <option value="0"><?php echo $text_no; ?></option>';
// 		html += '	  </select></div>';
// 		html += '	</div>';

// 		if (item['type'] == 'text') {
// 			html += '	<div class="form-group">';
// 			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
// 			html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
// 			html += '	</div>';
// 		}

// 		if (item['type'] == 'textarea') {
// 			html += '	<div class="form-group">';
// 			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
// 			html += '	  <div class="col-sm-10"><textarea name="product_option[' + option_row + '][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control"></textarea></div>';
// 			html += '	</div>';
// 		}

// 		if (item['type'] == 'file') {
// 			html += '	<div class="form-group" style="display: none;">';
// 			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
// 			html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
// 			html += '	</div>';
// 		}

// 		if (item['type'] == 'date') {
// 			html += '	<div class="form-group">';
// 			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
// 			html += '	  <div class="col-sm-3"><div class="input-group date"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
// 			html += '	</div>';
// 		}

// 		if (item['type'] == 'time') {
// 			html += '	<div class="form-group">';
// 			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
// 			html += '	  <div class="col-sm-10"><div class="input-group time"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
// 			html += '	</div>';
// 		}

// 		if (item['type'] == 'datetime') {
// 			html += '	<div class="form-group">';
// 			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
// 			html += '	  <div class="col-sm-10"><div class="input-group datetime"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
// 			html += '	</div>';
// 		}

// 		if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image') {
// 			html += '<div class="table-responsive">';
// 			html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
// 			html += '  	 <thead>';
// 			html += '      <tr>';
// 			html += '        <td class="text-left"><?php echo $entry_option_value; ?></td>';
// 			html += '        <td class="text-right"><?php echo $entry_quantity; ?></td>';
// 			html += '        <td class="text-left"><?php echo $entry_subtract; ?></td>';
// 			html += '        <td class="text-right"><?php echo $entry_price; ?></td>';
// 			html += '        <td class="text-right"><?php echo $entry_option_points; ?></td>';
// 			html += '        <td class="text-right"><?php echo $entry_weight; ?></td>';
// 			html += '        <td></td>';
// 			html += '      </tr>';
// 			html += '  	 </thead>';
// 			html += '  	 <tbody>';
// 			html += '    </tbody>';
// 			html += '    <tfoot>';
// 			html += '      <tr>';
// 			html += '        <td colspan="6"></td>';
// 			html += '        <td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
// 			html += '      </tr>';
// 			html += '    </tfoot>';
// 			html += '  </table>';
// 			html += '</div>';

//             html += '  <select id="option-values' + option_row + '" style="display: none;">';

//             for (i = 0; i < item['option_value'].length; i++) {
// 				html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
//             }

//             html += '  </select>';
// 			html += '</div>';
// 		}

// 		$('#tab-option .tab-content').append(html);

// 		$('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove(); $(\'#option a:first\').tab(\'show\')"></i> ' + item['label'] + '</li>');

// 		$('#option a[href=\'#tab-option' + option_row + '\']').tab('show');

// 		$('.date').datetimepicker({
// 			pickTime: false
// 		});

// 		$('.time').datetimepicker({
// 			pickDate: false
// 		});

// 		$('.datetime').datetimepicker({
// 			pickDate: true,
// 			pickTime: true
// 		});

// 		option_row++;
// 	}
// });
 </script>
   <script type="text/javascript">
// var option_value_row = <?php echo $option_value_row; ?>;

// function addOptionValue(option_row) {
// 	html  = '<tr id="option-value-row' + option_value_row + '">';
// 	html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
// 	html += $('#option-values' + option_row).html();
// 	html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
// 	html += '  <td class="text-right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
// 	html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" class="form-control">';
// 	html += '    <option value="1"><?php echo $text_yes; ?></option>';
// 	html += '    <option value="0"><?php echo $text_no; ?></option>';
// 	html += '  </select></td>';
// 	html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
// 	html += '    <option value="+">+</option>';
// 	html += '    <option value="-">-</option>';
// 	html += '  </select>';
// 	html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
// 	html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" class="form-control">';
// 	html += '    <option value="+">+</option>';
// 	html += '    <option value="-">-</option>';
// 	html += '  </select>';
// 	html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>';
// 	html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
// 	html += '    <option value="+">+</option>';
// 	html += '    <option value="-">-</option>';
// 	html += '  </select>';
// 	html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>';
// 	html += '  <td class="text-left"><button type="button" onclick="$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
// 	html += '</tr>';

// 	$('#option-value' + option_row + ' tbody').append(html);

// 	option_value_row++;
// }
 </script>
   <script type="text/javascript"><!--
// var discount_row = <?php echo $discount_row; ?>;

// function addDiscount() {
// 	html  = '<tr id="discount-row' + discount_row + '">';
//     html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
//     <?php foreach ($customer_groups as $customer_group) { ?>
//     html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
//     <?php } ?>
//     html += '  </select></td>';
//     html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
//     html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
// 	html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
//     html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
// 	html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
// 	html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
// 	html += '</tr>';

// 	$('#discount tbody').append(html);

// 	$('.date').datetimepicker({
// 		pickTime: false
// 	});

// 	discount_row++;
// }
 </script>
   <script type="text/javascript">
// var special_row = <?php echo $special_row; ?>;

// function addSpecial() {
// 	html  = '<tr id="special-row' + special_row + '">';
//     html += '  <td class="text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
//     <?php foreach ($customer_groups as $customer_group) { ?>
//     html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
//     <?php } ?>
//     html += '  </select></td>';
//     html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
// 	html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
//     html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
// 	html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
// 	html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
// 	html += '</tr>';

// 	$('#special tbody').append(html);

// 	$('.date').datetimepicker({
// 		pickTime: false
// 	});

// 	special_row++;
// }
 </script>
   <script type="text/javascript">
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#images tbody').append(html);

	image_row++;
}
 </script>
   <script type="text/javascript">
// var recurring_count = <?php echo $recurring_count; ?>;

// function addRecurring() {
// 	recurring_count++;

// 	html  = '';
// 	html += '<tr id="recurring-row' + recurring_count + '">';
// 	html += '  <td class="left">';
// 	html += '    <select name="product_recurrings[' + recurring_count + '][recurring_id]" class="form-control">>';
// 	<?php foreach ($recurrings as $recurring) { ?>
// 	html += '      <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>';
// 	<?php } ?>
// 	html += '    </select>';
// 	html += '  </td>';
// 	html += '  <td class="left">';
// 	html += '    <select name="product_recurrings[' + recurring_count + '][customer_group_id]" class="form-control">>';
// 	<?php foreach ($customer_groups as $customer_group) { ?>
// 	html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
// 	<?php } ?>
// 	html += '    <select>';
// 	html += '  </td>';
// 	html += '  <td class="left">';
// 	html += '    <a onclick="$(\'#recurring-row' + recurring_count + '\').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>';
// 	html += '  </td>';
// 	html += '</tr>';

// 	$('#tab-recurring table tbody').append(html);
// }
 </script>
   <script type="text/javascript">
// $('.date').datetimepicker({
// 	pickTime: false
// });

// $('.time').datetimepicker({
// 	pickDate: false
// });

// $('.datetime').datetimepicker({
// 	pickDate: true,
// 	pickTime: true
// });
 </script>
   <script type="text/javascript">
// $('#languagetab a:first').tab('show');
// $('#option a:first').tab('show');
</script>
   <script type="text/javascript">
	// Override summernotes image manager
	// $('button[data-event=\'showImageDialog\']').attr('data-toggle', 'image').removeAttr('data-event');

	// $(document).delegate('button[data-toggle=\'image\']', 'click', function() {
	// 	$('#modal-image').remove();

	// 	$.ajax({
	// 		url: 'index.php?route=sellerproduct/filemanager&token=' + getURLVar('token'),
	// 		dataType: 'html',
	// 		beforeSend: function() {
	// 			$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
	// 			$('#button-image').prop('disabled', true);
	// 		},
	// 		complete: function() {
	// 			$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
	// 			$('#button-image').prop('disabled', false);
	// 		},
	// 		success: function(html) {
	// 			$('body').append('<div id="modal-image" class="modal">' + html + '</div>');

	// 			$('#modal-image').modal('show');
	// 		}
	// 	});
	// });

	// Image Manager
	// $(document).delegate('a[data-toggle=\'image\']', 'click', function(e) {
	// 	e.preventDefault();

	// 	var element = this;

	// 	$(element).popover({
	// 		html: true,
	// 		placement: 'right',
	// 		trigger: 'manual',
	// 		content: function() {
	// 			return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
	// 		}
	// 	});

	// 	$(element).popover('toggle');

	// 	$('#button-image').on('click', function() {
	// 		$('#modal-image').remove();

	// 		$.ajax({
	// 			url: 'index.php?route=sellerproduct/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
	// 			dataType: 'html',
	// 			beforeSend: function() {
	// 				$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
	// 				$('#button-image').prop('disabled', true);
	// 			},
	// 			complete: function() {
	// 				$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
	// 				$('#button-image').prop('disabled', false);
	// 			},
	// 			success: function(html) {
	// 				$('body').append('<div id="modal-image" class="modal">' + html + '</div>');

	// 				$('#modal-image').modal('show');
	// 			}
	// 		});

	// 		$(element).popover('hide');
	// 	});

	// 	$('#button-clear').on('click', function() {
	// 		$(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));

	// 		$(element).parent().find('input').attr('value', '');

	// 		$(element).popover('hide');
	// 	});
	// });
 </script>
</div></div>
<?php echo $footer; ?>
