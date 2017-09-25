<?php

class Controllersellerprofilesellerprofile extends Controller
{
    private $error = array();
	
    public function index()
    {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('sellerprofile/sellerprofile', '', 'SSL');

            $this->response->redirect($this->url->link('common/home', '', 'SSL'));
        }

        $this->document->addStyle('http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css');
        $this->document->addScript('catalog/view/javascript/jquery-ui.multidatespicker.js');
        $this->document->addScript('catalog/view/javascript/sellerprofile/sellerprofile.js');
        $this->document->addScript('catalog/view/javascript/sellerprofile/sellerprofile_selleradvertise_approved.js');

        $this->load->model('sellerproduct/seller');
        $this->load->model('sellerprofile/sellerprofile');
        $this->load->model('catalog/category');
        $this->load->model('tool/image');
        $this->load->model('selleradvertise/advertise');

        $this->load->language('sellerprofile/sellerprofile');
        $this->document->setTitle($this->language->get('heading_title'));

        $data['column_seller_group'] = $this->language->get('column_seller_group');
        $data['column_commission'] = $this->language->get('column_commission');
        $data['column_commission_rate'] = $this->language->get('column_commission_rate');
        $data['column_subscription_price'] = $this->language->get('column_subscription_price');
        $data['column_product_limit'] = $this->language->get('column_product_limit');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_subscription_duration'] = $this->language->get('column_subscription_duration');
        $data['column_seller_group_description'] = $this->language->get('column_seller_group_description');
        $data['column_categories'] = $this->language->get('column_categories');
        $data['column_group_categories'] = $this->language->get('column_group_categories');

        $data['column_sort_order'] = $this->language->get('column_sort_order');

        $data['map'] = $this->load->controller('sellerprofile/map');
        $data['chart'] = $this->load->controller('sellerprofile/chart');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_seller_detail'] = $this->language->get('text_seller_detail');
        $data['text_seller_profile'] = $this->language->get('text_seller_profile');
        $data['entry_seller_avatar'] = $this->language->get('entry_seller_avatar');
        $data['entry_seller_banner'] = $this->language->get('entry_seller_banner');
        $data['entry_all_categories'] = $this->language->get('entry_all_categories');
        $data['text_seller_group_detail'] = $this->language->get('text_seller_group_detail');
		$data['entry_store_email'] = $this->language->get('entry_store_email');
		$data['entry_store_mobile_num'] = $this->language->get('entry_store_mobile_num');
		$data['entry_store_ll_num'] = $this->language->get('entry_store_ll_num');
		$data['entry_store_ll_code'] = $this->language->get('entry_store_ll_code');

        $data['text_form'] = !isset($this->request->get['seller_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_loading'] = $this->language->get('text_loading');
        $data['text_add_ban_ip'] = $this->language->get('text_add_ban_ip');
        $data['text_remove_ban_ip'] = $this->language->get('text_remove_ban_ip');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_seller_group_commission'] = $this->language->get('entry_seller_group_commission');
        $data['entry_seller_group_commission_rate'] = $this->language->get('entry_seller_group_commission_rate');
        $data['entry_date_created'] = $this->language->get('entry_date_created');
        $data['entry_date_end'] = $this->language->get('entry_date_end');
        $data['entry_seller_group'] = $this->language->get('entry_seller_group');
        $data['entry_firstname'] = $this->language->get('entry_firstname');
        $data['entry_lastname'] = $this->language->get('entry_lastname');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_telephone'] = $this->language->get('entry_telephone');
        $data['entry_fax'] = $this->language->get('entry_fax');
        $data['entry_password'] = $this->language->get('entry_password');
        $data['entry_confirm'] = $this->language->get('entry_confirm');
        $data['entry_newsletter'] = $this->language->get('entry_newsletter');
        $data['entry_safe'] = $this->language->get('entry_safe');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_company_id'] = $this->language->get('entry_company_id');
        $data['entry_branch_id'] = $this->language->get('entry_branch_id');
        $data['entry_bank'] = $this->language->get('entry_bank');
        $data['entry_bankaccount_1'] = $this->language->get('entry_bankaccount_1');
        $data['entry_bankaccount_2'] = $this->language->get('entry_bankaccount_2');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_postcode'] = $this->language->get('entry_postcode');
        $data['entry_zone'] = $this->language->get('entry_zone');
        $data['entry_country'] = $this->language->get('entry_country');
        $data['entry_default'] = $this->language->get('entry_default');
        $data['entry_comment'] = $this->language->get('entry_comment');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_store_address'] = $this->language->get('entry_store_address');
        $data['entry_amount'] = $this->language->get('entry_amount');
        $data['entry_points'] = $this->language->get('entry_points');
        $data['entry_seller_group_limit'] = $this->language->get('entry_seller_group_limit');
        $data['entry_seller_group_subscription_price'] = $this->language->get('entry_seller_group_subscription_price');
        $data['entry_seller_product_total'] = $this->language->get('entry_seller_product_total');
        $data['entry_seller_product_left'] = $this->language->get('entry_seller_product_left');

        $data['help_safe'] = $this->language->get('help_safe');
        $data['help_points'] = $this->language->get('help_points');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_bankaccount_add'] = $this->language->get('button_bankaccount_add');
        $data['button_history_add'] = $this->language->get('button_history_add');
        $data['button_transaction_add'] = $this->language->get('button_transaction_add');
        $data['button_request_membership_add'] = $this->language->get('button_request_membership_add');
        $data['entry_facebook'] = $this->language->get('entry_facebook');
        $data['entry_website'] = $this->language->get('entry_website');
        $data['entry_twitter'] = $this->language->get('entry_twitter');
        $data['entry_activate'] = $this->language->get('entry_activate');
        $data['entry_nickname'] = $this->language->get('entry_nickname');
		$data['entry_owner_name'] = $this->language->get('entry_owner_name');
		$data['entry_pan'] = $this->language->get('entry_pan');
		$data['entry_tin'] = $this->language->get('entry_tin');
		$data['placeholder_pan'] = $this->language->get('placeholder_pan');
		$data['placeholder_tin'] = $this->language->get('placeholder_tin');
        $data['entry_googleplus'] = $this->language->get('entry_googleplus');
        $data['entry_instagram'] = $this->language->get('entry_instagram');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_upload'] = $this->language->get('button_upload');

        $data['tab_dashboard'] = $this->language->get('tab_dashboard');
        $data['tab_bankaccount'] = $this->language->get('tab_bankaccount');
        $data['tab_history'] = $this->language->get('tab_history');
        $data['tab_badge'] = $this->language->get('tab_badge');
        $data['tab_sellerproduct'] = $this->language->get('tab_sellerproduct');
        $data['tab_transaction'] = $this->language->get('tab_transaction');
        $data['tab_request_membership'] = $this->language->get('tab_request_membership');
        $data['tab_more_details'] = $this->language->get('tab_more_details');
		$data['tab_store_ad'] = $this->language->get('tab_store_ad');
		$data['tab_profile_details'] = $this->language->get('tab_profile_details');
        $data['tab_ip'] = $this->language->get('tab_ip');

        if ($this->config->get('config_seller_agree_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('config_seller_agree_id'));

            if ($information_info) {
                $data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id='.$this->config->get('config_seller_agree_id'), 'SSL'), $information_info['title'], $information_info['title']);
            } else {
                $data['text_agree'] = '';
            }
        } else {
            $data['text_agree'] = '';
        }

        if (isset($information_info['title'])) {
            $data['text_seller_agree'] = sprintf($this->language->get('text_seller_agree'), $information_info['title']);
        }

        $data['banks'] = $this->model_sellerprofile_sellerprofile->getbankes();

        $data['seller_id'] = $this->customer->getId();		

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', '', 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sellerprofile/sellerprofile', '', 'SSL'),
        );

        $data['cancel'] = $this->url->link('account/account', '', 'SSL');

        $seller_info = $this->model_sellerprofile_sellerprofile->getseller($this->customer->getId());

		$category_seller = array();

        $seller_categories = ['category' => [], 'sub_categories' => ''];

		$category_ids = json_decode($seller_info['seller_category']);

        $categories_list = $this->model_catalog_category->getCategoriesList();

        foreach ($category_ids as $value) {
            if($value->category && $categories_list[$value->category]) {
                $seller_categories['category'][] = $categories_list[$value->category];
                $sub_category_ids = implode($value->sub_categories, "','");
                $sub_categories_list = $this->model_catalog_category->getSubCategories($value->category, $sub_category_ids);

                $seller_categories['sub_categories'][] = $sub_categories_list;
            }
        }

		$data['category_seller'] = $seller_categories;
		$data['allow_products'] = $seller_info['allow_products'];
		$data['allow_cart']     = $seller_info['allow_cart'];
		$data['seller_approved'] = $seller_info['seller_approved'];
		$data['seller_verified'] = $seller_info['seller_verified'];
		$data['seller_reject_reason'] = $seller_info['seller_reject_reason'];
		$data['token'] = (isset($this->session->data['token']) && $this->session->data['token'] != '') ? $this->session->data['token'] : '';
		$data['login_type'] = (isset($this->session->data['login_type']) && $this->session->data['login_type'] != '') ? $this->session->data['login_type'] : '';
        $data['seller_product_total'] = $this->model_sellerprofile_sellerprofile->getTotalProducts();
        $data['seller_groups'] = $this->model_sellerprofile_sellerprofile->getSellerGroups();

        if (isset($this->request->post['seller_group_id'])) {
            $data['seller_group_id'] = $this->request->post['seller_group_id'];
        } elseif (!empty($seller_info)) {
            $data['seller_group_id'] = $seller_info['seller_group_id'];
        } else {
            $data['seller_group_id'] = $this->config->get('config_seller_group_id');
        }


        if ($this->config->get('config_sellerimageupload')) {
            $data['sellerimageupload'] = '1';
        } else {
            $data['sellerimageupload'] = '0';
        }

        if (isset($this->request->post['image'])) {
            $data['image'] = $this->request->post['image'];
        } elseif (!empty($seller_info)) {
            $data['image'] = $seller_info['image'];
        } else {
            $data['image'] = '';
        }

        if (isset($this->request->post['image']) && is_file(DIR_IMAGE.$this->request->post['image'])) {
            $data['thumb_image'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
        } elseif (!empty($seller_info) && is_file(DIR_IMAGE.$seller_info['image'])) {
            $data['thumb_image'] = $this->model_tool_image->resize($seller_info['image'], 100, 100);
        } else {
            $data['thumb_image'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        if (isset($this->request->post['banner'])) {
            $data['banner'] = $this->request->post['banner'];
        } elseif (!empty($seller_info)) {
            $data['banner'] = $seller_info['banner'];
        } else {
            $data['banner'] = '';
        }

        if (isset($this->request->post['banner']) && is_file(DIR_IMAGE.$this->request->post['banner'])) {
            $data['thumb_banner'] = $this->model_tool_image->resize($this->request->post['banner'], 100, 100);
        } elseif (!empty($seller_info) && is_file(DIR_IMAGE.$seller_info['banner'])) {
            $data['thumb_banner'] = $this->model_tool_image->resize($seller_info['banner'], 100, 100);
        } else {
            $data['thumb_banner'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        $data['is_seller'] = $this->customer->isSeller();

        if (isset($this->request->post['seller_group'])) {
            $data['seller_group'] = $this->request->post['seller_group'];		
        } elseif (!empty($seller_info)) {
            $data['is_seller'] = $this->customer->isSeller();
            $data['seller_group'] = $seller_info['name'];
        } else {
            $data['seller_group'] = '';
        }

        if (isset($this->request->post['seller_group_limit'])) {
            $data['seller_group_limit'] = $this->request->post['seller_group_limit'];
        } elseif (!empty($seller_info)) {
            $data['seller_group_limit'] = $seller_info['product_limit'];
        } else {
            $data['seller_group_limit'] = '';
        }

        if (isset($this->request->post['seller_description'])) {
            $data['seller_description'] = $this->request->post['seller_description'];
        } elseif (!empty($seller_info)) {
            $data['seller_description'] = $seller_info['seller_description'];
        } else {
            $data['seller_description'] = '';
        }

        $data['store_activated'] = $seller_info['active'];
        $data['seller_address'] = $seller_info['address'];

        if (isset($this->request->post['facebook'])) {
            $data['facebook'] = $this->request->post['facebook'];
        } elseif (!empty($seller_info)) {
            $data['facebook'] = $seller_info['facebook'];
        } else {
            $data['facebook'] = '';
        }

        if (isset($this->request->post['website'])) {
            $data['website'] = $this->request->post['website'];
        } elseif (!empty($seller_info)) {
            $data['website'] = $seller_info['website'];
        } else {
            $data['website'] = '';
        }

        if (isset($this->request->post['twitter'])) {
            $data['twitter'] = $this->request->post['twitter'];
        } elseif (!empty($seller_info)) {
            $data['twitter'] = $seller_info['twitter'];
        } else {
            $data['twitter'] = '';
        }

        if (isset($this->request->post['nickname'])) {
            $data['nickname'] = $this->request->post['nickname'];
        } elseif (!empty($seller_info)) {
            $data['nickname'] = $seller_info['nickname'];
        } else {
            $data['nickname'] = '';
        }

		if (isset($this->request->post['referred_by'])) {
            $data['referred_by'] = $this->request->post['referred_by'];
        } elseif (!empty($seller_info)) {
			$data['referred_by'] = $seller_info['referred_by'];
        } else {
            $data['referred_by'] = '';
        }

		if (isset($this->request->post['owner_name'])) {
            $data['owner_name'] = $this->request->post['owner_name'];
        } elseif (!empty($seller_info)) {
            $data['owner_name'] = $seller_info['owner_name'];
        } else {
            $data['owner_name'] = '';
        }

		if (isset($this->request->post['store_ll_num'])) {
            $data['store_ll_num'] = $this->request->post['store_ll_num'];
        } elseif (!empty($seller_info)) {
            $data['store_ll_num'] = $seller_info['store_ll_num'];
        } else {
            $data['store_ll_num'] = '';
        }

		if (isset($this->request->post['store_mobile_num'])) {
            $data['store_mobile_num'] = $this->request->post['store_mobile_num'];
        } elseif (!empty($seller_info['store_mobile_num'])) {
            $data['store_mobile_num'] = $seller_info['store_mobile_num'];
		} elseif (!empty($seller_info['telephone'])) {
            $data['store_mobile_num'] = $seller_info['telephone'];
        } else {
            $data['store_mobile_num'] = '';
        }

		if (isset($this->request->post['store_email'])) {
            $data['store_email'] = $this->request->post['store_email'];
        } elseif (!empty($seller_info['store_email'])) {
            $data['store_email'] = $seller_info['store_email'];
		} elseif (!empty($seller_info['email'])) {
            $data['store_email'] = $seller_info['email'];
        } else {
            $data['store_email'] = '';
        }

		if (isset($this->request->post['tin'])) {
            $data['tin'] = $this->request->post['tin'];
        } elseif (!empty($seller_info)) {
            $data['tin'] = $seller_info['tin'];
        } else {
            $data['tin'] = '';
        }

		if (isset($this->request->post['pan'])) {
            $data['pan'] = $this->request->post['pan'];
        } elseif (!empty($seller_info)) {
            $data['pan'] = $seller_info['pan'];
        } else {
            $data['pan'] = '';
        }

		if (isset($this->request->post['lat'])) {
            $data['lat'] = $this->request->post['lat'];
        } elseif (!empty($seller_info)) {
            $data['lat'] = $seller_info['lat'];
        } else {
            $data['lat'] = '';
        }

		if (isset($this->request->post['lng'])) {
            $data['lng'] = $this->request->post['lng'];
        } elseif (!empty($seller_info)) {
            $data['lng'] = $seller_info['lng'];
        } else {
            $data['lng'] = '';
        }

        if (isset($this->request->post['googleplus'])) {
            $data['googleplus'] = $this->request->post['googleplus'];
        } elseif (!empty($seller_info)) {
            $data['googleplus'] = $seller_info['googleplus'];
        } else {
            $data['googleplus'] = '';
        }

        if (isset($this->request->post['instagram'])) {
            $data['instagram'] = $this->request->post['instagram'];
        } elseif (!empty($seller_info)) {
            $data['instagram'] = $seller_info['instagram'];
        } else {
            $data['instagram'] = '';
        }

        if (isset($this->request->post['seller_group_subscription_price'])) {
            $data['seller_group_subscription_price'] = $this->request->post['seller_group_subscription_price'];
        } elseif (!empty($seller_info)) {
            $data['seller_group_subscription_price'] = $this->currency->format($seller_info['subscription_price'], $this->session->data['currency']);
        } else {
            $data['seller_group_subscription_price'] = '';
        }
        if (isset($this->request->post['commission'])) {
            $data['commission'] = $this->request->post['commission'];
        } elseif (!empty($seller_info)) {
            $data['commission'] = $this->currency->format($seller_info['commission'], $this->session->data['currency']).' + '.$seller_info['fee']."%";
        } else {
            $data['commission'] = '';
        }

        if (isset($this->request->post['firstname'])) {
            $data['firstname'] = $this->request->post['firstname'];
        } elseif (!empty($seller_info)) {
            $data['firstname'] = $seller_info['firstname'];
        } else {
            $data['firstname'] = '';
        }

        if (isset($this->request->post['lastname'])) {
            $data['lastname'] = $this->request->post['lastname'];
        } elseif (!empty($seller_info)) {
            $data['lastname'] = $seller_info['lastname'];
        } else {
            $data['lastname'] = '';
        }

        if (isset($this->request->post['email'])) {
            $data['email'] = $this->request->post['email'];
        } elseif (!empty($seller_info)) {
            $data['email'] = $seller_info['email'];
        } else {
            $data['email'] = '';
        }

		if (isset($this->request->post['delivery_type'])) {
            $data['delivery_type'] = $this->request->post['delivery_type'];
        } elseif (!empty($seller_info)) {
            $data['delivery_type'] = $seller_info['delivery_type'];
        } else {
            $data['delivery_type'] = '';
        }

        if (isset($this->request->post['telephone'])) {
            $data['telephone'] = $this->request->post['telephone'];
        } elseif (!empty($seller_info)) {
            $data['telephone'] = $seller_info['telephone'];
        } else {
            $data['telephone'] = '';
        }

        if (isset($this->request->post['date'])) {
            $data['date'] = $this->request->post['date'];
        } elseif (!empty($seller_info)) {
            $data['date'] = date($this->language->get('date_format_short'), strtotime($seller_info['seller_date_added']));
        } else {
            $data['date'] = '';
        }

        if (!empty($seller_info) && $seller_info['subscription_duration'] != 0) {
            $data['date_end'] = date($this->language->get('date_format_short'), strtotime('+'.$seller_info['subscription_duration'].'months', strtotime($seller_info['seller_date_added'])));
        } else {
            $data['date_end'] = $this->language->get('text_unlimited');
        }

        $data['text_unlimited'] = $this->language->get('text_unlimited');

        if (isset($this->request->post['bankaccount'])) {
            $data['bankaccounts'] = $this->request->post['bankaccount'];
        } elseif (isset($this->request->get['seller_id'])) {
            $data['bankaccounts'] = $this->model_sellerprofile_sellerprofile->getbankaccounts($this->customer->getId());
        } else {
            $data['bankaccounts'] = array();
        }

        if (isset($this->request->post['bankaccount_id'])) {
            $data['bankaccount_id'] = $this->request->post['bankaccount_id'];
        } elseif (!empty($seller_info)) {
            $data['bankaccount_id'] = $seller_info['bankaccount_id'];
        } else {
            $data['bankaccount_id'] = '';
        }

		$data['seller_counter'] =$seller_info['seller_counter'];
		$data['feature_store_start'] =$seller_info['feature_store_start'];
		$data['feature_store_end'] =$seller_info['feature_store_end'];
		$today = date('m/d/Y');
		$today = strtotime($today);
		$finish = $seller_info['feature_store_end'];
		$finish = strtotime($finish);
		//difference
		$diff = $finish - $today;

		$data['daysleft'] = floor($diff/(60*60*24));
		$data['favourites_customer_count'] = $this->model_sellerprofile_sellerprofile->getfavourites_customer_count($this->customer->getId());
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        if (isset($this->request->post['seller_group_id'])) {
            $data['seller_group_id'] = $this->request->post['seller_group_id'];
        } else {
            $data['seller_group_id'] = $this->model_sellerprofile_sellerprofile->getSellerGroupId();
        }

        $data['seller_request'] = $this->model_sellerprofile_sellerprofile->getSellerrequest();

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'cgd.name';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort='.$this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order='.$this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page='.$this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', '', 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sellerprofile/sellerprofile',  $url, 'SSL'),
        );

        $data['column_commission'] = $this->language->get('column_commission');
        $data['column_commission_rate'] = $this->language->get('column_commission_rate');

        $this->load->model('sellerproduct/category');
        $this->load->model('sellerproduct/product');

		$data['order_edit'] = $this->url->link('order/order', '', 'SSL');
		$data['button_edit_order'] = $this->language->get('button_edit_order');


        $data['seller_groups'] = array();

        $filter_data = array(
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin'),
        );

        $seller_product_total = $this->model_sellerprofile_sellerprofile->getTotalProducts();

        $results = $this->model_sellerprofile_sellerprofile->getSellerGroups($filter_data);

        foreach ($results as $result) {
            $data['seller_groups'][] = array(
                'seller_group_id' => $result['seller_group_id'],
                'seller_categories' => $this->model_sellerproduct_category->getCategories(''),
				'seller_categories_singles' => $this->model_sellerproduct_category->getCategories_toseller(''),
				'name' => $result['name'],
                'sort_order' => $result['sort_order'],
                'description' => $result['description'],
                'product_limit' => ($result['product_limit'] != "0") ? $result['product_limit'] :  $this->language->get('text_unlimited') ,
                'text_subscription_duration' => sprintf($this->language->get('text_subscription_duration'), $result['subscription_duration']),
                'subscription_price' => $this->currency->format($result['subscription_price'], $this->session->data['currency']),
                'subscription_duration' => $result['subscription_duration'],
                'commission' => $this->currency->format($result['commission'], $this->session->data['currency']).' + '.$result['fee']."%",
                'categories' => $this->model_sellerproduct_category->getsellergroupCategoriesByGroupId($result['seller_group_id'])
            );
        }

		$data['error_warning_product_limit'] = '';

        if (!empty($seller_info)) {
			if ($seller_info['product_limit'] != 0) {
                if ($seller_product_total >= $seller_info['product_limit']) {
                    $data['error_warning_product_limit'] = $this->language->get('warning_product_limit');
                }
			}
        }

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_product_limit'] = $this->language->get('column_product_limit');
        $data['column_subscription_price'] = $this->language->get('column_subscription_price');
        $data['column_action'] = $this->language->get('column_action');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array) $this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page='.$this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('sellerprofile/sellerprofile',  '&sort=cgd.name'.$url, 'SSL');
        $data['sort_sort_order'] = $this->url->link('sellerprofile/sellerprofile',  '&sort=cg.sort_order'.$url, 'SSL');
        $data['sort_product_limit'] = $this->url->link('sellerprofile/sellerprofile',  '&sort=cg.product_limit'.$url, 'SSL');
        $data['sort_subscription_price'] = $this->url->link('sellerprofile/sellerprofile',  '&sort=cg.subscription_price'.$url, 'SSL');

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort='.$this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order='.$this->request->get['order'];
        }

        $data['sort'] = $sort;
        $data['order'] = $order;

		//profile details personal
		$this->load->language('account/edit');
		$this->load->model('account/customer');

		$data['customer_info'] = $this->model_account_customer->getCustomer($this->customer->getId());

		$data['text_your_details'] = $this->language->get('text_your_details');
		$data['text_additional'] = $this->language->get('text_additional');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['button_edit_profile'] = $this->language->get('button_edit_profile');
		$data['button_edit_password'] = $this->language->get('button_edit_password');

		$data['profile_edit'] = $this->url->link('account/edit', '', true);
		$data['password_edit'] = $this->url->link('account/password', '', true);

		//profile Address details
		$this->load->language('account/address');
		$this->load->model('account/address');

		$data['text_address_book'] = $this->language->get('text_address_book');
		$data['text_empty'] = $this->language->get('text_empty');

		$data['button_new_address'] = $this->language->get('button_new_address');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_back'] = $this->language->get('button_back');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['addresses'] = array();

		$results = $this->model_account_address->getAddresses();

		foreach ($results as $result) {
			if ($result['address_format']) {
				$format = $result['address_format'];
			} else {
				$format = '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
			}

			$find = array(
				'{address_1}',
				'{address_2}',
				'{city}',
				'{postcode}',
				'{zone}',
				'{zone_code}',
				'{country}'
			);

			$replace = array(
				'address_1' => $result['address_1'],
				'address_2' => $result['address_2'],
				'city'      => $result['city'],
				'postcode'  => $result['postcode'],
				'zone'      => $result['zone'],
				'zone_code' => $result['zone_code'],
				'country'   => $result['country']
			);

			$data['addresses'][] = array(
				'address_id' => $result['address_id'],
				'address'    => str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format)))),
				'update'     => $this->url->link('account/address/edit', 'address_id=' . $result['address_id'], true),
				'delete'     => $this->url->link('account/address/delete', 'address_id=' . $result['address_id'], true)
			);
		}

		// Store Images
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		$data['button_image_add'] = $this->language->get('button_image_add');

		$store_timings = $this->model_sellerprofile_sellerprofile->getstore_timings($this->customer->getId());

		if($store_timings) {
			$data['store_timings'] = $store_timings;
		} else {
			$data['store_timings'] = 
				array(
				"monday" => "a:4:{s:3:\"day\";s:6:\"monday\";s:6:\"status\";s:5:\"close\";s:4:\"from\";a:1:{i:0;s:7:\"8:00 PM\";}s:2:\"to\";a:1:{i:0;s:7:\"8:00 PM\";}}",
				"tuesday" => "a:4:{s:3:\"day\";s:6:\"monday\";s:6:\"status\";s:5:\"close\";s:4:\"from\";a:1:{i:0;s:7:\"8:00 PM\";}s:2:\"to\";a:1:{i:0;s:7:\"8:00 PM\";}}",
				"wednesday" => "a:4:{s:3:\"day\";s:6:\"monday\";s:6:\"status\";s:5:\"close\";s:4:\"from\";a:1:{i:0;s:7:\"8:00 PM\";}s:2:\"to\";a:1:{i:0;s:7:\"8:00 PM\";}}",
				"thursday" => "a:4:{s:3:\"day\";s:6:\"monday\";s:6:\"status\";s:5:\"close\";s:4:\"from\";a:1:{i:0;s:7:\"8:00 PM\";}s:2:\"to\";a:1:{i:0;s:7:\"8:00 PM\";}}",
				"friday" => "a:4:{s:3:\"day\";s:6:\"monday\";s:6:\"status\";s:5:\"close\";s:4:\"from\";a:1:{i:0;s:7:\"8:00 PM\";}s:2:\"to\";a:1:{i:0;s:7:\"8:00 PM\";}}",
				"saturday" => "a:4:{s:3:\"day\";s:6:\"monday\";s:6:\"status\";s:5:\"close\";s:4:\"from\";a:1:{i:0;s:7:\"8:00 PM\";}s:2:\"to\";a:1:{i:0;s:7:\"8:00 PM\";}}",
				"sunday" => "a:4:{s:3:\"day\";s:6:\"monday\";s:6:\"status\";s:5:\"close\";s:4:\"from\";a:1:{i:0;s:7:\"8:00 PM\";}s:2:\"to\";a:1:{i:0;s:7:\"8:00 PM\";}}");		
		}

		$store_images = $this->model_sellerprofile_sellerprofile->getStoreImages($this->customer->getId());

		$data['store_images'] = array();

		foreach ($store_images as $store_image) {
			if (is_file(DIR_IMAGE . $store_image['image'])) {
				$image = $store_image['image'];
				$thumb = $store_image['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}

			$data['store_images'][] = array(
				'image'      => $image,
				'thumb'      => $this->model_tool_image->resize($thumb, 100, 100),
				'sort_order' => $store_image['sort_order']
			);
		}

		$data['draft_tt'] = $this->model_selleradvertise_advertise->getTotalAdvertisesDraft();
		$data['submitted_tt'] = $this->model_selleradvertise_advertise->getTotalAdvertisesSubmitted();
		$data['approved_tt'] = $this->model_selleradvertise_advertise->getTotalAdvertisesApproved();
		$data['rejected_tt'] = $this->model_selleradvertise_advertise->getTotalAdvertisesRejected();
		$data['paid_tt'] = $this->model_selleradvertise_advertise->getTotalAdvertisesPaid();
		$data['archive_tt'] = $this->model_selleradvertise_advertise->getTotalAdvertisesArchive();
		$data['trash_tt'] = $this->model_selleradvertise_advertise->getTotalAdvertisesTrash();

		$ad = $this->model_selleradvertise_advertise->getTotalAdvertisesLive();

		foreach($ad as $ads) {
			$adv[] = $ads['total'];
		}		

		$data['live_tt'] = array_sum($adv);

        $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_form', $data));
    }

    public function badge()
    {
        $this->load->language('sellerprofile/sellerprofile');

        $this->load->model('sellerprofile/sellerprofile');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_badge'] = $this->language->get('entry_badge');
        $data['text_no_results'] = $this->language->get('text_no_results');

        if (isset($this->request->post['seller_badge'])) {
            $data['seller_badge'] = $this->request->post['seller_badge'];
        } elseif (isset($this->request->get['seller_id'])) {
            $data['seller_badge'] = $this->model_sellerprofile_sellerprofile->getbadgeseller($this->request->get['seller_id']);
        } else {
            $data['seller_badge'] = array($this->config->get('config_badge_id'));
        }

        $data['seller_badge'] = $this->model_sellerprofile_sellerprofile->getbadgeseller($this->customer->getId());

        $data['badges'] = array();

        $results = $this->model_sellerprofile_sellerprofile->getsellerbadges();

        $this->load->model('tool/image');

        foreach ($results as $result) {
            $data['badges'][] = array(
            'badge_id' => $result['badge_id'],
                'title' => $result['title'],
                'image' => (is_file(DIR_IMAGE.$result['image']) ? $this->model_tool_image->resize($result['image'], 40, 40) : $this->model_tool_image->resize('no_image.png', 40, 40)),
            );
        }


            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_badge', $data));

    }

    public function sellerproduct()
    {
        $this->load->language('sellerproduct/product');
        $this->load->language('sellerprofile/sellerprofile');
        $this->load->model('sellerprofile/sellerprofile');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_sellerproduct'] = $this->language->get('entry_sellerproduct');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit_mode'] = $this->language->get('button_edit_mode');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_price'] = $this->language->get('column_price');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_action'] = $this->language->get('column_action');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->post['sellerprofile_sellerprofileproduct'])) {
            $data['sellerprofile_sellerprofileproduct'] = $this->request->post['sellerprofile_sellerprofileproduct'];
        } elseif (isset($this->request->get['seller_id'])) {
            $data['sellerprofile_sellerprofileproduct'] = $this->model_sellerprofile_sellerprofile->getsellerproducts($this->request->get['seller_id']);
        } else {
            $data['sellerprofile_sellerprofileproduct'] = array($this->config->get('config_sellerproduct_id'));
        }

        $data['edit'] = $this->url->link('sellerproduct/product', '', 'SSL');

        $data['products'] = array();

        $this->load->model('tool/image');
        $this->load->model('sellerproduct/product');


        $results = $this->model_sellerprofile_sellerprofile->getProducts(($page - 1) * 10, 10);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 40, 40);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 40, 40);
            }

            $special = false;

            $product_specials = $this->model_sellerproduct_product->getProductSpecials($result['product_id']);

            foreach ($product_specials  as $product_special) {
                if (($product_special['date_start'] == '0000-00-00' || strtotime($product_special['date_start']) < time()) && ($product_special['date_end'] == '0000-00-00' || strtotime($product_special['date_end']) > time())) {
                    $special = $product_special['price'];

                    break;
                }
            }

            $data['products'][] = array(
                'product_id' => $result['product_id'],
                'image' => $image,
                'name' => $result['name'],
                'model' => $result['model'],
                'price' => $result['price'],
                'special' => $special,
                'quantity' => $result['quantity'],
                'status' => ($result['status']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
        );
        }

        $product_total = $this->model_sellerprofile_sellerprofile->getTotalProducts();

        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerprofile/sellerprofile/sellerproduct', 'seller_id='.$this->request->get['seller_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($product_total - 10)) ? $product_total : ((($page - 1) * 10) + 10), $product_total, ceil($product_total / 10));


            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_sellerproduct', $data));

    }

    public function history()
    {
        $this->load->language('sellerprofile/sellerprofile');

        $this->load->model('sellerprofile/sellerprofile');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_comment'] = $this->language->get('column_comment');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['histories'] = array();

        $results = $this->model_sellerprofile_sellerprofile->getHistories($this->request->get['seller_id'], ($page - 1) * 10, 10);

        foreach ($results as $result) {
            $data['histories'][] = array(
                'comment' => $result['comment'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
            );
        }

        $history_total = $this->model_sellerprofile_sellerprofile->getTotalHistories($this->request->get['seller_id']);

        $pagination = new Pagination();
        $pagination->total = $history_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerprofile/sellerprofile/history', '&seller_id='.$this->request->get['seller_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($history_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($history_total - 10)) ? $history_total : ((($page - 1) * 10) + 10), $history_total, ceil($history_total / 10));


        $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_history', $data));

    }

    public function transaction()
    {
        $this->load->language('sellerprofile/sellerprofile');

        $this->load->model('sellerprofile/sellerprofile');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->hasPermission('modify', 'sellerprofile/sellerprofile')) {
            $this->model_sellerprofile_sellerprofile->addTransaction($this->request->get['seller_id'], $this->request->post['description'], $this->request->post['amount']);

            $data['success'] = $this->language->get('text_success');
        } else {
            $data['success'] = '';
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$this->user->hasPermission('modify', 'sellerprofile/sellerprofile')) {
            $data['error_warning'] = $this->language->get('error_permission');
        } else {
            $data['error_warning'] = '';
        }

        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_balance'] = $this->language->get('text_balance');
        $data['text_commission'] = $this->language->get('text_commission');
        $data['text_subscription_price'] = $this->language->get('text_subscription_price');
        $data['text_total'] = $this->language->get('text_total');
        $data['text_amount'] = $this->language->get('text_amount');

        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_description'] = $this->language->get('column_description');
        $data['column_amount'] = $this->language->get('column_amount');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['transactions'] = array();

        $results = $this->model_sellerprofile_sellerprofile->getTransactions($this->request->get['seller_id'], ($page - 1) * 10, 10);

        foreach ($results as $result) {
            $data['transactions'][] = array(
                'amount' => $this->currency->format($result['amount'], $this->session->data['currency']),
                'description' => $result['description'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
            );
        }

        $data['balance'] = $this->currency->format($this->model_sellerprofile_sellerprofile->getTransactionTotal($this->request->get['seller_id']), $this->session->data['currency']);
        $balance = $this->model_sellerprofile_sellerprofile->getTransactionTotal($this->request->get['seller_id']);

        $seller_info = $this->model_sellerprofile_sellerprofile->getseller($this->customer->getId());
        if($seller_info){


        $commission = $seller_info['commission'];
        $fee = $seller_info['fee'];

        $data['commissions'] = $this->currency->format($seller_info['commission'], $this->session->data['currency']).' + '.($balance * $fee / 100)."%";
        $data['commission'] = $this->currency->format($seller_info['commission'], $this->session->data['currency']);
        $data['fee'] = $seller_info['fee'];

        $data['total'] = $this->currency->format($balance - $commission - ($balance * $fee / 100), $this->session->data['currency']);
}
        $transaction_total = $this->model_sellerprofile_sellerprofile->getTotalTransactions($this->request->get['seller_id']);

        $pagination = new Pagination();
        $pagination->total = $transaction_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerprofile/sellerprofile/transaction', '&seller_id='.$this->request->get['seller_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($transaction_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($transaction_total - 10)) ? $transaction_total : ((($page - 1) * 10) + 10), $transaction_total, ceil($transaction_total / 10));


            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_transaction', $data));

    }

    public function request_membership()
    {
        $this->load->language('sellerprofile/sellerprofile');

        $this->load->model('sellerprofile/sellerprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $this->model_sellerprofile_sellerprofile->addrequest_membership($this->request->get['seller_id'], $this->request->post);
            $this->model_sellerprofile_sellerprofile->addHistory($this->request->get['seller_id'], sprintf($this->language->get('text_request_message'), $this->request->post['seller_group_name']));

            // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('request_add', $activity_data);

            $data['success'] = $this->language->get('text_success');
        } else {
            $data['success'] = '';
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $data['error_warning'] = $this->language->get('error_permission');
        } else {
            $data['error_warning'] = '';
        }

        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_balance'] = $this->language->get('text_balance');
        $data['text_not_seller'] = $this->language->get('text_not_seller');
        $data['text_request'] = $this->language->get('text_request');
        $data['text_seller_no_approved'] = $this->language->get('text_seller_no_approved');
        $data['text_seller'] = $this->language->get('text_seller');
        $data['text_seller_change_group'] = $this->language->get('text_seller_change_group');
        $data['seller_request'] = $this->model_sellerprofile_sellerprofile->getSellerrequest();

            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_request_membership', $data));

    }

    public function cancelrequest()
    {
        $this->load->language('sellerprofile/sellerprofile');
        $this->load->model('sellerprofile/sellerprofile');

        $json = array();

        $customer_info = $this->model_sellerprofile_sellerprofile->CancelRequest();

        if (!$customer_info) {
            $json['error'] = $this->language->get('error_permission');
        }

        if (!$json) {
            $this->model_sellerprofile_sellerprofile->addHistory($this->customer->getID(), $this->language->get('text_cancel_request'));

            $subject = sprintf($this->language->get('text_cancel_request'), $this->config->get('config_name'));

            $message = sprintf($this->language->get('text_cancel_request'), $this->config->get('config_name'))."\n\n";
            $message .= $this->language->get('text_thanks')."\n";
            $message .= $this->config->get('config_name');

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
            $mail->setTo($this->customer->getEmail());
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($this->config->get('config_name'));
            $mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
            $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
            $mail->send();

            $json['success'] = $this->language->get('text_resend_success');
        }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function autocomplete()
    {
        $json = array();

        if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_email'])) {
            if (isset($this->request->get['filter_name'])) {
                $filter_name = $this->request->get['filter_name'];
            } else {
                $filter_name = '';
            }

            if (isset($this->request->get['filter_email'])) {
                $filter_email = $this->request->get['filter_email'];
            } else {
                $filter_email = '';
            }

            $this->load->model('sellerprofile/sellerprofile');

            $filter_data = array(
                'filter_name' => $filter_name,
                'filter_email' => $filter_email,
                'start' => 0,
                'limit' => 5,
            );

            $results = $this->model_sellerprofile_sellerprofile->getsellers($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'seller_id' => $result['seller_id'],
                    'seller_group_id' => $result['seller_group_id'],
                    'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
                    'seller_group' => $result['seller_group'],
                    'firstname' => $result['firstname'],
                    'lastname' => $result['lastname'],
                    'email' => $result['email'],
                    'telephone' => $result['telephone'],
                    'fax' => $result['fax'],
                    'custom_field' => unserialize($result['custom_field']),
                    'bankaccount' => $this->model_sellerprofile_sellerprofile->getbankaccounts($result['seller_id']),
                );
            }
        }

        $sort_order = array();

        foreach ($json as $key => $value) {
            $sort_order[$key] = $value['name'];
        }

        array_multisort($sort_order, SORT_ASC, $json);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function bankaccount()
    {
        $json = array();

        if (!empty($this->request->get['bankaccount_id'])) {
            $this->load->model('sellerprofile/sellerprofile');

            $json = $this->model_sellerprofile_sellerprofile->getbankaccount($this->request->get['bankaccount_id']);
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }



    public function seller_delete_image()
    {
        $this->load->language('sellerprofile/sellerprofile');

        $this->load->model('sellerprofile/sellerprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        if ($this->request->get['seller_image']) {
            $this->model_sellerprofile_sellerprofile->Sellerdeleteimage();

                // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('image_add', $activity_data);

            $json['success'] = $this->language->get('text_delete_image_success');
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function seller_delete_banner()
    {
        $this->load->language('sellerprofile/sellerprofile');

        $this->load->model('sellerprofile/sellerprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        if ($this->request->get['seller_banner']) {
            $this->model_sellerprofile_sellerprofile->Sellerdeletebanner();

                // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('banner_add', $activity_data);

            $json['success'] = $this->language->get('text_delete_banner_success');
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function profile() {
        $json = array();
        $this->load->language('sellerprofile/sellerprofile');

        $this->load->model('sellerprofile/sellerprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $this->load->model('catalog/category'); 

        $seller_info = $this->model_sellerprofile_sellerprofile->getseller($this->customer->getId());

		if($this->request->post['tin'] != '' && $this->request->post['pan'] == ''){
			$json['error'] = $this->language->get('error_pan');
		} elseif($this->request->post['tin'] == '' && $this->request->post['pan'] != '') {
			$json['error'] = $this->language->get('error_tin');
		} elseif($this->request->post['nickname'] != '' && (strlen($this->request->post['nickname']) > 200)) {
			$json['error'] = $this->language->get('error_nickname');
		} elseif($this->request->post['seller_description'] != '' && (strlen($this->request->post['seller_description']) > 2000)) {
			$json['error'] = $this->language->get('error_seller_description');
		} elseif($this->request->post['owner_name'] != '' && (strlen($this->request->post['owner_name']) > 200)) {
			$json['error'] = $this->language->get('error_owner_name');
		} elseif($this->request->post['store_email'] != '' && (strlen($this->request->post['store_email']) > 100)) {
			$json['error'] = $this->language->get('error_store_email');
		} elseif($this->request->post['referred_by'] != '' && (strlen($this->request->post['referred_by']) != 10)) {
			$json['error'] = $this->language->get('error_referred_by');
		} elseif(!empty($this->request->post['store_mobile_num'])) {
			$str_mob_filter = array_filter($this->request->post['store_mobile_num']);//print_r($str_mob_filter); die;
			
            foreach($str_mob_filter as $str_mb_num) {
				if(strlen(trim($str_mb_num)) != 10) {
					$json['error'] = $this->language->get('error_store_mobile_num');
				}
				if(!is_numeric(trim($str_mb_num))) {
					$json['error'] = $this->language->get('error_store_mobile_num_valid');
				}
			}
		}

		if((!empty($this->request->post['store_ll_num'])) || (!empty($this->request->post['store_ll_code']))) {
			foreach($this->request->post['store_ll_num'] as $store_ll_num) {
				if((trim($store_ll_num) != '') && (!is_numeric(trim($store_ll_num)))) {
					$json['error'] = $this->language->get('error_store_ll_num_valid');
				}
			}

			foreach($this->request->post['store_ll_code'] as $store_ll_code) {
				if((trim($store_ll_code) != '') && (!is_numeric(trim($store_ll_code)))) {
					$json['error'] = $this->language->get('error_store_ll_num_valid');
				}
			}
		}

		if($this->request->post['nickname'] =='') {
			$json['error'] = $this->language->get('error_nickname_req');
		}

		if($this->request->post['lat'] =='') {
			$json['error'] = $this->language->get('error_lat_req');
		}

		if($this->request->post['lng'] =='') {
			$json['error'] = $this->language->get('error_lng_req');
		}

        if($this->request->post['seller_address'] =='') {
            $json['error'] = $this->language->get('error_seller_address_req');
        }

		if($this->request->post['store_email'] == '') {
			$json['error'] = "Please enter Store/Entity email";
		}

        if(empty($seller_info['seller_category'])) {
            $json['error'] = $this->language->get('error_store_category_empty');
        }

		if(empty($json['error'])) {
			$this->model_sellerprofile_sellerprofile->SellerProfileSave($this->request->post);
			$json['success'] = $this->language->get('text_update_profile_success');
		}

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

	public function storeimage()
    {
        $this->load->language('sellerprofile/sellerprofile');

        $this->load->model('sellerprofile/sellerprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();
		//print_r($this->request->get); die;
        $this->model_sellerprofile_sellerprofile->SellerStoreImageSave($this->request->get['seller_id'],$this->request->get);

                // Add to activity log
      $this->load->model('account/activity');

        //$activity_data = array(
                //'customer_id' => $this->customer->getId(),
                //'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            //);

        //$this->model_account_activity->addActivity('store_image_update', $activity_data);

        $json['success'] = $this->language->get('text_update_profile_success');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
	

	public function sellerAdvertisedraft()
    {
        $this->load->language('selleradvertise/advertise');
        $this->load->language('sellerprofile/sellerprofile');
        $this->load->model('sellerprofile/sellerprofile');
		$this->load->model('selleradvertise/advertise');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_selleradvertise'] = $this->language->get('entry_selleradvertise');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit_mode_ad'] = $this->language->get('button_edit_mode_ad');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_title'] = $this->language->get('column_title');
        $data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->post['sellerprofile_sellerprofileadvertise'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->request->post['sellerprofile_sellerprofileadvertise'];
        } elseif (isset($this->request->get['seller_id'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->model_sellerprofile_sellerprofile->getselleradvertise($this->request->get['seller_id']);
        } else {
            $data['sellerprofile_sellerprofileadvertise'] = array($this->config->get('config_selleradvertise_id'));
        }

        $data['edit'] = $this->url->link('selleradvertise/advertise', '', 'SSL');

        $data['advertises'] = array();

        $this->load->model('tool/image');
        $this->load->model('selleradvertise/advertise');


        $results = $this->model_selleradvertise_advertise->getAdvertisesDraft(($page - 1) * 10, 10);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['offer_image'])) {
                $image = $this->model_tool_image->resize($result['offer_image'], 993, 182);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 993, 182);
            }

			if (is_file(DIR_IMAGE.$result['offer_image'])) {
				$image_tumb = $this->model_tool_image->resize($result['offer_image'], 993, 182);
			} else {
				$image_tumb = $this->model_tool_image->resize('no_image.png', 993, 182);
			}


            
            $data['advetises'][] = array(
                'advertise_id' => $result['advertise_id'],
                'image' => $image,
				'image_tumb' => $image_tumb,
				'offer_desc' => $result['offer_desc'],
                'offer_title' => $result['offer_title'],
                'sort_order' => $result['sort_order'],
                'offer_link' => $result['offer_url'],
                'status' => $result['status'],
				'edit' => $this->url->link('selleradvertise/advertise/edit', ''.'&advertise_id='.$result['advertise_id'], 'SSL'),
				'offer_image_original' => $result['offer_image_original'],
        );
        }

		$data['seller_id'] = $this->request->get['seller_id'];

        $advertise_total = $this->model_selleradvertise_advertise->getTotalAdvertisesDraft();

        $pagination = new Pagination();
        $pagination->total = $advertise_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerprofile/sellerprofile/sellerAdvertisedraft', 'seller_id='.$this->request->get['seller_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($advertise_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($advertise_total - 10)) ? $advertise_total : ((($page - 1) * 10) + 10), $advertise_total, ceil($advertise_total / 10));


            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_selleradvertise_draft', $data));

    }
	public function sellerAdvertisesubmitted()
    {
        $this->load->language('selleradvertise/advertise');
        $this->load->language('sellerprofile/sellerprofile');
        $this->load->model('sellerprofile/sellerprofile');
		$this->load->model('selleradvertise/advertise');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_selleradvertise'] = $this->language->get('entry_selleradvertise');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit_mode_ad'] = $this->language->get('button_edit_mode_ad');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_title'] = $this->language->get('column_title');
        $data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->post['sellerprofile_sellerprofileadvertise'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->request->post['sellerprofile_sellerprofileadvertise'];
        } elseif (isset($this->request->get['seller_id'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->model_sellerprofile_sellerprofile->getselleradvertise($this->request->get['seller_id']);
        } else {
            $data['sellerprofile_sellerprofileadvertise'] = array($this->config->get('config_selleradvertise_id'));
        }

        $data['edit'] = $this->url->link('selleradvertise/advertise', '', 'SSL');

        $data['advertises'] = array();

        $this->load->model('tool/image');
        $this->load->model('selleradvertise/advertise');


        $results = $this->model_selleradvertise_advertise->getAdvertisesSubmitted(($page - 1) * 10, 10);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['offer_image'])) {
                $image = $this->model_tool_image->resize($result['offer_image'], 993, 182);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 993, 182);
            }

			if (is_file(DIR_IMAGE.$result['offer_image'])) {
				$image_tumb = $this->model_tool_image->resize($result['offer_image'], 993, 182);
			} else {
				$image_tumb = $this->model_tool_image->resize('no_image.png', 993, 182);
			}

            
            $data['advetises'][] = array(
                'advertise_id' => $result['advertise_id'],
                'image' => $image,
				'image_tumb' => $image_tumb,
				'offer_desc' => $result['offer_desc'],
                'offer_title' => $result['offer_title'],
                'sort_order' => $result['sort_order'],
                'offer_link' => $result['offer_url'],
                'status' => $result['status'],
				'edit' => $this->url->link('selleradvertise/advertise/edit', ''.'&act=submitted&advertise_id='.$result['advertise_id'], 'SSL'),
				'offer_image_original' => $result['offer_image_original'],
        );
        }

		$data['seller_id'] = $this->request->get['seller_id'];

        $advertise_total = $this->model_selleradvertise_advertise->getTotalAdvertisesSubmitted();

        $pagination = new Pagination();
        $pagination->total = $advertise_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerprofile/sellerprofile/sellerAdvertisesubmitted', 'seller_id='.$this->request->get['seller_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($advertise_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($advertise_total - 10)) ? $advertise_total : ((($page - 1) * 10) + 10), $advertise_total, ceil($advertise_total / 10));


            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_selleradvertise_submitted', $data));

    }
	public function sellerAdvertiseapproved()
    {        
        $this->load->language('selleradvertise/advertise');
        $this->load->language('sellerprofile/sellerprofile');
        $this->load->model('sellerprofile/sellerprofile');
		$this->load->model('selleradvertise/advertise');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

		$basic_position_amount = $this->model_selleradvertise_advertise->getStoreOfferBasicPrice();

        $data['basic_position_amount'] = json_encode($basic_position_amount);
		$data['basic_price_cashback'] = $this->model_selleradvertise_advertise->getStoreOfferBasicPriceWithCashBack();

        $data['entry_selleradvertise'] = $this->language->get('entry_selleradvertise');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit_mode_ad'] = $this->language->get('button_edit_mode_ad');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_title'] = $this->language->get('column_title');
        $data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->post['sellerprofile_sellerprofileadvertise'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->request->post['sellerprofile_sellerprofileadvertise'];
        } elseif (isset($this->request->get['seller_id'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->model_sellerprofile_sellerprofile->getselleradvertise($this->request->get['seller_id']);
        } else {
            $data['sellerprofile_sellerprofileadvertise'] = array($this->config->get('config_selleradvertise_id'));
        }

        $data['edit'] = $this->url->link('selleradvertise/advertise', '', 'SSL');

		//getaddressfor lat & long
		$data['LatitudesLongitude'] = $this->model_sellerprofile_sellerprofile->getLatitudesLongitude($this->request->get['seller_id']);
        $data['advertises'] = array();

        $this->load->model('tool/image');
        $this->load->model('selleradvertise/advertise');


        $results = $this->model_selleradvertise_advertise->getAdvertisesApproved(($page - 1) * 10, 10);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['offer_image'])) {
                $image = $this->model_tool_image->resize($result['offer_image'], 993, 182);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 993, 182);
            }

			if (is_file(DIR_IMAGE.$result['offer_image'])) {
				$image_tumb = $this->model_tool_image->resize($result['offer_image'], 993, 182);
			} else {
				$image_tumb = $this->model_tool_image->resize('no_image.png', 993, 182);
			}

            
            $data['advetises'][] = array(
                'advertise_id' => $result['advertise_id'],
                'image' => $image,
				'image_tumb' => $image_tumb,
				'offer_desc' => $result['offer_desc'],
                'offer_title' => $result['offer_title'],
                'sort_order' => $result['sort_order'],
                'offer_link' => $result['offer_url'],
                'status' => $result['status'],
				'offer_image_original' => $result['offer_image_original'],
        );
        }

		$data['seller_id'] = $this->request->get['seller_id'];

        $advertise_total = $this->model_selleradvertise_advertise->getTotalAdvertisesApproved();

        $pagination = new Pagination();
        $pagination->total = $advertise_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerprofile/sellerprofile/sellerAdvertiseapproved', 'seller_id='.$this->request->get['seller_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($advertise_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($advertise_total - 10)) ? $advertise_total : ((($page - 1) * 10) + 10), $advertise_total, ceil($advertise_total / 10));

            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_selleradvertise_approved', $data));

    }
	public function sellerAdvertiserejected()
    {
        $this->load->language('selleradvertise/advertise');
        $this->load->language('sellerprofile/sellerprofile');
        $this->load->model('sellerprofile/sellerprofile');
		$this->load->model('selleradvertise/advertise');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_selleradvertise'] = $this->language->get('entry_selleradvertise');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit_mode_ad'] = $this->language->get('button_edit_mode_ad');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_title'] = $this->language->get('column_title');
        $data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->post['sellerprofile_sellerprofileadvertise'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->request->post['sellerprofile_sellerprofileadvertise'];
        } elseif (isset($this->request->get['seller_id'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->model_sellerprofile_sellerprofile->getselleradvertise($this->request->get['seller_id']);
        } else {
            $data['sellerprofile_sellerprofileadvertise'] = array($this->config->get('config_selleradvertise_id'));
        }

        $data['edit'] = $this->url->link('selleradvertise/advertise', '', 'SSL');

        $data['advertises'] = array();

        $this->load->model('tool/image');
        $this->load->model('selleradvertise/advertise');


        $results = $this->model_selleradvertise_advertise->getAdvertisesRejected(($page - 1) * 10, 10);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['offer_image'])) {
                $image = $this->model_tool_image->resize($result['offer_image'], 993, 182);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 993, 182);
            }

			if (is_file(DIR_IMAGE.$result['offer_image'])) {
				$image_tumb = $this->model_tool_image->resize($result['offer_image'], 993, 182);
			} else {
				$image_tumb = $this->model_tool_image->resize('no_image.png', 993, 182);
			}

            
            $data['advetises'][] = array(
                'advertise_id' => $result['advertise_id'],
                'image' => $image,
				'image_tumb' => $image_tumb,
				'offer_desc' => $result['offer_desc'],
				'remarks' => $result['remarks'],
                'offer_title' => $result['offer_title'],
                'sort_order' => $result['sort_order'],
                'offer_link' => $result['offer_url'],
                'status' => $result['status'],
				'edit' => $this->url->link('selleradvertise/advertise/edit', ''.'&advertise_id='.$result['advertise_id'], 'SSL'),
				'offer_image_original' => $result['offer_image_original'],
        );
        }

		$data['seller_id'] = $this->request->get['seller_id'];

        $advertise_total = $this->model_selleradvertise_advertise->getTotalAdvertisesRejected();

        $pagination = new Pagination();
        $pagination->total = $advertise_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerprofile/sellerprofile/sellerAdvertiserejected', 'seller_id='.$this->request->get['seller_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($advertise_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($advertise_total - 10)) ? $advertise_total : ((($page - 1) * 10) + 10), $advertise_total, ceil($advertise_total / 10));


            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_selleradvertise_rejected', $data));

    }
	public function sellerAdvertisepaid()
    {
        $this->load->language('selleradvertise/advertise');
        $this->load->language('sellerprofile/sellerprofile');
        $this->load->model('sellerprofile/sellerprofile');
		$this->load->model('selleradvertise/advertise');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_selleradvertise'] = $this->language->get('entry_selleradvertise');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit_mode_ad'] = $this->language->get('button_edit_mode_ad');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_title'] = $this->language->get('column_title');
        $data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->post['sellerprofile_sellerprofileadvertise'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->request->post['sellerprofile_sellerprofileadvertise'];
        } elseif (isset($this->request->get['seller_id'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->model_sellerprofile_sellerprofile->getselleradvertise($this->request->get['seller_id']);
        } else {
            $data['sellerprofile_sellerprofileadvertise'] = array($this->config->get('config_selleradvertise_id'));
        }

        $data['edit'] = $this->url->link('selleradvertise/advertise', '', 'SSL');

        $data['advertises'] = array();

        $this->load->model('tool/image');
        $this->load->model('selleradvertise/advertise');


        $results = $this->model_selleradvertise_advertise->getAdvertisesPaid(($page - 1) * 10, 10);

		if(!empty($results)) {

			foreach ($results as $result) {
				if (is_file(DIR_IMAGE.$result['offer_image'])) {
					$image = $this->model_tool_image->resize($result['offer_image'], 993, 182);
				} else {
					$image = $this->model_tool_image->resize('no_image.png', 993, 182);
				}

				if (is_file(DIR_IMAGE.$result['offer_image'])) {
					$image_tumb = $this->model_tool_image->resize($result['offer_image'], 993, 182);
				} else {
					$image_tumb = $this->model_tool_image->resize('no_image.png', 993, 182);
				}

				
				$data['advetises'][] = array(
					'advertise_id' => $result['advertise_id'],
					'image' => $image,
					'image_tumb' => $image_tumb,
					'offer_desc' => $result['offer_desc'],
					'remarks' => $result['remarks'],
					'offer_title' => $result['offer_title'],
					'sort_order' => $result['sort_order'],
					'offer_link' => $result['offer_url'],
					'status' => $result['status'],
					'edit' => $this->url->link('selleradvertise/advertise/edit', ''.'&advertise_id='.$result['advertise_id'], 'SSL'),
					'offer_image_original' => $result['offer_image_original'],
			);
			}
		}

		$data['seller_id'] = $this->request->get['seller_id'];

        $advertise_total = $this->model_selleradvertise_advertise->getTotalAdvertisesPaid();

        $pagination = new Pagination();
        $pagination->total = $advertise_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerprofile/sellerprofile/sellerAdvertisepaid', 'seller_id='.$this->request->get['seller_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($advertise_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($advertise_total - 10)) ? $advertise_total : ((($page - 1) * 10) + 10), $advertise_total, ceil($advertise_total / 10));


            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_selleradvertise_paid', $data));

    }
	public function sellerAdvertiselive()
    {
        $this->load->language('selleradvertise/advertise');
        $this->load->language('sellerprofile/sellerprofile');
        $this->load->model('sellerprofile/sellerprofile');
		$this->load->model('selleradvertise/advertise');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_selleradvertise'] = $this->language->get('entry_selleradvertise');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit_mode_ad'] = $this->language->get('button_edit_mode_ad');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_title'] = $this->language->get('column_title');
        $data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

		if (isset($this->request->post['sellerprofile_sellerprofileadvertise'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->request->post['sellerprofile_sellerprofileadvertise'];
        } elseif (isset($this->request->get['seller_id'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->model_sellerprofile_sellerprofile->getselleradvertise($this->request->get['seller_id']);
        } else {
            $data['sellerprofile_sellerprofileadvertise'] = array($this->config->get('config_selleradvertise_id'));
        }

        $data['edit'] = $this->url->link('selleradvertise/advertise', '', 'SSL');

        $data['advertises'] = array();

        $this->load->model('tool/image');
        $this->load->model('selleradvertise/advertise');


        $results = $this->model_selleradvertise_advertise->getAdvertisesLive(($page - 1) * 10, 10);

		//print_r($results); die;

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['offer_image'])) {
                $image = $this->model_tool_image->resize($result['offer_image'], 993, 182);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 993, 182);
            }

			if (is_file(DIR_IMAGE.$result['offer_image'])) {
				$image_tumb = $this->model_tool_image->resize($result['offer_image'], 993, 182);
			} else {
				$image_tumb = $this->model_tool_image->resize('no_image.png', 993, 182);
			}

			if($result['position'] != 1 && $result['position'] != 6){
				if($result['price'] != 500){
					$advertise_position = $this->model_sellerprofile_sellerprofile->getAdvertise_position($result['advertise_id'], $result['position']);
					$advertise_amt_pos = "";
				} else {
					$advertise_position = "Random";
					$advertise_amt_pos = "(Basic Price)";
				}
			} else {
				$advertise_position = "Random";
				$advertise_amt_pos = "";
			}

			if($result['position'] != 1 && $result['position'] != 6){
				//Convert to date
				$datestr=$result['end_date'];//Your date
				$date=strtotime($datestr);//Converted to a PHP date (a second count)

				//Calculate difference
				$diff=$date-time();//time returns current time in seconds
				$days_left=floor($diff/(60*60*24));//seconds/minute*minutes/hour*hours/day)
				//$hours=round(($diff-$days*60*60*24)/(60*60));
			}

			if($result['position'] == 1) {
				$days_left = $this->model_sellerprofile_sellerprofile->getHomeBanner_days($result['advertise_id']);
			}
 
			//print_r($advertise_position); die;
            
            $data['advetises'][] = array(
                'advertise_id' => $result['advertise_id'],
                'image' => $image,
				'image_tumb' => $image_tumb,
				'offer_desc' => $result['offer_desc'],
                'offer_title' => $result['offer_title'],
                'sort_order' => $result['sort_order'],
                'offer_link' => $result['offer_url'],
                'status' => $result['status'],
				'position' => $result['position'],
				'price' => $result['price'],
				'km' => $result['km'],
				'days_left' => $days_left,
				'advertise_position' => $advertise_position,
				'advertise_amt_pos' => $advertise_amt_pos,
				'offer_image_original' => $result['offer_image_original'],
        );
        }

		$data['seller_id'] = $this->request->get['seller_id'];

		$ad = $this->model_selleradvertise_advertise->getTotalAdvertisesLive();

		foreach($ad as $ads) {
			$adv[] = $ads['total'];
		}		

		$advertise_total = array_sum($adv);

		//echo "<pre>"; print_r($advertise_total); die;		

		$pagination = new Pagination();
        $pagination->total = $advertise_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerprofile/sellerprofile/sellerAdvertiselive', 'seller_id='.$this->request->get['seller_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($advertise_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($advertise_total - 10)) ? $advertise_total : ((($page - 1) * 10) + 10), $advertise_total, ceil($advertise_total / 10));

            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_selleradvertise_live', $data));

    }

	public function sellerAdvertisearchive()
    {
        $this->load->language('selleradvertise/advertise');
        $this->load->language('sellerprofile/sellerprofile');
        $this->load->model('sellerprofile/sellerprofile');
		$this->load->model('selleradvertise/advertise');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_selleradvertise'] = $this->language->get('entry_selleradvertise');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit_mode_ad'] = $this->language->get('button_edit_mode_ad');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_title'] = $this->language->get('column_title');
        $data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

		if (isset($this->request->post['sellerprofile_sellerprofileadvertise'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->request->post['sellerprofile_sellerprofileadvertise'];
        } elseif (isset($this->request->get['seller_id'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->model_sellerprofile_sellerprofile->getselleradvertise($this->request->get['seller_id']);
        } else {
            $data['sellerprofile_sellerprofileadvertise'] = array($this->config->get('config_selleradvertise_id'));
        }

        $data['edit'] = $this->url->link('selleradvertise/advertise', '', 'SSL');

		$url = '';

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

        $data['advertises'] = array();

        $this->load->model('tool/image');
        $this->load->model('selleradvertise/advertise');


        $results = $this->model_selleradvertise_advertise->getAdvertisesArchive(($page - 1) * 10, 10);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['offer_image'])) {
                $image = $this->model_tool_image->resize($result['offer_image'], 993, 182);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 993, 182);
            }

			if (is_file(DIR_IMAGE.$result['offer_image'])) {
				$image_tumb = $this->model_tool_image->resize($result['offer_image'], 993, 182);
			} else {
				$image_tumb = $this->model_tool_image->resize('no_image.png', 993, 182);
			}


            
            $data['advetises'][] = array(
                'advertise_id' => $result['advertise_id'],
                'image' => $image,
				'image_tumb' => $image_tumb,
				'offer_desc' => $result['offer_desc'],
                'offer_title' => $result['offer_title'],
                'sort_order' => $result['sort_order'],
                'offer_link' => $result['offer_url'],
                'status' => $result['status'],
				'copy' => $this->url->link('sellerprofile/sellerprofile/copy', ''.'&advertise_id='.$result['advertise_id'].$url, 'SSL'),
				'offer_image_original' => $result['offer_image_original'],
        );
        }

		$data['seller_id'] = $this->request->get['seller_id'];

		$advertise_total = $this->model_selleradvertise_advertise->getTotalAdvertisesArchive();       

		$pagination = new Pagination();
        $pagination->total = $advertise_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerprofile/sellerprofile/sellerAdvertisearchive', 'seller_id='.$this->request->get['seller_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($advertise_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($advertise_total - 10)) ? $advertise_total : ((($page - 1) * 10) + 10), $advertise_total, ceil($advertise_total / 10));

            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_selleradvertise_archive', $data));

    }

	public function sellerAdvertisetrash()
    {
        $this->load->language('selleradvertise/advertise');
        $this->load->language('sellerprofile/sellerprofile');
        $this->load->model('sellerprofile/sellerprofile');
		$this->load->model('selleradvertise/advertise');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_selleradvertise'] = $this->language->get('entry_selleradvertise');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit_mode_ad'] = $this->language->get('button_edit_mode_ad');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_title'] = $this->language->get('column_title');
        $data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

		if (isset($this->request->post['sellerprofile_sellerprofileadvertise'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->request->post['sellerprofile_sellerprofileadvertise'];
        } elseif (isset($this->request->get['seller_id'])) {
            $data['sellerprofile_sellerprofileadvertise'] = $this->model_sellerprofile_sellerprofile->getselleradvertise($this->request->get['seller_id']);
        } else {
            $data['sellerprofile_sellerprofileadvertise'] = array($this->config->get('config_selleradvertise_id'));
        }

        $data['edit'] = $this->url->link('selleradvertise/advertise', '', 'SSL');

        $data['advertises'] = array();

        $this->load->model('tool/image');
        $this->load->model('selleradvertise/advertise');


        $results = $this->model_selleradvertise_advertise->getAdvertisesTrash(($page - 1) * 10, 10);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['offer_image'])) {
                $image = $this->model_tool_image->resize($result['offer_image'], 993, 182);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 993, 182);
            }

			if (is_file(DIR_IMAGE.$result['offer_image'])) {
				$image_tumb = $this->model_tool_image->resize($result['offer_image'], 993, 182);
			} else {
				$image_tumb = $this->model_tool_image->resize('no_image.png', 993, 182);
			}


            
            $data['advetises'][] = array(
                'advertise_id' => $result['advertise_id'],
                'image' => $image,
				'image_tumb' => $image_tumb,
				'offer_desc' => $result['offer_desc'],
                'offer_title' => $result['offer_title'],
                'sort_order' => $result['sort_order'],
                'offer_link' => $result['offer_url'],
                'status' => $result['status'],
				'offer_image_original' => $result['offer_image_original'],
        );
        }

		$data['seller_id'] = $this->request->get['seller_id'];

		$advertise_total = $this->model_selleradvertise_advertise->getTotalAdvertisesTrash();       

		$pagination = new Pagination();
        $pagination->total = $advertise_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerprofile/sellerprofile/sellerAdvertisetrash', 'seller_id='.$this->request->get['seller_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($advertise_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($advertise_total - 10)) ? $advertise_total : ((($page - 1) * 10) + 10), $advertise_total, ceil($advertise_total / 10));

            $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_selleradvertise_trash', $data));

    }

	public function sellerAdvertisewallet()
    {
        //$this->load->language('selleradvertise/advertise');
        //$this->load->language('sellerprofile/sellerprofile');
        //$this->load->model('sellerprofile/sellerprofile');
		//$this->load->model('selleradvertise/advertise');

		$this->document->setTitle('Wallet');

		$data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => 'Home',
            'href' => $this->url->link('common/home', '', 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => 'Wallet',
            'href' => $this->url->link('sellerprofile/sellerprofile/selleradvertisewallet', '', 'SSL'),
        );

		$data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

		$data['advertises'] = array();

        $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_selleradvertise_wallet', $data));

    }

	public function sellerAdvertiseexpense()
    {
        //$this->load->language('selleradvertise/advertise');
        //$this->load->language('sellerprofile/sellerprofile');
        //$this->load->model('sellerprofile/sellerprofile');
		//$this->load->model('selleradvertise/advertise');

		$this->document->setTitle('Expense report');

		$data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => 'Home',
            'href' => $this->url->link('common/home', '', 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => 'Expense repot',
            'href' => $this->url->link('sellerprofile/sellerprofile/selleradvertiseexpense', '', 'SSL'),
        );

		$data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

		$data['advertises'] = array();

        $this->response->setOutput($this->load->view('sellerprofile/sellerprofile_selleradvertise_expense', $data));

    }
	
	public function ads_submit()
    {
        $this->load->language('selleradvertise/advertise');
		$this->load->model('selleradvertise/advertise');

		if($this->request->get['advertise_id'] != ''){
			$this->model_selleradvertise_advertise->statusAdvertise($this->request->get['advertise_id'], 'submitted');
			$data['success'] = 'Your ad successfully submitted to admin approvel.';
		}
		$data['draft_count'] = $this->model_selleradvertise_advertise->getTotalAdvertisesDraft();
		$data['submitted_count'] = $this->model_selleradvertise_advertise->getTotalAdvertisesSubmitted();
		$json = $data;
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
	}

	public function delete()
    {
        $this->load->language('selleradvertise/advertise');
		$this->load->model('selleradvertise/advertise');

		if($this->request->get['advertise_id'] != ''){
			$this->model_selleradvertise_advertise->deleteAdvertisePermanent($this->request->get['advertise_id']);
			$data['success'] = 'Your ad Successfully deleted.';
		}
		$data['count'] = $this->model_selleradvertise_advertise->getTotalAdvertisesTrash();
		$json = $data;
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
	}

	public function trash()
    {
        $this->load->language('selleradvertise/advertise');
		$this->load->model('selleradvertise/advertise');

		if($this->request->get['advertise_id'] != ''){
			$this->model_selleradvertise_advertise->deleteAdvertise($this->request->get['advertise_id']);
			$data['success'] = 'Your advertisment Successfully Moved to trash.';
		}
		if($this->request->get['func'] == 'draft'){
			$data['count'] = $this->model_selleradvertise_advertise->getTotalAdvertisesDraft();
		} elseif($this->request->get['func'] == 'submitted'){
			$data['count'] = $this->model_selleradvertise_advertise->getTotalAdvertisesSubmitted();
		} elseif($this->request->get['func'] == 'approved'){
			$data['count'] = $this->model_selleradvertise_advertise->getTotalAdvertisesApproved();
		} elseif($this->request->get['func'] == 'live'){
			$ad = $this->model_selleradvertise_advertise->getTotalAdvertisesLive();
			foreach($ad as $ads) {
				$adv[] = $ads['total'];
			}
			$data['count'] = array_sum($adv);
		} elseif($this->request->get['func'] == 'paid') {
			$data['count'] = $this->model_selleradvertise_advertise->getTotalAdvertisesPaid();
		} elseif($this->request->get['func'] == 'rejected') {
			$data['count'] = $this->model_selleradvertise_advertise->getTotalAdvertisesRejected();
		} elseif($this->request->get['func'] == 'archive') {
			$data['count'] = $this->model_selleradvertise_advertise->getTotalAdvertisesArchive();
		}
		$data['trash_count'] = $this->model_selleradvertise_advertise->getTotalAdvertisesTrash();
		$json = $data;
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
	}

	public function move_live()
    {
		$json = array();

		$this->load->language('selleradvertise/advertise');
		$this->load->model('selleradvertise/advertise');
		
		if(!isset($this->request->post['loc'])) {
			$this->request->post['loc'] = '';
			//print_r($this->request->post['loc']);die;			
		}		
		$delete_val = (isset($this->request->get['delete_val']) && ($this->request->get['delete_val'] != '')) ? $this->request->get['delete_val']: '';

		$basic_position_amount = $this->model_selleradvertise_advertise->getStoreOfferBasicPrice();
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate_move_live()) {			
			if(($this->request->post['from_date'] != '') && ($this->request->post['end_date'] != '') && ($this->request->post['position'] != '')){
				$amount = $this->request->post['amount'];
				$from_date = $this->request->post['from_date'];
				$end_date = $this->request->post['end_date'];
				$loc = $this->request->post['loc'];
				$ad_order = $this->request->post['position'];				
				$basic_amount_loc = '';
				if($loc == 2) { $basic_amount_loc = $basic_position_amount['home_national']; }
				if($loc == 3) { $basic_amount_loc = $basic_position_amount['home_state']; }
				if($loc == 4) { $basic_amount_loc = $basic_position_amount['home_city']; }
				if($loc == 5) { $basic_amount_loc = $basic_position_amount['home_local']; }
				if($loc == '2' || $loc == '3' || $loc == '4' || $loc == '5') {					
					$km = (isset($this->request->post['km']) && ($this->request->post['km'] != '')) ? $this->request->post['km']: '';
					$position_amt = $this->model_selleradvertise_advertise->getPostionAmount($from_date, $end_date, $loc, $ad_order, $km);
										
					if(count($position_amt) > 0){ 
						foreach($position_amt as $key => $position_a) {
							$value_filter[] = $position_a['price'];
						}
						if(count($value_filter) > 0) {
							//$basic_position_amount = array('0'=>'500','1'=>'400','2'=>'300','3'=>'200');
							$position_amount = array_diff($value_filter, $basic_position_amount);
						//print_r($position_amount);exit;
							$position_amount = array_unique($position_amount);
							$value = array();
							if(count($position_amount) > 0) {
								if(count($position_amount)+2 == $ad_order) {
									if($loc == '2') {
										$value[0] = $basic_position_amount['home_national'];
										
									}if($loc == '3') {
										$value[0] = $basic_position_amount['home_state'];
										
									}if($loc == '4') {
										$value[0] = $basic_position_amount['home_city'];
										
									}if($loc == '5') {
										$value[0] = $basic_position_amount['home_local'];
									}
								}
								foreach($position_amount as $key => $position) {					
									if(count($position_amount) == 1) { 
										if(($key+1) == $ad_order) {
											$value[0] = $position;
										}
										if(count($position_amount)+1 == $ad_order) {
											$value[0] = $position;
											if($loc == '2') {
												$value[1] = $basic_position_amount['home_national'];
												
											}if($loc == '3') {
												$value[1] = $basic_position_amount['home_state'];
												
											}if($loc == '4') {
												$value[1] = $basic_position_amount['home_city'];
												
											}if($loc == '5') {
												$value[1] = $basic_position_amount['home_local'];
											}
										}
									} else {										
										if(count($position_amount)+1 == $ad_order) {
											$value[0] = $position;
											if($loc == '2') {
												$value[1] = $basic_position_amount['home_national'];
												
											}if($loc == '3') {
												$value[1] = $basic_position_amount['home_state'];
												
											}if($loc == '4') {
												$value[1] = $basic_position_amount['home_city'];
												
											}if($loc == '5') {
												$value[1] = $basic_position_amount['home_local'];
											}
										} else {
											if($key+1 == $ad_order && $ad_order == 1) { 
												$value[0] = $position; break;
											} else {
												if($key+2 == $ad_order) {  
													$value[0] = $position;
												}
												if($key+1 == $ad_order) {
													$value[1] = $position;
												}
											}
										}
									}													
								}
							}
						}
								
						if($value > 0 && !empty($value)) {
							if(count($value) == 1) {									
								if($amount > $value['0']) {  
									$check = $this->model_selleradvertise_advertise->adToLive($this->request->post, $delete_val);
									if($check == 1 && $amount == 0) {
										$json['free_check'] = 1;
									} else {
										$json['success'] = $this->language->get('success_to_live');
									}	
								} else {
									if($amount == $basic_amount_loc) {							
										$check = $this->model_selleradvertise_advertise->adToLive($this->request->post, $delete_val);
										if($check == 1 && $amount == 0) {
											$json['free_check'] = 1;
										} else {
											$json['success'] = $this->language->get('success_to_live');
										}	
									} else {
										$this->error['amount'] = $this->language->get('position_amount_max');
										$json['amount'] = "Price should be above ".$value['0']. " Rs.";
									}
								}
							} else { 
								if($amount == $basic_amount_loc) {							
										$check = $this->model_selleradvertise_advertise->adToLive($this->request->post, $delete_val);
										if($check == 1 && $amount == 0) {
											$json['free_check'] = 1;
										} else {
											$json['success'] = $this->language->get('success_to_live');
										}									
								} else {
									if(($amount > $value['1']) && ($amount < $value['0']) && ($ad_order != (count($position_amt)+1))) { 
										$check = $this->model_selleradvertise_advertise->adToLive($this->request->post, $delete_val);
										if($check == 1 && $amount == 0) {
											$json['free_check'] = 1;
										} else {
											$json['success'] = $this->language->get('success_to_live');
										}									
									} else {
										//$this->error['position'] = $this->language->get('position_amount_min');
										$json['amount'] = "Enter between ".$value['1']." to ".$value['0'];
									}
								}
								
							} 				
						} else {
							if($amount == $basic_amount_loc) {							
								$check = $this->model_selleradvertise_advertise->adToLive($this->request->post, $delete_val);
								if($check == 1 && $amount == 0) {
									$json['free_check'] = 1;
								} else {
									$json['success'] = $this->language->get('success_to_live');
								}		
							}
						}
					} else {
						if($loc == '2') {
							$value[0] = $basic_position_amount['home_national'];
							
						}if($loc == '3') {
							$value[0] = $basic_position_amount['home_state'];
							
						}if($loc == '4') {
							$value[0] = $basic_position_amount['home_city'];
							
						}if($loc == '5') {
							$value[0] = $basic_position_amount['home_local'];
						}
						if($ad_order == 2) {
							$check = $this->model_selleradvertise_advertise->adToLive($this->request->post, $delete_val);
							if($check == 1 && $amount == 0) {
								$json['free_check'] = 1;
							} else {
								$json['success'] = $this->language->get('success_to_live');
							}	
						} else {							
							if($amount > $basic_amount_loc && $ad_order == '1') {
								$check = $this->model_selleradvertise_advertise->adToLive($this->request->post, $delete_val);
								if($check == 1 && $amount == 0) {
									$json['free_check'] = 1;
								} else {
									$json['success'] = $this->language->get('success_to_live');
								}								
							} else {
								$this->error['amount'] = $this->language->get('position_amount_max');
								$json['amount'] = "Price should be above ".$value['0']. " Rs";
							}
						}
					}
				}
			}
			if($this->request->post['loc'] == '6') {
				$this->model_selleradvertise_advertise->adToLive($this->request->post, $delete_val);				
				$json['success'] = $this->language->get('success_to_live');
			}
		
			if($this->request->post['loc'] == '1') {
				$top_banner_date = $this->request->post['top_banner_date'];
				if($top_banner_date != ''){	
					$top_banner_date_arr = explode(",", $top_banner_date);			
					foreach($top_banner_date_arr as $key => $top_banner_date) {
						$data['top_banner_date'] = $top_banner_date;
						$data['advetise_sp'] = $this->request->post['advetise_sp'];
						$data['loc'] = $this->request->post['loc'];
						$data['price'] = $default_home_top_advertise_amount = $basic_position_amount['top_banner'] * ($key +1);
						$this->model_selleradvertise_advertise->adToLive($data);	
					}				
					$json['success'] = $this->language->get('success_to_live');
				} else {
					
					if($this->request->post['position'] == ''){			
						$this->error['position'] = $this->language->get('position');
					}
				}
			}		
		}		

			if($this->request->post['loc'] == '6' || $this->request->post['loc'] == '2' || $this->request->post['loc'] == '3' || $this->request->post['loc'] == '4' || $this->request->post['loc'] == '5') {				
				if (isset($this->error['from_date'])) {
					$json['from_date'] = $this->error['from_date'];
				} 
				if (isset($this->error['end_date'])) {
					$json['end_date'] = $this->error['end_date'];
				} 
			}
			if($this->request->post['loc'] == '2' || $this->request->post['loc'] == '3' || $this->request->post['loc'] == '4' || $this->request->post['loc'] == '5') {
				/*if (isset($this->error['amount'])) {
					$json['amount'] = $this->language->get('amount');
				} */
				if (isset($this->error['position'])) {
					$json['position'] = $this->error['position'];
				}
			}
			
			if($this->request->post['loc'] == '1') {
				if (isset($this->error['top_banner_date'])) {
					$json['top_banner_date'] = $this->error['top_banner_date'];
				}
			}
			if (isset($this->error['advertise_location'])) {
				$json['advertise_location'] = $this->error['advertise_location'];
			}
		
		$_SESSION['confirm']['amount'] = $this->request->post['amount'];
		$_SESSION['confirm']['name'] = $this->getAdName($this->request->post['loc']);
		$_SESSION['confirm']['product_id'] = $this->request->post['advetise_sp'];
		$json['confirmForm'] = $this->load->controller('checkout/confirm/adConfirm');
		unset($_SESSION['confirm']);
		
		if(!count($this->error) && !isset($json['success']))
			$json['success'] = 'success';
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}

	public function top_banner_date_check() {
		$json = array();
		
		$this->load->language('selleradvertise/advertise');
		$this->load->model('selleradvertise/advertise');
		$avilable_dates = $this->model_selleradvertise_advertise->getdateCheckForFirstPosition();
		$value = '';
		if($avilable_dates > 0){
			foreach($avilable_dates as $dates) {
				$a_date[] = $dates['date'];
			}
			$value = array_count_values($a_date);
			$date_arr = array();
			foreach($value as $key => $val) {
				if($val >= 5) {					
					$date_arr[] = $key;
				}
			}			
			//print_r($val);
			$json['success'] = $date_arr;
		} else {
			$json['success'] = '';
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

	protected function validate_move_live() {
		if ($this->request->post['loc'] == '') {
			$this->error['advertise_location'] = $this->language->get('advertise_location');
		} else {			
			if($this->request->post['loc'] == '6' || $this->request->post['loc'] == '2' || $this->request->post['loc'] == '3' || $this->request->post['loc'] == '4' || $this->request->post['loc'] == '5') {	
				if($this->request->post['from_date'] == ''){			
					$this->error['from_date'] = $this->language->get('from_date');
				}
				if($this->request->post['end_date'] == ''){			
					$this->error['end_date'] = $this->language->get('end_date');
				}
			}
			if($this->request->post['loc'] == '2' || $this->request->post['loc'] == '3' || $this->request->post['loc'] == '4' || $this->request->post['loc'] == '5') {
				if($this->request->post['position'] == ''){			
					$this->error['position'] = $this->language->get('position');
				}
			}
			if($this->request->post['loc'] == '1') { 
				if($this->request->post['top_banner_date'] == ''){			
					$this->error['top_banner_date'] = $this->language->get('top_banner_date');
				}
			}
		}
		return !$this->error;
	}

	public function location_ad()
    {
		$json = array();		

		$this->load->language('selleradvertise/advertise');
		$this->load->model('selleradvertise/advertise');
 
		if ($this->request->post['loc'] != '' && $this->validate_move_live()) {

			$basic_position_amount = $this->model_selleradvertise_advertise->getStoreOfferBasicPrice();
			
			if(($this->request->post['from_date'] != '') && ($this->request->post['end_date'] != '') && ($this->request->post['position'] != '')){				
				$from_date = $this->request->post['from_date'];
				$end_date = $this->request->post['end_date'];
				$loc = $this->request->post['loc'];
				$ad_order = $this->request->post['position'];
				$km = (isset($this->request->post['km']) && ($this->request->post['km'] != '')) ? $this->request->post['km']: '';
				$position_amt = $this->model_selleradvertise_advertise->getPostionAmount($from_date, $end_date, $loc, $ad_order, $km);
				
				if($position_amt != ''){
					if(count($position_amt) > 0){ 
						foreach($position_amt as $key => $position_a) {
							$value_filter[] = $position_a['price'];
						}
						if(count($value_filter) > 0) {
							//$basic_position_amount = array('0'=>'500','1'=>'400','2'=>'300','3'=>'200');
							$position_amount = array_diff($value_filter, $basic_position_amount);
							$position_amount = array_unique($position_amount);
							$value = array();
							if(count($position_amount) > 0) {
								if(count($position_amount)+2 == $ad_order) {
									if($loc == '2') {
										$value[0] = $basic_position_amount['home_national'];
										
									}if($loc == '3') {
										$value[0] = $basic_position_amount['home_state'];
										
									}if($loc == '4') {
										$value[0] = $basic_position_amount['home_city'];
										
									}if($loc == '5') {
										$value[0] = $basic_position_amount['home_local'];
									}
								}
								foreach($position_amount as $key => $position) {					
									if(count($position_amount) == 1) { 
										if(($key+1) == $ad_order) {
											$value[0] = $position;
										}
										if(count($position_amount)+1 == $ad_order) {
											$value[0] = $position;
											if($loc == '2') {
												$value[1] = $basic_position_amount['home_national'];
												
											}if($loc == '3') {
												$value[1] = $basic_position_amount['home_state'];
												
											}if($loc == '4') {
												$value[1] = $basic_position_amount['home_city'];
												
											}if($loc == '5') {
												$value[1] = $basic_position_amount['home_local'];
											}
										}
									} else {										
										if(count($position_amount)+1 == $ad_order) {
											$value[0] = $position;
											if($loc == '2') {
												$value[1] = $basic_position_amount['home_national'];
												
											}if($loc == '3') {
												$value[1] = $basic_position_amount['home_state'];
												
											}if($loc == '4') {
												$value[1] = $basic_position_amount['home_city'];
												
											}if($loc == '5') {
												$value[1] = $basic_position_amount['home_local'];
											}
										} else {
											if($key+1 == $ad_order && $ad_order == 1) { 
												$value[0] = $position; break;
											} else {
												if($key+2 == $ad_order) {  
													$value[0] = $position;
												}
												if($key+1 == $ad_order) {
													$value[1] = $position;
												}
											}
										}
									}													
								}
								$json['success'] = $value;
							} else {
								if($loc == '2') {
									$value[0] = $basic_position_amount['home_national'];
									$json['success'] = $value;
								}if($loc == '3') {
									$value[0] = $basic_position_amount['home_state'];
									$json['success'] = $value;
								}if($loc == '4') {
									$value[0] = $basic_position_amount['home_city'];
									$json['success'] = $value;
								}if($loc == '5') {
									$value[0] = $basic_position_amount['home_local'];
									$json['success'] = $value;
								}
							}
						}
					} else { 
						if($loc == '2') {
							$value[0] = $basic_position_amount['home_national'];
							$json['success'] = $value;
						}if($loc == '3') {
							$value[0] = $basic_position_amount['home_state'];
							$json['success'] = $value;
						}if($loc == '4') {
							$value[0] = $basic_position_amount['home_city'];
							$json['success'] = $value;
						}if($loc == '5') {
							$value[0] = $basic_position_amount['home_local'];
							$json['success'] = $value;
						}
					}
				}else {
					if($loc == '2') {
						$value[0] = $basic_position_amount['home_national'];
						$json['success'] = $value;
					}if($loc == '3') {
						$value[0] = $basic_position_amount['home_state'];
						$json['success'] = $value;
					}if($loc == '4') {
						$value[0] = $basic_position_amount['home_city'];
						$json['success'] = $value;
					}if($loc == '5') {
						$value[0] = $basic_position_amount['home_local'];
						$json['success'] = $value;
					}
				}
			}
		}

		if (isset($this->error['advertise_location'])) {
			$json['advertise_location'] = $this->error['advertise_location'];
		} 
		if (isset($this->error['from_date'])) {
			$json['from_date'] = $this->error['from_date'];
		} 
		if (isset($this->error['end_date'])) {
			$json['end_date'] = $this->error['end_date'];
		} 
		if (isset($this->error['position'])) {
			$json['position'] = $this->error['position'];
		} 
		

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

		//print_r($this->request->post); die;
	}

	public function copy()
    {
        $this->load->language('selleradvertise/advertise');
		$this->load->model('selleradvertise/advertise');

        //echo "test"; die;
            //foreach ($this->request->post['selected'] as $product_id) {
            $advertise_i = $this->model_selleradvertise_advertise->copyAdvertisment($this->request->get['advertise_id']);
            //}

			if($advertise_i != '') {
				$this->session->data['success'] = $this->language->get('text_success');
			}

            $url = '';
            

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            $this->response->redirect($this->url->link('sellerprofile/sellerprofile&tab_section=store&inner_store=approved#content', ''.$url, 'SSL'));
        
    }

	public function category_autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/category');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				//'limit'       => 5
			);

			$results = $this->model_catalog_category->getCategories_auto($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'category_id' => $result['category_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function sub_category_autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/category');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'path_id' => $this->request->get['path_id'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 10
			);

			$results = $this->model_catalog_category->getSubCategories_auto($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'category_id' => $result['category_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function categories_subcategories_store() {
        try {

            $json = array();
            $validate_category = [];

            $this->load->language('selleradvertise/advertise');
            $this->load->model('catalog/category');
            $this->load->model('account/activity');

            $categories_list = $this->model_catalog_category->getCategoriesList();

            $categories = str_replace('&quot;', '"', $this->request->post['category']);
            $category_ids = json_decode($categories);

            foreach ($category_ids as $value) {
                if($value->category && $categories_list[$value->category]) {
                    $validate_category[] = $value;
                }
            }
            
            $this->model_catalog_category->storeSellerSubcategories(json_encode($validate_category));

            $json['success'] = 'Successfully saved';
                       
        } catch (Exception $e) {
            $json['error'] = $e->getMessage();
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
	}
	
	public function feature_store() {
		$json = array();

		$this->load->language('sellerprofile/sellerprofile');
		$this->load->model('sellerprofile/sellerprofile');		
		//print_r($this->request->post);
		if($this->request->post['featured_period'] != ''){
			if($this->request->post['featured_period'] == 'half') {
				$amount = 399;
				$days   = 15;
			} elseif ($this->request->post['featured_period'] == 'full') {
				$amount = 699;
				$days   = 30;
			}

			$from_date = date("Y-m-d");
			$end_date  = date('Y-m-d', strtotime("+".$days." days"));
			
			$this->model_sellerprofile_sellerprofile->featureStore($amount, $from_date, $end_date);
			$data['success'] = 'Your store moved to featured';
		}
		$json = $data;
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
	}

	public function store_timings()
    {
		$json = array();

		$this->load->language('sellerprofile/sellerprofile');
		$this->load->model('sellerprofile/sellerprofile');		
		//print_r($this->request->post); die;
		if($this->request->post != ''){
			
			$this->model_sellerprofile_sellerprofile->SellerStoretimings($this->request->post);
			$data['success'] = 'Your store timings Modified Successfully';
		}

		$json = $data;
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

	public function allow_products_cart()
    {
		$json = array();
		
		$this->load->model('sellerprofile/sellerprofile');	
		$this->model_sellerprofile_sellerprofile->SellerStoreAllowProductsCart($this->request->get);
		$data['success'] = 'Your store Settings Modified Successfully';

		$json = $data;
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

	public function clear_visitor_counter()
    {
		$json = array();

		$this->load->model('sellerprofile/sellerprofile');		
			
		$this->model_sellerprofile_sellerprofile->clear_visitor_counter();
		$data['success'] = 0;

		$json = $data;
		$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
	
	public function advertiseAmountList()
    {
		$json = $value = array();
		
		$this->load->language('selleradvertise/advertise');
		$this->load->model('selleradvertise/advertise');

		$from_date = $this->request->post['from_date'];
		$km = (isset($this->request->post['km']) && ($this->request->post['km'] != '')) ? $this->request->post['km']: '';
		$loc = $this->request->post['loc']; 
		$end_date = '';//$this->request->post['end_date'];
		$ad_order = '';//$this->request->post['position'];

		$position_amt = $this->model_selleradvertise_advertise->getPostionAmount($from_date, $end_date, $loc, $ad_order, $km);		
		
		if(count($position_amt) > 0){
			foreach($position_amt as $key => $position_a) {
				$value_filter[] = $position_a['price'];
			}
			if(count($value_filter) > 0){				
				$basic_position_amount = $this->model_selleradvertise_advertise->getStoreOfferBasicPrice(); //array('0'=>'500','1'=>'400','2'=>'300','3'=>'0');
				//print_r($basic_position_amount);exit;
				$position_amount = array_diff($value_filter, $basic_position_amount);
				foreach($position_amount as $key => $position) {					
					$json[] = $position;					
				}
				$json = array_unique($json);
			} 
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function download_qr()
    {
		$seller_id = $this->request->get['qr_id'];

		$filename = 'admin/view/image/qr_images/buyonear.in_'.$seller_id;

		$filename = $filename.'.png';

		$ctype="application/png";

		// required for IE, otherwise Content-disposition is ignored
		if(ini_get('zlib.output_compression'))
		ini_set('zlib.output_compression', 'Off');


		header("Pragma: public"); // required
		header("Expires: 0");
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		header("Cache-Control: private",false); // required for certain browsers
		header("Content-Type: $ctype");

		// change, added quotes to allow spaces in filenames


		header("Content-Disposition: attachment; filename=\"".basename($filename)."\";" );
		header("Content-Transfer-Encoding: binary");
		header("Content-Length: ".filesize($filename));
		readfile("$filename");
		exit();
		close();
	}	

	public function store_refer()
    {
        $this->load->language('sellerprofile/sellerprofile');

        $this->load->model('sellerprofile/sellerprofile');

        $json = array();

		//print_r($this->request->post); die;		

		if($this->request->post['refer_name'] == ''){
			$json['error'] = $this->language->get('enter_name');
		} elseif($this->request->post['refer_mobile'] == '') {
			$json['error'] = $this->language->get('enter_mobile');
		} elseif($this->request->post['refer_email'] == '') {
			$json['error'] = $this->language->get('enter_email');
		} elseif($this->request->post['bank_name'] == '') {
			$json['error'] = $this->language->get('enter_bank');
		} elseif($this->request->post['branch'] == '') {
			$json['error'] = $this->language->get('enter_branch');
		} elseif($this->request->post['account_holder_name'] == '') {
			$json['error'] = $this->language->get('enter_account_holder_name');
		} elseif($this->request->post['account_number'] == '') {
			$json['error'] = $this->language->get('enter_account_number');
		} elseif($this->request->post['ifsc'] == '') {
			$json['error'] = $this->language->get('enter_ifsc');
		}
		
		if( !preg_match("/^[0-9]{10}$/i", $this->request->post['refer_mobile']) ) {
			$json['error'] = $this->language->get('error_mobile');
		} elseif( !preg_match("/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i", $this->request->post['refer_email']) ) {
			$json['error'] = $this->language->get('error_email');
		}

		if(empty($json['error'])) {//echo "fdh"; die;
			$ref_mobile = $this->model_sellerprofile_sellerprofile->StoreReferrer($this->request->post);
			if($ref_mobile) {
				//$json['success'] = $this->language->get('refer_detail_updated');
				$json['success'] = $ref_mobile;
			}
		}

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

	public function store_portal()
    {
		$this->load->language('sellerprofile/sellerprofile');

        $this->load->model('sellerprofile/sellerprofile');

        $json = array();
		//print_r($this->request->post);

		if(isset($this->request->post['facebook']) != '' && (strlen(isset($this->request->post['facebook'])) > 500)){
			$json['error'] = $this->language->get('error_facebook');
		} elseif(isset($this->request->post['twitter']) != '' && (strlen(isset($this->request->post['twitter'])) > 500)) {
			$json['error'] = $this->language->get('error_twitter');
		} elseif(isset($this->request->post['googleplus']) != '' && (strlen(isset($this->request->post['googleplus'])) > 500)) {
			$json['error'] = $this->language->get('error_googleplus');
		} elseif(isset($this->request->post['website']) != '' && (strlen(isset($this->request->post['website'])) > 500)) {
			$json['error'] = $this->language->get('error_website');
		} elseif(isset($this->request->post['instagram']) != '' && (strlen(isset($this->request->post['instagram'])) > 500)) {
			$json['error'] = $this->language->get('error_instagram');
		}
		if(empty($json['error'])) {//echo "fdh"; die;
			$this->model_sellerprofile_sellerprofile->SellerProfileSave($this->request->post);
			$json['success'] = "Store/Entity portals successfully updated.";
		}    

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
	}
	
	public function getAdName($id)
	{
		$adName = 'free';
		switch($id)
		{
			case 1:
				$adName = 'Home - Top banner';
			break;
			case 2:
				$adName = 'Home - National (India)10%';
			break;
			case 3:
				$adName = 'Home - State (Tamil Nadu)';
			break;
			case 4:
				$adName = 'Home - City (Chennai)';
			break;
			case 5:
				$adName = 'Home - Nearby';
			break;
		}		
		return $adName;
	}

    public function getStoreOfferBasicPrice() {
        $this->load->model('selleradvertise/advertise');

        $basic_position_amount = $this->model_selleradvertise_advertise->getStoreOfferBasicPrice();

        echo json_encode($basic_position_amount);
        exit;
    }
	
}
