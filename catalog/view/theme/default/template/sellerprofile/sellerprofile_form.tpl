<?php echo $header; ?>
<div class="container-fluid mainn-topp-ress">
   <!--<ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
      </ul>-->
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
      <div id="content" class="<?php echo $class; ?> seller--prof-pg">
         <?php echo $content_top; ?>
         <div class="container-fluid main--side--red">
            <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
               <?php echo $error_warning; ?>
               <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php } ?>
            <?php if ($error_warning_product_limit) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
               <?php echo $error_warning_product_limit; ?>
               <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php } ?>
            <div class="panel panel-default">
               <!--<div class="panel-heading">
                  <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_seller_profile; ?></h3>
                  </div>-->
               <div class="panel-body">
                  <ul class="nav nav-tabs fixme" style="z-index:123; background: #cef0f5 none repeat scroll 0 0;">
                     <?php if ($is_seller) { ?>		     
                     <!--<li class="<?php //if(isset($_GET['tab_section']) != 'store'){ echo 'active'; }?>">
                        <a href="#tab-dashboard" data-toggle="tab">
                        <?php echo $tab_dashboard; ?>
                        </a>
                        </li>-->
                     <li class="<?php if($_GET['tab_section'] == 'profile'){ echo 'active'; }?>">
                        <a href="#tab-profile_details" data-toggle="tab">
                        <?php //echo $tab_profile_details; ?>
                        My Profile
                        </a>
                     </li>
                     <?php if($login_type == 'seller') { ?>
                     <li class="<?php if($_GET['tab_section'] == 'store_detail'){ echo 'active'; }?>">
                        <a href="#tab-more_details" data-toggle="tab">
                        <?php //echo $tab_more_details; ?>
                        Store/Entity detail
                        </a>
                     </li>
                     <li class="<?php if($_GET['tab_section'] == 'product'){ echo 'active'; }?>">
                        <a class="sellerproduct" href="#tab-sellerproduct" data-toggle="tab">
                        <?php //echo $tab_sellerproduct; ?>
                        Products
                        </a>
                     </li>
                     <li class="<?php if($_GET['tab_section'] == 'store'){ echo 'active'; }?>">
                        <a class="tab_store_ad" href="#tab_store_ad" data-toggle="tab">
                        Advertisements
                        </a>
                     </li>
                     <li class="<?php if($_GET['tab_section'] == 'qr_code'){ echo 'active'; }?>">
                        <a class="tab_qr_code" href="#tab_qr_code" data-toggle="tab">
                        QR-code
                        </a>
                     </li>
                     <li class="<?php if($_GET['tab_section'] == 'order'){ echo 'active'; }?>">
                        <a class="tab_review" href="<?php echo $order_edit; ?>">
                        Orders
                        </a>
                     </li>
                     <li class="<?php if($_GET['tab_section'] == 'review'){ echo 'active'; }?>">
                        <a class="tab_review" target="_self" href="index.php?route=sellerreview/sellerreview">
                        Reviews
                        </a>
                     </li>
                     <?php } ?>
                     <?php if($login_type == 'buyer') { ?>
                     <li class="<?php if($_GET['tab_section'] == 'order_history'){ echo 'active'; }?>">
                        <a class="tab_order_history" target="_self" href="index.php?route=account/order">
                        My Orders
                        </a>
                     </li>
                     <li class="<?php if($_GET['tab_section'] == 'my_wallet'){ echo 'active'; }?> wallet">
                        <a class="wallet" href="#tab_my_wallet" data-toggle="tab">
                        My Wallet
                        </a>
                     </li>
                     <li class="<?php if($_GET['tab_section'] == 'expense_report'){ echo 'active'; }?> expense">
                        <a class="expense" href="#tab_expense_report" data-toggle="tab">
                        Expense Report
                        </a>
                     </li>
                     <?php } ?>
                     <?php } else { ?>
					 <li class="<?php if($_GET['tab_section'] == 'profile'){ echo 'active'; }?>">
                        <a href="#tab-profile_details" data-toggle="tab">
                        <?php //echo $tab_profile_details; ?>
                        My Profile
                        </a>
                     </li>
					 <?php if($login_type == 'seller') { ?>
                     <li class="<?php if($_GET['tab_section'] == 'store_detail'){ echo 'active'; }?>">
                        <a href="#tab-more_details" data-toggle="tab">
                        <?php //echo $tab_more_details; ?>
                        Store/Entity detail
                        </a>
                     </li>
					 <?php } ?>
					 <?php if($login_type == 'buyer') { ?>
					 <li class="<?php if($_GET['tab_section'] == 'order_history'){ echo 'active'; }?>">
                        <a class="tab_order_history" target="_self" href="index.php?route=account/order">
                        My Orders
                        </a>
                     </li>
                     <li class="<?php if($_GET['tab_section'] == 'my_wallet'){ echo 'active'; }?> wallet">
                        <a class="wallet" href="#tab_my_wallet" data-toggle="tab">
                        My Wallet
                        </a>
                     </li>
                     <li class="<?php if($_GET['tab_section'] == 'expense_report'){ echo 'active'; }?> expense">
                        <a class="expense" href="#tab_expense_report" data-toggle="tab">
                        Expense Report
                        </a>
                     </li>
					 <?php } ?>
                     <?php } ?>
                     <!--<li>
                        <a href="#tab-badge" data-toggle="tab">
                        <?php echo $tab_badge; ?>
                        </a>
                        </li>
                        <li>
                        <a class="sellerproduct" href="#tab-sellerproduct" data-toggle="tab">
                        <?php echo $tab_sellerproduct; ?>
                        </a>
                        </li>
                        <li>
                        <a href="#tab-bankaccount" data-toggle="tab">
                        <?php echo $tab_bankaccount; ?>
                        </a>
                        </li>                     
                        <li>
                        <a href="#tab-transaction" data-toggle="tab">
                        <?php echo $tab_transaction; ?>
                        </a>
                        </li>
                        <li>
                        <a href="#tab-history" data-toggle="tab">
                        <?php echo $tab_history; ?>
                        </a>
                        </li>
                        <li <?php if (!$is_seller) { echo 'class="active"'; } ?>>
                        <a href="#tab-request_membership" data-toggle="tab">
                        <?php echo $tab_request_membership; ?>
                        </a>
                        </li>-->
                  </ul>
                  <div class="tab-content">
                     <?php if ($is_seller) { ?>
                     <!--<div class="tab-pane" id="tab-dashboard">
                        <div class="row">
                           <div class="col-sm-12">
                              <div class="well">				  
                                 <a href="<?php echo $order_edit; ?>" data-toggle="tooltip" title="" class="btn btn-primary"><?php echo $button_edit_order; ?></a>
                              </div>
                              <div class="tab-pane" id="tab-seller">
                                 <div class="col-md-6">
                                    <blockquote>
                                       <div class="panel-heading">
                                          <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_seller_detail; ?></h3>
                                       </div>
                                       <div class="table-responsive">
                                          <table class="table table-condensed">
                                             <tbody>
                                                <tr>
                                                   <td>
                                                      <button data-toggle="tooltip" title="<?php echo $entry_name; ?>" class="btn btn-info btn-xs"><i class="fa fa-user fa-fw"></i></button>
                                                   </td>
                                                   <td>
                                                      <?php echo $firstname.' '.$lastname; ?>
                                                      </a>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td>
                                                      <button data-toggle="tooltip" title="<?php echo $entry_seller_group; ?>" class="btn btn-info btn-xs"><i class="fa fa-users fa-fw"></i></button>
                                                   </td>
                                                   <td>
                                                      <?php echo $seller_group; ?>
                                                      </a>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td>
                                                      <button data-toggle="tooltip" title="<?php echo $entry_date_created; ?>" class="btn btn-info btn-xs"><i class="fa fa-calendar fa-fw"></i></button>
                                                   </td>
                                                   <td>
                                                      <?php echo $date ; ?>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td>
                                                      <button data-toggle="tooltip" title="<?php echo $entry_date_end; ?>" class="btn btn-info btn-xs"><i class="fa fa-calendar fa-fw"></i></button>
                                                   </td>
                                                   <td>
                                                      <?php echo $date_end; ?>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td>
                                                      <button data-toggle="tooltip" title="<?php echo $entry_email; ?>" class="btn btn-info btn-xs"><i class="fa fa-envelope-o fa-fw"></i></button>
                                                   </td>
                                                   <td>
                                                      <?php echo $email; ?>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td>
                                                      <button data-toggle="tooltip" title="<?php echo $entry_telephone; ?>" class="btn btn-info btn-xs"><i class="fa fa-phone fa-fw"></i></button>
                                                   </td>
                                                   <td>
                                                      <?php echo $telephone; ?>
                                                   </td>
                                                </tr>
                                             </tbody>
                                          </table>
                                       </div>
                                    </blockquote>
                                 </div>
                                 <div class="col-md-6">
                                    <blockquote>
                                       <div class="panel-heading">
                                          <h3 class="panel-title"><i class="fa fa-users"></i> <?php echo $text_seller_group_detail; ?></h3>
                                       </div>
                                       <div class="table-responsive">
                                          <table class="table table-condensed">
                                             <tbody>
                                                <tr>
                                                   <td>
                                                      <button data-toggle="tooltip" title="<?php echo $entry_seller_group_commission; ?>" class="btn btn-info btn-xs"><i class="fa fa-sitemap fa-fw"></i></button>
                                                   </td>
                                                   <td>
                                                      <?php echo $commission; ?>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td>
                                                      <button data-toggle="tooltip" title="<?php echo $entry_seller_group_subscription_price; ?>" class="btn btn-info btn-xs"><i class="fa fa-usd fa-fw"></i></button>
                                                   </td>
                                                   <td>
                                                      <?php echo $seller_group_subscription_price; ?>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td>
                                                      <button data-toggle="tooltip" title="<?php echo $entry_seller_product_total; ?>" class="btn btn-info btn-xs"><i class="fa fa-battery-quarter fa-fw"></i></button>
                                                   </td>
                                                   <td>
                                                      <?php echo $seller_product_total; ?>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td>
                                                      <button data-toggle="tooltip" title="<?php echo $entry_seller_group_limit; ?>" class="btn btn-info btn-xs"><i class="fa fa-battery-full fa-fw"></i></button>
                                                   </td>
                                                   <td>
                                                      <?php echo $seller_group_limit; ?>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td>
                                                      <button data-toggle="tooltip" title="<?php echo $entry_seller_product_left; ?>" class="btn btn-info btn-xs"><i class="fa fa-exclamation-triangle fa-fw"></i></button>
                                                   </td>
                                                   <td>
                                                      <div class="progress">
                                                         <div class="progress-bar active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:<?php echo ( $seller_group_limit ? (($seller_product_total / $seller_group_limit)*100) : 100) ;?>%">
                                                            <?php echo ($seller_group_limit - $seller_product_total); ?>
                                                         </div>
                                                      </div>
                                                   </td>
                                                </tr>
                                             </tbody>
                                          </table>
                                       </div>
                                    </blockquote>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-sm-12">
                              <div class="col-md-6"><?php //echo $map; ?></div>
                              <div class="col-md-6"><?php //echo $chart; ?></div>
                           </div>
                        </div>
                        </div>-->
                     <div class="tab-pane <?php if($_GET['tab_section'] == 'profile'){ echo 'active'; }?>" id="tab-profile_details">
                        <div class="col-md-12">
                           <blockquote>
                              <a href="<?php echo $profile_edit; ?>" data-toggle="tooltip" title="" class="prf--sell">Edit</a>
                              <div class="panel-heading">
                                 <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_your_details; ?></h3>
                              </div>
                              <div class="table-responsive">
                                 <table class="table table-condensed">
                                    <tbody>
                                       <tr>
                                          <td>
                                             <label for="input-firstname"><?php echo $entry_firstname; ?> </label>
                                          </td>
                                          <td>
                                             <?php echo $customer_info['firstname']; ?>
                                             </a>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <label for="input-lastname"><?php echo $entry_lastname; ?> </label>
                                          </td>
                                          <td>
                                             <?php echo $customer_info['lastname']; ?>
                                             </a>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <label for="input-email"><?php echo $entry_email; ?> </label>
                                          </td>
                                          <td>
                                             <?php echo $customer_info['email'] ; ?>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <label for="input-telephone"><?php echo $entry_telephone; ?> </label>
                                          </td>
                                          <td>
                                             <?php echo $customer_info['telephone']; ?>
                                          </td>
                                       </tr>
                                       <!-- <tr>
                                          <td>
                                             <label for="input-fax"><?php //echo $entry_fax; ?> </label>
                                          </td>
                                          <td>
                                             <?php //echo $customer_info['fax']; ?>
                                          </td>
                                          </tr> -->
                                    </tbody>
                                 </table>
                              </div>
                              <a href="<?php echo $password_edit; ?>" data-toggle="tooltip" title="" class="prf--sell">Change password</a><br><br>			       
                              <div class="panel-heading">
                                 <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_address_book; ?></h3>
                              </div>
                              <?php if ($addresses) { ?>
                              <div class="table-responsive">
                                 <table class="table table-bordered table-hover">
                                    <?php foreach ($addresses as $result) { ?>
                                    <tr>
                                       <td class="text-left"><?php echo $result['address']; ?></td>
                                       <td class="text-right"><a href="<?php echo $result['update']; ?>" class="prf--sell"><?php echo $button_edit; ?></a></td>
                                    </tr>
                                    <?php } ?>
                                 </table>
                              </div>
                              <?php } else { ?>
                              <p><?php echo $text_empty; ?></p>
                              <?php } ?>
                           </blockquote>
                        </div>
                     </div>
                     <div class="tab-pane <?php if($_GET['tab_section'] == 'store_detail'){ echo 'active'; }?>" id="tab-more_details">
                        <div class="panel-group" id="accordion">
                           <div class="panel panel-default">
                              <div class="panel-heading">
                                 <ul class="--bon-res-scrooll">
                                 <li>- Please enter accurate information.</li>
                                 <li>- Store/Entity name, location, at least one main category and email ID are needed to get the approval.</li>
                                 <li>- Get buyers attention more by filling other fields to get your store/entity verified.</li>
                                 <li>- Store/Entity will be enforced for re-approval if you change it's name and/or add/modify it's banner.</li>
                                 <ul>
                              </div>
                              <div id="collapse1" class="panel-collapse collapse in">
                                 <div class="panel-body">
                                    <?php if($seller_approved != 1) { ?>
                                    <div class="alert alert-danger"><i class="fa fa-times-circle"></i> Your store approval is pending.</div>
                                    <?php } else { ?>
                                    <div class="alert alert-success"><i class="fa fa-check-circle"></i> Your store is approved.</div>
                                    <?php } ?>
                                    <?php if($seller_verified != 1) { ?>
                                    <div class="alert alert-danger"><i class="fa fa-times-circle"></i> Your store verification is pending.</div>
                                    <?php } else { ?>
                                    <div class="alert alert-success"><i class="fa fa-check-circle"></i> Your store is verified.</div>
                                    <?php } ?>									
                                    <div class="str--ftr-btn col-sm-12">
                                       <div class="row" style="float: right;">
                                          <?php if(strtotime($feature_store_end) > strtotime('now')) { ?>
                                          <button disabled type="button" class="btn btn-primary">Featured Store/Entity</button>
                                          <?php } else { ?>
                                          <button type="button" style="cursor:pointer;" id="store_featured_dt" data-toggle="modal" data-target="#store_featured" class="btn btn-primary">Featured Store/Entity</button>
                                          <?php } ?>
                                       </div>
                                    </div>
                                    <form action="" method="post" enctype="multipart/form-data" id="form-profile" class="form-horizontal main--mb--bt">
                                       <!--<button type="button" id="button-profile-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary pull-right">
                                          <?php echo $button_save; ?>
                                          </button>-->
                                       <div class="form-group required">
                                          <label class="col-sm-2 control-label" for="input-nickname">
                                          <?php echo $entry_nickname; ?>
                                          </label>
                                          <div class="col-sm-8">
                                             <input type="text" maxlength="50" name="nickname" placeholder="<?php echo $entry_nickname; ?>" value="<?php echo $nickname; ?>" id="input-nickname" class="form-control" required/>
                                             <span class="input-group-btn">
                                             </span>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <div class="buttons">
                                             <label class="col-sm-2 control-label">
                                             <?php echo $entry_seller_banner; ?>
                                             </label>
                                             <div class="col-sm-10">
                                                <a href="" id="thumb-banner" data-toggle="banner" class="img-thumbnail"><img src="<?php echo $thumb_banner; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                                <input type="hidden" name="banner" value="<?php echo $banner; ?>" id="input-banner" />
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <label class="col-sm-2 control-label">
                                          <?php echo $entry_description; ?>
                                          </label>
                                          <div class="col-sm-10">
                                             <textarea style="white-space: normal;" name="seller_description" rows="4" placeholder="<?php echo $entry_description; ?>" id="input-description" class="form-control">
                                             <?php echo $seller_description; ?>
                                             </textarea>
                                          </div>
                                       </div>
                                       <div class="form-group required">
                                          <label class="col-sm-2 control-label">Enter map location</label>
                                          <div class="col-sm-10">
                                             <div id="map-search" class="map-sample">
                                                <img class="cursor img-responsive" id="search-btn_st" data-toggle="modal" data-target="#map_mod" src="image/gmap.jpg"/>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <label class="col-sm-2 control-label" for="input-owner-name">
                                          <?php echo $entry_owner_name; ?>
                                          </label>
                                          <div class="col-sm-8">
                                             <input type="text" name="owner_name" maxlength="50" placeholder="<?php echo $entry_owner_name; ?>" value="<?php echo $owner_name; ?>" id="input-owner-name" class="form-control" required/>
                                             <span class="input-group-btn">
                                             </span>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <div class="buttons">
                                             <label class="col-sm-2 control-label">
                                             <?php echo $entry_seller_avatar; ?>
                                             </label>
                                             <div class="col-sm-10">
                                                <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb_image; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                                <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <div class="buttons">
                                             <label class="col-sm-2 control-label">
                                             Additional Store/Entity images
                                             </label>
                                             <div class="col-sm-10 additional_image sel--sec--ordd">
                                                <a class="cursor sel--sec--ord" data-toggle="modal" data-target="#store_images">Edit</a>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group required">
                                          <div class="buttons">
                                             <label class="col-sm-2 control-label">
                                             Store/Entity catogeries
                                             </label>
                                             <div class="col-sm-10 additional_image sel--sec--ordd">
                                                <a class="cursor sel--sec--ord" data-toggle="modal" data-target="#store_cat">Edit</a>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <div class="buttons">
                                             <label class="col-sm-2 control-label">
                                             Hours of operation
                                             </label>
                                             <div class="col-sm-10 additional_image sel--sec--ordd">
                                                <a class="cursor sel--sec--ord" data-toggle="modal" data-target="#store_timings">Edit</a>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group new--mtt">
                                          <div class="row">
                                             <label class="col-sm-2 control-label" for="input-ll-num">
                                             <?php echo $entry_store_ll_num; ?>
                                             </label>
                                             <?php $store_ll_num_row = 0; $store_ll_num = explode(",", $store_ll_num); ?>
                                             <?php foreach ($store_ll_num as $store_ll_nums) { $store_ll = explode("-", $store_ll_nums);
                                                $store_ll_0 = (isset($store_ll[0]) && $store_ll[0] != '') ? $store_ll[0] : ''; 
                                                $store_ll_1 = (isset($store_ll[1]) && $store_ll[1] != '') ? $store_ll[1] : ''; ?>
                                             <?php if($store_ll_num_row != 0) { ?>
                                             <div id="ad_ll<?php echo $store_ll_num_row; ?>" class="row addition-mobile">
                                                <div class="col-sm-2"></div>
                                                <?php } ?>
                                                <div class="col-sm-2">
                                                   <input type="text" name="store_ll_code[]" placeholder="<?php echo $entry_store_ll_code; ?>" value="<?php echo $store_ll_0; ?>" id="input-ll-code" maxlength="5" class="form-control mat--lt" required/>
                                                   <span class="input-group-btn">
                                                   </span>
                                                </div>
                                                <div class="col-sm-6">
                                                   <input type="text" name="store_ll_num[]" placeholder="<?php echo $entry_store_ll_num; ?>" value="<?php echo $store_ll_1; ?>" id="input-store-num" maxlength="10" class="form-control mat--lt" required/>
                                                   <span class="input-group-btn">
                                                   </span>
                                                </div>
                                                <?php if($store_ll_num_row == 0) { ?>
                                                <div class="col-sm-2">
                                                   <button type="button" onclick="addStoreLandLine();" class="--plus-btn">+</button>
                                                </div>
                                             </div>
                                             <?php } else { ?>
                                             <div class="col-sm-2"><span class="text-left"><button type="button" onclick="ad_ll<?php echo $store_ll_num_row; ?>.remove();" class="--minus-btn">-</button></span></div>
                                          </div>
                                          <?php } ?>
                                          <?php $store_ll_num_row++; } ?>
                                          <div id="str_ll"></div>
                                       </div>
                                       <div class="form-group new--mtt">
                                          <div class="row">
                                             <label class="col-sm-2 control-label" for="input-store-num">
                                             <?php echo $entry_store_mobile_num; ?>
                                             </label>
                                             <?php $store_mobile_num_row = 0; $store_mobile_num = explode(",", $store_mobile_num); ?>
                                             <?php foreach ($store_mobile_num as $store_mobile_nums) { ?>
                                             <?php if($store_mobile_num_row != 0) { ?>
                                             <div id="ad_mob<?php echo $store_mobile_num_row; ?>" class="row addition-mobile">
                                                <div class="col-sm-2"></div>
                                                <?php } ?>
                                                <div class="col-sm-8">
                                                   <input type="text" name="store_mobile_num[]" placeholder="<?php echo $entry_store_mobile_num; ?>" value="<?php echo $store_mobile_nums; ?>" id="input-store-num" class="form-control mat--lt" required/>
                                                   <span class="input-group-btn">
                                                   </span>
                                                   <?php if($store_mobile_num_row == 0) { ?>
                                                   <p class="special--email-txt mat--lt --bon-res-scrooll">(Above mobile no. will be used while sending posted advertisement detail, buyers order detail, BoN offers, etc.)</p>
                                                   <?php } ?>
                                                </div>
                                                <?php if($store_mobile_num_row == 0) { ?>
                                                <div class="col-sm-2">
                                                   <button type="button" onclick="addStoreMobile();" class="--plus-btn">+</button>
                                                </div>
                                             </div>
                                             <?php } else { ?>
                                             <div class="col-sm-2"><span class="text-left"><button type="button" onclick="ad_mob<?php echo $store_mobile_num_row; ?>.remove();" class="--minus-btn"> - </button></span></div>
                                          </div>
                                          <?php } ?>
                                          <?php $store_mobile_num_row++; } ?>
                                          <div id="str_mob"></div>
                                       </div>
                                       <div class="form-group required">
                                          <label class="col-sm-2 control-label" for="input-store-email">
                                          <?php echo $entry_store_email; ?>
                                          </label>
                                          <div class="col-sm-10">
                                             <input type="text" name="store_email" placeholder="<?php echo $entry_store_email; ?>" value="<?php echo $store_email; ?>" id="input-store-email" class="form-control" required/>
                                             <span class="input-group-btn">
                                             </span>
                                             <p class="special--email-txt --bon-res-scrooll">(Above email ID will be used while sending posted advertisement detail, buyers order detail, BoN offers, etc.)</p>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <label class="col-sm-2 control-label" for="input-tin">
                                          <?php echo $entry_tin; ?>
                                          </label>
                                          <div class="col-sm-10">
                                             <input maxlength="30" type="text" name="tin" placeholder="<?php echo $placeholder_tin; ?>" value="<?php echo $tin; ?>" id="input-tin" class="form-control" required/>
                                             <span class="input-group-btn">
                                             </span>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <label class="col-sm-2 control-label" for="input-pan">
                                          <?php echo $entry_pan; ?>
                                          </label>
                                          <div class="col-sm-10">
                                             <input maxlength="30" type="text" name="pan" placeholder="<?php echo $placeholder_pan; ?>" value="<?php echo $pan; ?>" id="input-pan" class="form-control" required/>
                                             <span class="input-group-btn">
                                             </span>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <div class="buttons">
                                             <label class="col-sm-2 control-label">
                                             Store/Entity portals
                                             </label>
                                             <div class="col-sm-10 additional_image sel--sec--ordd">
                                                <a class="cursor sel--sec--ord" data-toggle="modal" data-target="#store_portals">Edit</a>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <label class="col-sm-2 control-label" for="input-delivery_type">
                                          Delivery type
                                          </label>
                                          <div class="col-sm-10">						     
                                             <input type="radio" name="delivery_type" value="1" <?php if($delivery_type == 1){ echo "checked"; } ?>> Cash on home delivery<br>
                                             <input type="radio" name="delivery_type" value="2" <?php if($delivery_type == 2){ echo "checked"; } ?>> Cash on Store delivery<br>
                                             <input type="radio" name="delivery_type" value="3" <?php if($delivery_type == 3){ echo "checked"; } ?>> Both
                                          </div>
                                       </div>
                                       <?php if($referred_by != '') { ?>
                                       <div class="form-group">
                                          <label class="col-sm-2 control-label" for="input-referred-by">
                                          Referred by
                                          </label>
                                          <div class="col-sm-10"  style="padding-top: 7px;">	
                                             <?php if($referred_by != '---') {
                                                $refed_val = explode("-", $referred_by); ?>
                                             <span class="referred-by"><?php echo $refed_val[0]; ?></span>
					     <input type="hidden" name="referred_by" value="<?php echo $refed_val[0]; ?>" id="input-referred-by" class="form-control" />
                                             <?php } else { ?>
                                             <span class="referred-by"><?php echo $referred_by; ?></span>
                                             <?php } ?>                                             
                                          </div>
                                       </div>
                                       <?php } ?>
                                       <div class="form-group referrer-fom-build-shownn" style="display: none;">
										  <label class="col-sm-2 control-label" for="input-referred-by">
										  Referred by
										  </label>
										  <div class="col-sm-10" style="padding-top: 7px;">
											  <input id="input-referred-by-vall" class="form-control" name="referred_by" placeholder="Referred By" value="">
												 <!--<span class="referred-by" id="ref-val-display"><?php //echo $referred_by; ?></span>-->
												 <p>If you are a new referrer,<a class="cursor" data-toggle="modal" data-target="#store_referred"> click here</a></p>
										  </div>
										   </div>
										   <?php if($referred_by == '') { ?>
										   <div class="form-group referrer-fom-build">
										  <label class="col-sm-2 control-label" for="input-referred-by">
										  Referred by
										  </label>
										  <div class="col-sm-10" style="padding-top: 7px;">
											 <input type="text" id="input-referred-by-val" name="referred_by" placeholder="Referred By" value="<?php echo $referred_by; ?>" id="input-referred-by" class="form-control" />
											 <p>If you are a new referrer,<a class="cursor" data-toggle="modal" data-target="#store_referred"> click here</a></p>
										  </div>
										   </div>
										   <?php } ?>
                                       <div class="diff--seller">
                                          <?php if($daysleft > 0) { ?>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" for="input-referred-by">
                                             - Set as <span style="background: yellow;">featured</span> to top the list :
                                             </label>
                                             <div class="col-sm-9">						     
                                                <span class="referred-by"><?php echo $daysleft; ?> day(s) left</span>
                                             </div>
                                          </div>
                                          <?php } else { ?>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" for="input-referred-by">
                                             - Not set as <span style="background: yellow;">featured.</span>
                                             </label>
                                             <div class="col-sm-9">
                                             </div>
                                          </div>
                                          <?php } ?>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" for="input-referred-by">
                                             - Number of times buyers viewed your listing :
                                             </label>
                                             <div class="col-sm-9" style="padding-top: 7px">
                                                <div class="cnt--sell">
                                                   <?php if($seller_counter == '0') { ?>
                                                   <p class="referred-by"><span id="manage_counter">0</span></p>
                                                   <?php } else { ?>
                                                   <p class="referred-by"><span id="manage_counter"><?php echo $seller_counter; ?></span></p>
                                                   <a id="clear_counter" class="cursor">Clear</a>
                                                   <?php } ?>						     
                                                </div>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" for="input-referred-by">
                                             - Number of buyers added this to their favourites :
                                             </label>
                                             <div class="col-sm-9"  style="margin-top: 5px;">						     
                                                <span class="referred-by"><?php echo $favourites_customer_count; ?> Buyer(s)</span>
                                             </div>
                                          </div>
                                       </div>
				       <div class="form-group">
					   <label class="col-sm-12 control-label" for="agree_tt" style="font-weight: bold; text-align: left;"><input type="hidden" name="agree" value="not_agree" id="agree">
					   <input type="checkbox" name="agree_tt" class="agree_tt" value="agree" id="agree_tt"> I hereby declare that the detail furnished above are true and correct to the best of my knowledge. In case any of the information is found to be false or untrue or misleading or misrepresenting, I am aware that my detail will impact approval and verification process.</label>
					</div>
                                       <!--<div class="form-group">
                                          <label class="col-sm-3 control-label">Address</label>
                                          <div class="col-sm-5">
                                          	<input type="text" class="form-control" name="address" id="address_st" value="" />												
                                          </div>
                                          </div>-->	
                                       <input type="hidden" class="form-control" name="lat" id="latitude_st" value="<?php echo $lat; ?>" />
                                       <input type="hidden" class="form-control" name="lng" id="longitude_st" value="<?php echo $lng; ?>" />	
                                       <button type="button" id="button-profile-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary pull-right">
                                       <?php echo $button_save; ?>
                                       </button>
                                    </form>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane <?php if($_GET['tab_section'] == 'product'){ echo 'active'; }?>" id="tab-sellerproduct">
                        <div class="--bon-res-scrooll">
                           <p>Products you upload here are closely monitored by our experts. If found not permissable to public, store/entity might be banned from the listing after a warning.</p>
                           <br/>
                           <?php if($allow_products != 0) {$checked_products = "checked";} else {$checked_products = "";}
                              if($allow_cart != 0) {$checked_cart = "checked";} else {$checked_cart = "";} ?>
                           <p><input type="checkbox" class="allow-prod-cart" name="allow_products" <?php echo $checked_products; ?> id="allow_products" value="allow_products"> Allow products to visible to buyer in store/entity page.</p>
                           <p><span class="txt--itc">(Hide products tab incase if you do not need it or if you want to update it)</span></p>
                           <p><input type="checkbox" class="allow-prod-cart" name="allow_products" <?php echo $checked_cart; ?> id="allow_cart" value="allow_cart"> Allow buyers to thier cart to continue online shooping.</p>
                           <p><span class="txt--itc">(Hide 'Add to cart' button incase if you want buyers to only see your products)</span></p>
                           <br/>
                        </div>
                        <div id="sellerproduct">
                           <div id="pre_loaderr"><img class="img-responsive" src="image/pre-loader.gif"></div>
                        </div>
                        <br />
                     </div>
                     <div class="tab-pane <?php if($_GET['tab_section'] == 'store'){ echo 'active'; }?>" id="tab_store_ad">
                        <ul class="nav nav-tabs fixme-sec" style="z-index:123">
                           <li class="<?php if($_GET['inner_store'] == 'draft'){ echo 'active'; }?>"><a href="#draftt" data-txt="draft" class="draft" data-toggle="tab">Drafts (<span class="black_s" id="sellerdraftcount"><?php echo $draft_tt; ?></span>)</a></li>
                           <li class="<?php if($_GET['inner_store'] == 'submitted'){ echo 'active'; }?>"><a href="#submitted" data-txt="submitted" class="submitted" data-toggle="tab">Submitted (<span class="black_s" id="sellersubmittedcount"><?php echo $submitted_tt; ?></span>)</a></li>
                           <li class="<?php if($_GET['inner_store'] == 'approved'){ echo 'active'; }?>"><a href="#approved" data-txt="approved" class="approved" data-toggle="tab">Approved (<span class="black_s" id="sellerapprovedcount"><?php echo $approved_tt; ?></span>)</a></li>
                           <li class="<?php if($_GET['inner_store'] == 'live'){ echo 'active'; }?>"><a href="#live" data-txt="live" class="live" data-toggle="tab">Live (<span class="black_s" id="sellerlivecount"><?php echo $live_tt; ?></span>)</a></li>
                           <li class="<?php if($_GET['inner_store'] == 'yet_to_live'){ echo 'active'; }?>"><a href="#yet_to_live" data-txt="yet_to_live" class="yet_to_live" data-toggle="tab">Yet to go live (<span class="black_s" id="sellerpaidcount"><?php echo $paid_tt; ?></span>)</a></li>
                           <li class="<?php if($_GET['inner_store'] == 'rejected'){ echo 'active'; }?>"><a href="#rejected" data-txt="rejected" class="rejected" data-toggle="tab">Rejected (<span class="black_s" id="sellerrejectedcount"><?php echo $rejected_tt; ?></span>)</a></li>
                           <li class="<?php if($_GET['inner_store'] == 'archive'){ echo 'active'; }?>"><a href="#archive" data-txt="archive" class="archive" data-toggle="tab">Archive (<span class="black_s" id="sellerarchivecount"><?php echo $archive_tt; ?></span>)</a></li>
                           <li class="<?php if($_GET['inner_store'] == 'trash'){ echo 'active'; }?>"><a href="#trash" data-txt="trash" class="trash" data-toggle="tab">Trash (<span class="black_s" id="sellertrashcount"><?php echo $trash_tt; ?></span>)</a></li>
                        </ul>
                        <!-- Nav tabs content -->
                        <div class="tab-content">
                           <div id="draftt" class="tab-pane <?php if($_GET['inner_store'] == 'draft'){ echo 'active'; }?>">
                              <div id="sellerdraft">
                                 <!-- <div id="pre_loaderr"><img class="img-responsive" src="image/pre-loader.gif"></div> -->
                              </div>
                              <br />
                           </div>
                           <div id="submitted" class="tab-pane <?php if($_GET['inner_store'] == 'submitted'){ echo 'active'; }?>">
                              <div id="sellersubmitted">
                                 <div id="pre_loaderr"><img class="img-responsive" src="image/pre-loader.gif"></div>
                              </div>
                              <br />
                           </div>
                           <div id="approved" class="tab-pane <?php if($_GET['inner_store'] == 'approved'){ echo 'active'; }?>">
                              <div id="sellerapproved">
                                 <div id="pre_loaderr"><img class="img-responsive" src="image/pre-loader.gif"></div>
                              </div>
                              <br />
                           </div>
                           <div id="rejected" class="tab-pane <?php if($_GET['inner_store'] == 'rejected'){ echo 'active'; }?>">
                              <div id="sellerrejected">
                                 <div id="pre_loaderr"><img class="img-responsive" src="image/pre-loader.gif"></div>
                              </div>
                              <br />
                           </div>
                           <div id="yet_to_live" class="tab-pane <?php if($_GET['inner_store'] == 'yet_to_live'){ echo 'active'; }?>">
                              <div id="selleryet_to_live">
                                 <div id="pre_loaderr"><img class="img-responsive" src="image/pre-loader.gif"></div>
                              </div>
                              <br />
                           </div>
                           <div id="live" class="tab-pane <?php if($_GET['inner_store'] == 'live'){ echo 'active'; }?>">
                              <div id="sellerlive">
                                 <div id="pre_loaderr"><img class="img-responsive" src="image/pre-loader.gif"></div>
                              </div>
                              <br />
                           </div>
                           <div id="archive" class="tab-pane <?php if($_GET['inner_store'] == 'archive'){ echo 'active'; }?>">
                              <div id="sellerarchive">
                                 <div id="pre_loaderr"><img class="img-responsive" src="image/pre-loader.gif"></div>
                              </div>
                              <br />
                           </div>
                           <div id="trash" class="tab-pane <?php if($_GET['inner_store'] == 'trash'){ echo 'active'; }?>">
                              <div id="sellertrash">
                                 <div id="pre_loaderr"><img class="img-responsive" src="image/pre-loader.gif"></div>
                              </div>
                              <br />
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane <?php if($_GET['tab_section'] == 'qr_code'){ echo 'active'; }?>" id="tab_qr_code">
                        <div class="col-sm-12 --bon-res-scrooll">
                           <p>Please download any or both below images having QR code of your store/entity and have them for display to your buyers.
                           <p>By scanning buyers can
                           <p>
                           <p style="margin-left:20px;">- add yours as their favorites to get your AD's notification the moment you upload. It increases your sales BEYOND IMAGINATION.</p>
                           <p style="margin-left:20px;">- pay online for what they have purchased. GO CASHLESS.</p>
                        </div>
                        <div class="col-sm-12">
                           <div class="row">
                              <div class="col-sm-9 qr-tmp">
                                 <div class="_req-ic">
                                    <a style="cursor:pointer" data-id="main1" class="print_me"><i class="fa fa-print" aria-hidden="true"></i></a>
                                    <a href="index.php?route=sellerprofile/sellerprofile/download_qr&qr_id=<?php echo $seller_id; ?>_main1"><i class="fa fa-download" aria-hidden="true"></i></a>
                                 </div>
                                 <span id="print_me_qr_main1"><img src="<?php echo HTTPS_SERVER; ?>admin/view/image/qr_images/buyonear.in_<?php echo $seller_id; ?>_main1.png" alt="" title="" class="img-responsive"></span>
                              </div>
                              <div class="col-sm-3">
                                 <div class="_req-ic">
                                    <a style="cursor:pointer" data-id="main2" class="print_me"><i class="fa fa-print" aria-hidden="true"></i></a>
                                    <a href="index.php?route=sellerprofile/sellerprofile/download_qr&qr_id=<?php echo $seller_id; ?>_main2"><i class="fa fa-download" aria-hidden="true"></i></a>
                                 </div>
                                 <span id="print_me_qr_main2"><img src="<?php echo HTTPS_SERVER; ?>admin/view/image/qr_images/buyonear.in_<?php echo $seller_id; ?>_main2.png" alt="" title="" class="img-responsive"></span>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane <?php if($_GET['tab_section'] == 'my_wallet'){ echo 'active'; }?>" id="tab_my_wallet">
                        <div id="sellerwallet"></div>
                        <br />
                     </div>
                     <div class="tab-pane <?php if($_GET['tab_section'] == 'expense_report'){ echo 'active'; }?>" id="tab_expense_report">
                        <div id="sellerexpense"></div>
                        <br />
                     </div>
                     <?php } else { ?>
					 <div class="tab-pane <?php if($_GET['tab_section'] == 'profile'){ echo 'active'; }?>" id="tab-profile_details">
                        <div class="col-md-12">
                           <blockquote>
                              <a href="<?php echo $profile_edit; ?>" data-toggle="tooltip" title="" class="prf--sell">Edit</a>
                              <div class="panel-heading">
                                 <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_your_details; ?></h3>
                              </div>
                              <div class="table-responsive">
                                 <table class="table table-condensed">
                                    <tbody>
                                       <tr>
                                          <td>
                                             <label for="input-firstname"><?php echo $entry_firstname; ?> </label>
                                          </td>
                                          <td>
                                             <?php echo $customer_info['firstname']; ?>
                                             </a>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <label for="input-lastname"><?php echo $entry_lastname; ?> </label>
                                          </td>
                                          <td>
                                             <?php echo $customer_info['lastname']; ?>
                                             </a>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <label for="input-email"><?php echo $entry_email; ?> </label>
                                          </td>
                                          <td>
                                             <?php echo $customer_info['email'] ; ?>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <label for="input-telephone"><?php echo $entry_telephone; ?> </label>
                                          </td>
                                          <td>
                                             <?php echo $customer_info['telephone']; ?>
                                          </td>
                                       </tr>
                                       <!-- <tr>
                                          <td>
                                             <label for="input-fax"><?php //echo $entry_fax; ?> </label>
                                          </td>
                                          <td>
                                             <?php //echo $customer_info['fax']; ?>
                                          </td>
                                          </tr> -->
                                    </tbody>
                                 </table>
                              </div>
                              <a href="<?php echo $password_edit; ?>" data-toggle="tooltip" title="" class="prf--sell">Change password</a><br><br>			       
                              <div class="panel-heading">
                                 <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_address_book; ?></h3>
                              </div>
                              <?php if ($addresses) { ?>
                              <div class="table-responsive">
                                 <table class="table table-bordered table-hover">
                                    <?php foreach ($addresses as $result) { ?>
                                    <tr>
                                       <td class="text-left"><?php echo $result['address']; ?></td>
                                       <td class="text-right"><a href="<?php echo $result['update']; ?>" class="prf--sell"><?php echo $button_edit; ?></a></td>
                                    </tr>
                                    <?php } ?>
                                 </table>
                              </div>
                              <?php } else { ?>
                              <p><?php echo $text_empty; ?></p>
                              <?php } ?>
                           </blockquote>
                        </div>
                     </div>
                     <div class="tab-pane <?php if($_GET['tab_section'] == 'store_detail'){ echo 'active'; }?>" id="tab-more_details">
					 <div class="panel-group" id="accordionn">
                           <div class="panel panel-default">
						   <div id="collapse1" class="panel-collapse collapse in">
						   <div class="panel-body">
							<div class="panel-heading">
                                 <ul class="--bon-res-scrooll">
                                 <li>- Please enter accurate information.</li>
                                 <li>- Store/Entity name, location, at least one main category and email ID are needed to get the approval.</li>
                                 <li>- Get buyers attention more by filling other fields to get your store/entity verified.</li>
                                 <li>- Store/Entity will be enforced for re-approval if you change it's name and/or add/modify it's banner.</li>
                                 <ul>
                              </div>
                              
                        
                        <?php if($seller_approved != 1) { ?>
                        <div class="alert alert-danger"><i class="fa fa-times-circle"></i> You store Approvel pending </div>
                        <?php } else { ?>
                        <div class="alert alert-success"><i class="fa fa-check-circle"></i> You store Approved</div>
                        <?php } ?>
                        <?php if($seller_verified != 1) { ?>
                        <div class="alert alert-danger"><i class="fa fa-times-circle"></i> You store Verification pending</div>
                        <?php } else { ?>
                        <div class="alert alert-success"><i class="fa fa-check-circle"></i> You store Verified</div>
                        <?php } ?>
						<?php if($seller_reject_reason != '') { ?>
						<div class="alert alert-danger"><i class="fa fa-times-circle"></i> <?php echo $seller_reject_reason; ?></div>
						<?php } ?>
                        <form action="" method="post" enctype="multipart/form-data" id="form-profile" class="form-horizontal main--mb--bt">
							   <!--<button type="button" id="button-profile-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary pull-right">
								  <?php echo $button_save; ?>
								  </button>-->
							   <div class="form-group required">
								  <label class="col-sm-2 control-label" for="input-nickname">
								  <?php echo $entry_nickname; ?>
								  </label>
								  <div class="col-sm-8">
									 <input type="text" maxlength="50" name="nickname" placeholder="<?php echo $entry_nickname; ?>" value="<?php echo $nickname; ?>" id="input-nickname" class="form-control" required/>
									 <span class="input-group-btn">
									 </span>
								  </div>
							   </div>
							   <div class="form-group">
								  <div class="buttons">
									 <label class="col-sm-2 control-label">
									 <?php echo $entry_seller_banner; ?>
									 </label>
									 <div class="col-sm-10">
										<a href="" id="thumb-banner" data-toggle="banner" class="img-thumbnail"><img src="<?php echo $thumb_banner; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
										<input type="hidden" name="banner" value="<?php echo $banner; ?>" id="input-banner" />
									 </div>
								  </div>
							   </div>
							   <div class="form-group">
								  <label class="col-sm-2 control-label">
								  <?php echo $entry_description; ?>
								  </label>
								  <div class="col-sm-10">
									 <textarea style="white-space: normal;" name="seller_description" rows="5" placeholder="<?php echo $entry_description; ?>" id="input-description" class="form-control">
									 <?php echo $seller_description; ?>
									 </textarea>
								  </div>
							   </div>
							   <div class="form-group required">
								  <label class="col-sm-2 control-label">Enter map location</label>
								  <div class="col-sm-10">
									 <div id="map-search" class="map-sample">
										<img class="cursor img-responsive" id="search-btn_st" data-toggle="modal" data-target="#map_mod" src="image/gmap.jpg"/>
									 </div>
								  </div>
							   </div>
							   <div class="form-group">
								  <label class="col-sm-2 control-label" for="input-owner-name">
								  <?php echo $entry_owner_name; ?>
								  </label>
								  <div class="col-sm-8">
									 <input type="text" maxlength="50" name="owner_name" placeholder="<?php echo $entry_owner_name; ?>" value="<?php echo $owner_name; ?>" id="input-owner-name" class="form-control" required/>
									 <span class="input-group-btn">
									 </span>
								  </div>
							   </div>
							   <div class="form-group">
								  <div class="buttons">
									 <label class="col-sm-2 control-label">
									 <?php echo $entry_seller_avatar; ?>
									 </label>
									 <div class="col-sm-10">
										<a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb_image; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
										<input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
									 </div>
								  </div>
							   </div>
							   <div class="form-group">
								  <div class="buttons">
									 <label class="col-sm-2 control-label">
									 Additional Store/Entity images
									 </label>
									 <div class="col-sm-10 additional_image sel--sec--ordd">
										<a class="cursor sel--sec--ord" data-toggle="modal" data-target="#store_images">Edit</a>
									 </div>
								  </div>
							   </div>
							   <div class="form-group required">
								  <div class="buttons">
									 <label class="col-sm-2 control-label">
									 Store/Entity catogeries
									 </label>
									 <div class="col-sm-10 additional_image sel--sec--ordd">
										<a class="cursor sel--sec--ord" data-toggle="modal" data-target="#store_cat">Edit</a>
									 </div>
								  </div>
							   </div>
							   <div class="form-group">
								  <div class="buttons">
									 <label class="col-sm-2 control-label">
									 Hours of operation
									 </label>
									 <div class="col-sm-10 additional_image sel--sec--ordd">
										<a class="cursor sel--sec--ord" data-toggle="modal" data-target="#store_timings">Edit</a>
									 </div>
								  </div>
							   </div>
							   <div class="form-group new--mtt">
								  <div class="row">
									 <label class="col-sm-2 control-label" for="input-ll-num">
									 <?php echo $entry_store_ll_num; ?>
									 </label>
									 <?php $store_ll_num_row = 0; $store_ll_num = explode(",", $store_ll_num); ?>
									 <?php foreach ($store_ll_num as $store_ll_nums) { $store_ll = explode("-", $store_ll_nums);
										$store_ll_0 = (isset($store_ll[0]) && $store_ll[0] != '') ? $store_ll[0] : ''; 
										$store_ll_1 = (isset($store_ll[1]) && $store_ll[1] != '') ? $store_ll[1] : ''; ?>
									 <?php if($store_ll_num_row != 0) { ?>
									 <div id="ad_ll<?php echo $store_ll_num_row; ?>" class="row addition-mobile">
										<div class="col-sm-2"></div>
										<?php } ?>
										<div class="col-sm-2">
										   <input type="text" name="store_ll_code[]" placeholder="<?php echo $entry_store_ll_code; ?>" value="<?php echo $store_ll_0; ?>" id="input-ll-code" maxlength="5" class="form-control mat--lt" required/>
										   <span class="input-group-btn">
										   </span>
										</div>
										<div class="col-sm-6">
										   <input type="text" name="store_ll_num[]" placeholder="<?php echo $entry_store_ll_num; ?>" value="<?php echo $store_ll_1; ?>" id="input-store-num" maxlength="10" class="form-control mat--lt" required/>
										   <span class="input-group-btn">
										   </span>
										</div>
										<?php if($store_ll_num_row == 0) { ?>
										<div class="col-sm-2">
										   <button type="button" onclick="addStoreLandLine();" class="--plus-btn">+</button>
										</div>
									 </div>
									 <?php } else { ?>
									 <div class="col-sm-2"><span class="text-left"><button type="button" onclick="ad_ll<?php echo $store_ll_num_row; ?>.remove();" class="--minus-btn">-</button></span></div>
								  </div>
								  <?php } ?>
								  <?php $store_ll_num_row++; } ?>
								  <div id="str_ll"></div>
							   </div>
							   <div class="form-group new--mtt">
								  <div class="row">
									 <label class="col-sm-2 control-label" for="input-store-num">
									 <?php echo $entry_store_mobile_num; ?>
									 </label>
									 <?php $store_mobile_num_row = 0; $store_mobile_num = explode(",", $store_mobile_num); ?>
									 <?php foreach ($store_mobile_num as $store_mobile_nums) { ?>
									 <?php if($store_mobile_num_row != 0) { ?>
									 <div id="ad_mob<?php echo $store_mobile_num_row; ?>" class="row addition-mobile">
										<div class="col-sm-2"></div>
										<?php } ?>
										<div class="col-sm-8">
										   <input type="text" name="store_mobile_num[]" placeholder="<?php echo $entry_store_mobile_num; ?>" value="<?php echo $store_mobile_nums; ?>" id="input-store-num" class="form-control mat--lt" required/>
										   <span class="input-group-btn">
										   </span>
										   <?php if($store_mobile_num_row == 0) { ?>
										   <p class="special--email-txt mat--lt --bon-res-scrooll">(Above mobile no. will be used while sending posted advertisement detail, buyers order detail, BoN offers, etc.)</p>
										   <?php } ?>
										</div>
										<?php if($store_mobile_num_row == 0) { ?>
										<div class="col-sm-2">
										   <button type="button" onclick="addStoreMobile();" class="--plus-btn">+</button>
										</div>
									 </div>
									 <?php } else { ?>
									 <div class="col-sm-2"><span class="text-left"><button type="button" onclick="ad_mob<?php echo $store_mobile_num_row; ?>.remove();" class="--minus-btn"> - </button></span></div>
								  </div>
								  <?php } ?>
								  <?php $store_mobile_num_row++; } ?>
								  <div id="str_mob"></div>
							   </div>
							   <div class="form-group required">
								  <label class="col-sm-2 control-label" for="input-store-email">
								  <?php echo $entry_store_email; ?>
								  </label>
								  <div class="col-sm-10">
									 <input type="text" name="store_email" placeholder="<?php echo $entry_store_email; ?>" value="<?php echo $store_email; ?>" id="input-store-email" class="form-control" required/>
									 <span class="input-group-btn">
									 </span>
									 <p class="special--email-txt --bon-res-scrooll">(Above email ID will be used while sending posted advertisement detail, buyers order detail, BoN offers, etc.)</p>
								  </div>
							   </div>
							   <div class="form-group">
								  <label class="col-sm-2 control-label" for="input-tin">
								  <?php echo $entry_tin; ?>
								  </label>
								  <div class="col-sm-10">
									 <input maxlength="30" type="text" name="tin" placeholder="<?php echo $placeholder_tin; ?>" value="<?php echo $tin; ?>" id="input-tin" class="form-control" required/>
									 <span class="input-group-btn">
									 </span>
								  </div>
							   </div>
							   <div class="form-group">
								  <label class="col-sm-2 control-label" for="input-pan">
								  <?php echo $entry_pan; ?>
								  </label>
								  <div class="col-sm-10">
									 <input maxlength="30" type="text" name="pan" placeholder="<?php echo $placeholder_pan; ?>" value="<?php echo $pan; ?>" id="input-pan" class="form-control" required/>
									 <span class="input-group-btn">
									 </span>
								  </div>
							   </div>
							   <div class="form-group">
								  <div class="buttons">
									 <label class="col-sm-2 control-label">
									 Store/Entity portals
									 </label>
									 <div class="col-sm-10 additional_image sel--sec--ordd">
										<a class="cursor sel--sec--ord" data-toggle="modal" data-target="#store_portals">Edit</a>
									 </div>
								  </div>
							   </div>
							   <div class="form-group">
								  <label class="col-sm-2 control-label" for="input-delivery_type">
								  Delivery type
								  </label>
								  <div class="col-sm-10">						     
									 <input type="radio" name="delivery_type" value="1" <?php if($delivery_type == 1){ echo "checked"; } ?>> Cash on home delivery<br>
									 <input type="radio" name="delivery_type" value="2" <?php if($delivery_type == 2){ echo "checked"; } ?>> Cash on Store delivery<br>
									 <input type="radio" name="delivery_type" value="3" <?php if($delivery_type == 3){ echo "checked"; } ?>> Both
								  </div>
							   </div>
							   <?php if($referred_by != '') { ?>
							       <div class="form-group">
								  <label class="col-sm-2 control-label" for="input-referred-by">
								  Referred by
								  </label>
								  <div class="col-sm-10"  style="padding-top: 7px;">	
								     <?php if($referred_by != '---') {
									$refed_val = explode("-", $referred_by); ?>
								     <span class="referred-by"><?php echo $refed_val[0]; ?></span>
								     <input type="hidden" name="referred_by" value="<?php echo $refed_val[0]; ?>" id="input-referred-by" class="form-control" />
								     <?php } else { ?>
								     <span class="referred-by"><?php echo $referred_by; ?></span>
								     <?php } ?>                                             
								  </div>
							       </div>
							       <?php } ?>
							       <div class="form-group referrer-fom-build-shownn" style="display: none;">
								  <label class="col-sm-2 control-label" for="input-referred-by">
								  Referred by
								  </label>
								  <div class="col-sm-10" style="padding-top: 7px;">
									  <input id="input-referred-by-vall" class="form-control" name="referred_by" placeholder="Referred By" value="">
										 <!--<span class="referred-by" id="ref-val-display"><?php //echo $referred_by; ?></span>-->
										 <p>If you are a new referrer,<a class="cursor" data-toggle="modal" data-target="#store_referred"> click here</a></p>
								  </div>
							       </div>
							       <?php if($referred_by == '') { ?>
							       <div class="form-group referrer-fom-build">
								  <label class="col-sm-2 control-label" for="input-referred-by">
								  Referred by
								  </label>
								  <div class="col-sm-10" style="padding-top: 7px;">
								     <input type="text" id="input-referred-by-val" name="referred_by" placeholder="Referred By" value="<?php echo $referred_by; ?>" id="input-referred-by" class="form-control" />
								     <p>If you are a new referrer,<a class="cursor" data-toggle="modal" data-target="#store_referred"> click here</a></p>
								  </div>
							       </div>
							       <?php } ?>
							   <div class="diff--seller">
								  <?php if($daysleft > 0) { ?>
								  <div class="form-group">
									 <label class="col-sm-3 control-label" for="input-referred-by">
									 - Set as <span style="background: yellow;">featured</span> to top the list :
									 </label>
									 <div class="col-sm-9">						     
										<span class="referred-by"><?php echo $daysleft; ?> day(s) left</span>
									 </div>
								  </div>
								  <?php } else { ?>
								  <div class="form-group">
									 <label class="col-sm-3 control-label" for="input-referred-by">
									 - Not set as <span style="background: yellow;">featured.</span>
									 </label>
									 <div class="col-sm-9">
									 </div>
								  </div>
								  <?php } ?>
								  <div class="form-group">
									 <label class="col-sm-3 control-label" for="input-referred-by">
									 - Number of times buyers viewed your listing :
									 </label>
									 <div class="col-sm-9" style="padding-top: 7px">
										<div class="cnt--sell">
										   <?php if($seller_counter == '0') { ?>
										   <p class="referred-by"><span id="manage_counter">0</span></p>
										   <?php } else { ?>
										   <p class="referred-by"><span id="manage_counter"><?php echo $seller_counter; ?></span></p>
										   <a id="clear_counter" class="cursor">Clear</a>
										   <?php } ?>						     
										</div>
									 </div>
								  </div>
								  <div class="form-group">
									 <label class="col-sm-3 control-label" for="input-referred-by">
									 - Number of buyers added this to their favourites :
									 </label>
									 <div class="col-sm-9"  style="margin-top: 5px;">						     
										<span class="referred-by"><?php echo $favourites_customer_count; ?> Buyer(s)</span>
									 </div>
								  </div>
							   </div>
							   <div class="form-group">
								   <label class="col-sm-12 control-label" for="agree_tt" style="font-weight: bold; text-align: left;"><input type="hidden" name="agree" value="not_agree" id="agree">
								   <input type="checkbox" name="agree_tt" class="agree_tt" value="agree" id="agree_tt"> I hereby declare that the detail furnished above are true and correct to the best of my knowledge. In case any of the information is found to be false or untrue or misleading or misrepresenting, I am aware that my detail will impact approval and verification process.</label>
								</div>
							   <!--<div class="form-group">
								  <label class="col-sm-3 control-label">Address</label>
								  <div class="col-sm-5">
									<input type="text" class="form-control" name="address" id="address_st" value="" />												
								  </div>
								  </div>-->	
							   <input type="hidden" class="form-control" name="lat" id="latitude_st" value="<?php echo $lat; ?>" />
							   <input type="hidden" class="form-control" name="lng" id="longitude_st" value="<?php echo $lng; ?>" />	
							   <button type="button" id="button-profile-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary pull-right">
							   <?php echo $button_save; ?>
							   </button>
							</form>
                     </div>
					 </div>
					 </div>
					 </div>
					 
						</div>
                     <?php } ?>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<div class="modal fade" id="store_referred" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content loc-pop">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title loc-share-title">New referrer form</h4>
         </div>
         <div class="modal-body reffer-str-top">
            <div id="val_ref_tt"></div>
            <p>You get 20% of the first paid advertisement posted by the store/entity you refer.</p>
            <br/>
            <form action="" method="post" enctype="multipart/form-data" id="store_referred_frm" class="">
               <div class="featured-detils">
                  <div class="form-group">
                     <input name="refer_name" id="refer_name" value="" placeholder="Name" required="" type="text">
                  </div>
                  <div class="form-group">
                     <input name="refer_mobile" id="refer_mobile" value="" placeholder="Mobile Number" required="" type="text">
                  </div>
                  <div class="form-group">
                     <input name="refer_email" id="refer_email" value="" placeholder="Email" required="" type="email">
                  </div>
                  <div class="form-temp">Referrer bank detail</div>
                  <div class="form-group">
                     <input name="bank_name" id="bank_name" value="" placeholder="Bank Name" required="" type="text">
                  </div>
                  <div class="form-group">
                     <input name="branch" id="branch" value="" placeholder="Branch" required="" type="text">
                  </div>
                  <div class="form-group">
                     <input name="account_holder_name" id="account_holder_name" value="" placeholder="Account holders name" required="" type="text">
                  </div>
                  <div class="form-group">
                     <input name="account_number" id="account_number" value="" placeholder="Account number" required="" type="text">
                  </div>
                  <div class="form-group">
                     <input name="ifsc" id="ifsc" value="" placeholder="IFSC" required="" type="text">
                  </div>
                  <div class="form-group">
                     <div class="main--res-redor">
                        <span class="pull-left"><input type="radio" checked name="account_type" id="salary_account" value="salary_account"><label for="salary_account"> saving account</label></span>
                        <span class="pull-right"><input type="radio" name="account_type" id="current_account" value="current_account"><label for="current_account"> current account</label></span><br/>
                     </div>
                  </div>
                  <div class="det--ref" style="margin-bottom:10px;clear: both;">Above information including bank detail are true and correct to the best of my knowledge. If there is any issue or incorrect data provided by me, BoN is in no way will be held responsible.</div>
                  <div class="form-group">
                     <input type="checkbox" name="terms" id="agree_bank" value="agree" style="margin-right: 5px;"><label for="agree"> I agree</label>
                  </div>
                  <div class="det--ref" style="margin-bottom:20px;"><strong>Note:</strong> BoN will not share your information including bank detail with anyone for any purpose.</div>
                  <div class="form-group">
                     <button type="button" data-dismiss="modal" class="btn btn-primary pull-left">Cancel</button>
                     <button type="button" id="button-refer-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary pull-right">Save</button>		     
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
<div class="modal fade" id="store_portals" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content loc-pop">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title loc-share-title">Store/Entity portals</h4>
         </div>
         <div class="modal-body str--fet--stt">
            <div class="row">
               <form action="" method="post" enctype="multipart/form-data" id="store_portals_fm" class="form-horizontal">
                  <div class="col-sm-12 col-xs-12">
                     <div class="portal_alert"></div>
                  </div>
                  <div class="col-sm-12 col-xs-12">
                     <div class="col-sm-2 col-xs-2">
                        <label>Website</label>
                     </div>
                     <div class="col-sm-10 col-xs-10">
                        <input type="text" name="website" placeholder="http://www.example.com" value="<?php echo $website; ?>" id="input-website" class="form-control" />
                        <span class="input-group-btn">
                        </span>
                     </div>
                  </div>
                  <div class="col-sm-12 col-xs-12">
                     <div class="col-sm-2 col-xs-2">
                        <label>Facebook</label>
                     </div>
                     <div class="col-sm-10 col-xs-10">
                        <input type="text" name="facebook" placeholder="http://www.facebook.com/youraccount" value="<?php echo $facebook; ?>" id="input-facebook" class="form-control" />
                        <span class="input-group-btn">
                        </span>
                     </div>
                  </div>
                  <div class="col-sm-12 col-xs-12">
                     <div class="col-sm-2 col-xs-2">
                        <label>Twitter</label>
                     </div>
                     <div class="col-sm-10 col-xs-10">
                        <input type="text" name="twitter" placeholder="http://twitter.com/youraccount" value="<?php echo $twitter; ?>" id="input-twitter" class="form-control" />
                        <span class="input-group-btn">
                        </span>
                     </div>
                  </div>
                  <div class="col-sm-12 col-xs-12">
                     <div class="col-sm-2 col-xs-2">
                        <label>Google+</label>
                     </div>
                     <div class="col-sm-10 col-xs-10">
                        <input type="text" name="googleplus" placeholder="http://plus.google.com/youraccount" value="<?php echo $googleplus; ?>" id="input-googleplus" class="form-control" />
                        <span class="input-group-btn">
                        </span>
                     </div>
                  </div>
                  <div class="col-sm-12 col-xs-12">
                     <div class="col-sm-2 col-xs-2">
                        <label>Intagram</label>
                     </div>
                     <div class="col-sm-10 col-xs-10">
                        <input type="text" name="instagram" placeholder="http://www.instagram.com/youraccount" value="<?php echo $instagram; ?>" id="input-instagram" class="form-control" />
                        <span class="input-group-btn">
                        </span>
                     </div>
                  </div>
                  <div class="col-sm-12 col-xs-12">
                     <div class="col-sm-10 col-xs-10">
                     </div>
                     <div class="col-sm-2 col-xs-2">
                        <button type="button" id="button-portals-save" data-loading-text="Loading..." class="btn btn-primary pull-right">Save</button>
                     </div>
                  </div>
            </div>
            </form>
         </div>
      </div>
   </div>
</div>
</div>
<div class="modal fade" id="store_featured" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content loc-pop">
         <!--<div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title loc-share-title">Feature Store Details</h4>
            </div>-->
         <div class="modal-body str--fet--st">
            <div class="row">
               <div class="main-tss-mg">
                  <img class="img-responsive" src="image/feature-store-img.jpg">
               </div>
            </div>
            <div class="row">
               <form action="" method="post" enctype="multipart/form-data" id="store-feature" class="form-horizontal">
                  <div class="featured-detils">
                     <input type="radio" name="featured_period" if="half_per" value="half"><label for="half_per"> 15 days - Rs 399</label><br/>
                     <input type="radio" name="featured_period" if="full_per" value="full"><label for="full_per"> 30 days - Rs 699</label><br/>
                     <button id="button-feature-save" data-loading-text="<?php echo $text_loading; ?>" class="advertise-btn_live">Continue</button>
                     <button class="advertise-btn" type="button" onclick="this.form.reset();" data-dismiss="modal" aria-hidden="true">Cancel</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<div class="modal fade" id="store_images" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content loc-pop">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title loc-share-title">Store/Entity additional images</h4>
         </div>
         <div class="modal-body timing-share-top">
            <ul class="--bon-res-scrooll">
               <li>- Images you upload here are closely monitored by our experts. If found not permissable to public, store/entity might be banned from the listing after a warning.</li>
            </ul>
            <br/>
            <form action="" method="post" enctype="multipart/form-data" id="form-image" class="form-horizontal">
               <div class="table-responsive">
                  <table id="images" class="table table-striped table-bordered table-hover">
                     <thead>
                        <tr>
                           <td class="text-left">Additional Image<?php //echo $entry_additional_image; ?></td>
                           <td class="text-right">Sort Order<?php //echo $entry_sort_order; ?></td>
                           <td></td>
                        </tr>
                     </thead>
                     <tbody>
                        <?php $image_row = 0; ?>
                        <?php foreach ($store_images as $store_image) { ?>
                        <tr id="image-row<?php echo $image_row; ?>">
                           <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $store_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" class="imgae_empty_check" name="store_image[<?php echo $image_row; ?>][image]" value="<?php echo $store_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                           <td class="text-right"><input type="text" name="store_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $store_image['sort_order']; ?>" placeholder="<?php //echo $entry_sort_order; ?>" class="form-control" /></td>
                           <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="--minus-btn">-</button></td>
                        </tr>
                        <?php $image_row++; ?>
                        <?php } ?>
                     </tbody>
                     <tfoot>
                        <tr>
                           <td colspan="2"></td>
                           <td class="text-left"><button type="button" onclick="addImage();" class="--plus-btn">+</button></td>
                        </tr>
                     </tfoot>
                  </table>
                  <button type="button" id="button-image-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary pull-right">
                  <?php echo $button_save; ?>
                  </button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
<div class="modal fade" id="store_cat" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content loc-pop">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title loc-share-title">Store/Entity Categories</h4>
         </div>
         <div class="modal-body cat-top">
            <ul class="--bon-res-scrooll">
               <li>- Advertisement(s) you post will be filtered by buyers upon searching the main category you add here.</li>
               <li>- Please be cautious in choosing main or sub category to keep your loyalty/credibility amongst buyers.</li>
            </ul>
            <br/>
            <form action="" method="post" enctype="multipart/form-data" id="form-categories" class="form-horizontal">
               <div class="table-responsive">
                  <table id="cats" class="table table-striped table-bordered table-hover">
                     <thead>
                        <tr>
                           <td class="text-left">Main Category<?php //echo $entry_additional_image; ?></td>
                           <td class="text-left">Sub category<?php //echo $entry_sort_order; ?></td>
                           <td></td>
                        </tr>
                     </thead>
                     <tbody>
                        <?php $cat_row = 0; ?>
                        <?php if(!empty($category_seller)) {		  
                           foreach ($category_seller as $key=> $seller_cat) { ?>		 
                        <tr id="cat-rows<?php //echo $cat_row; ?>" class="extra remove<?php echo $cat_row; ?>">
                           <td class="text-left cat">
                              <input type="text" disabled data-catid="<?php echo $key; ?>" name="category<?php echo $cat_row; ?>" value="<?php echo $seller_cat['name']; ?>" placeholder="Type here" id="input-category" data-cat="" onKeyPress="inputsKeyup(this)" class="form-control" />
                              <input type="hidden" name="category_id<?php echo $cat_row; ?>" value="<?php echo $key; ?>" placeholder="Type here" id="input-category-main" class="form-control" />
                              <input type="hidden" id="hidden-category-main" name="category_ids[]" value="<?php echo $seller_cat['id']; ?>" />
                           </td>
                           <td class="text-left subcat">
                              <input type="text" name="sub_category<?php echo $cat_row; ?>" style="display:none" data-cateid="<?php echo $key; ?>" data-val="<?php echo $cat_row; ?>" value="" placeholder="Type here" id="input-sub-category"  class="form-control" />
                              <div id="product-category<?php echo $cat_row; ?>" class="well well-sm" style="height: 150px; overflow: auto;">
                                 <?php foreach ($seller_cat as $sel_key => $seller_c) {  if($seller_cat['name'] != $seller_c){ ?>
                                 <div id="product-category<?php echo $sel_key; ?>">
                                    <!-- <i class="fa fa-minus-circle"></i> --> <?php echo $seller_c; ?>
                                    <input type="hidden" name="product_category[]" value="<?php echo $seller_c; ?>" />
                                 </div>
                                 <?php } }?>
                              </div>
                           </td>
                           <td><span class="text-left"><button type="button" onclick="$('tr.remove<?php echo $cat_row; ?>').remove();" class="--minus-btn">-</button></span></td>
                        </tr>
                        <?php $cat_row++; } }?>
                        <tr id="cat-rows" class="extra clonediv">
                           <td class="text-left cat">
                              <input type="text" data-catid="" name="category" value="" placeholder="Type here" id="input-category" data-cat="" onKeyPress="inputsKeyup(this)" class="form-control" />
                              <input type="hidden" name="category_id" value="" placeholder="Type here" id="input-category-main" class="form-control" />
                              <input type="hidden" id="hidden-category-main" name="category_ids[]" value="" />
                           </td>
                           <td class="text-left subcat">
                              <input type="text" name="sub_category" data-val="" value="" placeholder="Type here" id="input-sub-category" class="form-control" />
                              <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
                                 <div id="product-category">
                                    <!-- <i class="fa fa-minus-circle"></i>-->
                                    <input type="hidden" name="product_category[]" value="" />
                                 </div>
                              </div>
                           </td>
                        </tr>
                     </tbody>
                     <tfoot>
                        <tr>
                           <td colspan="2"></td>
                           <td class="text-left"><button type="button" id="addBtn" class="--plus-btn">+</button></td>
                        </tr>
                     </tfoot>
                  </table>
                  <button type="button" id="button-cat-subcat-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary pull-right">
                  <?php echo $button_save; ?>
                  </button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
<link href="catalog/view/javascript/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
<script src="catalog/view/javascript/bootstrap-timepicker.js"></script>
<div class="modal fade" id="store_timings" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content loc-pop">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title loc-share-title">Hours of operation</h4>
         </div>
         <div class="modal-body store-timing-share-top">
	 <div id="store_success_timg"></div>
            <form action="" method="post" enctype="multipart/form-data" id="store-timings" class="form-horizontal">
               <div class="featured-detils">	       
                  <?php $days = array("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"); ?>
                  <?php $i = 0; foreach($days as $day) { 
                     $str_tmg = unserialize($store_timings[strtolower($day)]);
		     //echo "<pre>"; print_r($store_timings['monday']);
                     if($str_tmg['status'] == "open") { ?>
                  <div class="row">
                     <div class="col-sm-2">
                        <label><?php echo $day; ?></label>
                     </div>
                     <div class="col-sm-2">
                        <?php $status = array("close", "open", "holiday", "leave"); ?>
                        <input type="hidden" name="<?php echo strtolower($day); ?>[day]" value="<?php echo strtolower($day); ?>">
                        <select name="<?php echo strtolower($day); ?>[status]" id="select-<?php echo strtolower($day); ?>" data-month="<?php echo strtolower($day).$i; ?>" data-id="<?php echo $i; ?>" > // onchange='check()'
                        <?php 
                           foreach ($status as $statu) {
                           	 $selected = ($statu == $str_tmg['status']) ? "selected = selected" : "";
                           	echo "<option value=\"" . $statu . "\"".$selected.">" . strtoupper($statu) . "</option>";
                           }
                           ?>
                        </select>
                     </div>
                     <div class="col-sm-6">
                        <div class="select-<?php echo strtolower($day.$i); ?>" style ="margin-bottom: 10px; display: inline-flex;">
                           <?php if($str_tmg['from'][0] != '') { ?>
                           <div class="input-group bootstrap-timepicker timepicker">
                              <input id="timepicker1" name="<?php echo strtolower($day); ?>[from][]" type="text" value="<?php echo $str_tmg['from'][0]; ?>" class="form-control input-small timepicker1" readonly>
                              <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                           </div>
                           <?php } ?>
                           <?php if($str_tmg['to'][0] != '') { ?>
                           <div class="input-group bootstrap-timepicker timepicker">
                              <input id="timepicker1" name="<?php echo strtolower($day); ?>[to][]" type="text" value="<?php echo $str_tmg['to'][0]; ?>" class="form-control input-small timepicker1" readonly>
                              <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                           </div>
                           <?php } ?>
                        </div>
                        <?php if(isset($str_tmg['from'][1]) && $str_tmg['from'][1] != '') { ?>
                        <div class="select-<?php echo strtolower($day.$i); ?> extras" style ="margin-bottom: 10px; display: inline-flex;">
                           <div class="input-group bootstrap-timepicker timepicker">
                              <input id="timepicker1" name="<?php echo strtolower($day); ?>[from][]" type="text" value="<?php echo $str_tmg['from'][1]; ?>" class="form-control input-small timepicker1" readonly>
                              <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                           </div>
                           <?php } ?>
                           <?php if(isset($str_tmg['to'][1]) && $str_tmg['to'][1] != '') { ?>
                           <div class="input-group bootstrap-timepicker timepicker">
                              <input id="timepicker2" name="<?php echo strtolower($day); ?>[to][]" type="text" value="<?php echo $str_tmg['to'][1]; ?>" class="form-control input-small timepicker1" readonly>
                              <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                           </div>
                        </div>
                        <?php } ?>
                        <div class="second-time-<?php echo strtolower($day.$i); ?>">		  
                        </div>
                     </div>
                     <?php if(count($str_tmg['from']) != 2) { ?>
                     <div class="col-sm-2" id="add-<?php echo strtolower($day.$i); ?>" >
                        <button type="button" class="addbtn" onclick="addbtnfnt(this);" id="<?php echo strtolower($day.$i); ?>">+</button>
                     </div>
                     <?php } else { ?>
                     <div class="col-sm-2" id="add-<?php echo strtolower($day.$i); ?>" >
                        <button type="button" class="removebtns" id="<?php echo strtolower($day.$i); ?>">-</button>
                     </div>
                     <?php } ?>
                  </div>
                  <?php } else { ?>
                  <div class="row">
                     <div class="col-sm-2">
                        <label><?php echo $day; ?></label>
                     </div>
                     <div class="col-sm-2">
                        <?php $status = array("close", "open", "holiday", "leave"); ?>
                        <input type="hidden" name="<?php echo strtolower($day); ?>[day]" value="<?php echo strtolower($day); ?>">
                        <select name="<?php echo strtolower($day); ?>[status]" id="select-<?php echo strtolower($day); ?>" data-month="<?php echo strtolower($day).$i; ?>" data-id="<?php echo $i; ?>"> // onchange='check()'
                        <?php 
                           foreach ($status as $statu) {
                           	 $selected = ($statu == $str_tmg['status']) ? "selected = selected" : "";
                           	echo "<option value=\"" . $statu . "\"".$selected.">" . strtoupper($statu) . "</option>";
                           }
                           ?>
                        </select>
                     </div>
                     <div class="col-sm-6">
                        <div class="select-<?php echo strtolower($day.$i); ?>" style="display:none; margin-bottom: 10px;">
                           <div class="input-group bootstrap-timepicker timepicker">
                              <input id="timepicker1" name="<?php echo strtolower($day); ?>[from][]" type="text" value="" class="form-control input-small timepicker1" readonly>
                              <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                           </div>
                           <div class="input-group bootstrap-timepicker timepicker">
                              <input id="timepicker2" name="<?php echo strtolower($day); ?>[to][]" type="text" value="" class="form-control input-small timepicker1" readonly>
                              <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                           </div>
                        </div>
                        <div class="second-time-<?php echo strtolower($day.$i); ?>">		  
                        </div>
                     </div>
                     <div class="col-sm-2" id="add-<?php echo strtolower($day.$i); ?>" style="display:none;">
                        <button type="button" class="addbtn" id="<?php echo strtolower($day.$i); ?>" onclick="addbtnfnt(this);">+</button>
                     </div>
                  </div>
                  <?php } $i++; } ?>
               </div>
               <button type="button" id="button-timing-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary pull-right">Save</button>
            </form>
         </div>
      </div>
   </div>
</div>
<script>
   var fixmeTop = $('.fixme').offset().top;
   $(window).scroll(function() {
       var currentScroll = $(window).scrollTop();
       if (currentScroll >= fixmeTop) {
           $('.fixme').css({
               position: 'sticky',
               top: '0',
               
           });
       } else {
           $('.fixme').css({
               position: 'static'
           });
       }
   });
// Section tab section
   var fixmeTop = $('.fixme-sec').offset().top;
   $(window).scroll(function() {
       var currentScroll = $(window).scrollTop();
       if (currentScroll >= fixmeTop) {
           $('.fixme-sec').css({
               position: 'sticky',
               top: '40px',
               
           });
       } else {
           $('.fixme-sec').css({
               position: 'static'
           });
       }
   });
   
</script>
<script type="text/javascript">
   $('.timepicker1').timepicker();
   
   $("#store-timings select").on("change", function() {
   var id = $(this).attr("id");
   var data_id = $(this).data('id');
   var month_id = $(this).data('month');
   var sel_val = $(this).val();
   var tit = id+data_id;
   //alert(month_id);
   if(sel_val == "open") {
   $('#add-'+month_id).show();
   $("."+tit).css({"display": "inline-flex", "margin-bottom": "10px"});		
   } else {
   $('#add-'+month_id).hide();
   $("."+tit).css({"display": "none", "margin-bottom": "10px"});		
   }
   
   });
   
   $('#button-timing-save').on('click', function(e) {
	   $.ajax({
	     type: "POST",
	     url: 'index.php?route=sellerprofile/sellerprofile/store_timings',
	     data: $('#store-timings').serialize(),
	     success: function(data) {
	     $('#store_success_timg').html('');
		     if (data['success']) {
		   $('#store_success_timg').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i>'  + data['success'] + '</div>');
		   $('#store_timings').scrollTop(0);
		     }
		//$('body, html').animate({scrollTop:$('#store_timings').offset().top}, 'slow');
	     }
	   });
   });
</script>
<!--<div>
   <?php $monthss ='';
      $months = array("09:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM", "12:00 PM", "12:00 PM", "12:30 PM", "01:00 PM", "01:30 PM", "02:00 PM", "02:30 PM", "03:00 PM", "03:30 PM", "04:00 PM", "04:30 PM", "05:00 PM", "05:30 PM", "06:00 PM", "06:30 PM", "07:00 PM", "07:30 PM", "08:00 PM", "08:30 PM", "09:00 PM", "09:30 PM", "10:00 PM", "10:30 PM", "11:00 PM", "11:30 PM", "12:00 AM", "12:00 AM", "12:30 AM", "01:00 AM", "01:30 AM", "02:00 AM", "02:30 AM", "03:00 AM", "03:30 AM", "04:00 AM", "04:30 AM", "05:00 AM", "05:30 AM", "06:00 AM", "06:30 AM", "07:00 AM", "07:30 AM", "08:00 AM", "08:30 AM", "09:00 AM");						
      ?>
   <select class="" name="from" id="from" style="height: 50px;"
   	<?php 
      foreach ($months as $month) {
      	 $selected = ($month == $monthss) ? "selected = selected" : "";
      	echo "<option value=\"" . $month . "\"".$selected.">" . $month . "</option>";
      }
      ?>
   </select>
   </div>-->
<script type="text/javascript"><!--
   //var image_row = <?php //echo $image_row; ?>;
   
   /*function addImage() {//alert("test");
   	html  = '<tr id="image-row' + image_row + '">';
   	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input class="imgae_empty_check" type="hidden" name="store_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
   	html += '  <td class="text-left"><input type="text" name="store_image[' + image_row + '][sort_order]" value="" placeholder="Sort Order" class="form-control" /></td>';
   	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" class="--minus-btn">-</button></td>';
   	html += '</tr>';
   
   	$('#images tbody').append(html);
   
   	image_row++;
   }*/
   
   var cat_row = <?php echo $cat_row; ?>;
   
   function addCat() {//alert("test");
   	html  = '<tr id="cat-row' + cat_row + '">';
   	html += '  <td class="text-left"><input type="text" name="category" value="" placeholder="Type here" id="input-category' + cat_row + '" class="form-control" /><input type="hidden" name="category_id" value="" placeholder="Type here" id="input-category-main' + cat_row + '" class="form-control" /></td>';
   	html += '  <td class="text-right"><input type="text" name="sub_category" value="" placeholder="Type here" id="input-sub-category' + image_row + '" class="form-control" /><div id="product-category' + image_row + '" class="well well-sm" style="height: 150px; overflow: auto;"><div id="product-category' + image_row + '"><i class="fa fa-minus-circle"></i><input type="hidden" name="product_category[]" value="" /></div></div></td>';
   	html += '  <td class="text-left"><button type="button" onclick="$(\'#cat-row' + cat_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
   	html += '</tr>';
   
   	$('#cats tbody').append(html);
   
   	cat_row++;
   }
   
   //$(".addbtn").on("click", function() {
   function addbtnfnt(val) {//alert(343);
       var addbtn_id = $(val).attr('id');
       var ctr = $(".select-"+addbtn_id).find(".extra").length;
       if (ctr < 1) {
           var $ddl = $(".select-"+addbtn_id).clone();
           $ddl.attr("id", "ddl" + ctr);
           $ddl.addClass("extra");	
   	//$(".select-"+addbtn_id).append($ddl);
   //alert(addbtn_id);
   $(".second-time-"+addbtn_id).append($ddl);
   	$("#add-"+addbtn_id).html('<button type="button" class="removebtn" id="'+addbtn_id+'">-</button>');
   	 $('.timepicker1').timepicker();
       } 
     }
    //});
   
    $('.col-sm-2').delegate('.removebtn', 'click', function() { 
   	 var addbtn_id = $(this).attr('id');
   	$(".select-"+addbtn_id+".extra").remove();	
   	$("#add-"+addbtn_id).html('<button type="button" onclick="addbtnfnt(this);" class="addbtn" id="'+addbtn_id+'">+</button>');
   });
   
   $('.col-sm-2').delegate('.removebtns', 'click', function() { //alert(233223);
   	 var addbtn_id = $(this).attr('id');
   	 //alert(".select-"+addbtn_id+" .extras");
   	$(".select-"+addbtn_id+".extras").remove();	
   	$("#add-"+addbtn_id).html('<button type="button" onclick="addbtnfnt(this);" class="addbtn" id="'+addbtn_id+'">+</button>');
   });
   
   $('select#select-monday').on("change", function() { 
   	
   	var month = $(this).data('month'); 
   	$('#add-'+month).show();
   	if($(this).val() == 'close' || $(this).val() == 'holiday'  || $(this).val() == 'leave') { 
   		$('#add-'+month).hide();
   	}
    });
     
   
   $("#addBtn").on("click", function() {
       var ctr = $("#cats tbody").find(".extra").length;
       if (ctr < 8) {
           var $ddl = $(".clonediv").clone();
           $ddl.attr("id", "ddl" + ctr);
           $ddl.addClass("extra");	
   	$("#cats tbody").append($ddl);
   	$('tr#ddl'+ctr).append('<span class="text-left"><button type="button" onclick="$(\'tr#ddl' + ctr + '\').remove();" class="--minus-btn">-</button></span>');
   	$('tr#ddl'+ctr+' > td.cat > input#input-category').attr('name', 'category'+ctr);
   	$('tr#ddl'+ctr+' > td.cat > input#input-category').attr('data-cat', ctr);
   	$('tr#ddl'+ctr+' > td.cat > input#input-category-main').attr('name', 'category_id'+ctr);
   	$('tr#ddl'+ctr+' > td.subcat > input#input-sub-category').attr('name', 'sub_category'+ctr);
   	$('tr#ddl'+ctr+' > td.subcat > div').attr('id', 'product-category'+ctr);
   	$('tr#ddl'+ctr+' > td.cat > input#hidden-category-main').attr('id', 'hidden-category-main'+ctr);
         
           var cat_hidden = [];
   	$('tr>td>input#input-category-main').each(function() {		
   		var cat_arr = $(this).val();	
   		 cat_hidden.push(cat_arr);		
   	});
   	cat_hid_arr = $.unique(cat_hidden);
   	$('input[name=category_ids]').val(cat_hid_arr);
   	//alert($('input[name=sub_category'+ctr+']').data('val', ''));
   	$('input[name=category'+ctr+']').val('');
   	$('input[name=category_id'+ctr+']').val('');
   	$('input[name=sub_category'+ctr+']').attr('data-val', '');
   	$('#product-category'+ctr).empty();
   	var cat_name = 'category'+ctr; 
   	var cat_main_name = 'category_id'+ctr; 	
   	var cat_sub_name = 'sub_category'+ctr;
   	var sub_cat_div = 'product-category'+ctr;
   	var cat_hidden_val = cat_hid_arr; //$('tr#ddl'+ctr+' > td.cat > input#input-category-main').attr('name', 'category_id'+ctr).val();
   	autocompletecat(cat_name, cat_main_name, cat_hidden_val, ctr);
   	autocompletesubcat(cat_sub_name, cat_main_name, sub_cat_div)
       }
   });
   
   
   /*$("input").keyup(function(){
       var lgt = $(this).val().length;   
   	if (lgt == 0) { 
   	//alert(lgt);
   		$("#input-category-main").val('');
   		$("#product-category").empty();
   	};
   });*/
   
   function inputsKeyup(value) {
   	var lgt = $(value).val().length; 
   	var value1 = $(value).data('cat');
   	if (lgt == 0) {
   		$('input[name=category_id'+value1+']').val('');
   		$("#product-category"+value1).empty();
   	};
   	
   }
    // Category
    function autocompletecat(cat_name, cat_main_name, cat_hidden_val, ctr) {
   	$('input[name='+cat_name+']').autocomplete({
   		'source': function(request, response) {
   			$.ajax({
   				url: 'index.php?route=sellerprofile/sellerprofile/category_autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
   				dataType: 'json',
   				success: function(json) {				
   					response($.map(json, function(item) {
   						if($.inArray(item['category_id'], cat_hidden_val) == -1) {
   							return {
   								label: item['name'],
   								value: item['category_id']
   							}
   						}
   					}));					
   				}
   			});
   		},
   		'select': function(item) {
   			$('input[name='+cat_name+']').val(item['label']);
   			$('input[name='+cat_main_name+']').val(item['value']);
   
   			$('input#hidden-category-main'+ctr).val(item['value']);
   			
   			//$('#product-category' + item['value']).remove();
   
   			
   		}
   		//if(item['category_id'] != cat_hidden_val) {
   					  // alert(item['category_id']);
   		
   	});
   }
   
   var count = $("#cats tbody").find(".extra").length;
   var cat_val = '';
   for(var i=0; i<count; i++){	
   	if(count == 1) {
   		cat_val = $("#cats tbody .extra input").first().attr('name');
   		var cat_val_new = 'category';
   		var cat_id= 'category_id';
   		var sub_cat_id= 'sub_category';
   		var product_cat_id= 'product-category';
   		category1(cat_val_new, cat_id);
   		subcategory1(sub_cat_id, product_cat_id, cat_id);
   	} else {
   		cat_val = $("#cats tbody .extra input").first().attr('name');
   		var cat_val_new = 'category'+i;
   		var cat_id= 'category_id'+i;
   		var sub_cat_id= 'sub_category'+i;
   		var product_cat_id= 'product-category'+i;
   		category1(cat_val_new, cat_id);
   		subcategory1(sub_cat_id, product_cat_id, cat_id);
   	}
   }
   
   function category1(cat_val, cat_id) {
   	$('input[name='+cat_val+']').autocomplete({
   		'source': function(request, response) {
   			$.ajax({
   				url: 'index.php?route=sellerprofile/sellerprofile/category_autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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
   			$('input[name='+cat_val+']').val(item['label']);
   			$('input[name='+cat_id+']').val(item['value']);
   			$('input[name=\'sub_category\']').attr("data-val", item['value']);
   			$('input#hidden-category-main').val(item['value']);
   			//$('#product-category' + item['value']).remove();
   			
   			//$('tr#cat-rows > td.cat').append('<input type="hidden" name="category_ids[]" value="' + item['value'] + '" />');		
   		}
   		
   	});
   }
   $('input[name=\'category\']').autocomplete({
   	'source': function(request, response) {
   	var cat_hidden = [];
   	$('tr>td>input#input-category-main').each(function() {		
   		var cat_arr = $(this).val();	
   		 cat_hidden.push(cat_arr);		
   	});
   	cat_hid_arr = $.unique(cat_hidden);
   	var cat_hidden_val = cat_hid_arr;
   		$.ajax({
   			url: 'index.php?route=sellerprofile/sellerprofile/category_autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
   			dataType: 'json',
   			success: function(json) {
   				response($.map(json, function(item) {
   				if($.inArray(item['category_id'], cat_hidden_val) == -1) {
   					return {
   						label: item['name'],
   						value: item['category_id']
   					}
   				}
   				}));
   			}
   		});
   	},
   	'select': function(item) {
   		$('input[name=\'category\']').val(item['label']);
   		$('input[name=\'category_id\']').val(item['value']);
   		$('input[name=\'sub_category\']').attr("data-val", item['value']);
   		$('input#hidden-category-main').val(item['value']);
   		//$('#product-category' + item['value']).remove();
   		
   		//$('tr#cat-rows > td.cat').append('<input type="hidden" name="category_ids[]" value="' + item['value'] + '" />');		
   	}
   	
   });
   
   $('input[name=\'sub_category\']').autocomplete({
   	'source': function(request, response) {	
   		var path_id = $('input[name=\'category_id\']').val();	
   		$.ajax({
   			url: 'index.php?route=sellerprofile/sellerprofile/sub_category_autocomplete&token=<?php echo $token; ?>&path_id=' + path_id + '&filter_name=' +  encodeURIComponent(request),
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
   	'select': function(item, path_id) {
   		$('input[name=\'sub_category\']').val('');
   
   		$('#product-category' + item['value']).remove();
   		var cat_id = $(this).attr("data-val");
   		$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
   	}
   	
   });
   
   // Sub Category
   function autocompletesubcat(cat_sub_name, cat_main_name, sub_cat_div) {
   	$('input[name='+cat_sub_name+']').autocomplete({
   		'source': function(request, response) {
   		if($(this).attr("data-val") != '') {
   			var path_id = $(this).attr("data-val");
   		} else {
   			var path_id = $('input[name='+cat_main_name+']').val();
   		}
   		//alert(path_id);
   			$.ajax({
   				url: 'index.php?route=sellerprofile/sellerprofile/sub_category_autocomplete&token=<?php echo $token; ?>&path_id=' + path_id + '&filter_name=' +  encodeURIComponent(request),
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
   			$('input[name='+cat_sub_name+']').val('');
   
   			$('#product-category' + item['value']).remove();
   
   			$('#'+sub_cat_div).append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle" onclick="$("#"+sub_cat_div).remove();"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
   		}
   		
   	});
   }
   
   function subcategory1(sub_cat_id, product_cat_id, cat_id) {
   	$('input[name='+sub_cat_id+']').autocomplete({
   		'source': function(request, response) {
   		if($(this).attr("data-val") != '') {
   			var path_id = $(this).attr("data-cateid");
   		} else {
   			var path_id = $('input[name='+cat_id+']').val();
   		}	
   		
   			$.ajax({
   				url: 'index.php?route=sellerprofile/sellerprofile/sub_category_autocomplete&token=<?php echo $token; ?>&path_id=' + path_id + '&filter_name=' +  encodeURIComponent(request),
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
   		'select': function(item, path_id) {
   			$('input[name='+sub_cat_id+']').val('');
   
   			$('#product-category' + item['value']).remove();
   			var cat_id = $(this).attr("data-val");
   			$('#'+product_cat_id).append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
   		}
   		
   	});
   }
   
   
   
   		
   	
   $('.well').delegate('.fa-minus-circle', 'click', function() {
   	//$('.fa-minus-circle').click(function(){
   	$(this).parent().remove();
   
   	//alert($(this).parent());
   
   });
   
   $('#button-portals-save').on('click', function(e) {//alert(5345);
   	$.ajax({
   	    type: "POST",
   	    url: 'index.php?route=sellerprofile/sellerprofile/store_portal',
   	    data: $('#store_portals_fm').serialize(),
   	    success: function(data) {
   		//alert(data);
   		$('.portal_alert').html('');
     if (data['success']) {
   $('.portal_alert').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i>'  + data['success'] + '</div>');
   $('#store_portals').scrollTop(0);
     }
     if(data['error']) {
   $('.portal_alert').html('<div class="alert alert-danger"><i class="fa fa-check-circle"></i>'  + data['error'] + '</div>');
   $('#store_portals').scrollTop(0);
     }
   	    }
   	  });
   });
   
   $('#button-refer-save').on('click', function(e) {//alert(235);
   if (document.getElementById('agree_bank').checked) {
    agree_value = document.getElementById('agree_bank').value;
    refer_mobile_val = document.getElementById('refer_mobile').value;
    if(agree_value == 'agree') {
   $.ajax({
      type: "POST",
      url: 'index.php?route=sellerprofile/sellerprofile/store_refer',
      data: $('#store_referred_frm').serialize(),
      success: function(json) {
   $('#val_ref_tt').html('');
    if (json['success']) {
   //$('#val_ref_tt').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i>'  + json['success'] + '</div>');
   //$('#store_referred').scrollTop(0);
   if(refer_mobile_val == json['success']) {
   $('#input-referred-by-val').val('');
   //$('.referrer-fom-build').css("display", "none");
   //$('.referrer-fom-build-shown').css("display", "block");
   //$('#ref-val-display').html(json['success']);
   $('#input-referred-by-val').val(json['success']);
   //document.getElementById('#store_referred_frm').reset();
   $('#store_referred').modal('toggle');
   }
    }
    if(json['error']) {
   $('#val_ref_tt').html('<div class="alert alert-danger"><i class="fa fa-check-circle"></i>'  + json['error'] + '</div>');
   $('#store_referred').scrollTop(0);
    }
      }
    });
    }
   } else {
    $('#val_ref_tt').html('');
    $('#val_ref_tt').html('<div class="alert alert-danger"><i class="fa fa-check-circle"></i>Please agree to terms and save.</div>');
    $('#store_referred').scrollTop(0);
   }
   	
   });
   
   
   $('#button-feature-save').on('click', function(e) {
   	$.ajax({
   	    type: "POST",
   	    url: 'index.php?route=sellerprofile/sellerprofile/feature_store',
   	    data: $('#store-feature').serialize(),
   	    success: function(data) {
   		//alert(data);
   		window.location.reload();
   	    }
   	  });
   });
   
   $('#button-cat-subcat-save').on('click', function(e) {
   	$.ajax({
   	    type: "POST",
   	    url: 'index.php?route=sellerprofile/sellerprofile/categories_subcategories_store',
   	    data: $('#form-categories').serialize(),
   	    success: function(data) {
   		//alert(data);
		$('#store_cat').modal('toggle');
   	    }
   	  });
   });
   
   $('#clear_counter').on('click', function(e) {
   	$.ajax({
   	    type: "POST",
   	    url: 'index.php?route=sellerprofile/sellerprofile/clear_visitor_counter',
   	    success: function(data) {
   	    if(data['success'] == 0) {
   		//alert(data['success']);
   		$('#manage_counter').html('');
   		$('#manage_counter').html(data['succes']);
   	    }
   	    }
   	  });
   });
</script>
<script type="text/javascript"><!--
   var image_row = <?php echo $image_row; ?>;
   
   function addImage() {//alert("test");
   	html  = '<tr id="image-row' + image_row + '">';
   	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" class="imgae_empty_check" name="store_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
   	html += '  <td class="text-right"><input type="text" name="store_image[' + image_row + '][sort_order]" value="" placeholder="Sort Order" class="form-control" /></td>';
   	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" class="--minus-btn">-</button></td>';
   	html += '</tr>';
   
   	$('#images tbody').append(html);
   
   	image_row++;
   }
   //-->
</script>
<script type="text/javascript"><!--
   var store_mobile_num_row = <?php echo $store_mobile_num_row; ?>;
   
   function addStoreMobile() {//alert("test");
   	html = '<div id="ad_mob' + store_mobile_num_row + '" class="row">';
   	html += '<div class="col-sm-2">';
   	html += '</div>';
   	html += '<div class="col-sm-8 addition-mobile ' + store_mobile_num_row + '">';	
   	html += '  <input type="text" name="store_mobile_num[]" value="" placeholder="Store/Entity mobile number" class="form-control mat--lt" />';
   	html += '</div>';  
   	html += '<div class="col-sm-2 addition-mobile">';	
   	html += '  <span class="text-left"><button type="button" onclick="$(\'#ad_mob' + store_mobile_num_row  + '\').remove();" class="--minus-btn">-</button></span>';
   	html += '</div>';
   	html += '</div>';
   
   	$('#str_mob').append(html);
   
   	store_mobile_num_row++;
   }
   //-->
</script>
<script type="text/javascript"><!--
   var store_ll_num_row = <?php echo $store_ll_num_row; ?>;
   
   function addStoreLandLine() {//alert("test");
   	html = '<div id="ad_ll' + store_ll_num_row + '" class="row">';
   	html += '<div class="col-sm-2">';
   	html += '</div>';
   	html += '<div class="col-sm-2 addition-mobile ' + store_ll_num_row + '">';	
   	html += '  <input type="text" maxlength="5" name="store_ll_code[]" value="" placeholder="Store/Entity STD code" class="form-control mat--lt" />';
   	html += '</div>';
   	html += '<div class="col-sm-6 addition-mobile ' + store_ll_num_row + '">';	
   	html += '  <input type="text" maxlength="10" name="store_ll_num[]" value="" placeholder="Store/Entity landline number" class="form-control mat--lt" />';
   	html += '</div>';  
   	html += '<div class="col-sm-2 addition-mobile">';	
   	html += '  <span class="text-left"><button type="button" onclick="$(\'#ad_ll' + store_ll_num_row  + '\').remove();" class="--minus-btn">-</button></span>';
   	html += '</div>';
   	html += '</div>';
   
   	$('#str_ll').append(html);
   
   	store_mobile_num_row++;
   }
   //-->
</script>
<script type="text/javascript">
   <!--
   $('#badge').delegate('.pagination a', 'click', function(e) {
     e.preventDefault();
   
     $('#badge').load(this.href);
   });
   
   $('#badge').load('index.php?route=sellerprofile/sellerprofile/badge&seller_id=<?php echo $seller_id; ?>');
   
   $('#button-badge').on('click', function(e) {
     e.preventDefault();
   
     $.ajax({
       url: 'index.php?route=sellerprofile/sellerprofile/badge&seller_id=<?php echo $seller_id; ?>',
       type: 'post',
       dataType: 'html',
       data: 'comment=' + encodeURIComponent($('#tab-badge textarea[name=\'comment\']').val()),
       beforeSend: function() {
         $('#button-badge').button('loading');
       },
       complete: function() {
         $('#button-badge').button('reset');
       },
       success: function(html) {
         $('.alert').remove();
   
         $('#badge').html(html);
   
         $('#tab-badge textarea[name=\'comment\']').val('');
       }
     });
   });
   //-->
</script>
<script type="text/javascript"> 

	$(document).ready(function(){
		var tab_class = "<?php echo (isset($_GET['tab_section']) && $_GET['tab_section'] !='') ? $_GET['tab_section'] : '';  ?>";
		if(tab_class == 'product') {
			$('#pre_loaderr').show();
			$('#sellerproduct').load('index.php?route=sellerprofile/sellerprofile/sellerproduct&seller_id=<?php echo $seller_id; ?>');
			$('#pre_loaderr').delay(10000).fadeOut(5000);
		}
	});
		
   
   $('.sellerproduct').on('click', function () {
   $('#pre_loaderr').show();
   $('#sellerproduct').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   $('#sellerproduct').load(this.href);
   });
   $('#sellerproduct').load('index.php?route=sellerprofile/sellerprofile/sellerproduct&seller_id=<?php echo $seller_id; ?>');
   $('#pre_loaderr').delay(10000).fadeOut(5000);
   });
   
   
   
   $('#button-sellerproduct').on('click', function(e) {
     e.preventDefault();
   
     $.ajax({
       url: 'index.php?route=sellerprofile/sellerprofile/sellerproduct&seller_id=<?php echo $seller_id; ?>',
       type: 'post',
       dataType: 'html',
       data: 'comment=' + encodeURIComponent($('#tab-sellerproduct textarea[name=\'comment\']').val()),
       beforeSend: function() {
         $('#button-sellerproduct').button('loading');
       },
       complete: function() {
         $('#button-sellerproduct').button('reset');
       },
       success: function(html) {
         $('.alert').remove();
   
         $('#sellerproduct').html(html);
   
         $('#tab-sellerproduct textarea[name=\'comment\']').val('');
       }
     });
   });
   //-->
</script>
<script type="text/javascript">
   $(document).ready(function(){
   var target = $('#tab_store_ad a[data-toggle="tab"]').attr("href") // activated tab		
   target1 = target.replace('#','.');
   if(target1 != '') {
   $('#sellerdraft').load('index.php?route=sellerprofile/sellerprofile/selleradvertisedraft&seller_id=<?php echo $seller_id; ?>');   
   }
   });
   var tab_class = "<?php echo (isset($_GET['inner_store']) && $_GET['inner_store'] !='') ? $_GET['inner_store'] : '';  ?>";
   //var tab_class = "<?php //echo $_GET['inner_store']; ?>";
   //draft =  "$('."+draft+"')";
   //alert(tab_class);		
   if(tab_class !='') {			
    $('#seller'+tab_class).delegate('.pagination a', 'click', function(e) {
     e.preventDefault();		  
     $('#seller'+tab_class).load(this.href);
    }); 
    if(tab_class == 'yet_to_live') {
   $('#seller'+tab_class).load('index.php?route=sellerprofile/sellerprofile/selleradvertisepaid&seller_id=<?php echo $seller_id; ?>');
    } else {
     $('#seller'+tab_class).load('index.php?route=sellerprofile/sellerprofile/selleradvertise'+tab_class+'&seller_id=<?php echo $seller_id; ?>');
    }
   }
   
      $('.tab_store_ad').on('click', function () {
      $( ".draft" ).trigger( "click" );
      $('#pre_loaderr').show();
   $('#sellerdraft').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   $('#sellerdraft').load(this.href);
   });		  
   $('#sellerdraft').load('index.php?route=sellerprofile/sellerprofile/selleradvertisedraft&seller_id=<?php echo $seller_id; ?>');   
   $('#pre_loaderr').hide();
      });
   
      $('.draft').on('click', function () {
      $('#pre_loaderr').show();
     $('#sellerdraft').delegate('.pagination a', 'click', function(e) {
   	e.preventDefault();
   	$('#sellerdraft').load(this.href);
     });		  
     $('#sellerdraft').load('index.php?route=sellerprofile/sellerprofile/selleradvertisedraft&seller_id=<?php echo $seller_id; ?>'); 
     $('#pre_loaderr').hide();
      }); 
    
</script>
<script type="text/javascript">
   $('.submitted').on('click', function () {
   $('#pre_loaderr').show();
   $('#sellersubmitted').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();		  
   $('#sellersubmitted').load(this.href);
   });		  
   $('#sellersubmitted').load('index.php?route=sellerprofile/sellerprofile/selleradvertisesubmitted&seller_id=<?php echo $seller_id; ?>');      
   $('#pre_loaderr').hide();
   });
</script>
<script type="text/javascript">
   $('.approved').on('click', function () {
   $('#pre_loaderr').show();
   $('#sellerapproved').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   
   $('#sellerapproved').load(this.href);
   });
   
   $('#sellerapproved').load('index.php?route=sellerprofile/sellerprofile/selleradvertiseapproved&seller_id=<?php echo $seller_id; ?>');
   $('#pre_loaderr').hide();
   });
</script>
<script type="text/javascript">
   $('.rejected').on('click', function () {
   $('#pre_loaderr').show();
   $('#sellerrejected').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   
   $('#sellerrejected').load(this.href);
   });
   
   $('#sellerrejected').load('index.php?route=sellerprofile/sellerprofile/selleradvertiserejected&seller_id=<?php echo $seller_id; ?>');      
   $('#pre_loaderr').hide();
   });
</script>
<script type="text/javascript">
   $('.yet_to_live').on('click', function () {
   $('#pre_loaderr').show();
   $('#selleryet_to_live').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   
   $('#selleryet_to_live').load(this.href);
   });
   
   $('#selleryet_to_live').load('index.php?route=sellerprofile/sellerprofile/selleradvertisepaid&seller_id=<?php echo $seller_id; ?>');      
   $('#pre_loaderr').hide();
   });
</script>
<script type="text/javascript">
   $('.live').on('click', function () {
   $('#pre_loaderr').show();
   $('#sellerlive').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   
   $('#sellerlive').load(this.href);
   });
   
   $('#sellerlive').load('index.php?route=sellerprofile/sellerprofile/selleradvertiselive&seller_id=<?php echo $seller_id; ?>');     
   $('#pre_loaderr').hide();
   });
</script>
<script type="text/javascript">
   $('.archive').on('click', function () {
   $('#pre_loaderr').show();
   $('#sellerarchive').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   
   $('#sellerarchive').load(this.href);
   });
   
   $('#sellerarchive').load('index.php?route=sellerprofile/sellerprofile/selleradvertisearchive&seller_id=<?php echo $seller_id; ?>');     
    $('#pre_loaderr').hide();
     });
</script>
<script type="text/javascript">
   $('.trash').on('click', function () {
   $('#pre_loaderr').show();
   $('#sellertrash').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   
   $('#sellertrash').load(this.href);
   });
   
   $('#sellertrash').load('index.php?route=sellerprofile/sellerprofile/selleradvertisetrash&seller_id=<?php echo $seller_id; ?>');     
   $('#pre_loaderr').hide();
   });
</script>
<script type="text/javascript">
   $('.wallet').on('click', function () {
   $('#sellerwallet').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   
   $('#sellerwallet').load(this.href);
   });
   
   $('#sellerwallet').load('index.php?route=sellerprofile/sellerprofile/selleradvertisewallet&seller_id=<?php echo $seller_id; ?>');     
   
   });
   $('#sellerwallet').load('index.php?route=sellerprofile/sellerprofile/selleradvertisewallet&seller_id=<?php echo $seller_id; ?>'); 
</script>
<script type="text/javascript">
   $('.expense').on('click', function () {
   $('#sellerexpense').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   
   $('#sellerexpense').load(this.href);
   });
   
   $('#sellerexpense').load('index.php?route=sellerprofile/sellerprofile/selleradvertiseexpense&seller_id=<?php echo $seller_id; ?>');     
   
   });
   $('#sellerexpense').load('index.php?route=sellerprofile/sellerprofile/selleradvertiseexpense&seller_id=<?php echo $seller_id; ?>');
</script>
<script type="text/javascript">
   <!--
   $('#bankaccount').load('index.php?route=bankaccount/bankaccount&profile=<?php echo $seller_id; ?>');
   $('#history').load('index.php?route=sellerprofile/sellerprofile/history&seller_id=<?php echo $seller_id; ?>');
   
   $('#button-history').on('click', function(e) {
     e.preventDefault();
   
     $.ajax({
       url: 'index.php?route=sellerprofile/sellerprofile/history&seller_id=<?php echo $seller_id; ?>',
       type: 'post',
       dataType: 'html',
       data: 'comment=' + encodeURIComponent($('#tab-history textarea[name=\'comment\']').val()),
       beforeSend: function() {
         $('#button-history').button('loading');
       },
       complete: function() {
         $('#button-history').button('reset');
       },
       success: function(html) {
         //$('.alert').remove();
   
         $('#history').html(html);
   
         $('#tab-history textarea[name=\'comment\']').val('');
       }
     });
   });
   //-->
</script>
<script type="text/javascript">
   <!--
   $('#transaction').delegate('.pagination a', 'click', function(e) {
     e.preventDefault();
   
     $('#transaction').load(this.href);
   });
   
   $('#transaction').load('index.php?route=sellerprofile/sellerprofile/transaction&seller_id=<?php echo $seller_id; ?>');
   
   $('#button-transaction').on('click', function(e) {
     e.preventDefault();
   
     $.ajax({
       url: 'index.php?route=sellerprofile/sellerprofile/transaction&seller_id=<?php echo $seller_id; ?>',
       type: 'post',
       dataType: 'html',
       data: 'seller_group_id=' + encodeURIComponent($('#tab-transaction select[name=\'seller_group_id\']').val()) + '&amount=' + encodeURIComponent($('#tab-transaction input[name=\'amount\']').val()),
       beforeSend: function() {
         $('#button-transaction').button('loading');
       },
       complete: function() {
         $('#button-transaction').button('reset');
       },
       success: function(html) {
         $('.alert').remove();
   
         $('#transaction').html(html);
   
         $('#tab-transaction input[name=\'amount\']').val('');
         $('#tab-transaction input[name=\'description\']').val('');
       }
     });
   });
   //-->
</script>
<script type="text/javascript">
   <!--
   $('#request_membership').delegate('.pagination a', 'click', function(e) {
     e.preventDefault();
   
     $('#request_membership').load(this.href);
   });
   
   $('#request_membership').load('index.php?route=sellerprofile/sellerprofile/request_membership&seller_id=<?php echo $seller_id; ?>');
   
   $('#button-request_membership').on('click', function(e) {
     e.preventDefault();
     if ($('#tab-request_membership input[name=\'agree\']').prop('checked')) {
       var seller_group_id = $('#tab-request_membership input[name=\'selected\']:checkbox:checked').val();
       $.ajax({
         url: 'index.php?route=sellerprofile/sellerprofile/request_membership&seller_id=<?php echo $seller_id; ?>',
         type: 'POST',
         dataType: 'html',
         data: $('#tab-request_membership .scrollbox-' + seller_group_id + ' input[name=\'seller_category[]\']').serialize() + '&seller_group_name=' + encodeURIComponent($(
             '#tab-request_membership input[name=\'selected\']:checkbox:checked').attr("id")) + '&description=' + encodeURIComponent($('#tab-request_membership input[name=\'description\']').val()) + '&seller_group_id=' +
           encodeURIComponent($('#tab-request_membership input[name=\'selected\']:checkbox:checked').val()),
         beforeSend: function() {
           $('#button-request_membership').button('loading');
         },
         complete: function() {
           $('#button-request_membership').button('reset');
         },
         success: function(html) {
   
           $('#request_membership').html(html);
   
           $('#tab-request_membership input[name=\'points\']').val('');
           $('#tab-request_membership input[name=\'description\']').val('');
         }
       });
   
   
   
     } else {
       var text_seller_agree = '<?php echo $text_seller_agree; ?>';
   
       $('#request_membership').prepend('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + text_seller_agree + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
     }
   });
   
   //-->
</script>
<script type="text/javascript">
   <!--
   $('#button-request_membership').attr("disabled", "disabled");
   // the selector will match all input controls of type :checkbox
   // and attach a click event handler
   $(".text-center input:checkbox").on('click', function() {
     // in the handler, 'this' refers to the box clicked on
     var $box = $(this);
     if ($box.is(":checked")) {
       $('#button-request_membership').removeAttr('disabled');
      
       var group = "input:checkbox[name='" + $box.attr("name") + "']";
       
       $(group).prop("checked", false);
       $box.prop("checked", true);
     } else {
       $('#button-request_membership').attr("disabled", "disabled");
       $box.prop("checked", false);
     }
   });
   
   // Image Manager
   $(document).delegate('a[data-toggle=\'image\']', 'click', function(e) {
     e.preventDefault();
   
     var element = this;
   
     $(element).popover({
       html: true,
       placement: 'right',
       trigger: 'manual',
       content: function() {
         return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
       }
     });
   
     $(element).popover('toggle');
   
     $('#button-image').on('click', function() {
       $('#modal-image').remove();
   
       $.ajax({
         url: 'index.php?route=sellerproduct/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
         dataType: 'html',
         beforeSend: function() {
           $('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
           $('#button-image').prop('disabled', true);
         },
         complete: function() {
           $('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
           $('#button-image').prop('disabled', false);
         },
         success: function(html) {
           $('body').append('<div id="modal-image" class="modal">' + html + '</div>');
   
           $('#modal-image').modal('show');
         }
       });
   
       $(element).popover('hide');
     });
   
     $('#button-clear').on('click', function() {
       $(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));
   
       $(element).parent().find('input').attr('value', '');
   
       $(element).popover('hide');
     });
   });
   
   // banner Manager
   $(document).delegate('a[data-toggle=\'banner\']', 'click', function(e) {
     e.preventDefault();
   
     var element = this;
   
     $(element).popover({
       html: true,
       placement: 'right',
       trigger: 'manual',
       content: function() {
         return '<button type="button" id="button-banner" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
       }
     });
   
     $(element).popover('toggle');
   
     $('#button-banner').on('click', function() {
       $('#modal-image').remove();
   
       $.ajax({
         url: 'index.php?route=sellerproduct/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
         dataType: 'html',
         beforeSend: function() {
           $('#button-banner i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
           $('#button-banner').prop('disabled', true);
         },
         complete: function() {
           $('#button-banner i').replaceWith('<i class="fa fa-upload"></i>');
           $('#button-banner').prop('disabled', false);
         },
         success: function(html) {
           $('body').append('<div id="modal-image" class="modal">' + html + '</div>');
   
           $('#modal-image').modal('show');
         }
       });
   
       $(element).popover('hide');
     });
   
     $('#button-clear').on('click', function() {
       $(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));
   
       $(element).parent().find('input').attr('value', '');
   
       $(element).popover('hide');
     });
   });
   
   //-->
</script>
<script type="text/javascript">
   <!--
   $(document).delegate('#button-profile-save', 'click', function() {
   /*$('#agree_tt').change(function() {
   if($(this).is(":checked")) {
	$('input#agree').val('agree');
   } else {
	$('input#agree').val('not_agree');
   }
   });*/

   function convertToSlug(Text)
{
    return Text
        .toLowerCase()
        .replace(/[^\w ]+/g,'')
        .replace(/ +/g,'-')
        ;
}

	   //var term_agree = $('input#agree').val();
	   //var c = $('input[name="agree_tt"]:checked').length > 0;
	

	if ($('input[name="agree_tt"]').is(':checked')) {
	   var nickname = convertToSlug($('#input-nickname').val());
	   var db_nickname = convertToSlug("<?php echo $nickname; ?>");
	   var banner = convertToSlug($('#input-banner').val());
	   var db_banner = convertToSlug("<?php echo $banner; ?>");
	
			
	   var has_change = false;
		if(db_nickname != nickname) {
			has_change = true;
		}
		
		if(banner != '' && banner != db_banner){
			has_change = true;
		}
     
	   /*var cond = db_nickname != nickname;
	   if(banner != ''){
		cond = (db_nickname != nickname) || (db_banner != banner);
	   } */
	   if(has_change){
	   var modal = $('<div id="alert_pop_del" class="modal fade alert_prof_del_close" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>Are you sure want to save?</p><br/><p>- Please validate your store/entity map location before saving.<br/> - Any change in store/entity name and banner are subject to approval.</p></p></div><div class="modal-footer"><button class="btn store_prof_btn" >Yes</button><button class="btn" data-dismiss="modal" aria-hidden="true">No</button></div></div></div></div></div>');  
    
	   $('body').append(modal);
	     modal.modal({
	     show: true
	    })	    
	    $('.store_prof_btn').on('click', function(e) {
	    $('.alert_prof_del_close').modal('hide');
		   //if(confirm('If you update this detail. After web master approvel Your store will shown front pages')){
			   $.ajax({
			   url: 'index.php?route=sellerprofile/sellerprofile/profile&seller_id=<?php echo $seller_id; ?>',
			   dataType: 'json',
			   type: "POST",
			   data: $('#form-profile').serialize(),
			   beforeSend: function() {
			   $('#button-profile-save').button('loading');
			   },
			   complete: function() {
			   $('#button-profile-save').button('reset');
			    
			   $('#button-profile-save').addClass('btn-success');
			   $('#button-profile-save').removeClass('btn-primary');   
			   
			   //window.location.reload();
			    
			   },
			   success: function(json) {
			   $('.store_msg_alert').remove();
			    
			   if (json['error']) {
				 $('.agree_tt').attr('checked', false);
			     $('#content > .container-fluid').prepend('<div class="alert store_msg_alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			     $('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
			   }
			   else if (json['success']) {
				 $('.agree_tt').attr('checked', false);
			     $('#content > .container-fluid').prepend('<div class="alert store_msg_alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');
			     $('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
			   }
			   
			   },
			   error: function(xhr, ajaxOptions, thrownError) {
			   alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			   }		  
			   });
		   //} else {
			//window.location.reload();
		   //}
		   });

	   } else {
		   $.ajax({
		   url: 'index.php?route=sellerprofile/sellerprofile/profile&seller_id=<?php echo $seller_id; ?>',
		   dataType: 'json',
		   type: "POST",
		   data: $('#form-profile').serialize(),
		   beforeSend: function() {
		   $('#button-profile-save').button('loading');
		   },
		   complete: function() {
		   $('#button-profile-save').button('reset');
		    
		   $('#button-profile-save').addClass('btn-success');
		   $('#button-profile-save').removeClass('btn-primary');      
		    
		   },
		   success: function(json) {
		   $('.store_msg_alert').remove();
		    
		   if (json['error']) {
			 $('.agree_tt').attr('checked', false);
		     $('#content > .container-fluid').prepend('<div class="alert store_msg_alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');	
		     $('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
		   }
		   else if (json['success']) {
			 $('.agree_tt').attr('checked', false);
		     $('#content > .container-fluid').prepend('<div class="alert store_msg_alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');
		     $('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
		   }
		    
		   },
		   error: function(xhr, ajaxOptions, thrownError) {
		   alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		   }
		   });
	   }
   } else {
	$('.store_msg_alert').remove();
	$('#content > .container-fluid').prepend('<div class="alert store_msg_alert alert-danger"><i class="fa fa-exclamation-circle"></i>Please agree to the terms and conditions mentioned and then save.</div>');	
	$('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
   }
   });
   //-->
</script>
<script type="text/javascript">
   <!--
   $(document).delegate('#button-image-save', 'click', function() {
   var imge_first_val = $('.imgae_empty_check').val();
   if(imge_first_val) {
   //alert($('#input-image0').val());
     $.ajax({
       url: 'index.php?route=sellerprofile/sellerprofile/storeimage&seller_id=<?php echo $seller_id; ?>',
       dataType: 'json',
       data: $('#form-image').serialize(),
       beforeSend: function() {
         $('#button-image-save').button('loading');
       },
       complete: function() {
         $('#button-image-save').button('reset');
   
         $('#button-image-save').addClass('btn-success');
         $('#button-image-save').removeClass('btn-primary');
	   //$("#store_images").removeClass('in');
	   //$("#store_images").hide();	 
	   $('#store_images').modal('toggle');
   
       },
       success: function(json) {
         $('.alert').remove();
   
         if (json['error']) {
           $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
         }
   
       },
       error: function(xhr, ajaxOptions, thrownError) {
         alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
       }
     });
     } else { 
	var modal = $('<div id="alert_pop_del_empty" class="modal fade alert_prof_del_close" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>Please select atleast one image.</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">ok</button></div></div></div></div></div>');  
    
	   $('body').append(modal);
	     modal.modal({
	     show: true
	    })	 
	//alert("Please select atleadt one image...");
     }
   });
   //-->
</script>
<script type="text/javascript">
   $('#button-clear').on('click', function() {
     $(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));
   
     $(element).parent().find('input').attr('value', '');
   
     $(element).popover('hide');
   });
   
</script>
<script type="text/javascript">
   $(".allow-prod-cart").change(function() {
   var ischecked= $(this).is(':checked');
     if(!ischecked) {
   var valt = 0;
   var valt_title = $(this).val();
     }
       //alert('uncheckd ' + $(this).val());
     if(ischecked) {
   var valt = 1;
   var valt_title = $(this).val();
     }
       //alert('checkd ' + $(this).val());
     $.ajax({
     type: "POST",
     url: 'index.php?route=sellerprofile/sellerprofile/allow_products_cart&valt='+ valt +'&valt_title='+ valt_title,
     //data: $('#store-timings').serialize(),
     success: function(data) {
   alert(data['success']);
   //window.location.reload();
     }
   });
   }); 
</script>
<!--<script type="text/javascript">
   /*
    * Google Maps: Latitude-Longitude Finder Tool
    * http://salman-w.blogspot.com/2009/03/latitude-longitude-finder-tool.html
    */
   function loadmap_st() {
   	// initialize map
   	if(document.getElementById("latitude_st").value != ''){
   		var map = new google.maps.Map(document.getElementById("map-canvas"), {				
   			center: new google.maps.LatLng(document.getElementById("latitude_st").value, document.getElementById("longitude_st").value),
   			zoom: 13,
   			mapTypeId: google.maps.MapTypeId.ROADMAP
   		});
   	} else {
   		var map = new google.maps.Map(document.getElementById("map-canvas_st"), {				
   			center: new google.maps.LatLng(13.072087, 80.262777),
   			zoom: 10,
   			mapTypeId: google.maps.MapTypeId.ROADMAP
   		});	
   	}
   	// initialize marker
   	var marker = new google.maps.Marker({
   		position: map.getCenter(),
   		draggable: true,
   		map: map
   	});
   	// intercept map and marker movements
   	google.maps.event.addListener(map, "idle", function() {
   		marker.setPosition(map.getCenter());
   		document.getElementById("latitude_st").value = map.getCenter().lat().toFixed(6);
   		document.getElementById("longitude_st").value = map.getCenter().lng().toFixed(6);
   	});
   	google.maps.event.addListener(marker, "dragend", function(mapEvent) {
   		map.panTo(mapEvent.latLng);
   	});
   	// initialize geocoder
   	var geocoder = new google.maps.Geocoder();
   	google.maps.event.addDomListener(document.getElementById("search-btn_st"), "click", function() {
   		geocoder.geocode({ address: document.getElementById("search-txt_st").value }, function(results, status) {
   			if (status == google.maps.GeocoderStatus.OK) {
   				var result = results[0];
   				document.getElementById("search-txt_st").value = result.formatted_address;
   				if (result.geometry.viewport) {
   					map.fitBounds(result.geometry.viewport);
   				} else {
   					map.setCenter(result.geometry.location);
   				}
   			} else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
   				alert("Sorry, geocoder API failed to locate the address.");
   			} else {
   				alert("Sorry, geocoder API failed with an error.");
   			}
   		});
   	});
   	google.maps.event.addDomListener(document.getElementById("search-txt"), "keydown", function(domEvent) {
   		if (domEvent.which === 13 || domEvent.keyCode === 13) {
   			google.maps.event.trigger(document.getElementById("search-btn"), "click");
   		}
   	});
   	// initialize geolocation
   	if (navigator.geolocation) {
   		google.maps.event.addDomListener(document.getElementById("detect-btn"), "click", function() {
   			navigator.geolocation.getCurrentPosition(function(position) {
   				map.setCenter(new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
   			}, function() {
   				alert("Sorry, geolocation API failed to detect your location.");
   			});
   		});
   		document.getElementById("detect-btn").disabled = false;
   	}
   }
   </script>
   <script src="//maps.googleapis.com/maps/api/js?v=3&amp;sensor=false&amp;key=AIzaSyCd8_dkSlkxLyjEb0vv8AC6_zX6P7ios2g&amp;callback=loadmap_st" defer></script>
   <style>
          #map-search_st { position: absolute; top: 10px; left: 10px; right: 10px; }
          #search-txt_st { float: left; width: 73%; }
          #search-btn_st { float: left; width: 27%; }
          #detect-btn_st { float: right; width: 19%; }
          #map-canvas_st { position: sticky !important; top: 10px; bottom: 65px; left: 10px; right: 10px; width: 100%; height: 450px;}
          #map-output_st { position: absolute; bottom: 10px; left: 10px; right: 10px; }
          #map-output_st a { float: right; }
          .addlinks {
          border-bottom: 1px solid #ccc;
          margin: 0 auto;
          /*width: 67%;*/
          }
          /*.update_cancel {
          border: 0 none;
          left: 9%;
          position: absolute;
          top: 97%;
          }*/
          .btn12 {
          bottom: 0;
          left: 26%;
          position: relative;
          right: 0;
          /*top: -71px;*/
          }
       </style>-->
<?php
   if(isset($_COOKIE['myCookie'])){
    	$cookie = $_COOKIE['myCookie'];
    	$cookie_res = explode(',',$cookie);
    	$latitude = $cookie_res[0];
    	$longitude = $cookie_res[1];
    } else {
    	$latitude = '13.067439';
    	$longitude = '80.237617';
    }
   echo "<script>\n";
   echo "var lat_st = " . $latitude . ";\n";
   echo "var log_st = " . $longitude . ";\n";
   //echo "alert(log_st);";
   echo "$('#latitude_st').val(lat_st);";
   echo "$('#longitude_st').val(log_st);";
   echo "</script>\n";
   ?>
<script>
   var lat_st = "<?php echo $latitude; ?>";
   var log_st = "<?php echo $longitude; ?>";
   $('#latitude_st').val(lat_st);
   $('#longitude_st').val(log_st);
</script>
<script>
   $(document).on('click', '.print_me', function(e) {
   var data_id = $(this).data('id');
   var content = document.getElementById('print_me_qr_'+data_id).innerHTML;
   var win = window.open();	
   //win.document.write('<link href="css/style_v1.css" rel="stylesheet">');
   //win.document.write('<link href="core/framework/libs/pj/css/pj-table.css" rel="stylesheet" type="text/css" />');			
   win.document.write(content);	
   win.print();			
   });
</script>
</div>
</div>
<?php echo $footer; ?>