<?php echo $header; ?>
<div class="container-fluid mainn-topp-ress">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i>
    <?php echo $success; ?>
  </div>
  <?php } ?>
  <div class="row">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-md-4'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> seller--prof-pg">
      <?php echo $content_top; ?>
      <div class="container-fluid main--side--red profileBox">
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
        <a href="" id="openTermsOfUse" style="margin-left: 20px"><u>Terms of service.</u></a>
        <div id="terms_of_use" class="modal fade" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title"><u>Terms of service</u></h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <table>
                      <tr>
                        <td>1.&nbsp&nbsp</td>
                        <td><?php echo $terms_of_service_1; ?></td>
                      </tr><tr><td></td><td></td></tr>
                      <tr>
                        <td>2.&nbsp&nbsp</td>
                        <td><?php echo $terms_of_service_2; ?></td>
                      </tr>
                      <tr>
                        <td>3.&nbsp&nbsp</td>
                        <td><?php echo $terms_of_service_3; ?></td>
                      </tr>
                      <tr>
                        <td>4.&nbsp&nbsp</td>
                        <td><?php echo $terms_of_service_4; ?></td>
                      </tr>
                      <tr>
                        <td>5.&nbsp&nbsp</td>
                        <td><?php echo $terms_of_service_5; ?></td>
                      </tr>
                      <tr>
                        <td>6.&nbsp&nbsp</td>
                        <td><?php echo $terms_of_service_6; ?></td>
                      </tr>
                      <tr>
                        <td>7.&nbsp&nbsp</td>
                        <td><?php echo $terms_of_service_7; ?></td>
                      </tr>
                      <tr>
                        <td>8.&nbsp&nbsp</td>
                        <td><?php echo $terms_of_service_8; ?></td>
                      </tr>
                  </table>
                </div>
              </div>
              <div class="modal-footer">
                <input type="checkbox" name="read_terms" id="terms_read" value="1"/>
                <label for="terms_read">I read and will abide the terms strictly.&nbsp&nbsp&nbsp</label>
                <button type="button" class="btn btn-primary" id="btnTermsReadOk" disabled>Ok</button>
              </div>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-body">
            <ul class="nav nav-tabs fixme _bon_ts" style="z-index:123;    background-color: #f1f1f1 !important; background:  none repeat scroll 0 0;">
              <?php if ($is_seller) { ?>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'profile'){ echo 'active'; }?>">
                <a href="#tab-profile_details" data-toggle="tab">
                  <?php //echo $tab_profile_details; ?> My Profile
                </a>
              </li>
              <?php if($login_type == 'seller') { ?>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'store_detail'){ echo 'active'; }?>">
                <a href="#tab-more_details" data-toggle="tab">
                  <?php //echo $tab_more_details; ?> Store/Entity detail
                </a>
              </li>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'product'){ echo 'active'; }?>">
                <a class="sellerproduct" href="#tab-sellerproduct" data-toggle="tab">
                  <?php //echo $tab_sellerproduct; ?> Products
                </a>
              </li>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'store'){ echo 'active'; }?>">
                <a class="tab_store_ad" href="#tab_store_ad" data-toggle="tab">
                        Advertisements
                        </a>
              </li>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'qr_code'){ echo 'active'; }?>">
                <a class="tab_qr_code" href="#tab_qr_code" data-toggle="tab">
                        QR-code
                        </a>
              </li>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'order'){ echo 'active'; }?>">
                <a class="tab_review" href="<?php echo $order_edit; ?>">
                        Orders
                        </a>
              </li>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'review'){ echo 'active'; }?>">
                <a class="tab_review" target="_self" href="index.php?route=sellerreview/sellerreview">
                        Reviews
                        </a>
              </li>
              <?php } ?>
              <?php if($login_type == 'buyer') { ?>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'order_history'){ echo 'active'; }?>">
                <a class="tab_order_history" target="_self" href="index.php?route=account/order">
                        My Orders
                        </a>
              </li>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'my_wallet'){ echo 'active'; }?> wallet">
                <a class="wallet" href="#tab_my_wallet" data-toggle="tab">
                        My Wallet
                        </a>
              </li>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'expense_report'){ echo 'active'; }?> expense">
                <a class="expense" href="#tab_expense_report" data-toggle="tab">
                        Expense Report
                        </a>
              </li>
              <?php } ?>
              <?php } else { ?>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'profile'){ echo 'active'; }?>">
                <a href="#tab-profile_details" data-toggle="tab">
                  <?php //echo $tab_profile_details; ?> My Profile
                </a>
              </li>
              <?php if($login_type == 'seller') { ?>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'store_detail'){ echo 'active'; }?>">
                <a href="#tab-more_details" data-toggle="tab">
                  <?php //echo $tab_more_details; ?> Store/Entity detail
                </a>
              </li>
              <?php } ?>
              <?php if($login_type == 'buyer') { ?>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'order_history'){ echo 'active'; }?>">
                <a class="tab_order_history" target="_self" href="index.php?route=account/order">
                        My Orders
                        </a>
              </li>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'my_wallet'){ echo 'active'; }?> wallet">
                <a class="wallet" href="#tab_my_wallet" data-toggle="tab">
                        My Wallet
                        </a>
              </li>
              <li class="tas_bon <?php if($_GET['tab_section'] == 'expense_report'){ echo 'active'; }?> expense">
                <a class="expense" href="#tab_expense_report" data-toggle="tab">
                        Expense Report
                        </a>
              </li>
              <?php } ?>
              <?php } ?>
            </ul>
            <div class="tab-content">
              <div class="tab-pane <?php if($_GET['tab_section'] == 'profile'){ echo 'active'; }?>" id="tab-profile_details">
                <div class="col-md-12">
                  <blockquote>
                    <a href="<?php echo $profile_edit; ?>" data-toggle="tooltip" title="" class="prf--sell btn btn-primary edt">Edit</a>
                    <div class="panel-heading">
                      <h3 class="panel-title"><i class="fa fa-user"></i>
                        <?php echo $text_your_details; ?>
                      </h3>
                    </div>
                    <div class="table-responsive">
                      <table class="table table-condensed profileTable">
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
                    <a href="<?php echo $password_edit; ?>" data-toggle="tooltip" title="" class="prf--sell btn btn-primary edt">Change password</a><br><br>
                    <div class="panel-heading">
                      <h3 class="panel-title"><i class="fa fa-user"></i>
                        <?php echo $text_address_book; ?>
                      </h3>
                    </div>
                    <?php if ($addresses) { ?>
                    <div class="table-responsive">
                      <table class="table table-bordered table-hover">
                        <?php foreach ($addresses as $result) { ?>
                        <tr>
                          <td class="text-left">
                            <?php echo $result['address']; ?>
                          </td>
                          <td class="text-right">
                            <a href="<?php echo $result['update']; ?>" class="prf--sell btn btn-primary edt">
                              <?php echo $button_edit; ?>
                            </a>
                          </td>
                        </tr>
                        <?php } ?>
                      </table>
                    </div>
                    <?php } else { ?>
                    <p>
                      <?php echo $text_empty; ?>
                    </p>
                    <?php } ?>
                  </blockquote>
                </div>
              </div>
              <div class="tab-pane <?php if($_GET['tab_section'] == 'store_detail'){ echo 'active'; }?>" id="tab-more_details">
                <div class="panel-group" id="accordion">
                  <div class="panel panel-default">
                    <div id="collapse1" class="panel-collapse collapse in">
                      <div class="panel-body">
                        <?php if($seller_approved != 1) { ?>
                        <div class="alert alert-danger"><i class="fa fa-times-circle"></i> Your store/entity approval is pending. Enter all fields correctly and save for approval.</div>
                        <?php } else { ?>
                        <div class="alert alert-success"><i class="fa fa-check-circle"></i> Your store/entity is approved. It is now live for public view.</div>
                        <?php } ?>
                        <?php if($seller_verified != 1) { ?>
                        <div class="alert alert-danger"><i class="fa fa-times-circle"></i> Your store/entity verification is pending. Get crowned (<img width="20" height="20" src="image/verified.png">) and earn buyers trust by getting verified.</div>
                        <?php } else { ?>
                        <div class="alert alert-success"><i class="fa fa-check-circle"></i> Your store is verified. Got crowned (<img width="20" height="20" src="image/verified.png">), now you are leading the race to reach buyers.</div>
                        <?php } ?>
                        <div >
                          <?php if(!empty($seller_reject_reason)) { ?>
                          <textarea name="seller_admin_msg" rows="2" placeholder="<?php echo $entry_description; ?>" id="admin_msg" class= "form-control" disabled>Admin message:&nbsp&nbsp&nbsp&nbsp<?php echo $seller_reject_reason; ?></textarea>
                          <?php } else { ?>
                          <textarea name="seller_admin_msg" rows="2" placeholder="<?php echo $entry_description; ?>" id="admin_msg" class= "form-control" disabled>Admin message:&nbsp&nbsp&nbsp&nbspWelcome to BoN age. Go online and get your store/entity into buyers home around you.</textarea>
                          <?php } ?>
                          </br>
                        </div>
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
                          <div class="form-group">
                            <label class="col-md-4 control-label" for="input-nickname">
                                          <?php echo $entry_activate; ?>
                                          </label>
                            <div class="col-sm-8" style="padding-top: 7px;">
                              <input type="hidden" name="store_activate" value="2" />
                              <input type="checkbox" name="store_activate" <?php if ($store_activated==1 ) { echo 'checked'; } ?>                              id="store_activate" value="1" />
                              <span style="font-style: italic;">(Keep this checked to let the buyers see your store/entity.)</span>
                            </div>
                          </div>
                          <div class="form-group required">
                            <label class="col-md-4 control-label" for="input-nickname">
                                          <?php echo $entry_nickname; ?>
                                          <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Must match name in banner and/or registered name.
                                              </li>    
                                             </ul>      
                                          </div>
                              </label>
                            <div class="col-sm-8">
                              <input type="text" maxlength="50" name="nickname" placeholder="<?php echo $entry_nickname; ?>" value="<?php echo $nickname; ?>"
                                id="input-nickname" class="form-control" required/>
                              <span class="input-group-btn">
                                             </span>
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="buttons">
                              <label class="col-md-4 control-label">
                                             <?php echo $entry_seller_banner; ?>
                                         <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Image must be clear and concise.
                                              </li>    
                                             </ul>      
                                          </div>
                              </label>
                              <div class="col-md-4">
                                <a href="" id="thumb-banner" data-toggle="banner" class="img-thumbnail"><img src="<?php echo $thumb_banner; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="banner" value="<?php echo $banner; ?>" id="input-banner" />
                              </div>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-4 control-label">
                                          <?php echo $entry_description; ?>
                                         <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Detail about your business.
                                              </li>    
                                             </ul>      
                                          </div> </label>
                            <div class="col-sm-8">
                              <textarea style="white-space: normal;" name="seller_description" rows="4" maxlength="2000" placeholder="<?php echo $entry_description; ?>"
                                id="input-description" class="form-control"><?php echo $seller_description; ?></textarea>
                            </div>
                          </div>
                          <div id="store_address" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  <h4 class="modal-title">Update Store Address</h4>
                                </div>
                                <div class="modal-body">
                                  <div id="errorMsg" class="alert alert-danger" style="display:none;"></div>
                                  <div id="successMsg" class="alert alert-success" style="display:none;"></div>

                                  <div class="form-group required">
                                    <label class="col-md-4 control-label" for="store-address-1"><?php echo $entry_address_1; ?></label>
                                    <div class="col-md-4">
                                      <input type="text" name="address_1" maxlength="150" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="store-address-1" class="form-control" autocomplete="off" />
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="col-md-4 control-label" for="store-address-2"><?php echo $entry_address_2; ?></label>
                                    <div class="col-md-4">
                                      <input type="text" name="address_2" maxlength="150" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="store-address-2" class="form-control" 
                                      autocomplete="off" />
                                    </div>
                                  </div>
                                  <div class="form-group required">
                                    <label class="col-md-4 control-label" for="store-country"><?php echo $entry_country; ?></label>
                                    <div class="col-md-4">
                                      <input type="hidden" id="hidden_store_countryId" name="hidden_store_countryId" value="99" />
                                      <select name="store_country_id" id="store-country" class="form-control" disabled>
                                        <option value="0"><?php echo $text_select; ?></option>
                                        <?php foreach ($countries as $country) { ?>
                                        <?php if ($country['country_id'] == $country_id) { ?>
                                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                      </select>
                                    </div>
                                  </div>
                                  <div class="form-group required">
                                    <label class="col-md-4 control-label" for="store-zone"><?php echo $entry_zone; ?></label>
                                    <div class="col-md-4">
                                      <input type="hidden" id="hidden_zone_id" name="hidden_zone_id" value="<?php echo $zone_id; ?>" />
                                      <select name="store_zone" id="store_zone" class="form-control"></select>
                                    </div>
                                  </div>
                                  <div class="form-group required">
                                    <label class="col-md-4 control-label" for="store-city"><?php echo $entry_city; ?></label>
                                    <div class="col-md-4">
                                      <input type="hidden" id="hidden_store_city" name="hidden_store_city" value="<?php echo $city; ?>" />
                                      <select name="city" id="store_city" class="form-control"></select>
                                    </div>
                                  </div>
                                  <div class="form-group required">
                                    <label class="col-md-4 control-label" for="store-postcode"><?php echo $entry_postcode; ?></label>
                                    <div class="col-md-4">
                                      <input type="text" name="postcode" maxlength="10" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="store-postcode" class="form-control" autocomplete="off" />
                                    </div>
                                  </div>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-primary" onclick="storeAddress();">Save</button>
                                  <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="form-group required">
                            <label class="col-md-4 control-label" for="input-store-address">
                              <?php echo $entry_store_address; ?>
                                          <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Save correct store/entity address for buyers access.
                                              </li>    
                                             </ul>      
                                          </div>
                            </label>
                            <div class="col-sm-8 additional_image sel--sec--ordd">
                               <a class="cursor sel--sec--ord btn btn-primary edt" id="openStoreAddress">Edit</a>
                              &nbsp; &nbsp;
                              <span id="store_address_update"><?php echo $address_store; ?></span>
                            </div>
                          </div>
                          <div class="form-group required">
                            <label class="col-md-4 control-label">Enter map location
                              <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Save accurate location of you store/entity for buyers to search and find you in BoN.
                                              </li>    
                                             </ul>      
                                          </div>
                            </label>
                            <div class="col-md-2">
                              <div id="map-search" class="map-sample">
                                <img class="cursor img-responsive" id="search-btn_st" data-toggle="modal" data-target="#map_mod" src="image/gmap.jpg" />
                              </div>
                            </div>
                            <div class="col-md-4">
                              <label style="font-style: italic">(Save the store/entity to update map changes you made.)</label>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-4 control-label" for="input-owner-name">
                              <?php echo $entry_owner_name; ?>
                                          <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Enter full name.
                                              </li>    
                                             </ul>      
                                          </div>
                            </label>
                            <div class="col-sm-8">
                              <input type="text" name="owner_name" maxlength="50" placeholder="<?php echo $entry_owner_name; ?>" value="<?php echo $owner_name; ?>"
                                id="input-owner-name" class="form-control" required/>
                              <span class="input-group-btn">
                                             </span>
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="buttons">
                              <label class="col-md-4 control-label">
                                             <?php echo $entry_seller_avatar; ?>
                                             <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Image must be clear.
                                              </li>    
                                             </ul>      
                                          </div>
                              </label>
                              <div class="col-md-4">
                                <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb_image; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                              </div>
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="buttons">
                              <label class="col-md-4 control-label">
                                             Additional Store/Entity images
                                             <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Additional images of your business.
                                              </li>    
                                             </ul>      
                                          </div>
                              </label>
                              <div class="col-md-4 additional_image sel--sec--ordd">
                                <a class="cursor sel--sec--ord btn btn-primary edt" data-toggle="modal" data-target="#store_images">Edit</a>
                              </div>
                            </div>
                          </div>
                          <div class="form-group required">
                            <div class="buttons">
                              <label class="col-md-4 control-label">
                                             Store/Entity categories
                                          <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Entered category will affect your ranking inturn buyers views, if not accurate.
                                              </li>    
                                             </ul>      
                                          </div>
                              </label>
                              <div class="col-md-4 additional_image sel--sec--ordd">
                                <a class="cursor sel--sec--ord btn btn-primary edt" data-toggle="modal" data-target="#store_cat">Edit</a>
                              </div>
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="buttons">
                              <label class="col-md-4 control-label">
                                             Hours of operation
                                          <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Provide working hours for buyer visits.
                                              </li>    
                                             </ul>      
                                          </div>
                              </label>
                              <div class="col-md-4 additional_image sel--sec--ordd">
                                <a class="cursor sel--sec--ord btn btn-primary edt" data-toggle="modal" data-target="#store_timings">Edit</a>
                              </div>
                            </div>
                          </div>
                          <div class="form-group new--mtt">
                            <div class="row">
                              <label class="col-md-4 control-label" for="input-ll-num">
                                             <?php echo $entry_store_ll_num; ?>
                                             <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Enter correct contact landline number for buyers access.
                                              </li>    
                                             </ul>      
                                          </div>
                              </label>
                              <?php $store_ll_num_row = 0; $store_ll_num = explode(",", $store_ll_num); ?>
                              <?php foreach ($store_ll_num as $store_ll_nums) { $store_ll = explode("-", $store_ll_nums);
                                                $store_ll_0 = (isset($store_ll[0]) && $store_ll[0] != '') ? $store_ll[0] : ''; 
                                                $store_ll_1 = (isset($store_ll[1]) && $store_ll[1] != '') ? $store_ll[1] : ''; ?>
                              <?php if($store_ll_num_row != 0) { ?>
                              <div id="ad_ll<?php echo $store_ll_num_row; ?>" class="row addition-mobile">
                                <div class="col-md-4"></div>
                                <?php } ?>
                                <div class="col-md-2">
                                  <input type="text" name="store_ll_code[]" placeholder="<?php echo $entry_store_ll_code; ?>" value="<?php echo $store_ll_0; ?>"
                                    id="input-ll-code" maxlength="5" class="form-control mat--lt" required/>
                                  <span class="input-group-btn">
                                                   </span>
                                </div>
                                <div class="col-md-2">
                                  <input type="text" name="store_ll_num[]" placeholder="<?php echo $entry_store_ll_num; ?>" value="<?php echo $store_ll_1; ?>"
                                    id="input-store-num" maxlength="10" class="form-control mat--lt" required/>
                                  <span class="input-group-btn">
                                                   </span>
                                </div>
                                <?php if($store_ll_num_row == 0) { ?>
                                <div class="col-sm-2">
                                  <button type="button" onclick="addStoreLandLine();" class="--plus-btn">+</button>
                                </div>
                              </div>
                              <?php } else { ?>
                              <div class="col-md-4"><span class="text-left"><button type="button" onclick="ad_ll<?php echo $store_ll_num_row; ?>.remove();" class="--minus-btn">-</button></span></div>
                            </div>
                            <?php } ?>
                            <?php $store_ll_num_row++; } ?>
                            <div id="str_ll"></div>
                          </div>
                          <div class="form-group new--mtt">
                            <div class="row">
                              <label class="col-md-4 control-label" for="input-store-num">
                                             <?php echo $entry_store_mobile_num; ?>
                                             <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Enter correct contact mobile number for buyers easy access. Entered mobile number will be used while sending posted advertisement
                                                detail, buyers order detail, BoN offers etc.,</br></br>Default: User number
                                              </li>    
                                             </ul>      
                                          </div>
                              </label>
                              <?php $store_mobile_num_row = 0; $store_mobile_num = explode(",", $store_mobile_num); ?>
                              <?php foreach ($store_mobile_num as $store_mobile_nums) { ?>
                              <?php if($store_mobile_num_row != 0) { ?>
                              <div id="ad_mob<?php echo $store_mobile_num_row; ?>" class="row addition-mobile">
                                <div class="col-md-4"></div>
                                <?php } ?>
                                <div class="col-sm-2">
                                  <input type="text" name="store_mobile_num[]" maxlength="10" placeholder="<?php echo $entry_store_mobile_num; ?>" value="<?php echo $store_mobile_nums; ?>"
                                    id="input-store-num" class="form-control mat--lt" required/>
                                  <span class="input-group-btn">
                                                   </span>
                                </div>
                                <?php if($store_mobile_num_row == 0) { ?>
                                <div class="col-md-4">
                                  <button type="button" onclick="addStoreMobile();" class="--plus-btn">+</button>
                                </div>
                              </div>
                              <?php } else { ?>
                              <div class="col-md-4"><span class="text-left"><button type="button" onclick="ad_mob<?php echo $store_mobile_num_row; ?>.remove();" class="--minus-btn"> - </button></span></div>
                            </div>
                            <?php } ?>
                            <?php $store_mobile_num_row++; } ?>
                            <div id="str_mob"></div>
                          </div>
                          <div class="form-group required">
                            <label class="col-md-4 control-label" for="input-store-email">
                                          <?php echo $entry_store_email; ?>
                                         <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Enter valid email address. Entered email ID will be used while sending posted advertisement
                                                detail, buyers order detal, BoN offers etc.,</br></br>Default: User email ID
                                              </li>    
                                             </ul>      
                                          </div>
                            </label>
                            <div class="col-md-4">
                              <input type="text" name="store_email" placeholder="<?php echo $entry_store_email; ?>" value="<?php echo $store_email; ?>"
                                id="input-store-email" maxlength="100" class="form-control" required/>
                              <span class="input-group-btn">
                                             </span>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-4 control-label" for="input-tin">
                                          <?php echo $entry_tin; ?>
                                          <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Enter registered TIN/TAN/CST number to verify your business and get more attention.
                                              </li>    
                                             </ul>      
                                          </div>
                            </label>
                            <div class="col-md-4">
                              <input maxlength="30" type="text" name="tin" value="<?php echo $tin; ?>" id="input-tin"
                                class="form-control" required/>
                              <span class="input-group-btn">
                                             </span>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-4 control-label" for="input-pan">
                                          <?php echo $entry_pan; ?>
                                          <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Enter PAN used to get TIN/TAN/CST number to verify your business and get more attention.
                                              </li>    
                                             </ul>      
                                          </div>
                            </label>
                            <div class="col-md-4">
                              <input maxlength="30" type="text" name="pan" placeholder="<?php echo $placeholder_pan; ?>" value="<?php echo $pan; ?>" id="input-pan"
                                class="form-control" required/>
                              <span class="input-group-btn">
                                             </span>
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="buttons">
                              <label class="col-md-4 control-label">Store/Entity portals
                                <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Enter full and correct URL's of your business portals if you have.
                                              </li>    
                                             </ul>      
                                          </div>
                              </label>
                              <div class="col-md-4 additional_image sel--sec--ordd">
                                <a class="cursor sel--sec--ord btn btn-primary edt" data-toggle="modal" data-target="#store_portals">Edit</a>
                              </div>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-4 control-label" for="input-delivery_type">
                                          Delivery type
                                          <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Choose current delivery type you run your business.
                                              </li>    
                                             </ul>      
                                          </div>
                            </label>
                            <div class="col-md-4">
                              <input type="radio" name="delivery_type" value="1" checked> Cash on home delivery<br>
                              <input type="radio" name="delivery_type" value="2" <?php if($delivery_type==2 ){ echo "checked"; } ?>>
                              Cash on Store delivery<br>
                              <input type="radio" name="delivery_type" value="3" <?php if($delivery_type==3 ){ echo "checked"; } ?>>
                              Both
                            </div>
                          </div>
                          <?php if($referred_by !== '' && !empty($referred_by)) { ?>
                          <div class="form-group">
                            <label class="col-md-4 control-label" for="input-referred-by">
                                                Referred by
                                                <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Referrers would get 20% of the first paid advertisement posted by the store/entity you referred.
                                              </li>    
                                             </ul>      
                                          </div>
                            </label>
                            <div class="col-md-4" style="padding-top: 7px;">
                              <?php if($referred_by != '---') {
                                                   $refed_val = explode("-", $referred_by); ?>
                              <span class="referred-by"><?php echo $refed_val[0]; ?></span>
                              <input type="hidden" name="referred_by" value="<?php echo $refed_val[0]; ?>" id="input-referred-by" class="form-control"
                              />
                              <?php } else { ?>
                              <span class="referred-by"><?php echo $referred_by; ?></span>
                              <?php } ?>
                            </div>
                          </div>
                          <?php } else { ?>
                          <div class="form-group referrer-fom-build">
                            <label class="col-md-4 control-label" for="input-referred-by">
                                    Referred by
                                     <div class="pull-right">
                                            <a class="cursor" data-toggle="dropdown" aria-expanded="true">
                                              <span class="bonbadge"><i class="fa-info" aria-hidden="true"></i></span>
                                            </a>                                            
                                            <ul class="dropdown-menu badgemenu">
                                              <li>
                                                Referrers would get 20% of the first paid advertisement posted by the store/entity you referred.
                                              </li>    
                                             </ul>      
                                          </div>
                            </label>
                            <div class="col-md-4" style="padding-top: 7px;">
                              <input type="text" id="input-referred-by-val" name="referred_by" placeholder="<?php echo $entry_store_mobile_num; ?>" value="<?php echo $referred_by; ?>"
                                id="input-referred-by" maxlength="10" class="form-control" />
                              <p>If you are a new referrer,<a class="cursor" data-toggle="modal" data-target="#store_referred"> click here</a></p>
                            </div>
                          </div>
                          <?php } ?>
                          <div class="diff--seller">
                            <?php if($daysleft > 0) { ?>
                            <div class="form-group">
                              <label class="col-sm-12 control-label" for="input-referred-by">
                                             - Set as <span style="background: yellow;"> Featured </span>. Now you lead the race no matter how far you are from buyers by topping their search list. 
                              </label>
                              <div class="col-sm-9">
                                <span class="referred-by"><?php echo $daysleft; ?> day(s) left</span>
                              </div>
                            </div>
                            <?php } else { ?>
                            <div class="form-group">
                              <label class="col-sm-12 control-label" for="input-referred-by">
                                             - Not set as <span style="background: yellow;"> Featured </span>. Don't be one among the crowd, rise above from the rest.
                                             
                              </label>
                              <div class="col-sm-9">
                              </div>
                            </div>
                            <?php } ?>
                            <div class="form-group">
                              <label class="col-sm-12 control-label" for="input-referred-by">
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
                              <label class="col-sm-12 control-label" for="input-referred-by">
                                             - Number of buyers added this to their favourites :
                                             </label>
                              <div class="col-sm-9" style="margin-top: 5px;">
                                <span class="referred-by"><?php echo $favourites_customer_count; ?> Buyer(s)</span>
                              </div>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-12 control-label" for="agree_tt" style="font-weight: bold; text-align: left;"><input type="hidden" name="agree" value="not_agree" id="agree">
             <input type="checkbox" name="agree_tt" class="agree_tt" value="agree" id="agree_tt"> &nbsp;I hereby declare that the detail furnished above are true and correct to the best of my knowledge. In case any of the information is found to be false or untrue or misleading or misrepresenting, I am aware that my detail will impact approval and verification process.</label>
                          </div>
                          <!--<div class="form-group">
                                          <label class="col-sm-3 control-label">Address</label>
                                          <div class="col-sm-5">
                                            <input type="text" class="form-control" name="address" id="address_st" value="" />                        
                                          </div>
                                          </div>-->
                          <input type="hidden" class="form-control" name="lat" id="latitude_st" value="<?php echo $lat; ?>" />
                          <input type="hidden" class="form-control" name="lng" id="longitude_st" value="<?php echo $lng; ?>" />
                          
                                  <?php if((empty($nickname) && $seller_approved == 0) || $seller_approved == 1) { ?>
                                    <button type="button" id="button-profile-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary pull-right"><?php echo $button_save; ?></button>
                                  <?php } else { ?>
                                    <button type="button" id="button-profile-save-disabled" data-loading-text="<?php echo $text_loading; ?>" class="btn pull-right" disabled><?php echo $button_save; ?></button>
                                    <label style="font-size: 13px;font-style: italic;font-weight: bold;color: #FF4500">Save option will be enabled after store/entity is approved by BoN admin.&nbsp&nbsp&nbsp</label>
                                  <?php } ?>
                                                           
                              </br>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane <?php if($_GET['tab_section'] == 'product'){ echo 'active'; }?>" id="tab-sellerproduct">
                <div class="--bon-res-scrooll">
                  <p>Products you upload here are closely monitored by our experts. If found not permissable to public, store/entity
                    will be banned from the listing without a warning.</p>
                  <br/>
                  <?php if($allow_products != 0) {$checked_products = "checked";} else {$checked_products = "";}
                              if($allow_cart != 0) {$checked_cart = "checked";} else {$checked_cart = "";} ?>
                  <p>
                    <input type="checkbox" class="allow-prod-cart" name="allow_products" <?php echo $checked_products; ?> id="allow_products" value="allow_products"> Allow products tab visible to buyer in store/entity detail page.</p>
                  <p><span class="txt--itc">(Hide products tab incase if you do not need it or if you want to update it)</span></p>
                  <p><input type="checkbox" class="allow-prod-cart" name="allow_products" <?php echo $checked_cart; ?> id="allow_cart"
                    value="allow_cart"> Allow buyers to add products to thier cart to continue online shooping.</p>
                  <p><span class="txt--itc">(Hide 'Add to cart' button incase if you want buyers to only see your products)</span></p>
                  <br/>
                </div>
                <div id="sellerproduct">
                  <div id="pre_loaderr"><img class="img-responsive" src="image/pre-loader.gif"></div>
                </div>
                <br />
              </div>
              <?php if ($is_seller) { ?>
              <div class="tab-pane <?php if($_GET['tab_section'] == 'store'){ echo 'active'; }?>" id="tab_store_ad">
                <ul class="nav nav-tabs fixme-sec _bon_ts" style="z-index:123 background-color: #f1f1f1 !important;">
                  <li class="tas_bon <?php if($_GET['inner_store'] == 'draft'){ echo 'active'; }?>"><a href="#draftt" data-txt="draft" class="draft" data-toggle="tab">Drafts (<span class="black_s" id="sellerdraftcount"><?php echo $draft_tt; ?></span>)</a></li>
                  <li class="tas_bon <?php if($_GET['inner_store'] == 'submitted'){ echo 'active'; }?>"><a href="#submitted" data-txt="submitted" class="submitted" data-toggle="tab">Submitted (<span class="black_s" id="sellersubmittedcount"><?php echo $submitted_tt; ?></span>)</a></li>
                  <li class="tas_bon <?php if($_GET['inner_store'] == 'approved'){ echo 'active'; }?>"><a href="#approved" data-txt="approved" class="approved" data-toggle="tab">Approved (<span class="black_s" id="sellerapprovedcount"><?php echo $approved_tt; ?></span>)</a></li>
                  <li class="tas_bon <?php if($_GET['inner_store'] == 'live'){ echo 'active'; }?>"><a href="#live" data-txt="live" class="live" data-toggle="tab">Live (<span class="black_s" id="sellerlivecount"><?php echo $live_tt; ?></span>)</a></li>
                  <li class="tas_bon <?php if($_GET['inner_store'] == 'yet_to_live'){ echo 'active'; }?>"><a href="#yet_to_live" data-txt="yet_to_live" class="yet_to_live" data-toggle="tab">Yet to go live (<span class="black_s" id="sellerpaidcount"><?php echo $paid_tt; ?></span>)</a></li>
                  <li class="tas_bon <?php if($_GET['inner_store'] == 'rejected'){ echo 'active'; }?>"><a href="#rejected" data-txt="rejected" class="rejected" data-toggle="tab">Rejected (<span class="black_s" id="sellerrejectedcount"><?php echo $rejected_tt; ?></span>)</a></li>
                  <li class="tas_bon <?php if($_GET['inner_store'] == 'archive'){ echo 'active'; }?>"><a href="#archive" data-txt="archive" class="archive" data-toggle="tab">Archive (<span class="black_s" id="sellerarchivecount"><?php echo $archive_tt; ?></span>)</a></li>
                  <li class="tas_bon <?php if($_GET['inner_store'] == 'trash'){ echo 'active'; }?>"><a href="#trash" data-txt="trash" class="trash" data-toggle="tab">Trash (<span class="black_s" id="sellertrashcount"><?php echo $trash_tt; ?></span>)</a></li>
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
                  <p>Please download any or both images below having QR code of your store/entity and display them to your buyers.
                    <p>By scanning buyers can
                      <p>
                        <p style="margin-left:20px;">- add yours as their favorites to get your AD's notification the moment you upload. It increases
                          your sales BEYOND IMAGINATION.</p>
                        <p style="margin-left:20px;">- pay online for what they have purchased. GO DIGITAL, GO CASHLESS.</p>
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
              <?php } ?>
              <!-- <div class="tab-pane <?php if($_GET['tab_section'] == 'profile'){ echo 'active'; }?>" id="tab-profile_details">
                <div class="col-md-12">
                  <blockquote>
                    <a href="<?php echo $profile_edit; ?>" data-toggle="tooltip" title="" class="prf--sell btn btn-primary edt">Edit</a>
                    <div class="panel-heading">
                      <h3 class="panel-title"><i class="fa fa-user"></i>
                        <?php echo $text_your_details; ?>
                      </h3>
                    </div>
                    <div class="table-responsive">
                      <table class="table table-condensed profileTable">
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
                        </tbody>
                      </table>
                    </div>
                    <a href="<?php echo $password_edit; ?>" data-toggle="tooltip" title="" class="prf--sell">Change password</a><br><br>
                    <div class="panel-heading">
                      <h3 class="panel-title"><i class="fa fa-user"></i>
                        <?php echo $text_address_book; ?>
                      </h3>
                    </div>
                    <?php if ($addresses) { ?>
                    <div class="table-responsive">
                      <table class="table table-bordered table-hover">
                        <?php foreach ($addresses as $result) { ?>
                        <tr>
                          <td class="text-left">
                            <?php echo $result['address']; ?>
                          </td>
                          <td class="text-right">
                            <a href="<?php echo $result['update']; ?>" class="prf--sell">
                              <?php echo $button_edit; ?>
                            </a>
                          </td>
                        </tr>
                        <?php } ?>
                      </table>
                    </div>
                    <?php } else { ?>
                    <p>
                      <?php echo $text_empty; ?>
                    </p>
                    <?php } ?>
                  </blockquote>
                </div>
              </div> -->

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
            <div class="form-temp">Referrer bank detail:</div>
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
                <span class="pull-left"><input type="radio" checked name="account_type" id="salary_account" value="salary_account"><label for="salary_account"> savings account</label></span>
                <span class="pull-right"><input type="radio" name="account_type" id="current_account" value="current_account"><label for="current_account"> current account</label></span><br/>
              </div>
            </div>
            <div class="det--ref" style="margin-bottom:10px;clear: both;">Above information including bank detail are true and correct to the best of my knowledge. If there is any issue
              or incorrect data provided by me, BoN is in no way will be held responsible.</div>
            <div class="form-group">
              <input type="checkbox" name="terms" id="agree_bank" value="agree" style="margin-right: 5px;"><label for="agree"> I agree and would like to earn money.</label>
            </div>
            <div class="form-group">
              <button type="button" data-dismiss="modal" class="btn btn-primary pull-left">Cancel</button>
              <button type="button" id="button-refer-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary pull-right">Save</button>
            </div>
            <div class="det--ref" style="margin-bottom:20px;"><strong>Note:</strong> BoN will not share your information including bank detail with anyone for any purpose.</div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<div id="store_portals" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title">Update store/entity portals</h4>
      </div>
      <div class="modal-body">
      	<div id="portalErrorMsg" class="alert alert-danger" style="display:none;"></div>
      	<div id="portalSuccessMsg" class="alert alert-success" style="display:none;"></div>
      	
        <div class="form-group">
	  <label class="col-md-6 control-label" for="input-website"><?php echo $entry_website; ?></label>
	  <div class="col-md-6">
            <input type="text" name="website" maxlength="500" value="<?php echo $website; ?>" placeholder="http://www.example.com" id="input-website" class="form-control" autocomplete="off" />
          </div>
	</div>	
	<div class="form-group">
	  <label class="col-md-6 control-label" for="input-facebook"><?php echo $entry_facebook; ?></label>
	  <div class="col-md-6">
            <input type="text" name="facebook" maxlength="500" value="<?php echo $facebook; ?>" placeholder="http://www.facebook.com/youraccount" id="input-facebook" class="form-control" autocomplete="off" />
          </div>
	</div>
        <div class="form-group">
	  <label class="col-md-6 control-label" for="input-twitter"><?php echo $entry_twitter; ?></label>
	  <div class="col-md-6">
            <input type="text" name="twitter" maxlength="500" value="<?php echo $twitter; ?>" placeholder="http://twitter.com/youraccount" id="input-twitter" class="form-control" autocomplete="off" />
          </div>
	</div>
        <div class="form-group">
	  <label class="col-md-6 control-label" for="input-googleplus"><?php echo $entry_googleplus; ?></label>
	  <div class="col-md-6">
            <input type="text" name="googleplus" maxlength="500" value="<?php echo $googleplus; ?>" placeholder="http://plus.google.com/youraccount" id="input-googleplus" class="form-control" autocomplete="off" />
          </div>
	</div>
        <div class="form-group">
	  <label class="col-md-6 control-label" for="input-instagram"><?php echo $entry_instagram; ?></label>
	  <div class="col-md-6">
            <input type="text" name="instagram" maxlength="500" value="<?php echo $instagram; ?>" placeholder="http://www.instagram.com/youraccount" id="input-instagram" class="form-control" autocomplete="off" />
          </div>
	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="storePortals();">Save</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
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
        <ul>
          <li style="text-align: left; font-size: 12px">Images you upload here are closely monitored by our experts. If found not permissable to public, your store/entity
            will be banned from the listing without a warning.</li>
        </ul>
        <br/>
      	<div id="storeImagesErrorMsg" class="alert alert-danger" style="display:none;"></div>
      	<div id="storeImagesSuccessMsg" class="alert alert-success" style="display:none;"></div>
        <form action="" method="post" enctype="multipart/form-data" id="form-image" class="form-horizontal">
          <div class="table-responsive">
            <table id="images" class="table table-striped table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left">Additional Image
                    <?php //echo $entry_additional_image; ?>
                  </td>
                  <td class="text-right">Sort Order
                    <?php //echo $entry_sort_order; ?>
                  </td>
                  <td></td>
                </tr>
              </thead>
              <tbody>
                <?php $image_row = 0; ?>
                <?php foreach ($store_images as $store_image) { ?>
                <tr id="image-row<?php echo $image_row; ?>">
                  <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $store_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input
                      type="hidden" class="imgae_empty_check" name="store_image[<?php echo $image_row; ?>][image]" value="<?php echo $store_image['image']; ?>"
                      id="input-image<?php echo $image_row; ?>" /></td>
                  <td class="text-right"><input type="text" name="store_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $store_image['sort_order']; ?>"
                      placeholder="<?php //echo $entry_sort_order; ?>" class="form-control" /></td>
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
        <ul>
          <table style="font-size: 12px;text-align: left">
            <tr>
              <td>1.&nbsp&nbsp</td>
              <td>Advertisement(s) you post will be filtered by buyers upon searching the main category you add here.</td>
            </tr>
            <tr>
              <td>2.&nbsp&nbsp</td>
              <td>Please be cautious in choosing main or sub category to keep your loyalty/credibility amongst buyers.</td>
            </tr>
          </table>
        </ul>
      	<div id="storeCatErrorMsg" class="alert alert-danger" style="display:none;"></div>
      	<div id="storeCatSuccessMsg" class="alert alert-success" style="display:none;"></div>
        <br/>
        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
          <div class="table-responsive">
            <table id="cats" class="table table-striped table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left">Main Category</td>
                  <td class="text-left">Sub category</td>
                  <td></td>
                </tr>
              </thead>
              <tbody>
                <?php $cat_row = 0; ?>
                <?php 
                  if(!empty($category_seller['category'])) { 
                    $i = 0;
                    foreach ($category_seller['category'] as $seller_cat) { ?>
                <tr id="cat-rows<?php echo $cat_row; ?>" class="extra">
                  <td class="text-left cat">
                    <input type="text" name="category" data-row="<?php echo $cat_row; ?>" id="category_<?php echo $cat_row; ?>" value="<?php echo $seller_cat['name']; ?>"
                      placeholder="Type here" class="form-control" />
                    <ul class="dropdown-menu_<?php echo $cat_row; ?>"></ul>
                    <input type="hidden" data-row="<?php echo $cat_row; ?>" name="category_id" id="category_hidden_<?php echo $cat_row; ?>" value="<?php echo $seller_cat['category_id']; ?>"
                    />
                  </td>
                  <td class="text-left subcat">
                    <input type="text" name="sub_category" id="sub_category_<?php echo $cat_row; ?>" data-row="<?php echo $cat_row; ?>" value=""
                      placeholder="Type here" class="form-control" />
                    <ul class="dropdown-submenu_<?php echo $cat_row; ?>"></ul>
                    <div id="product-category_<?php echo $cat_row; ?>" class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php
                                         foreach ($category_seller['sub_categories'][$cat_row] as $seller_sub_cat) { ?>
                        <p><i class="fa fa-minus-circle"></i>
                          <?php echo $seller_sub_cat['name']; ?>
                          <input type="hidden" name="product_category[]" id="product_category_<?php echo $seller_sub_cat['category_id']; ?>" value="<?php echo $seller_sub_cat['category_id']; ?>"></p>
                        <?php } ?>
                    </div>
          </div>
          </td>
          <td class="text-left">
            <?php if($cat_row > 0) { ?>
            <button type="button" onclick="$('#cat-rows<?php echo $cat_row; ?>').remove();" class="--minus-btn">-</button>
            <?php } ?>
          </td>
          </tr>
          <?php $cat_row++; } } else { ?>
          <tr id="cat-rows0" class="extra">
            <td class="text-left cat">
              <input type="text" name="category" id="category_0" data-row="0" value="" placeholder="Type here" onKeyPress="getCategories(this.value, 0)"
                class="form-control" />
              <ul class="dropdown-menu_0"></ul>
              <input type="hidden" id="category_hidden_0" data-row="0" name="category_id" value="" />
            </td>
            <td class="text-left subcat">
              <input type="text" name="sub_category" value="" placeholder="Type here" data-row="0" class="form-control" />
              <ul class="dropdown-submenu_0"></ul>
              <div id="product-category_0" class="well well-sm" style="height: 150px; overflow: auto;"></div>
            </td>
            <td></td>
          </tr>
          <?php } ?>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="3">
                <button type="button" id="addBtnCategories" class="btn btn-primary">Add</button>
                <button type="button" id="button-cat-subcat-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary pull-right"><?php echo $button_save; ?></button>
              </td>
            </tr>
          </tfoot>
          </table>
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
  $(window).scroll(function () {
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
  var fixmeTop;
  if($('.fixme-sec').offset()){
    var fixmeTop = $('.fixme-sec').offset().top;
  }
  $(window).scroll(function () {
    var currentScroll = $(window).scrollTop();
    if (currentScroll >= fixmeTop) {
      $('.fixme-sec').css({
        position: 'sticky',
        top: '40px',
        'z-index': '1'
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

  $("#store-timings select").on("change", function () {
    var id = $(this).attr("id");
    var data_id = $(this).data('id');
    var month_id = $(this).data('month');
    var sel_val = $(this).val();
    var tit = id + data_id;
    //alert(month_id);
    if (sel_val == "open") {
      $('#add-' + month_id).show();
      $("." + tit).css({ "display": "inline-flex", "margin-bottom": "10px" });
    } else {
      $('#add-' + month_id).hide();
      $("." + tit).css({ "display": "none", "margin-bottom": "10px" });
    }

  });

  $('#button-timing-save').on('click', function (e) {
    $.ajax({
      type: "POST",
      url: 'index.php?route=sellerprofile/sellerprofile/store_timings',
      data: $('#store-timings').serialize(),
        success: function(data) {
          $('#store_success_timg').html('');
          $('#store_success_timg').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i>' + data['success'] + '</div>');

          setTimeout(function() {
            $('#store_timings').modal('toggle');
            $('#store_success_timg').html('');
          }, 3000);
        }
      })
    });

//      success: function (data) {
//        $('#store_success_timg').html('');
//        if (data['success']) {
//          $('#store_success_timg').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i>' + data['success'] + '</div>');
//          $('#store_timings').scrollTop(0);
//        }


</script>
<script type="text/javascript">
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
     
  $('.well').delegate('.fa-minus-circle', 'click', function () {
    $(this).parent().remove();
  });

  $('#button-refer-save').on('click', function (e) {//alert(235);
    if (document.getElementById('agree_bank').checked) {
      agree_value = document.getElementById('agree_bank').value;
      refer_mobile_val = document.getElementById('refer_mobile').value;
      if (agree_value == 'agree') {
        $.ajax({
          type: "POST",
          url: 'index.php?route=sellerprofile/sellerprofile/store_refer',
          data: $('#store_referred_frm').serialize(),
          success: function (json) {
            $('#val_ref_tt').html('');
            if (json['success']) {
              if (refer_mobile_val == json['success']) {
                $('#input-referred-by-val').val('');
                $('#input-referred-by-val').val(json['success']);
                $('#store_referred').modal('toggle');
              }
            }
            if (json['error']) {
              $('#val_ref_tt').html('<div class="alert alert-danger"><i class="fa fa-check-circle"></i>' + json['error'] + '</div>');
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


  $('#button-feature-save').on('click', function (e) {
    $.ajax({
      type: "POST",
      url: 'index.php?route=sellerprofile/sellerprofile/feature_store',
      data: $('#store-feature').serialize(),
      success: function (data) {
        window.location.reload();
      }
    });
  });


  $('#clear_counter').on('click', function (e) {
    $.ajax({
      type: "POST",
      url: 'index.php?route=sellerprofile/sellerprofile/clear_visitor_counter',
      success: function (data) {
        if (data['success'] == 0) {
          $('#manage_counter').html('');
          $('#manage_counter').html(data['succes']);
        }
      }
    });
  });

</script>
<script type="text/javascript">
  <!--
   var image_row = <?php echo $image_row; ?>;
   
  function addImage() {
    html = '<tr id="image-row' + image_row + '">';
    html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" class="imgae_empty_check" name="store_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
    html += '  <td class="text-right"><input type="text" name="store_image[' + image_row + '][sort_order]" value="" placeholder="Sort Order" class="form-control" /></td>';
    html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row + '\').remove();" class="--minus-btn">-</button></td>';
    html += '</tr>';

    $('#images tbody').append(html);

    image_row++;
  }
   //-->

</script>
<script type="text/javascript">
  <!--
   var store_mobile_num_row = <?php echo $store_mobile_num_row; ?>;
   
  function addStoreMobile() {
    html = '<div id="ad_mob' + store_mobile_num_row + '" class="row">';
    html += '<div class="col-md-4">';
    html += '</div>';
    html += '<div class="col-sm-2 addition-mobile ' + store_mobile_num_row + '">';
    html += '  <input type="text" name="store_mobile_num[]" value="" placeholder="10 digit mobile number" class="form-control mat--lt" />';
    html += '</div>';
    html += '<div class="col-md-2 addition-mobile">';
    html += '  <span class="text-left"><button type="button" onclick="$(\'#ad_mob' + store_mobile_num_row + '\').remove();" class="--minus-btn">-</button></span>';
    html += '</div>';
    html += '</div>';

    $('#str_mob').append(html);

    store_mobile_num_row++;
  }
   //-->

</script>
<script type="text/javascript">
  <!--
   var store_ll_num_row = <?php echo $store_ll_num_row; ?>;
   
  function addStoreLandLine() {//alert("test");
    html = '<div id="ad_ll' + store_ll_num_row + '" class="row">';
    html += '<div class="col-md-4">';
    html += '</div>';
    html += '<div class="col-md-2 addition-mobile ' + store_ll_num_row + '">';
    html += '  <input type="text" maxlength="5" name="store_ll_code[]" value="" placeholder="STD code" class="form-control mat--lt" />';
    html += '</div>';
    html += '<div class="col-md-2 addition-mobile ' + store_ll_num_row + '">';
    html += '  <input type="text" maxlength="10" name="store_ll_num[]" value="" placeholder="LL number" class="form-control mat--lt" />';
    html += '</div>';
    html += '<div class="col-md-2 addition-mobile">';
    html += '  <span class="text-left"><button type="button" onclick="$(\'#ad_ll' + store_ll_num_row + '\').remove();" class="--minus-btn">-</button></span>';
    html += '</div>';
    html += '</div>';

    $('#str_ll').append(html);

    store_mobile_num_row++;
  }
   //-->

</script>
<script type="text/javascript">
   <!--
     $('#badge').delegate('.pagination a', 'click', function (e) {
       e.preventDefault();

       $('#badge').load(this.href);
     });

   $('#badge').load('index.php?route=sellerprofile/sellerprofile/badge&seller_id=<?php echo $seller_id; ?>');

   $('#button-badge').on('click', function (e) {
     e.preventDefault();

     $.ajax({
       url: 'index.php?route=sellerprofile/sellerprofile/badge&seller_id=<?php echo $seller_id; ?>',
       type: 'post',
       dataType: 'html',
       data: 'comment=' + encodeURIComponent($('#tab-badge textarea[name=\'comment\']').val()),
       beforeSend: function () {
         $('#button-badge').button('loading');
       },
       complete: function () {
         $('#button-badge').button('reset');
       },
       success: function (html) {
         $('.alert').remove();

         $('#badge').html(html);

         $('#tab-badge textarea[name=\'comment\']').val('');
       }
     });
   });
   //-->

</script>
<script type="text/javascript">

  
   $(document).ready(function () {
     var tab_class = "<?php echo (isset($_GET['tab_section']) && $_GET['tab_section'] !='') ? $_GET['tab_section'] : '';  ?>";
     if (tab_class == 'product') {
       $('#pre_loaderr').show();
       $('#sellerproduct').load('index.php?route=sellerprofile/sellerprofile/sellerproduct&seller_id=<?php echo $seller_id; ?>');
       $('#pre_loaderr').delay(10000).fadeOut(5000);
       
     }

   });


   $('.sellerproduct').on('click', function () {
     $('#pre_loaderr').show();
     $('#sellerproduct').delegate('.pagination a', 'click', function (e) {
       e.preventDefault();
       $('#sellerproduct').load(this.href);
     });
     $('#sellerproduct').load('index.php?route=sellerprofile/sellerprofile/sellerproduct&seller_id=<?php echo $seller_id; ?>');
     $('#pre_loaderr').delay(10000).fadeOut(5000);
   });



   $('#button-sellerproduct').on('click', function (e) {
     e.preventDefault();

     $.ajax({
       url: 'index.php?route=sellerprofile/sellerprofile/sellerproduct&seller_id=<?php echo $seller_id; ?>',
       type: 'post',
       dataType: 'html',
       data: 'comment=' + encodeURIComponent($('#tab-sellerproduct textarea[name=\'comment\']').val()),
       beforeSend: function () {
         $('#button-sellerproduct').button('loading');
       },
       complete: function () {
         $('#button-sellerproduct').button('reset');
       },
       success: function (html) {
         $('.alert').remove();

         $('#sellerproduct').html(html);

         $('#tab-sellerproduct textarea[name=\'comment\']').val('');
       }
     });
   });
   //-->

</script>
<script type="text/javascript">
   $(document).ready(function () {
     var target = $('#tab_store_ad a[data-toggle="tab"]').attr("href") // activated tab   
     if(target){
        target1 = target.replace('#', '.');
        if (target1 != '') {
          $('#sellerdraft').load('index.php?route=sellerprofile/sellerprofile/selleradvertisedraft&seller_id=<?php echo $seller_id; ?>');
        }
     }
   });
   var tab_class = "<?php echo (isset($_GET['inner_store']) && $_GET['inner_store'] !='') ? $_GET['inner_store'] : '';  ?>";
   if (tab_class != '') {
     $('#seller' + tab_class).delegate('.pagination a', 'click', function (e) {
       e.preventDefault();
       $('#seller' + tab_class).load(this.href);
     });
     if (tab_class == 'yet_to_live') {
       $('#seller' + tab_class).load('index.php?route=sellerprofile/sellerprofile/selleradvertisepaid&seller_id=<?php echo $seller_id; ?>');
     } else {
       $('#seller' + tab_class).load('index.php?route=sellerprofile/sellerprofile/selleradvertise' + tab_class + '&seller_id=<?php echo $seller_id; ?>');
     }
   }

   $('.tab_store_ad').on('click', function () {
     $(".draft").trigger("click");
     $('#pre_loaderr').show();
     $('#sellerdraft').delegate('.pagination a', 'click', function (e) {
       e.preventDefault();
       $('#sellerdraft').load(this.href);
     });
     $('#sellerdraft').load('index.php?route=sellerprofile/sellerprofile/selleradvertisedraft&seller_id=<?php echo $seller_id; ?>');
     $('#pre_loaderr').hide();
   });

   $('.draft').on('click', function () {
     $('#pre_loaderr').show();
     $('#sellerdraft').delegate('.pagination a', 'click', function (e) {
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
     $('#sellersubmitted').delegate('.pagination a', 'click', function (e) {
       e.preventDefault();
       $('#sellersubmitted').load(this.href);
     });
     $('#sellersubmitted').load('index.php?route=sellerprofile/sellerprofile/selleradvertisesubmitted&seller_id=<?php echo $seller_id; ?>');
     $('#pre_loaderr').hide();
   });

  $('.approved').on('click', function () {
    $('#pre_loaderr').show();
    $('#sellerapproved').delegate('.pagination a', 'click', function (e) {
      e.preventDefault();

      $('#sellerapproved').load(this.href);
    });

    $('#sellerapproved').load('index.php?route=sellerprofile/sellerprofile/selleradvertiseapproved&seller_id=<?php echo $seller_id; ?>');
    $('#pre_loaderr').hide();
  });

  $('.rejected').on('click', function () {
    $('#pre_loaderr').show();
    $('#sellerrejected').delegate('.pagination a', 'click', function (e) {
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
    $('#selleryet_to_live').delegate('.pagination a', 'click', function (e) {
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
    $('#sellerlive').delegate('.pagination a', 'click', function (e) {
      e.preventDefault();

      $('#sellerlive').load(this.href);
    });

    $('#sellerlive').load('index.php?route=sellerprofile/sellerprofile/selleradvertiselive&seller_id=<?php echo $seller_id; ?>',function() {
      $("#sellerlivecount").text($("#sellerlive .hovereffect").length);
    });
    $('#pre_loaderr').hide();
  });

</script>
<script type="text/javascript">
  $('.archive').on('click', function () {
    $('#pre_loaderr').show();
    $('#sellerarchive').delegate('.pagination a', 'click', function (e) {
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
    $('#sellertrash').delegate('.pagination a', 'click', function (e) {
      e.preventDefault();

      $('#sellertrash').load(this.href);
    });

    $('#sellertrash').load('index.php?route=sellerprofile/sellerprofile/selleradvertisetrash&seller_id=<?php echo $seller_id; ?>');
    $('#pre_loaderr').hide();
  });

</script>
<script type="text/javascript">
  $('.wallet').on('click', function () {
    $('#sellerwallet').delegate('.pagination a', 'click', function (e) {
      e.preventDefault();

      $('#sellerwallet').load(this.href);
    });

    $('#sellerwallet').load('index.php?route=sellerprofile/sellerprofile/selleradvertisewallet&seller_id=<?php echo $seller_id; ?>');

  });
  $('#sellerwallet').load('index.php?route=sellerprofile/sellerprofile/selleradvertisewallet&seller_id=<?php echo $seller_id; ?>');

</script>
<script type="text/javascript">
  $('.expense').on('click', function () {
    $('#sellerexpense').delegate('.pagination a', 'click', function (e) {
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

  $('#button-history').on('click', function (e) {
    e.preventDefault();

    $.ajax({
      url: 'index.php?route=sellerprofile/sellerprofile/history&seller_id=<?php echo $seller_id; ?>',
      type: 'post',
      dataType: 'html',
      data: 'comment=' + encodeURIComponent($('#tab-history textarea[name=\'comment\']').val()),
      beforeSend: function () {
        $('#button-history').button('loading');
      },
      complete: function () {
        $('#button-history').button('reset');
      },
      success: function (html) {
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
    $('#transaction').delegate('.pagination a', 'click', function (e) {
      e.preventDefault();

      $('#transaction').load(this.href);
    });

  $('#transaction').load('index.php?route=sellerprofile/sellerprofile/transaction&seller_id=<?php echo $seller_id; ?>');

  $('#button-transaction').on('click', function (e) {
    e.preventDefault();

    $.ajax({
      url: 'index.php?route=sellerprofile/sellerprofile/transaction&seller_id=<?php echo $seller_id; ?>',
      type: 'post',
      dataType: 'html',
      data: 'seller_group_id=' + encodeURIComponent($('#tab-transaction select[name=\'seller_group_id\']').val()) + '&amount=' + encodeURIComponent($('#tab-transaction input[name=\'amount\']').val()),
      beforeSend: function () {
        $('#button-transaction').button('loading');
      },
      complete: function () {
        $('#button-transaction').button('reset');
      },
      success: function (html) {
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
    $('#request_membership').delegate('.pagination a', 'click', function (e) {
      e.preventDefault();

      $('#request_membership').load(this.href);
    });

  $('#request_membership').load('index.php?route=sellerprofile/sellerprofile/request_membership&seller_id=<?php echo $seller_id; ?>');

  $('#button-request_membership').on('click', function (e) {
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
        beforeSend: function () {
          $('#button-request_membership').button('loading');
        },
        complete: function () {
          $('#button-request_membership').button('reset');
        },
        success: function (html) {

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
  $(".text-center input:checkbox").on('click', function () {
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
  $(document).delegate('a[data-toggle=\'image\']', 'click', function (e) {
    e.preventDefault();

    var element = this;

    $(element).popover({
      html: true,
      placement: 'right',
      trigger: 'manual',
      content: function () {
        return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
      }
    });

    $(element).popover('toggle');

    $('#button-image').on('click', function () {
      $('#modal-image').remove();

      $.ajax({
        url: 'index.php?route=sellerproduct/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
        dataType: 'html',
        beforeSend: function () {
          $('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
          $('#button-image').prop('disabled', true);
        },
        complete: function () {
          $('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
          $('#button-image').prop('disabled', false);
        },
        success: function (html) {
          $('body').append('<div id="modal-image" class="modal">' + html + '</div>');

          $('#modal-image').modal('show');
        }
      });

      $(element).popover('hide');
    });

    $('#button-clear').on('click', function () {
      $(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));

      $(element).parent().find('input').attr('value', '');

      $(element).popover('hide');
    });
  });

  // banner Manager
  $(document).delegate('a[data-toggle=\'banner\']', 'click', function (e) {
    e.preventDefault();

    var element = this;

    $(element).popover({
      html: true,
      placement: 'right',
      trigger: 'manual',
      content: function () {
        return '<button type="button" id="button-banner" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
      }
    });

    $(element).popover('toggle');

    $('#button-banner').on('click', function () {
      $('#modal-image').remove();

      $.ajax({
        url: 'index.php?route=sellerproduct/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
        dataType: 'html',
        beforeSend: function () {
          $('#button-banner i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
          $('#button-banner').prop('disabled', true);
        },
        complete: function () {
          $('#button-banner i').replaceWith('<i class="fa fa-upload"></i>');
          $('#button-banner').prop('disabled', false);
        },
        success: function (html) {
          $('body').append('<div id="modal-image" class="modal">' + html + '</div>');

          $('#modal-image').modal('show');
        }
      });

      $(element).popover('hide');
    });

    $('#button-clear').on('click', function () {
      $(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));

      $(element).parent().find('input').attr('value', '');

      $(element).popover('hide');
    });
  });

</script>
<script type="text/javascript">
   $(document).delegate('#button-profile-save', 'click', function () {
     if (sessionStorage.getItem("myStoreAddress")) {
       var latLang = sessionStorage.getItem("myStoreAddress").split(',');
       $('#latitude_st').val(latLang[0]);
       $('#longitude_st').val(latLang[1]);
     }

     function convertToSlug(Text) {
       return Text
         .toLowerCase()
         .replace(/[^\w ]+/g, '')
         .replace(/ +/g, '-')
         ;
     }

    //if ((convertToSlug("<?php echo $nickname; ?>) == "" && <?php echo $seller_approved; ?> == 0) || <?php echo $seller_approved; ?> == 1) {
    //  $('.store_msg_alert').remove();
    //  $('#content > .container-fluid').prepend('<div class="alert store_msg_alert alert-danger"><i class="fa fa-exclamation-circle"></i>Store/entity is not approved. Cannot save now.</div>');
    //  $('body, html').animate({ scrollTop: $('#content').offset().top }, 'slow');
    //}
     
     if ($('input[name="agree_tt"]').is(':checked')) {
       var nickname = convertToSlug($('#input-nickname').val());
       var db_nickname = convertToSlug("<?php echo $nickname; ?>");
       var banner = convertToSlug($('#input-banner').val());
       var db_banner = convertToSlug("<?php echo $banner; ?>");


       var has_change = false;
       if (db_nickname != nickname) {
         has_change = true;
       }

       if (banner != '' && banner != db_banner) {
         has_change = true;
       }

       if (has_change) {
         var modal = $('<div id="alert_pop_del" class="modal fade alert_prof_del_close" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>Are you sure want to save?</p><br/><p>You have changed mandatory fields which requires approval from BoN admin. Till it is approved your store/entity will be taken from public access and also you can not save new changes.</p></p></div><div class="modal-footer"><button class="btn store_prof_btn" >Yes</button><button class="btn" data-dismiss="modal" aria-hidden="true">No</button></div></div></div></div></div>');

         $('body').append(modal);
         modal.modal({
           show: true
         })
         $('.store_prof_btn').on('click', function (e) {
           $('.alert_prof_del_close').modal('hide');
           $.ajax({
             url: 'index.php?route=sellerprofile/sellerprofile/profile&seller_id=<?php echo $seller_id; ?>',
             dataType: 'json',
             type: "POST",
             data: $('#form-profile').serialize(),
             beforeSend: function () {
               $('#button-profile-save').button('loading');
             },
             complete: function () {
               $('#button-profile-save').button('reset');

               $('#button-profile-save').addClass('btn-success');
               $('#button-profile-save').removeClass('btn-primary');

             },
             success: function (json) {
                $('.store_msg_alert').remove();
                if (json['error']) {
                  $('#image_pop_cls').prop('disabled', false);

                  //var modal = $('<div id="alert_pop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>'+"Successfully saved store/entity detail!"+'</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true" id="btnSaved" onClick="window.location.reload()">Ok</button></div></div></div></div></div>');
                  
                  //$('body').append(modal);
                  //  modal.modal({
                  //    show: true
                  //  })
                  $('.agree_tt').attr('checked', false);
                  $('#content > .container-fluid').prepend('<div class="alert store_msg_alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                  $('body, html').animate({ scrollTop: $('#content').offset().top }, 'slow');
               }
               else if (json['success']) {
                  var modal = $('<div id="alert_pop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>'+"Successfully saved store/entity detail!"+'</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true" id="btnSaved" onClick="window.location.reload()">Ok</button></div></div></div></div></div>');
                  
                  $('body').append(modal);
                    modal.modal({
                      show: true
                    })
                //$('.agree_tt').attr('checked', false);
                 //$('#content > .container-fluid').prepend('<div class="alert store_msg_alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + '</div>');
                 //$('body, html').animate({ scrollTop: $('#content').offset().top }, 'slow');
               }

             },
             error: function (xhr, ajaxOptions, thrownError) {
               alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
             }
           });
         });

       } else {
         $.ajax({
           url: 'index.php?route=sellerprofile/sellerprofile/profile&seller_id=<?php echo $seller_id; ?>',
           dataType: 'json',
           type: "POST",
           data: $('#form-profile').serialize(),
           beforeSend: function () {
             $('#button-profile-save').button('loading');
           },
           complete: function () {
             $('#button-profile-save').button('reset');

             $('#button-profile-save').addClass('btn-success');
             $('#button-profile-save').removeClass('btn-primary');

           },
           success: function (json) {
             $('.store_msg_alert').remove();
             if (json['error']) {
                var modal = $('<div id="alert_pop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>'+"Successfully saved store/entity detail!"+'</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true" id="btnSaved" onClick="window.location.reload()">Ok</button></div></div></div></div></div>');
              
                $('body').append(modal);
                  modal.modal({
                  show: true
                })
               //$('.agree_tt').attr('checked', false);
               //$('#content > .container-fluid').prepend('<div class="alert store_msg_alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
               //$('body, html').animate({ scrollTop: $('#content').offset().top }, 'slow');
             }
             else if (json['success']) {
              var modal = $('<div id="alert_pop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>'+"Successfully saved store/entity detail!"+'</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true" id="btnSaved" onClick="window.location.reload()">Ok</button></div></div></div></div></div>');
              
              $('body').append(modal);
                modal.modal({
                  show: true
                })
             }

           },
           error: function (xhr, ajaxOptions, thrownError) {
             alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
           }
         });
       }
     } else {
       $('.store_msg_alert').remove();
       $('#content > .container-fluid').prepend('<div class="alert store_msg_alert alert-danger"><i class="fa fa-exclamation-circle"></i>Please agree to the terms and conditions mentioned and then save.</div>');
       $('body, html').animate({ scrollTop: $('#content').offset().top }, 'slow');
     }
   });

</script>
<script type="text/javascript">
  <!--
    $(document).delegate('#button-image-save', 'click', function () {
      var imge_first_val = $('.imgae_empty_check').val();
      if (imge_first_val) {
        $.ajax({
          url: 'index.php?route=sellerprofile/sellerprofile/storeimage&seller_id=<?php echo $seller_id; ?>',
          dataType: 'json',
          data: $('#form-image').serialize(),
          beforeSend: function () {
            $('#button-image-save').button('loading');
          },
          //complete: function () {
          // $('#button-image-save').button('reset');

          //  $('#button-image-save').addClass('btn-success');
          //  $('#button-image-save').removeClass('btn-primary');
            //$("#store_images").removeClass('in');
            //$("#store_images").hide();   
          //  $('#store_images').modal('toggle');

          //},
        success: function(json) {
          $('#storeImagesSuccessMsg').empty().hide();
          
          if (json['error']) {
              $('#storeImagesSuccessMsg').html('<i class="fa fa-check-circle"></i> '+ json.success).show();
          }

          setTimeout(function() {
            $('#store_images').modal('toggle');
            $('#storeImagesSuccessMsg').empty().hide();
          }, 3000);
        },
        error: function(xhr, ajaxOptions, thrownError) {
          $('#storeImageErrorMsg').html('<i class="fa fa-times-circle"></i> '+xhr.responseText).show();
  
          setTimeout(function() {
            $('#storeImageErrorMsg').empty().hide();
          }, 3000);
        }
/*          success: function (json) {
            $('.alert').remove();

            if (json['error']) {
              $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
            }

          },
          error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
*/
        });
      } else {
        var modal = $('<div id="alert_pop_del_empty" class="modal fade alert_prof_del_close" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>Please select atleast one image.</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">ok</button></div></div></div></div></div>');

        $('body').append(modal);
        modal.modal({
          show: true
        })
      }
    });
   //-->

</script>
<script type="text/javascript">
  $('#button-clear').on('click', function () {
    $(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));

    $(element).parent().find('input').attr('value', '');

    $(element).popover('hide');
  });

</script>
<script type="text/javascript">
  $(".allow-prod-cart").change(function () {
    var ischecked = $(this).is(':checked');
    if (!ischecked) {
      var valt = 0;
      var valt_title = $(this).val();
    }
    if (ischecked) {
      var valt = 1;
      var valt_title = $(this).val();
    }
    $.ajax({
      type: "POST",
      url: 'index.php?route=sellerprofile/sellerprofile/allow_products_cart&valt=' + valt + '&valt_title=' + valt_title,
      success: function (data) {
        // alert(data['success']);
      }
    });
  });

</script>

<?php
  //  if(isset($_COOKIE['myStoreAddress'])){
  //    $cookie = $_COOKIE['myStoreAddress'];
  //    $cookie_res = explode(',',$cookie);
  //    $latitude = $cookie_res[0];
  //    $longitude = $cookie_res[1];
  //   } else {
  //    $latitude = '13.067439';
  //    $longitude = '80.237617';
  //   }
  //  echo "<script>\n";
  //  echo "var lat_st = " . $latitude . ";\n";
  //  echo "var log_st = " . $longitude . ";\n";
  //  echo "$('#latitude_st').val(lat_st);";
  //  echo "$('#longitude_st').val(log_st);";
  //  echo "</script>\n";
?>

  <script>
    var lat_st = "<?php echo $lat; ?>";
    var long_st = "<?php echo $lng; ?>";
    if (lat_st != "" && long_st != "")
      sessionStorage.setItem("myStoreAddress", lat_st + "," + long_st)
  </script>
  <script>
    $(document).on('click', '.print_me', function (e) {
      var data_id = $(this).data('id');
      var content = document.getElementById('print_me_qr_' + data_id).innerHTML;
      var win = window.open();
      win.document.write(content);
      win.print();
    });
  </script>
  </div>
  </div>
  <?php echo $footer; ?>