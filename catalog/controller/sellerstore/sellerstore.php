<?php

class Controllersellerstoresellerstore extends Controller
{
    private $error = array();

    public function index()
    {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('sellerstore/sellerstore', '', 'SSL');

            $this->response->redirect($this->url->link('common/home', '', 'SSL'));
        }

        $this->load->language('sellerstore/sellerstore');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sellerstore/sellerstore');

		$sellerstore_lists = $this->model_sellerstore_sellerstore->sellerstore_list($this->customer->getId());

		foreach ($sellerstore_lists  as $sellerstore) {

			if ($sellerstore) {
				$data['sellerstore_list'][] = array(
				'edit' => $this->url->link('sellerproduct/sellerstore/edit', ''.'&seller_store_id='.$sellerstore['customer_store_id'], 'SSL'),
				'store_name' => $sellerstore['store_name'],
				'store_address' => $sellerstore['store_address']
			);
			}
		}

		$data['insert'] = $this->url->link('sellerstore/sellerstore/add', '', 'SSL');
        //$data['delete'] = $this->url->link('sellerproduct/sellerstore/delete', '', 'SSL');
		
		//print_r($data['sellerstore_list']);

		$data['store_name'] = $this->language->get('store_name');
		$data['store_address'] = $this->language->get('store_address');

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

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_seller_detail'] = $this->language->get('text_seller_detail');
        $data['text_seller_profile'] = $this->language->get('text_seller_profile');
        $data['entry_seller_avatar'] = $this->language->get('entry_seller_avatar');
        $data['entry_seller_banner'] = $this->language->get('entry_seller_banner');
        $data['entry_all_categories'] = $this->language->get('entry_all_categories');
        $data['text_seller_group_detail'] = $this->language->get('text_seller_group_detail');

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
        $data['entry_nickname'] = $this->language->get('entry_nickname');
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

        $this->load->model('sellerstore/sellerstore');

        $data['seller_id'] = $this->customer->getId();

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', '', 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sellerstore/sellerstore', '', 'SSL'),
        );

        
        $this->load->model('sellerstore/sellerstore');

        if (isset($this->request->post['seller_group_id'])) {
            $data['seller_group_id'] = $this->request->post['seller_group_id'];
        } elseif (!empty($seller_info)) {
            $data['seller_group_id'] = $seller_info['seller_group_id'];
        } else {
            $data['seller_group_id'] = $this->config->get('config_seller_group_id');
        }
        $this->load->model('tool/image');
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


            $this->load->model('sellerproduct/seller');

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

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        


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

        


            $this->response->setOutput($this->load->view('sellerstore/sellerprofile_form', $data));

    }
	public function edit()
    {
        $this->load->language('sellerstore/sellerstore');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sellerstore/sellerstore');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_sellerstore_sellerstore->editstore($this->request->get['seller_store_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('store_edit', $activity_data);

            $this->response->redirect($this->url->link('sellerstore/sellerstore', '', 'SSL'));
        }

        $this->getForm();
    }

	protected function validateForm()
    {
        
        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }


    
    
}
