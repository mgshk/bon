<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <!--<div class="pull-right"><a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-seller').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>-->
      <h1><?php echo $heading_title; ?></h1>
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
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
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
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-seller_verified"><?php echo $entry_seller_verified; ?></label>
                <select name="filter_seller_verified" id="input-seller_verified" class="form-control">
                  <option value="*"></option>
                  
                  <?php if ($filter_seller_verified) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                  <?php } ?>
                  
                  <?php if (($filter_seller_verified !== null) && !$filter_seller_verified) { ?>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                    <option value="0"><?php echo $text_no; ?></option>
                  <?php } ?>
                
                </select>
              </div>
            </div>
            <div class="col-sm-3">
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
            <div hidden class="col-sm-3">
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
              <div hidden class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="filter_email" value="<?php echo $filter_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
              <div hidden class="form-group">
                <label class="control-label" for="input-ip"><?php echo $entry_ip; ?></label>
                <input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" placeholder="<?php echo $entry_ip; ?>" id="input-ip" class="form-control" />
              </div>
              <div hidden class="form-group">
                <label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>
          </div>
        </div>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-seller">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center colHeader"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left colHeader"><?php if ($sort == 'c.nickname') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                  <!--<td class="text-left colHeader"><?php if ($sort == 'c.email') { ?>
                    <a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
                    <?php } ?></td>
                  <td class="text-left colHeader"><?php if ($sort == 'seller_group') { ?>
                    <a href="<?php echo $sort_seller_group; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_seller_group; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_seller_group; ?>"><?php echo $column_seller_group; ?></a>
                    <?php } ?></td>
                    <td class="text-left"><?php if ($sort == 'seller_product') { ?>
                    <a href="<?php echo $sort_seller_product; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_seller_product; ?>"><?php echo $column_quantity; ?></a>
                    <?php } ?></td>
                  <td class="text-left colHeader"><?php if ($sort == 'c.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-left colHeader"><?php if ($sort == 'c.ip') { ?>
                    <a href="<?php echo $sort_ip; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_ip; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_ip; ?>"><?php echo $column_ip; ?></a>
                    <?php } ?></td>
                  -->
                  <td class="text-left colHeader"><?php if ($sort == 'c.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                    <?php } ?></td>
                  <td class="text-right colHeader"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($sellers) { ?>
                <?php foreach ($sellers as $seller) { ?>
                <tr>
                  <td class="text-center colDetail"><?php if (in_array($seller['seller_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $seller['seller_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $seller['seller_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left colDetail"><?php echo $seller['name']; ?></td>
                  <!--<td class="text-left colDetail"><?php echo $seller['email']; ?></td>
                  <td class="text-left colDetail"><?php echo $seller['seller_group']; ?></td>
                  <td class="text-left colDetail"><?php echo $seller['seller_product']; ?></td>
                  <td class="text-left colDetail"><?php echo $seller['seller_approved_text']; ?></td>
                  <td class="text-left colDetail"><?php echo $seller['ip']; ?></td>
                  -->
                  <td class="text-left colDetail"><?php echo $seller['date_added']; ?></td>
                  <td class="text-right colDetail">
                    <?php if ($seller['seller_changegroup'] && $seller['seller_changegroup_id']!=$seller['seller_group_id']) { ; ?>
                      <a href="<?php echo $seller['upgrade_sellergroup']; ?>" data-toggle="tooltip" title="" class="btn btn-success"><?php echo $button_upgrade_sellergroup; ?><?php echo $seller['seller_changegroup']; ?></a>
                    <?php } ?>
                    <?php if (!$seller['seller_approved']) { ; ?>
                      <a href="<?php echo $seller['approve']; ?>" data-toggle="tooltip" title="<?php echo $button_approve; ?>" class="btn btn-success"><i class="fa fa-thumbs-o-up"></i></a>
                    <?php } else { ?>
                      <a style="cursor: pointer;" data-toggle="modal" data-target="#store_reject_reson_<?php echo $seller['seller_id']; ?>" data-toggle="tooltip" title="<?php echo $button_disapprove; ?>" class="btn btn-danger"><i class="fa fa-thumbs-o-down"></i></a>
                    <?php } ?>
                    <?php if (!$seller['seller_verified']) { ; ?>
                      <a href="<?php echo $seller['verify']; ?>" class="btn btn-success"><i class="fa fa-check"></i></a>
                    <?php } else { ?>
                      <a href="<?php echo $seller['disverify']; ?>" class="btn btn-danger"><i class="fa fa-times"></i></a>
                    <?php } ?>
                    <div class="btn-group" data-toggle="tooltip" title="<?php echo $text_login; ?>">
                      <button type="button" data-toggle="dropdown" class="btn btn-info dropdown-toggle"><i class="fa fa-lock"></i></button>
                      <ul class="dropdown-menu pull-right">
                        <li><a href="index.php?route=seller/seller/login&token=<?php echo $token; ?>&seller_id=<?php echo $seller['seller_id']; ?>&store_id=0" target="_blank"><?php echo $text_default; ?></a></li>
                        <?php foreach ($stores as $store) { ?>
                          <li><a href="index.php?route=seller/seller/login&token=<?php echo $token; ?>&seller_id=<?php echo $seller['seller_id']; ?>&store_id=<?php echo $store['store_id']; ?>" target="_blank"><?php echo $store['name']; ?></a></li>
                        <?php } ?>
                      </ul>
                    </div>
                    <a href="<?php echo $seller['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i>
                      <?php if ($seller['seller_category']) {
                        echo $text_seller_category_approve;
                      } ?>
                    </a>
                    <a style="cursor: pointer;" data-toggle="modal" data-target="#send_admin_message_<?php echo $seller['seller_id']; ?>" data-toggle="tooltip" title="<?php echo $button_sendadmmsg; ?>" class="btn btn-primary"><i class="fa fa-commenting-o"></i></a>
                  </td>
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
  <?php if ($sellers) { ?>
    <?php foreach ($sellers as $seller) { ?>
      <div class="modal fade" id="store_reject_reson_<?php echo $seller['seller_id']; ?>" role="dialog">
        <div class="modal-dialog">
          <!-- Modal content-->
          <div class="modal-content loc-pop">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title loc-share-title">Please Enter reason to Reject</h4>
            </div>
            <div class="modal-body timing-share-top">
              <form action="" method="post" enctype="multipart/form-data" id="store_reject" class="form-horizontal">
                <input type="hidden" id="disapprove_reson_<?php echo $seller['seller_id']; ?>" value="<?php echo $seller['disapprove']; ?>">
                <textarea class="form-control store_reject_res" name="store_reject_res" id="store_reject_res_<?php echo $seller['seller_id']; ?>" ></textarea>
                <span id="error_reason"></span>
                <a id="<?php echo $seller['seller_id']; ?>" data-toggle="tooltip" title="<?php echo $button_disapprove; ?>" class="btn btn-danger button_rej"><i class="fa fa-thumbs-o-down"></i></a>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="send_admin_message_<?php echo $seller['seller_id']; ?>" role="dialog">
        <div class="modal-dialog">
          <!-- Modal content-->
          <div class="modal-content loc-pop">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title loc-share-title">New message to store</h4>
            </div>
            <div class="modal-body timing-share-top">
              <form action="" method="post" enctype="multipart/form-data" id="new_admin_msg" class="form-horizontal">
                <input type="hidden" id="send_adm_msg_<?php echo $seller['seller_id']; ?>" value="<?php echo $seller['sendAdminMsg']; ?>">
                <textarea class="form-control" name="new_admin_message" id="new_admin_message_<?php echo $seller['seller_id']; ?>" ></textarea>
                <span id="newAdminMsg"></span>
                <a id="<?php echo $seller['seller_id']; ?>" data-toggle="tooltip" title="<?php echo $button_sendadmmsg; ?>" class="btn btn-primary button_send"><i class="fa fa-paper-plane-o"></i></a>
              </form>
            </div>
          </div>
        </div>
      </div>
    <?php } ?>
  <?php } ?>
 <script>
$('.button_rej').on('click', function() {
	var seller_id = $(this).attr('id');
	var reason = $('#store_reject_res_'+seller_id).val();
	var disapprove = $('#disapprove_reson_'+seller_id).val();
	if(reason == ''){
		//$('#error_reason').val("Please enter reason to reject");
		alert("Please enter reason to reject");
	} else {
		//alert(disapprove+'&reason='+reason);
		window.location.href=disapprove+'&reason='+reason;
	}	
});
$('.button_send').on('click', function() {
	var seller_id = $(this).attr('id');
	var msg = $('#new_admin_message_'+seller_id).val();
	var sendAdmMsg = $('#send_adm_msg_'+seller_id).val();
	if(msg == ''){
		//$('#error_reason').val("Please enter reason to reject");
		alert("Please enter reason to reject");
	} else {
		//alert(disapprove+'&reason='+reason);
		window.location.href=sendAdmMsg+'&reason='+msg;
	}	
});
</script>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=seller/seller&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').val();

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

	var filter_seller_verified = $('select[name=\'filter_seller_verified\']').val();

	if (filter_seller_verified != '*') {
		url += '&filter_seller_verified=' + encodeURIComponent(filter_seller_verified);
	}

	var filter_ip = $('input[name=\'filter_ip\']').val();

	if (filter_ip) {
		url += '&filter_ip=' + encodeURIComponent(filter_ip);
	}

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
