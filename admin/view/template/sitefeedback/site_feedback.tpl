<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <!--<div class="pull-right"><a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-seller').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>-->
      <h1><?php echo $heading_title_feed; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title_feed; ?></h3>
      </div>
      <!--<div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="filter_email" value="<?php echo $filter_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-seller-group"><?php echo $entry_seller_group; ?></label>
                <select name="filter_seller_group_id" id="input-seller-group" class="form-control">
                  <option value="*"></option>
                  <?php foreach ($seller_groups as $seller_group) { ?>
                  <?php if ($seller_group['seller_group_id'] == $filter_seller_group_id) { ?>
                  <option value="<?php echo $seller_group['seller_group_id']; ?>" selected="selected"><?php echo $seller_group['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $seller_group['seller_group_id']; ?>"><?php echo $seller_group['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>

              <div class="form-group">
                <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                <select name="filter_status" id="input-status" class="form-control">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (($filter_status !== null) && !$filter_status) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-seller_approved"><?php echo $entry_seller_approved; ?></label>
                <select name="filter_seller_approved" id="input-seller_approved" class="form-control">
                  <option value="*"></option>
                  <?php if ($filter_seller_approved) { ?>
                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_yes; ?></option>
                  <?php } ?>
                  <?php if (($filter_seller_approved !== null) && !$filter_seller_approved) { ?>
                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_no; ?></option>
                  <?php } ?>
                </select>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-ip"><?php echo $entry_ip; ?></label>
                <input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" placeholder="<?php echo $entry_ip; ?>" id="input-ip" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div></div>
			 <div class="col-sm-3">
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
			</div>
          </div>
        </div>-->
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-seller">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left">
                    <?php echo $column_mobile; ?>
				  </td>
                  <td class="text-left">
                    <?php echo $column_email; ?>
				  </td>  
				  <td class="text-left">
				  <?php echo $column_feedback; ?>
				  </td>
                  <td class="text-left">
				    <?php if ($sort == 'date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                    <?php } ?>
				  </td>
				  <?php //if($request=='submitted'){ ?>
                  <!--<td class="text-right"><?php echo $column_action; ?></td>-->
		  <?php //} ?>
                </tr>
              </thead>
              <tbody>
                <?php if ($sitefeedback) { ?>
                <?php foreach ($sitefeedback as $site_feed) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($site_feed['feedback_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $site_feed['feedback_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $site_feed['feedback_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-center"><?php echo $site_feed['mobile_num']; ?></td>
				  <td class="text-left"><?php echo $site_feed['email']; ?></td> 
				  <td class="text-left"><?php echo $site_feed['feedback']; ?></td> 
                  <td class="text-left"><?php echo $site_feed['date']; ?></td>
		  <?php //if($request=='submitted'){ ?>
                  <!--<td class="text-right">
                   
                    <a class="btn btn-primary" data-toggle="modal" data-target="#myModalfeed_<?php echo $site_feed['feedback_id']; ?>" ><i class="fa fa-eye" aria-hidden="true"></i>
</a>
                    </td>-->
		    <?php //} ?>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
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
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=selleradvertise/selleradvertise&token=<?php echo $token; ?>';

	/*var filter_name = $('input[name=\'filter_name\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_email = $('input[name=\'filter_email\']').val();

	if (filter_email) {
		url += '&filter_email=' + encodeURIComponent(filter_email);
	}

	var filter_seller_group_id = $('select[name=\'filter_seller_group_id\']').val();

	if (filter_seller_group_id != '*') {
		url += '&filter_seller_group_id=' + encodeURIComponent(filter_seller_group_id);
	}

	var filter_status = $('select[name=\'filter_status\']').val();

	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}

	var filter_seller_approved = $('select[name=\'filter_seller_approved\']').val();

	if (filter_seller_approved != '*') {
		url += '&filter_seller_approved=' + encodeURIComponent(filter_seller_approved);
	}

	var filter_ip = $('input[name=\'filter_ip\']').val();

	if (filter_ip) {
		url += '&filter_ip=' + encodeURIComponent(filter_ip);
	}*/

	var filter_date_added = $('input[name=\'filter_date_added\']').val();

	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}

	location = url;
});
//--></script>
  <script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=seller/seller/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['seller_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_name\']').val(item['label']);
	}
});

$('input[name=\'filter_email\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=seller/seller/autocomplete&token=<?php echo $token; ?>&filter_email=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['email'],
						value: item['seller_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_email\']').val(item['label']);
	}
});
//--></script>
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script></div>
<?php echo $footer; ?>
 <?php if ($selleradvertise) { ?>
 <?php foreach ($selleradvertise as $seller_ad) { ?>
<div class="modal fade" id="myModalad_<?php echo $seller_ad['advertise_id']; ?>" role="dialog">
 <div class="modal-dialog">
	<div class="modal-content loc-pop">
	   <div class="modal-header">
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
		  <h4 class="modal-title loc-share-title">Advertise Details</h4>
	   </div>
	   <div class="modal-body loc-share-top">
	   <h3><?php echo $seller_ad['offer_title']; ?></h3>
		  <?php if ($seller_ad['offer_image_tumb']) { ?>
		       <img src="<?php echo $seller_ad['offer_image_tumb']; ?>" alt="<?php echo $seller_ad['offer_title']; ?>" class="img-thumbnail img-responsive" />
		       <?php } else { ?>
		       <span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
		       <?php } ?>
		      <p><?php echo $seller_ad['offer_desc']; ?></p>
		      <p><?php echo $seller_ad['offer_url']; ?></p>
		      <form id="remarks_con" method="post" class="form-horizontal">		     
			   <input type="hidden" name="advertise_id" value="<?php echo $seller_ad['advertise_id']; ?>">
				<div class="form-group">
				 <label for="remarks">Reason:</label>
					<textarea name="remarks" id="remarks" style="width: 100%;"></textarea>
					<span id="error_remark" style="color: red;"></span>
				</div>
			   </form>
	   </div>
	   
	   <div class="modal-footer">
		<a href="<?php echo $seller_ad['approve']; ?>" data-toggle="tooltip" title="<?php echo $button_approve; ?>" class="btn btn-success"><i class="fa fa-thumbs-o-up"></i></a>
                   
		<a id="remarks_st" data-toggle="tooltip" title="<?php echo $button_disapprove; ?>" class="btn btn-danger"><i class="fa fa-thumbs-o-down"></i></a>
	 </div>
	</div>
	
 </div>
</div>
<?php } ?>
<?php } ?>
<script>
$('#remarks_st').on('click', function() {
	 $.ajax({
		url: 'index.php?route=selleradvertise/selleradvertise/disapprove&token=<?php echo $token; ?>&filter_ad_status=submitted',
		type: 'post',
		dataType: 'json',
		data: $("#remarks_con").serialize(),
		success: function(json) {
			if (json['success']) {
				window.location="index.php?route=selleradvertise/selleradvertise&token=<?php echo $token; ?>&filter_ad_status=submitted";
			}
			if(json['error_remarks']) {
				$('#error_remark').html('<i class="fa fa-times" aria-hidden="true"></i> ' + json['error_remarks']);
			}
		}
	 });
	 });
</script>