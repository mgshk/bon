<?php
class ControllerCommonHeader extends Controller {
	private $error = array();

	public function index() {
		// Analytics
		$this->load->model('extension/extension');
		$this->load->model('localisation/country');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$this->document->addScript('catalog/view/javascript/common/header.js');

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');		

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_select'] = $this->language->get('text_select');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
$data['isseller'] = $this->customer->isSeller();
		if(isset($this->session->data['login_type'])){
			$data['login_type'] = $this->session->data['login_type'];
		} else {
			$data['login_type'] = '';
		}
//print_r($data['login_type']);

				//if($this->customer->isSeller()){
			$this->load->model('sellerprofile/sellerprofile');
			$data['seller_info'] = $this->model_sellerprofile_sellerprofile->getseller($this->customer->getId());
			//print_r($data['seller_info']);
			//if( strtotime('now') > strtotime("+".$seller_info['subscription_duration'] ."months", strtotime($seller_info['seller_date_added']))) {

			//$this->load->language('sellerprofile/sellerprofile');



		//$disapprove_comment = $this->language->get('disapprove_comment');
		//$this->model_sellerprofile_sellerprofile->addHistory($this->customer->getId(), $disapprove_comment);
		//$this->model_sellerprofile_sellerprofile->disapprove($this->customer->getId());

			//}

		//}

		
		//$zone_data = $this->cache->get('zone.' . (int)$country_id);

		//if (!$zone_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE country_id = '" . (int)'99' . "' AND status = '1' ORDER BY name");

			$data['zone_data'] = $query->rows;


			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "security_question ORDER BY q_id ASC");

			$data['security_question_data'] = $query->rows;

			//$this->cache->set('zone.' . (int)$country_id, $data['zone_data']);
		//}	
		

		//$data['store_favourites_front'] = $this->model_seller_seller->updatestore_favourites_front($this->customer->getID());

		//echo "<pre>"; print_r($data['store_favourites_front']); die;

		$data['logged'] = $this->customer->isLogged();
		$data['seller_profile'] = $this->url->link('sellerprofile/sellerprofile', '', 'SSL');
		$data['seller_order'] = $this->url->link('order/order', '', 'SSL');
		$data['seller_product'] = $this->url->link('sellerproduct/product', '', 'SSL');
		$data['seller_bankaccount'] = $this->url->link('bankaccount/bankaccount', '', 'SSL');
		$data['seller_shipping'] = $this->url->link('extension/shipping', '', 'SSL');

		$data['text_seller_account'] = $this->language->get('text_seller_account');
		$data['text_seller_order'] = $this->language->get('text_seller_order');
		$data['text_seller_product'] = $this->language->get('text_seller_product');
		$data['text_seller_bankaccount'] = $this->language->get('text_seller_bankaccount');
		$data['text_seller_shipping'] = $this->language->get('text_seller_shipping');

		$data['text_sellerdownload'] = $this->language->get('text_sellerdownload');
		$data['sellerdownload'] = $this->url->link('sellerproduct/download', '', '');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');
		$data['store_favouries'] = $this->load->controller('common/favourites');
		$data['countries'] = $this->model_localisation_country->getCountries();

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';}

		return $this->load->view('common/header', $data);
	}

	public function new_login() {

		$json = array();
		$this->load->language('account/register');

		$this->load->model('account/customer');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$code = $this->randomString();
			
			$customer_id = $this->addCustomer($this->request->post, $code);

			//SMS Integration
			$this->load->model('selleradvertise/advertise');
			$phone_num = $this->request->post['telephone'];
			$sender_id = $this->config->get('sms_sender_lne');
			$status = '';
			$sms_type = 'sign_up';
			$this->model_selleradvertise_advertise->sendsms_payment($phone_num, $code, $sender_id, $status, $sms_type);
			//SMS Integration

			if (isset($this->request->post['zone_select'])) {
				$data['zone_select'] = $this->request->post['zone_select'];
			} else {
				$data['zone_select'] = '';
			}

			if (isset($this->request->post['telephone'])) {
				$data['telephone'] = $this->request->post['telephone'];
			} else {
				$data['telephone'] = '';
			}

			$query = $this->db->query('SELECT address_id, telephone FROM '.DB_PREFIX."customer WHERE telephone = '" . $this->db->escape($this->request->post['telephone']) . "'");
			$db_value = $query->row;
			$address_id = $db_value['address_id'];

			if($address_id) {
				$this->db->query("UPDATE " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', country_id = '" . (int)'99' . "', zone_id = '" . (int)$data['zone_select']. "' WHERE address_id = '" . (int)$address_id . "'");

				$this->db->query("UPDATE " . DB_PREFIX . "customer SET seller_group_id = '1' WHERE customer_id = '" . (int)$customer_id . "'");

			} else {
				$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', country_id = '" . (int)'99' . "', zone_id = '" . (int)$data['zone_select']. "'");

				$address_id = $this->db->getLastId();

				$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . $address_id . "', seller_group_id = '1' WHERE customer_id = '" . (int)$customer_id . "'");
			}

			//$customer_group_id = $this->config->get('config_customer_group_id');

			//$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

			// Clear any previous login attempts for unregistered accounts.
			//$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);

			//$this->customer->login($this->request->post['email'], $this->request->post['password']);

			unset($this->session->data['guest']);

			//$this->response->redirect($this->url->link('account/success'));
			if($customer_id != ''){
				$json['success'] = $customer_id;
				$json['telephone'] = $data['telephone'];
				$json['zone_select'] = $data['zone_select'];
			}
		}
		//return $this->load->view('common/header', $data);
		if (isset($this->error['warning'])) {
			$json['error_warning'] = $this->error['warning'];
		}
		if (isset($this->error['telephone'])) {
			$json['error_telephone'] = $this->error['telephone'];
		}
		if (isset($this->error['telephone_number'])) {
			$json['telephone_number'] = $this->error['telephone_number'];
		}
		
		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} else {
			$data['telephone'] = '';
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}

	private function validate() {
		if ((utf8_strlen($this->request->post['telephone']) < 9) || (utf8_strlen($this->request->post['telephone']) > 11)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}
		if ($this->model_account_customer->getTotalCustomersByTelephoneOTP($this->request->post['telephone'])) {
			$this->error['warning'] = $this->language->get('error_exists_mobile');
		}
		if (!(int)($this->request->post['telephone'])) {
			$this->error['telephone_number'] = $this->language->get('error_telephone_number');
		}
		return !$this->error;
	}

	public function addCustomer($data, $code) {
		//$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$customer_group_id . "', telephone = '" . $this->db->escape($data['telephone']) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '0', approved = '" . (int)!$customer_group_info['approval'] . "', date_added = NOW()");
		if ($this->model_account_customer->getTotalCustomersByTelephoneCheck($data['telephone'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET customer_group_id = '1', telephone = '" . $this->db->escape($data['telephone']) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '0', approved = '1', date_added = NOW(), code = '" . $this->db->escape($code) . "' WHERE telephone = '" . $this->db->escape($data['telephone']) . "'");

			$query = $this->db->query('SELECT customer_id, telephone FROM '.DB_PREFIX."customer WHERE telephone = '" . $this->db->escape($data['telephone']) . "'");
			$db_value = $query->row;
			$customer_id = $db_value['customer_id'];
		} else {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_group_id = '1', telephone = '" . $this->db->escape($data['telephone']) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '0', approved = '1', date_added = NOW(), code = '" . $this->db->escape($code) . "'");
			$customer_id = $this->db->getLastId();	
		}			

		return $customer_id;
	}
	public function new_login_update() {
	$json = array();
		$this->load->language('account/register');

		$this->load->model('account/customer');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate_upadte()) {
			$customer_id = $this->updateCustomer($this->request->post);

			// Clear any previous login attempts for unregistered accounts.
			//$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);

			//$this->customer->login($this->request->post['email'], $this->request->post['password']);

			unset($this->session->data['guest']);

			//$this->response->redirect($this->url->link('account/success'));
			if($customer_id != ''){
				$json['success'] = $customer_id;
			}
		}
		//return $this->load->view('common/header', $data);
		if (isset($this->error['email_empty'])) {
			$json['error_email_empty'] = $this->error['email_empty'];
		}
		if (isset($this->error['email'])) {
			$json['error_email'] = $this->error['email'];
		}
		
		if (isset($this->error['warning'])) {
			$json['error_warning'] = $this->error['warning'];
		}
		if (isset($this->error['password'])) {
			$json['error_password'] = $this->error['password'];
		}

		if (isset($this->error['confirm'])) {
			$json['error_confirm'] = $this->error['confirm'];
		}

		if (isset($this->error['security_select'])) {
			$json['security_select'] = $this->error['security_select'];
		}

		if (isset($this->error['security_answer'])) {
			$json['security_answer'] = $this->error['security_answer'];
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}
		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}
		
		if (isset($this->request->post['security_select'])) {
			$data['security_select'] = $this->request->post['security_select'];
		} else {
			$data['security_select'] = '';
		}

		if (isset($this->request->post['security_answer'])) {
			$data['security_answer'] = $this->request->post['security_answer'];
		} else {
			$data['security_answer'] = '';
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}
	public function code_check() {
		if($this->request->post['otp'] != ''){
			$this->load->language('account/register');
			$this->load->model('account/customer');
			$cus_prof = $this->request->post['cus_prof'];		
			$cus_detail_full = $this->model_account_customer->getCustomer($this->request->post['cus_prof']);
			$cus_detail = $this->model_account_customer->getCustomerByPhone($cus_detail_full['telephone']);
			//echo "<pre>"; print_r($cus_detail['code']);
			//print_r($this->request->post['forgt-phn-otp']);die;
			if($cus_detail['code'] != $this->request->post['otp']){
				$json['error_warning'] = $this->language->get('OTP not match!');
			} else {
				$json['success'] = "success";
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}
	private function validate_upadte() {
		/*if($this->request->post['forgt-phn-otp'] != ''){
			$cus_detail = $this->model_account_customer->getCustomerByPhone($this->request->post['forgt-phn-sec']);
			//echo "<pre>"; print_r($cus_detail['code']);
			//print_r($this->request->post['forgt-phn-otp']);die;
			if($cus_detail['code'] != $this->request->post['forgt-phn-otp']){
				$this->error['sec_otp_sec'] = $this->language->get('sec_otp_sec_not');
			}
		}*/
		if (utf8_strlen($this->request->post['email']) == '') {
			$this->error['email_empty'] = "E-Mail cannot be empty";
		}
		if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
		}
		if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_exists');
		}
		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if ($this->request->post['confirm'] != $this->request->post['password']) {
			$this->error['confirm'] = $this->language->get('error_confirm');
		}
		if ($this->request->post['security_select'] == '') {
			$this->error['security_select'] = $this->language->get('security_select_error');
		}
		if (($this->request->post['security_answer'] == '') && ($this->request->post['security_select'] != '')) {
			$this->error['security_answer'] = $this->language->get('security_answer_error');
		}
		return !$this->error;
	}
	private function updateCustomer($data) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET email = '" . $this->db->escape($data['email']) . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', status = '1', code = '' WHERE customer_id = '" . (int)$this->request->post['cus_prof'] . "'");		

		$this->db->query("UPDATE " . DB_PREFIX . "address SET security_select = '" . (int)$data['security_select'] . "', security_answer = '" . $data['security_answer'] . "' WHERE customer_id = '" . (int)$this->request->post['cus_prof'] . "'");

		$customer_id = $this->request->post['cus_prof'];

		return $customer_id;
	}

	public function new_login_update_two() {
		$json = array();
		$this->load->language('account/register');

		$this->load->model('account/customer');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate_upadte_two()) {
			$customer_id = $this->updateCustomerTwo($this->request->post);

			// Clear any previous login attempts for unregistered accounts.
			//$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);

			//$this->customer->login($this->request->post['email'], $this->request->post['password']);

			unset($this->session->data['guest']);

			//$this->response->redirect($this->url->link('account/success'));
			if($customer_id != ''){
				$json['success'] = 'New user registration completed successfully.';
			}
		}
		//return $this->load->view('common/header', $data);
		if (isset($this->error['firstname'])) {
			$json['error_firstname'] = $this->error['firstname'];
		}

		if (isset($this->error['lastname'])) {
			$json['error_lastname'] = $this->error['lastname'];
		}
		if (isset($this->error['address_1'])) {
			$json['error_address_1'] = $this->error['address_1'];
		}

		// if (isset($this->request->post['firstname'])) {
		// 	$data['firstname'] = $this->request->post['firstname'];
		// } else {
		// 	$data['firstname'] = '';
		// }

		// if (isset($this->request->post['lastname'])) {
		// 	$data['lastname'] = $this->request->post['lastname'];
		// } else {
		// 	$data['lastname'] = '';
		// }

		// if (isset($this->request->post['address_1'])) {
		// 	$data['address_1'] = $this->request->post['address_1'];
		// } else {
		// 	$data['address_1'] = '';
		// }

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}
	private function validate_upadte_two() {
		$this->load->model('localisation/country');

		if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
			$this->error['address_1'] = $this->language->get('error_address_1');
		}

		if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
			$this->error['city'] = $this->language->get('error_city');
		}

		if ($this->request->post['country_id'] == '' || !is_numeric($this->request->post['country_id'])) {
			$this->error['country'] = $this->language->get('error_country');
		}

		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

		if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
			$this->error['postcode'] = $this->language->get('error_postcode');
		}

		if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '' || !is_numeric($this->request->post['zone_id'])) {
			$this->error['zone'] = $this->language->get('error_zone');
		}

		return !$this->error;
	}
	private function updateCustomerTwo($data) {
		$this->db->query("UPDATE " . DB_PREFIX . "address 
			SET customer_id = '" . (int)$this->request->post['cus_d_up'] . "', firstname = '" . $this->db->escape($data['firstname']) . "', 
			lastname = '" . $this->db->escape($data['lastname']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "',
			address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', 
			postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', 
			zone_id = '" . (int)$data['zone_id'] . "' WHERE customer_id = '" . (int)$this->request->post['cus_d_up'] . "'");

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET firstname = '" . $this->db->escape($data['firstname']) . "', 
			lastname = '" . $this->db->escape($data['lastname']) . "' 
			WHERE customer_id = '" . (int)$this->request->post['cus_d_up'] . "'");

		$customer_id = $this->request->post['cus_d_up'];
		return $customer_id;
	}
	public function forgot_pass_log() {
	$json = array();
		
		$this->load->language('account/forgotten');

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate_forgot()) {
			
			$code = $this->randomString();
			//$code = token(40);

			$this->model_account_customer->editCodePhone($this->request->post['forgt-phn'], $code);

			//SMS Integration
			$this->load->model('selleradvertise/advertise');
			$phone_num = $this->request->post['forgt-phn'];
			$sender_id = $this->config->get('sms_sender_ads');
			$status = '';
			$sms_type = 'forget_pass';
			$this->model_selleradvertise_advertise->sendsms_payment($phone_num, $code, $sender_id, $status, $sms_type);
			//SMS Integration

			$customer_info_txt = $this->model_account_customer->getCustomerByPhone($this->request->post['forgt-phn']);
			$customer_info_address_sec = $this->model_account_customer->getCustomerByAddress($customer_info_txt['address_id']);
			$customer_security_question = $this->model_account_customer->getCustomerByAddressSecurity($customer_info_address_sec['security_select']);

			if($customer_security_question != ''){
				$json['success'] = $this->request->post['forgt-phn'];
				$json['q_name'] = $customer_security_question['q_name'];
			}
		}

		if (isset($this->error['forgt-phn-failure'])) {
			$json['forgt-phn-failure'] = $this->error['forgt-phn-failure'];
		} else {
			$json['forgt-phn-failure'] = '';
		}

		if (isset($this->request->post['forgt-phn'])) {
			$data['forgt-phn'] = $this->request->post['forgt-phn'];
		} else {
			$data['forgt-phn'] = '';
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	protected function validate_forgot() {
		if (!isset($this->request->post['forgt-phn'])) {
			$this->error['forgt-phn-failure'] = $this->language->get('error_phone');
		} 
		if (!$this->model_account_customer->getTotalCustomersByPhone($this->request->post['forgt-phn'])) {
			$this->error['forgt-phn-failure'] = $this->language->get('error_phone');
		}

		$customer_info = $this->model_account_customer->getCustomerByPhone($this->request->post['forgt-phn']);
		
		if ($customer_info && !$customer_info['approved']) {
			$this->error['forgt-phn-failure'] = $this->language->get('error_approved');
		}

		return !$this->error;
	}
	private function randomString($length = 6) {
		$str = "";
		$characters = array_merge(range('0','9'));
		$max = count($characters) - 1;
		for ($i = 0; $i < $length; $i++) {
			$rand = mt_rand(0, $max);
			$str .= $characters[$rand];
		}
		return $str;
	}
	public function forgot_pass_sec() {
	$json = array();
		
		$this->load->language('account/forgotten');

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate_forgot_sec()) {
			$customer_info_txt = $this->model_account_customer->getCustomerByPhone($this->request->post['forgt-phn-sec']);
			if($customer_info_txt != ''){
				$json['success'] = $customer_info_txt['customer_id'];
			}
		}
		if (isset($this->error['security_answer_sec'])) {
			$json['security_answer_sec'] = $this->error['security_answer_sec'];
		} else {
			$json['security_answer_sec'] = '';
		}
		if (isset($this->error['sec_otp_sec'])) {
			$json['sec_otp_sec'] = $this->error['sec_otp_sec'];
		} else {
			$json['sec_otp_sec'] = '';
		}

		if (isset($this->request->post['security_answer_sec'])) {
			$data['security_answer_sec'] = $this->request->post['security_answer_sec'];
		} else {
			$data['security_answer_sec'] = '';
		}
		if (isset($this->request->post['forgt-phn-otp'])) {
			$data['forgt-phn-otp'] = $this->request->post['forgt-phn-otp'];
		} else {
			$data['forgt-phn-otp'] = '';
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	protected function validate_forgot_sec() {
		if ($this->request->post['forgt-phn-otp'] == '') {
			$this->error['sec_otp_sec'] = $this->language->get('sec_otp_sec');
		}
		if($this->request->post['forgt-phn-otp'] != ''){
			$cus_detail = $this->model_account_customer->getCustomerByPhone($this->request->post['forgt-phn-sec']);
			//echo "<pre>"; print_r($cus_detail['code']);
			//print_r($this->request->post['forgt-phn-otp']);die;
			if($cus_detail['code'] != $this->request->post['forgt-phn-otp']){
				$this->error['sec_otp_sec'] = $this->language->get('sec_otp_sec_not');
			}
		}
		if (($this->request->post['otp-sec'] != 0) && ($this->request->post['security_answer_sec'] == '')) {
			$this->error['security_answer_sec'] = $this->language->get('security_answer_sec');
		}
		
		if (($this->request->post['otp-sec'] != 0) && ($this->request->post['security_answer_sec'] != '')) {
			$cus_answer = $this->model_account_customer->getCustomerByAddress($cus_detail['address_id']);
			if($cus_answer['security_answer'] != $this->request->post['security_answer_sec']){
				$this->error['security_answer_sec'] = $this->language->get('security_answer_sec_not');
			}
		}

		return !$this->error;
	}

	public function forgot_pass_change() {
	$json = array();
	$this->load->language('account/register');

	$this->load->model('account/customer');
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate_change_pass()) {
			$customer_id = $this->updateCustomerPass($this->request->post);
			if($customer_id != ''){
				$json['success'] = "Password changed successfully...";
			}
		}
		if (isset($this->error['password'])) {
			$json['error_password'] = $this->error['password'];
		}

		if (isset($this->error['confirm'])) {
			$json['error_confirm'] = $this->error['confirm'];
		}
		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}
	private function validate_change_pass() {
		
		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if ($this->request->post['confirm'] != $this->request->post['password']) {
			$this->error['confirm'] = $this->language->get('error_confirm');
		}
		return !$this->error;
	}
	private function updateCustomerPass($data) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE customer_id = '" . (int)$this->request->post['cus_ids'] . "'");	

		$customer_id = $this->request->post['cus_ids'];

		return $customer_id;
	}
	
	public function updatestore_favourites_front() {

		$this->load->model('seller/seller');

		$store_id = $this->request->post['store_id'];
		$value    = $this->request->post['value'];
		$fav_name = $this->request->post['fav_name'];

		$this->model_seller_seller->updatestore_favourites_front($this->customer->getID(), $store_id, $value, $fav_name);

		$json['success'] = "Updated successfully...";

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

	public function remove() {

		$json = array();

		$this->load->model('seller/seller');

		// Remove
		if (isset($this->request->post['key'])) {
			$this->model_seller_seller->remove_favourite($this->request->post['key']);
			$fav_stores = $this->model_seller_seller->getstore_favourites_front($this->customer->getID());
			$json['total'] = count($fav_stores);
			$json['success'] = "Removed";
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function site_feedback() {

		$json = array();

		$this->load->model('seller/seller');

		//print_r($this->request->post);
		//die;

		if($this->request->post['fd_mobile_num'] == '') {
			$json['error'] = "Please enter mobile number.";
		} elseif(($this->request->post['fd_mobile_num'] != '') && (strlen($this->request->post['fd_mobile_num']) != 10) && !is_numeric($this->request->post['fd_mobile_num'])) {
			$json['error'] = "Please enter valid mobile number.";
		} elseif($this->request->post['fd_email'] == '' || (strlen($this->request->post['fd_email']) > 70)) {
			$json['error'] = "Please enter valid Email ID.";
//		} elseif(utf8_strlen($this->request->post['fd_feedback']) == 0) {
//			$json['error'] = "Please enter your feedback.";
//		} elseif((strlen($this->request->post['fd_feedback']) > 3000)) {
//			$json['error'] = "You crossed maximum allowed characters of 3000 in feedback.";
		} else {		
			$feedback_id = $this->model_seller_seller->Insert_site_feedback($this->request->post);

			if($feedback_id != '') {
				$json['success'] = "Your feedback Successfully submitted";
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
}