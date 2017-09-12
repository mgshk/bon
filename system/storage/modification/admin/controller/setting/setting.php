<?php
class ControllerSettingSetting extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('setting/setting');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('config', $this->request->post);

			if ($this->config->get('config_currency_auto')) {
				$this->load->model('localisation/currency');

				$this->model_localisation_currency->refresh();
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('setting/store', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_product'] = $this->language->get('text_product');
		$data['text_review'] = $this->language->get('text_review');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_captcha'] = $this->language->get('text_captcha');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_shipping'] = $this->language->get('text_shipping');
		$data['text_payment'] = $this->language->get('text_payment');
		$data['text_mail'] = $this->language->get('text_mail');
		$data['text_smtp'] = $this->language->get('text_smtp');
		$data['text_mail_alert'] = $this->language->get('text_mail_alert');
		$data['text_mail_account'] = $this->language->get('text_mail_account');
		$data['text_mail_affiliate'] = $this->language->get('text_mail_affiliate');
		$data['text_mail_order']  = $this->language->get('text_mail_order');
		$data['text_mail_review'] = $this->language->get('text_mail_review');
		$data['text_general'] = $this->language->get('text_general');
		$data['text_security'] = $this->language->get('text_security');
		$data['text_upload'] = $this->language->get('text_upload');
		$data['text_error'] = $this->language->get('text_error');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_owner'] = $this->language->get('entry_owner');
		$data['entry_address'] = $this->language->get('entry_address');
		$data['entry_geocode'] = $this->language->get('entry_geocode');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_open'] = $this->language->get('entry_open');
		$data['entry_comment'] = $this->language->get('entry_comment');
		$data['entry_location'] = $this->language->get('entry_location');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_theme'] = $this->language->get('entry_theme');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_language'] = $this->language->get('entry_language');
		$data['entry_admin_language'] = $this->language->get('entry_admin_language');
		$data['entry_currency'] = $this->language->get('entry_currency');
		$data['entry_currency_auto'] = $this->language->get('entry_currency_auto');
		$data['entry_length_class'] = $this->language->get('entry_length_class');
		$data['entry_weight_class'] = $this->language->get('entry_weight_class');
		$data['entry_limit_admin'] = $this->language->get('entry_limit_admin');
		$data['entry_product_count'] = $this->language->get('entry_product_count');
		$data['entry_review'] = $this->language->get('entry_review');
		$data['entry_review_guest'] = $this->language->get('entry_review_guest');
		$data['entry_voucher_min'] = $this->language->get('entry_voucher_min');
		$data['entry_voucher_max'] = $this->language->get('entry_voucher_max');
		$data['entry_tax'] = $this->language->get('entry_tax');
		$data['entry_tax_default'] = $this->language->get('entry_tax_default');
		$data['entry_tax_customer'] = $this->language->get('entry_tax_customer');
		$data['entry_customer_online'] = $this->language->get('entry_customer_online');
		$data['entry_customer_activity'] = $this->language->get('entry_customer_activity');
		$data['entry_customer_search'] = $this->language->get('entry_customer_search');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_customer_group_display'] = $this->language->get('entry_customer_group_display');
		$data['entry_customer_price'] = $this->language->get('entry_customer_price');
		$data['entry_login_attempts'] = $this->language->get('entry_login_attempts');
		$data['entry_account'] = $this->language->get('entry_account');
		$data['entry_invoice_prefix'] = $this->language->get('entry_invoice_prefix');
		$data['entry_cart_weight'] = $this->language->get('entry_cart_weight');
		$data['entry_checkout_guest'] = $this->language->get('entry_checkout_guest');
		$data['entry_checkout'] = $this->language->get('entry_checkout');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_processing_status'] = $this->language->get('entry_processing_status');
		$data['entry_complete_status'] = $this->language->get('entry_complete_status');
		$data['entry_fraud_status'] = $this->language->get('entry_fraud_status');
		$data['entry_api'] = $this->language->get('entry_api');
		$data['entry_stock_display'] = $this->language->get('entry_stock_display');
		$data['entry_stock_warning'] = $this->language->get('entry_stock_warning');
		$data['entry_stock_checkout'] = $this->language->get('entry_stock_checkout');
		$data['entry_affiliate_approval'] = $this->language->get('entry_affiliate_approval');
		$data['entry_affiliate_auto'] = $this->language->get('entry_affiliate_auto');
		$data['entry_affiliate_commission'] = $this->language->get('entry_affiliate_commission');
		$data['entry_affiliate'] = $this->language->get('entry_affiliate');
		$data['entry_return'] = $this->language->get('entry_return');
		$data['entry_return_status'] = $this->language->get('entry_return_status');
		$data['entry_captcha'] = $this->language->get('entry_captcha');
		$data['entry_captcha_page'] = $this->language->get('entry_captcha_page');
		$data['entry_logo'] = $this->language->get('entry_logo');
		$data['entry_icon'] = $this->language->get('entry_icon');
		$data['entry_ftp_hostname'] = $this->language->get('entry_ftp_hostname');
		$data['entry_ftp_port'] = $this->language->get('entry_ftp_port');
		$data['entry_ftp_username'] = $this->language->get('entry_ftp_username');
		$data['entry_ftp_password'] = $this->language->get('entry_ftp_password');
		$data['entry_ftp_root'] = $this->language->get('entry_ftp_root');
		$data['entry_ftp_status'] = $this->language->get('entry_ftp_status');
		$data['entry_mail_protocol'] = $this->language->get('entry_mail_protocol');
		$data['entry_mail_parameter'] = $this->language->get('entry_mail_parameter');
		$data['entry_mail_smtp_hostname'] = $this->language->get('entry_mail_smtp_hostname');
		$data['entry_mail_smtp_username'] = $this->language->get('entry_mail_smtp_username');
		$data['entry_mail_smtp_password'] = $this->language->get('entry_mail_smtp_password');
		$data['entry_mail_smtp_port'] = $this->language->get('entry_mail_smtp_port');
		$data['entry_mail_smtp_timeout'] = $this->language->get('entry_mail_smtp_timeout');
		$data['entry_mail_alert'] = $this->language->get('entry_mail_alert');
		$data['entry_mail_alert_email'] = $this->language->get('entry_mail_alert_email');
		$data['entry_alert_email'] = $this->language->get('entry_alert_email');
		$data['entry_secure'] = $this->language->get('entry_secure');
		$data['entry_shared'] = $this->language->get('entry_shared');
		$data['entry_robots'] = $this->language->get('entry_robots');
		$data['entry_file_max_size'] = $this->language->get('entry_file_max_size');
		$data['entry_file_ext_allowed'] = $this->language->get('entry_file_ext_allowed');
		$data['entry_file_mime_allowed'] = $this->language->get('entry_file_mime_allowed');
		$data['entry_maintenance'] = $this->language->get('entry_maintenance');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_encryption'] = $this->language->get('entry_encryption');
		$data['entry_seo_url'] = $this->language->get('entry_seo_url');
		$data['entry_compression'] = $this->language->get('entry_compression');
		$data['entry_error_display'] = $this->language->get('entry_error_display');
		$data['entry_error_log'] = $this->language->get('entry_error_log');
		$data['entry_error_filename'] = $this->language->get('entry_error_filename');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['help_geocode'] = $this->language->get('help_geocode');
		$data['help_open'] = $this->language->get('help_open');
		$data['help_comment'] = $this->language->get('help_comment');
		$data['help_location'] = $this->language->get('help_location');
		$data['help_currency'] = $this->language->get('help_currency');
		$data['help_currency_auto'] = $this->language->get('help_currency_auto');
		$data['help_limit_admin'] = $this->language->get('help_limit_admin');
		$data['help_product_count'] = $this->language->get('help_product_count');
		$data['help_review'] = $this->language->get('help_review');
		$data['help_review_guest'] = $this->language->get('help_review_guest');
		$data['help_voucher_min'] = $this->language->get('help_voucher_min');
		$data['help_voucher_max'] = $this->language->get('help_voucher_max');
		$data['help_tax_default'] = $this->language->get('help_tax_default');
		$data['help_tax_customer'] = $this->language->get('help_tax_customer');
		$data['help_customer_online'] = $this->language->get('help_customer_online');
		$data['help_customer_activity'] = $this->language->get('help_customer_activity');
		$data['help_customer_group'] = $this->language->get('help_customer_group');
		$data['help_customer_group_display'] = $this->language->get('help_customer_group_display');
		$data['help_customer_price'] = $this->language->get('help_customer_price');
		$data['help_login_attempts'] = $this->language->get('help_login_attempts');
		$data['help_account'] = $this->language->get('help_account');
		$data['help_cart_weight'] = $this->language->get('help_cart_weight');
		$data['help_checkout_guest'] = $this->language->get('help_checkout_guest');
		$data['help_checkout'] = $this->language->get('help_checkout');
		$data['help_invoice_prefix'] = $this->language->get('help_invoice_prefix');
		$data['help_order_status'] = $this->language->get('help_order_status');
		$data['help_processing_status'] = $this->language->get('help_processing_status');
		$data['help_complete_status'] = $this->language->get('help_complete_status');
		$data['help_fraud_status'] = $this->language->get('help_fraud_status');
		$data['help_api'] = $this->language->get('help_api');
		$data['help_stock_display'] = $this->language->get('help_stock_display');
		$data['help_stock_warning'] = $this->language->get('help_stock_warning');
		$data['help_stock_checkout'] = $this->language->get('help_stock_checkout');
		$data['help_affiliate_approval'] = $this->language->get('help_affiliate_approval');
		$data['help_affiliate_auto'] = $this->language->get('help_affiliate_auto');
		$data['help_affiliate_commission'] = $this->language->get('help_affiliate_commission');
		$data['help_affiliate'] = $this->language->get('help_affiliate');
		$data['help_commission'] = $this->language->get('help_commission');
		$data['help_return'] = $this->language->get('help_return');
		$data['help_return_status'] = $this->language->get('help_return_status');
		$data['help_captcha'] = $this->language->get('help_captcha');
		$data['help_icon'] = $this->language->get('help_icon');
		$data['help_ftp_root'] = $this->language->get('help_ftp_root');
		$data['help_mail_protocol'] = $this->language->get('help_mail_protocol');
		$data['help_mail_parameter'] = $this->language->get('help_mail_parameter');
		$data['help_mail_smtp_hostname'] = $this->language->get('help_mail_smtp_hostname');
		$data['help_mail_smtp_password'] = $this->language->get('help_mail_smtp_password');
		$data['help_mail_alert'] = $this->language->get('help_mail_alert');
		$data['help_mail_alert_email'] = $this->language->get('help_mail_alert_email');
		$data['help_secure'] = $this->language->get('help_secure');
		$data['help_shared'] = $this->language->get('help_shared');
		$data['help_robots'] = $this->language->get('help_robots');
		$data['help_seo_url'] = $this->language->get('help_seo_url');
		$data['help_file_max_size'] = $this->language->get('help_file_max_size');
		$data['help_file_ext_allowed'] = $this->language->get('help_file_ext_allowed');
		$data['help_file_mime_allowed'] = $this->language->get('help_file_mime_allowed');
		$data['help_maintenance'] = $this->language->get('help_maintenance');
		$data['help_password'] = $this->language->get('help_password');
		$data['help_encryption'] = $this->language->get('help_encryption');
		$data['help_compression'] = $this->language->get('help_compression');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_store'] = $this->language->get('tab_store');
		$data['tab_local'] = $this->language->get('tab_local');
		$data['tab_option'] = $this->language->get('tab_option');
		$data['tab_image'] = $this->language->get('tab_image');
		$data['tab_ftp'] = $this->language->get('tab_ftp');
		$data['tab_mail'] = $this->language->get('tab_mail');
		$data['tab_server'] = $this->language->get('tab_server');
$data['tab_multiseller_setting'] = $this->language->get('tab_multiseller_setting');
$data['tab_multisellergeneral'] = $this->language->get('tab_multisellergeneral');
$data['tab_multisellerproductsetting'] = $this->language->get('tab_multisellerproductsetting');
$data['tab_multisellerordersetting'] = $this->language->get('tab_multisellerordersetting');
$data['tab_multisellerdownloadsetting'] = $this->language->get('tab_multisellerdownloadsetting');
$data['text_sellerdownloadstatus'] = $this->language->get('text_sellerdownloadstatus');

if (isset($this->request->post['config_sellerdownloadstatus'])) {
						$data['config_sellerdownloadstatus'] = $this->request->post['config_sellerdownloadstatus'];
					} else {
						$data['config_sellerdownloadstatus'] = $this->config->get('config_sellerdownloadstatus');
					}

$data['text_seller_agree'] = $this->language->get('text_seller_agree');

if (isset($this->request->post['config_seller_agree'])) {
  $data['config_seller_agree'] = $this->request->post['config_seller_agree'];
} else {
  $data['config_seller_agree'] = $this->config->get('config_seller_agree');
}

if (isset($this->request->post['config_seller_agree_id'])) {
			$data['config_seller_agree_id'] = $this->request->post['config_seller_agree_id'];
		} else {
			$data['config_seller_agree_id'] = $this->config->get('config_seller_agree_id');
		}

$data['text_sellerreview'] = $this->language->get('text_sellerreview');

if (isset($this->request->post['config_sellerreview'])) {
						$data['config_sellerreview'] = $this->request->post['config_sellerreview'];
					} else {
						$data['config_sellerreview'] = $this->config->get('config_sellerreview');
					}

$data['text_sellerreviewguest'] = $this->language->get('text_sellerreviewguest');

					if (isset($this->request->post['config_sellerreview_guest'])) {
						$data['config_sellerreview_guest'] = $this->request->post['config_sellerreview_guest'];
					} else {
						$data['config_sellerreview_guest'] = $this->config->get('config_sellerreview_guest');
					}

$data['text_sellerimageupload'] = $this->language->get('text_sellerimageupload');
$data['text_sellerprofileimage'] = $this->language->get('text_sellerprofileimage');
$data['text_sellerproductname'] = $this->language->get('text_sellerproductname');
$data['text_sellerproductimage'] = $this->language->get('text_sellerproductimage');
$data['text_sellerproductdateofcreat'] = $this->language->get('text_sellerproductdateofcreat');
$data['text_sellerproductbadge'] = $this->language->get('text_sellerproductbadge');
$data['text_seller_add_product_alert'] = $this->language->get('text_seller_add_product_alert');
$data['text_sellerproductcount'] = $this->language->get('text_sellerproductcount');
$data['text_sellerproductrating'] = $this->language->get('text_sellerproductrating');
$data['text_sellerwebsite'] = $this->language->get('text_sellerwebsite');
$data['text_sellerfacebook'] = $this->language->get('text_sellerfacebook');
$data['text_sellertwitter'] = $this->language->get('text_sellertwitter');
$data['text_sellergoogleplus'] = $this->language->get('text_sellergoogleplus');
$data['text_sellerinstagram'] = $this->language->get('text_sellerinstagram');

if (isset($this->request->post['config_sellerimageupload'])) {
						$data['config_sellerimageupload'] = $this->request->post['config_sellerimageupload'];
					} else {
						$data['config_sellerimageupload'] = $this->config->get('config_sellerimageupload');
					}

if (isset($this->request->post['config_sellerprofileimage'])) {
						$data['config_sellerprofileimage'] = $this->request->post['config_sellerprofileimage'];
					} else {
						$data['config_sellerprofileimage'] = $this->config->get('config_sellerprofileimage');
					}

if (isset($this->request->post['config_sellerproductname'])) {
						$data['config_sellerproductname'] = $this->request->post['config_sellerproductname'];
					} else {
						$data['config_sellerproductname'] = $this->config->get('config_sellerproductname');
					}
if (isset($this->request->post['config_sellerproductrating'])) {
						$data['config_sellerproductrating'] = $this->request->post['config_sellerproductrating'];
					} else {
						$data['config_sellerproductrating'] = $this->config->get('config_sellerproductrating');
					}
if (isset($this->request->post['config_sellerproductimage'])) {
						$data['config_sellerproductimage'] = $this->request->post['config_sellerproductimage'];
					} else {
						$data['config_sellerproductimage'] = $this->config->get('config_sellerproductimage');
					}

if (isset($this->request->post['config_sellerproductdateofcreat'])) {
						$data['config_sellerproductdateofcreat'] = $this->request->post['config_sellerproductdateofcreat'];
					} else {
						$data['config_sellerproductdateofcreat'] = $this->config->get('config_sellerproductdateofcreat');
					}

if (isset($this->request->post['config_sellerproductbadge'])) {
						$data['config_sellerproductbadge'] = $this->request->post['config_sellerproductbadge'];
					} else {
						$data['config_sellerproductbadge'] = $this->config->get('config_sellerproductbadge');
					}
          if (isset($this->request->post['config_seller_add_product_alert'])) {
						$data['config_seller_add_product_alert'] = $this->request->post['config_seller_add_product_alert'];
					} else {
						$data['config_seller_add_product_alert'] = $this->config->get('config_seller_add_product_alert');
					}

if (isset($this->request->post['config_sellerproductcount'])) {
						$data['config_sellerproductcount'] = $this->request->post['config_sellerproductcount'];
					} else {
						$data['config_sellerproductcount'] = $this->config->get('config_sellerproductcount');
					}

					if (isset($this->request->post['config_sellerwebsite'])) {
						$data['config_sellerwebsite'] = $this->request->post['config_sellerwebsite'];
					} else {
						$data['config_sellerwebsite'] = $this->config->get('config_sellerwebsite');
					}

if (isset($this->request->post['config_sellerfacebook'])) {
						$data['config_sellerfacebook'] = $this->request->post['config_sellerfacebook'];
					} else {
						$data['config_sellerfacebook'] = $this->config->get('config_sellerfacebook');
					}

if (isset($this->request->post['config_sellertwitter'])) {
						$data['config_sellertwitter'] = $this->request->post['config_sellertwitter'];
					} else {
						$data['config_sellertwitter'] = $this->config->get('config_sellertwitter');
					}
if (isset($this->request->post['config_sellergoogleplus'])) {
						$data['config_sellergoogleplus'] = $this->request->post['config_sellergoogleplus'];
					} else {
						$data['config_sellergoogleplus'] = $this->config->get('config_sellergoogleplus');
					}
if (isset($this->request->post['config_sellerinstagram'])) {
						$data['config_sellerinstagram'] = $this->request->post['config_sellerinstagram'];
					} else {
						$data['config_sellerinstagram'] = $this->config->get('config_sellerinstagram');
					}

$data['text_sellerordersettlement'] = $this->language->get('text_sellerordersettlement');

if (isset($this->request->post['config_sellerordersettlement'])) {
						$data['config_sellerordersettlement'] = $this->request->post['config_sellerordersettlement'];
					} else {
						$data['config_sellerordersettlement'] = $this->config->get('config_sellerordersettlement');
					}

					$data['text_sellerorderstatus'] = $this->language->get('text_sellerorderstatus');

if (isset($this->request->post['config_sellerorderstatus'])) {
						$data['config_sellerorderstatus'] = $this->request->post['config_sellerorderstatus'];
					} else {
						$data['config_sellerorderstatus'] = $this->config->get('config_sellerorderstatus');
					}

					$data['text_sellerordernotifyhistory'] = $this->language->get('text_sellerordernotifyhistory');

					if (isset($this->request->post['config_sellerordernotifyhistory'])) {
											$data['config_sellerordernotifyhistory'] = $this->request->post['config_sellerordernotifyhistory'];
										} else {
											$data['config_sellerordernotifyhistory'] = $this->config->get('config_sellerordernotifyhistory');
										}
///////////////////////
if (isset($this->request->post['config_multiseller_out_of_stock_status'])) {
						$data['config_multiseller_out_of_stock_status'] = $this->request->post['config_multiseller_out_of_stock_status'];
					} else {
						$data['config_multiseller_out_of_stock_status'] = $this->config->get('config_multiseller_out_of_stock_status');
					}
if (isset($this->request->post['config_multiseller_date_available'])) {
						$data['config_multiseller_date_available'] = $this->request->post['config_multiseller_date_available'];
					} else {
						$data['config_multiseller_date_available'] = $this->config->get('config_multiseller_date_available');
					}
if (isset($this->request->post['config_multiseller_subtract_stok'])) {
						$data['config_multiseller_subtract_stok'] = $this->request->post['config_multiseller_subtract_stok'];
					} else {
						$data['config_multiseller_subtract_stok'] = $this->config->get('config_multiseller_subtract_stok');
					}
if (isset($this->request->post['config_multiseller_seo_url'])) {
						$data['config_multiseller_seo_url'] = $this->request->post['config_multiseller_seo_url'];
					} else {
						$data['config_multiseller_seo_url'] = $this->config->get('config_multiseller_seo_url');
					}
if (isset($this->request->post['config_multiseller_dimensions'])) {
						$data['config_multiseller_dimensions'] = $this->request->post['config_multiseller_dimensions'];
					} else {
						$data['config_multiseller_dimensions'] = $this->config->get('config_multiseller_dimensions');
					}
if (isset($this->request->post['config_multiseller_length_class'])) {
						$data['config_multiseller_length_class'] = $this->request->post['config_multiseller_length_class'];
					} else {
						$data['config_multiseller_length_class'] = $this->config->get('config_multiseller_length_class');
					}
if (isset($this->request->post['config_multiseller_weight'])) {
						$data['config_multiseller_weight'] = $this->request->post['config_multiseller_weight'];
					} else {
						$data['config_multiseller_weight'] = $this->config->get('config_multiseller_weight');
					}
if (isset($this->request->post['config_multiseller_weight_class'])) {
						$data['config_multiseller_weight_class'] = $this->request->post['config_multiseller_weight_class'];
					} else {
						$data['config_multiseller_weight_class'] = $this->config->get('config_multiseller_weight_class');
					}
if (isset($this->request->post['config_multiseller_status'])) {
						$data['config_multiseller_status'] = $this->request->post['config_multiseller_status'];
					} else {
						$data['config_multiseller_status'] = $this->config->get('config_multiseller_status');
					}
if (isset($this->request->post['config_multiseller_sort_order'])) {
						$data['config_multiseller_sort_order'] = $this->request->post['config_multiseller_sort_order'];
					} else {
						$data['config_multiseller_sort_order'] = $this->config->get('config_multiseller_sort_order');
					}
					if (isset($this->request->post['config_multiseller_sku'])) {
						$data['config_multiseller_sku'] = $this->request->post['config_multiseller_sku'];
					} else {
						$data['config_multiseller_sku'] = $this->config->get('config_multiseller_sku');
					}
					if (isset($this->request->post['config_multiseller_upc'])) {
						$data['config_multiseller_upc'] = $this->request->post['config_multiseller_upc'];
					} else {
						$data['config_multiseller_upc'] = $this->config->get('config_multiseller_upc');
					}
					if (isset($this->request->post['config_multiseller_ean'])) {
						$data['config_multiseller_ean'] = $this->request->post['config_multiseller_ean'];
					} else {
						$data['config_multiseller_ean'] = $this->config->get('config_multiseller_ean');
					}
					if (isset($this->request->post['config_multiseller_jan'])) {
						$data['config_multiseller_jan'] = $this->request->post['config_multiseller_jan'];
					} else {
						$data['config_multiseller_jan'] = $this->config->get('config_multiseller_jan');
					}
					if (isset($this->request->post['config_multiseller_isbn'])) {
						$data['config_multiseller_isbn'] = $this->request->post['config_multiseller_isbn'];
					} else {
						$data['config_multiseller_isbn'] = $this->config->get('config_multiseller_isbn');
					}
					if (isset($this->request->post['config_multiseller_out_of_stock_status'])) {
						$data['config_multiseller_out_of_stock_status'] = $this->request->post['config_multiseller_out_of_stock_status'];
					} else {
						$data['config_multiseller_out_of_stock_status'] = $this->config->get('config_multiseller_out_of_stock_status');
					}
					if (isset($this->request->post['config_multiseller_location'])) {
						$data['config_multiseller_location'] = $this->request->post['config_multiseller_location'];
					} else {
						$data['config_multiseller_location'] = $this->config->get('config_multiseller_location');
					}
					if (isset($this->request->post['config_multiseller_price'])) {
						$data['config_multiseller_price'] = $this->request->post['config_multiseller_price'];
					} else {
						$data['config_multiseller_price'] = $this->config->get('config_multiseller_price');
					}
					if (isset($this->request->post['config_multiseller_tax_class'])) {
						$data['config_multiseller_tax_class'] = $this->request->post['config_multiseller_tax_class'];
					} else {
						$data['config_multiseller_tax_class'] = $this->config->get('config_multiseller_tax_class');
					}
					if (isset($this->request->post['config_multiseller_quantity'])) {
						$data['config_multiseller_quantity'] = $this->request->post['config_multiseller_quantity'];
					} else {
						$data['config_multiseller_quantity'] = $this->config->get('config_multiseller_quantity');
					}
					if (isset($this->request->post['config_multiseller_minimum_quantity'])) {
						$data['config_multiseller_minimum_quantity'] = $this->request->post['config_multiseller_minimum_quantity'];
					} else {
						$data['config_multiseller_minimum_quantity'] = $this->config->get('config_multiseller_minimum_quantity');
					}
					if (isset($this->request->post['config_multiseller_mpn'])) {
						$data['config_multiseller_mpn'] = $this->request->post['config_multiseller_mpn'];
					} else {
						$data['config_multiseller_mpn'] = $this->config->get('config_multiseller_mpn');
					}

					if (isset($this->request->post['config_multiseller_tax_class'])) {
						$data['config_multiseller_tax_class'] = $this->request->post['config_multiseller_tax_class'];
					} else {
						$data['config_multiseller_tax_class'] = $this->config->get('config_multiseller_tax_class');
					}
					if (isset($this->request->post['config_multiseller_requires_shipping'])) {
						$data['config_multiseller_requires_shipping'] = $this->request->post['config_multiseller_requires_shipping'];
					} else {
						$data['config_multiseller_requires_shipping'] = $this->config->get('config_multiseller_requires_shipping');
					}
if (isset($this->request->post['config_multiseller_image'])) {
						$data['config_multiseller_image'] = $this->request->post['config_multiseller_image'];
					} else {
						$data['config_multiseller_image'] = $this->config->get('config_multiseller_image');
					}
		if (isset($this->request->post['config_multiseller_model'])) {
						$data['config_multiseller_model'] = $this->request->post['config_multiseller_model'];
					} else {
						$data['config_multiseller_model'] = $this->config->get('config_multiseller_model');
					}
if (isset($this->request->post['config_multiseller_related_products'])) {
						$data['config_multiseller_related_products'] = $this->request->post['config_multiseller_related_products'];
					} else {
						$data['config_multiseller_related_products'] = $this->config->get('config_multiseller_related_products');
					}
					if (isset($this->request->post['config_multiseller_downloads'])) {
						$data['config_multiseller_downloads'] = $this->request->post['config_multiseller_downloads'];
					} else {
						$data['config_multiseller_downloads'] = $this->config->get('config_multiseller_downloads');
					}
					if (isset($this->request->post['config_multiseller_stors'])) {
						$data['config_multiseller_stors'] = $this->request->post['config_multiseller_stors'];
					} else {
						$data['config_multiseller_stors'] = $this->config->get('config_multiseller_stors');
					}
					if (isset($this->request->post['config_multiseller_filters'])) {
						$data['config_multiseller_filters'] = $this->request->post['config_multiseller_filters'];
					} else {
						$data['config_multiseller_filters'] = $this->config->get('config_multiseller_filters');
					}
					if (isset($this->request->post['config_multiseller_categories'])) {
						$data['config_multiseller_categories'] = $this->request->post['config_multiseller_categories'];
					} else {
						$data['config_multiseller_categories'] = $this->config->get('config_multiseller_categories');
					}
					if (isset($this->request->post['config_multiseller_manufacturer'])) {
						$data['config_multiseller_manufacturer'] = $this->request->post['config_multiseller_manufacturer'];
					} else {
						$data['config_multiseller_manufacturer'] = $this->config->get('config_multiseller_manufacturer');
					}
								if (isset($this->request->post['config_multiseller_tab_data'])) {
						$data['config_multiseller_tab_data'] = $this->request->post['config_multiseller_tab_data'];
					} else {
						$data['config_multiseller_tab_data'] = $this->config->get('config_multiseller_tab_data');
					}
					if (isset($this->request->post['config_multiseller_tab_links'])) {
						$data['config_multiseller_tab_links'] = $this->request->post['config_multiseller_tab_links'];
					} else {
						$data['config_multiseller_tab_links'] = $this->config->get('config_multiseller_tab_links');
					}
					if (isset($this->request->post['config_multiseller_tab_attribute'])) {
						$data['config_multiseller_tab_attribute'] = $this->request->post['config_multiseller_tab_attribute'];
					} else {
						$data['config_multiseller_tab_attribute'] = $this->config->get('config_multiseller_tab_attribute');
					}
					if (isset($this->request->post['config_multiseller_tab_options'])) {
						$data['config_multiseller_tab_options'] = $this->request->post['config_multiseller_tab_options'];
					} else {
						$data['config_multiseller_tab_options'] = $this->config->get('config_multiseller_tab_options');
					}
					if (isset($this->request->post['config_multiseller_tab_recurring'])) {
						$data['config_multiseller_tab_recurring'] = $this->request->post['config_multiseller_tab_recurring'];
					} else {
						$data['config_multiseller_tab_recurring'] = $this->config->get('config_multiseller_tab_recurring');
					}
					if (isset($this->request->post['config_multiseller_tab_discount'])) {
						$data['config_multiseller_tab_discount'] = $this->request->post['config_multiseller_tab_discount'];
					} else {
						$data['config_multiseller_tab_discount'] = $this->config->get('config_multiseller_tab_discount');
					}
					if (isset($this->request->post['config_multiseller_tab_special'])) {
						$data['config_multiseller_tab_special'] = $this->request->post['config_multiseller_tab_special'];
					} else {
						$data['config_multiseller_tab_special'] = $this->config->get('config_multiseller_tab_special');
					}
					if (isset($this->request->post['config_multiseller_tab_image'])) {
						$data['config_multiseller_tab_image'] = $this->request->post['config_multiseller_tab_image'];
					} else {
						$data['config_multiseller_tab_image'] = $this->config->get('config_multiseller_tab_image');
					}
					if (isset($this->request->post['config_multiseller_tab_reward_points'])) {
						$data['config_multiseller_tab_reward_points'] = $this->request->post['config_multiseller_tab_reward_points'];
					} else {
						$data['config_multiseller_tab_reward_points'] = $this->config->get('config_multiseller_tab_reward_points');
					}
					if (isset($this->request->post['config_multiseller_tab_design'])) {
						$data['config_multiseller_tab_design'] = $this->request->post['config_multiseller_tab_design'];
					} else {
						$data['config_multiseller_tab_design'] = $this->config->get('config_multiseller_tab_design');
					}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['owner'])) {
			$data['error_owner'] = $this->error['owner'];
		} else {
			$data['error_owner'] = '';
		}

		if (isset($this->error['address'])) {
			$data['error_address'] = $this->error['address'];
		} else {
			$data['error_address'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = '';
		}

		if (isset($this->error['country'])) {
			$data['error_country'] = $this->error['country'];
		} else {
			$data['error_country'] = '';
		}

		if (isset($this->error['zone'])) {
			$data['error_zone'] = $this->error['zone'];
		} else {
			$data['error_zone'] = '';
		}

		if (isset($this->error['customer_group_display'])) {
			$data['error_customer_group_display'] = $this->error['customer_group_display'];
		} else {
			$data['error_customer_group_display'] = '';
		}

		if (isset($this->error['login_attempts'])) {
			$data['error_login_attempts'] = $this->error['login_attempts'];
		} else {
			$data['error_login_attempts'] = '';
		}

		if (isset($this->error['voucher_min'])) {
			$data['error_voucher_min'] = $this->error['voucher_min'];
		} else {
			$data['error_voucher_min'] = '';
		}

		if (isset($this->error['voucher_max'])) {
			$data['error_voucher_max'] = $this->error['voucher_max'];
		} else {
			$data['error_voucher_max'] = '';
		}

		if (isset($this->error['processing_status'])) {
			$data['error_processing_status'] = $this->error['processing_status'];
		} else {
			$data['error_processing_status'] = '';
		}

		if (isset($this->error['complete_status'])) {
			$data['error_complete_status'] = $this->error['complete_status'];
		} else {
			$data['error_complete_status'] = '';
		}

		if (isset($this->error['ftp_hostname'])) {
			$data['error_ftp_hostname'] = $this->error['ftp_hostname'];
		} else {
			$data['error_ftp_hostname'] = '';
		}

		if (isset($this->error['ftp_port'])) {
			$data['error_ftp_port'] = $this->error['ftp_port'];
		} else {
			$data['error_ftp_port'] = '';
		}

		if (isset($this->error['ftp_username'])) {
			$data['error_ftp_username'] = $this->error['ftp_username'];
		} else {
			$data['error_ftp_username'] = '';
		}

		if (isset($this->error['ftp_password'])) {
			$data['error_ftp_password'] = $this->error['ftp_password'];
		} else {
			$data['error_ftp_password'] = '';
		}

		if (isset($this->error['error_filename'])) {
			$data['error_error_filename'] = $this->error['error_filename'];
		} else {
			$data['error_error_filename'] = '';
		}

		if (isset($this->error['limit_admin'])) {
			$data['error_limit_admin'] = $this->error['limit_admin'];
		} else {
			$data['error_limit_admin'] = '';
		}

		if (isset($this->error['encryption'])) {
			$data['error_encryption'] = $this->error['encryption'];
		} else {
			$data['error_encryption'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_stores'),
			'href' => $this->url->link('setting/store', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('setting/setting', 'token=' . $this->session->data['token'], true)
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['action'] = $this->url->link('setting/setting', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('setting/store', 'token=' . $this->session->data['token'], true);

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['config_meta_title'])) {
			$data['config_meta_title'] = $this->request->post['config_meta_title'];
		} else {
			$data['config_meta_title'] = $this->config->get('config_meta_title');
		}

		if (isset($this->request->post['config_meta_description'])) {
			$data['config_meta_description'] = $this->request->post['config_meta_description'];
		} else {
			$data['config_meta_description'] = $this->config->get('config_meta_description');
		}

		if (isset($this->request->post['config_meta_keyword'])) {
			$data['config_meta_keyword'] = $this->request->post['config_meta_keyword'];
		} else {
			$data['config_meta_keyword'] = $this->config->get('config_meta_keyword');
		}

		if (isset($this->request->post['config_theme'])) {
			$data['config_theme'] = $this->request->post['config_theme'];
		} else {
			$data['config_theme'] = $this->config->get('config_theme');
		}

		if ($this->request->server['HTTPS']) {
			$data['store_url'] = HTTPS_CATALOG;
		} else {
			$data['store_url'] = HTTP_CATALOG;
		}

		$data['themes'] = array();

		$this->load->model('extension/extension');

		$extensions = $this->model_extension_extension->getInstalled('theme');

		foreach ($extensions as $code) {
			$this->load->language('extension/theme/' . $code);
			
			$data['themes'][] = array(
				'text'  => $this->language->get('heading_title'),
				'value' => $code
			);
		}
			
		if (isset($this->request->post['config_layout_id'])) {
			$data['config_layout_id'] = $this->request->post['config_layout_id'];
		} else {
			$data['config_layout_id'] = $this->config->get('config_layout_id');
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		if (isset($this->request->post['config_name'])) {
			$data['config_name'] = $this->request->post['config_name'];
		} else {
			$data['config_name'] = $this->config->get('config_name');
		}

		if (isset($this->request->post['config_owner'])) {
			$data['config_owner'] = $this->request->post['config_owner'];
		} else {
			$data['config_owner'] = $this->config->get('config_owner');
		}

		if (isset($this->request->post['config_address'])) {
			$data['config_address'] = $this->request->post['config_address'];
		} else {
			$data['config_address'] = $this->config->get('config_address');
		}

		if (isset($this->request->post['config_geocode'])) {
			$data['config_geocode'] = $this->request->post['config_geocode'];
		} else {
			$data['config_geocode'] = $this->config->get('config_geocode');
		}

		if (isset($this->request->post['config_email'])) {
			$data['config_email'] = $this->request->post['config_email'];
		} else {
			$data['config_email'] = $this->config->get('config_email');
		}

		if (isset($this->request->post['config_telephone'])) {
			$data['config_telephone'] = $this->request->post['config_telephone'];
		} else {
			$data['config_telephone'] = $this->config->get('config_telephone');
		}

		if (isset($this->request->post['config_fax'])) {
			$data['config_fax'] = $this->request->post['config_fax'];
		} else {
			$data['config_fax'] = $this->config->get('config_fax');
		}

		if (isset($this->request->post['config_image'])) {
			$data['config_image'] = $this->request->post['config_image'];
		} else {
			$data['config_image'] = $this->config->get('config_image');
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['config_image']) && is_file(DIR_IMAGE . $this->request->post['config_image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['config_image'], 100, 100);
		} elseif ($this->config->get('config_image') && is_file(DIR_IMAGE . $this->config->get('config_image'))) {
			$data['thumb'] = $this->model_tool_image->resize($this->config->get('config_image'), 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['config_open'])) {
			$data['config_open'] = $this->request->post['config_open'];
		} else {
			$data['config_open'] = $this->config->get('config_open');
		}

		if (isset($this->request->post['config_comment'])) {
			$data['config_comment'] = $this->request->post['config_comment'];
		} else {
			$data['config_comment'] = $this->config->get('config_comment');
		}

		$this->load->model('localisation/location');

		$data['locations'] = $this->model_localisation_location->getLocations();

		if (isset($this->request->post['config_location'])) {
			$data['config_location'] = $this->request->post['config_location'];
		} elseif ($this->config->get('config_location')) {
			$data['config_location'] = $this->config->get('config_location');
		} else {
			$data['config_location'] = array();
		}

		if (isset($this->request->post['config_country_id'])) {
			$data['config_country_id'] = $this->request->post['config_country_id'];
		} else {
			$data['config_country_id'] = $this->config->get('config_country_id');
		}

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();

		if (isset($this->request->post['config_zone_id'])) {
			$data['config_zone_id'] = $this->request->post['config_zone_id'];
		} else {
			$data['config_zone_id'] = $this->config->get('config_zone_id');
		}

		if (isset($this->request->post['config_language'])) {
			$data['config_language'] = $this->request->post['config_language'];
		} else {
			$data['config_language'] = $this->config->get('config_language');
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['config_admin_language'])) {
			$data['config_admin_language'] = $this->request->post['config_admin_language'];
		} else {
			$data['config_admin_language'] = $this->config->get('config_admin_language');
		}

		if (isset($this->request->post['config_currency'])) {
			$data['config_currency'] = $this->request->post['config_currency'];
		} else {
			$data['config_currency'] = $this->config->get('config_currency');
		}

		if (isset($this->request->post['config_currency_auto'])) {
			$data['config_currency_auto'] = $this->request->post['config_currency_auto'];
		} else {
			$data['config_currency_auto'] = $this->config->get('config_currency_auto');
		}

		$this->load->model('localisation/currency');

		$data['currencies'] = $this->model_localisation_currency->getCurrencies();

		if (isset($this->request->post['config_length_class_id'])) {
			$data['config_length_class_id'] = $this->request->post['config_length_class_id'];
		} else {
			$data['config_length_class_id'] = $this->config->get('config_length_class_id');
		}

		$this->load->model('localisation/length_class');

		$data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();

		if (isset($this->request->post['config_weight_class_id'])) {
			$data['config_weight_class_id'] = $this->request->post['config_weight_class_id'];
		} else {
			$data['config_weight_class_id'] = $this->config->get('config_weight_class_id');
		}

		$this->load->model('localisation/weight_class');

		$data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();

		if (isset($this->request->post['config_limit_admin'])) {
			$data['config_limit_admin'] = $this->request->post['config_limit_admin'];
		} else {
			$data['config_limit_admin'] = $this->config->get('config_limit_admin');
		}

		if (isset($this->request->post['config_product_count'])) {
			$data['config_product_count'] = $this->request->post['config_product_count'];
		} else {
			$data['config_product_count'] = $this->config->get('config_product_count');
		}

		if (isset($this->request->post['config_review_status'])) {
			$data['config_review_status'] = $this->request->post['config_review_status'];
		} else {
			$data['config_review_status'] = $this->config->get('config_review_status');
		}

		if (isset($this->request->post['config_review_guest'])) {
			$data['config_review_guest'] = $this->request->post['config_review_guest'];
		} else {
			$data['config_review_guest'] = $this->config->get('config_review_guest');
		}

		if (isset($this->request->post['config_voucher_min'])) {
			$data['config_voucher_min'] = $this->request->post['config_voucher_min'];
		} else {
			$data['config_voucher_min'] = $this->config->get('config_voucher_min');
		}

		if (isset($this->request->post['config_voucher_max'])) {
			$data['config_voucher_max'] = $this->request->post['config_voucher_max'];
		} else {
			$data['config_voucher_max'] = $this->config->get('config_voucher_max');
		}

		if (isset($this->request->post['config_tax'])) {
			$data['config_tax'] = $this->request->post['config_tax'];
		} else {
			$data['config_tax'] = $this->config->get('config_tax');
		}

		if (isset($this->request->post['config_tax_default'])) {
			$data['config_tax_default'] = $this->request->post['config_tax_default'];
		} else {
			$data['config_tax_default'] = $this->config->get('config_tax_default');
		}

		if (isset($this->request->post['config_tax_customer'])) {
			$data['config_tax_customer'] = $this->request->post['config_tax_customer'];
		} else {
			$data['config_tax_customer'] = $this->config->get('config_tax_customer');
		}

		if (isset($this->request->post['config_customer_online'])) {
			$data['config_customer_online'] = $this->request->post['config_customer_online'];
		} else {
			$data['config_customer_online'] = $this->config->get('config_customer_online');
		}

		if (isset($this->request->post['config_customer_activity'])) {
			$data['config_customer_activity'] = $this->request->post['config_customer_activity'];
		} else {
			$data['config_customer_activity'] = $this->config->get('config_customer_activity');
		}

		if (isset($this->request->post['config_customer_search'])) {
			$data['config_customer_search'] = $this->request->post['config_customer_search'];
		} else {
			$data['config_customer_search'] = $this->config->get('config_customer_search');
		}

		if (isset($this->request->post['config_customer_group_id'])) {
			$data['config_customer_group_id'] = $this->request->post['config_customer_group_id'];
		} else {
			$data['config_customer_group_id'] = $this->config->get('config_customer_group_id');
		}

		$this->load->model('customer/customer_group');

		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();

		if (isset($this->request->post['config_customer_group_display'])) {
			$data['config_customer_group_display'] = $this->request->post['config_customer_group_display'];
		} elseif ($this->config->get('config_customer_group_display')) {
			$data['config_customer_group_display'] = $this->config->get('config_customer_group_display');
		} else {
			$data['config_customer_group_display'] = array();
		}

		if (isset($this->request->post['config_customer_price'])) {
			$data['config_customer_price'] = $this->request->post['config_customer_price'];
		} else {
			$data['config_customer_price'] = $this->config->get('config_customer_price');
		}

		if (isset($this->request->post['config_login_attempts'])) {
			$data['config_login_attempts'] = $this->request->post['config_login_attempts'];
		} elseif ($this->config->has('config_login_attempts')) {
			$data['config_login_attempts'] = $this->config->get('config_login_attempts');
		} else {
			$data['config_login_attempts'] = 5;
		}

		if (isset($this->request->post['config_account_id'])) {
			$data['config_account_id'] = $this->request->post['config_account_id'];
		} else {
			$data['config_account_id'] = $this->config->get('config_account_id');
		}

		$this->load->model('catalog/information');

		$data['informations'] = $this->model_catalog_information->getInformations();

		if (isset($this->request->post['config_cart_weight'])) {
			$data['config_cart_weight'] = $this->request->post['config_cart_weight'];
		} else {
			$data['config_cart_weight'] = $this->config->get('config_cart_weight');
		}

		if (isset($this->request->post['config_checkout_guest'])) {
			$data['config_checkout_guest'] = $this->request->post['config_checkout_guest'];
		} else {
			$data['config_checkout_guest'] = $this->config->get('config_checkout_guest');
		}

		if (isset($this->request->post['config_checkout_id'])) {
			$data['config_checkout_id'] = $this->request->post['config_checkout_id'];
		} else {
			$data['config_checkout_id'] = $this->config->get('config_checkout_id');
		}

		if (isset($this->request->post['config_invoice_prefix'])) {
			$data['config_invoice_prefix'] = $this->request->post['config_invoice_prefix'];
		} elseif ($this->config->get('config_invoice_prefix')) {
			$data['config_invoice_prefix'] = $this->config->get('config_invoice_prefix');
		} else {
			$data['config_invoice_prefix'] = 'INV-' . date('Y') . '-00';
		}

		if (isset($this->request->post['config_order_status_id'])) {
			$data['config_order_status_id'] = $this->request->post['config_order_status_id'];
		} else {
			$data['config_order_status_id'] = $this->config->get('config_order_status_id');
		}

		if (isset($this->request->post['config_processing_status'])) {
			$data['config_processing_status'] = $this->request->post['config_processing_status'];
		} elseif ($this->config->get('config_processing_status')) {
			$data['config_processing_status'] = $this->config->get('config_processing_status');
		} else {
			$data['config_processing_status'] = array();
		}

		if (isset($this->request->post['config_complete_status'])) {
			$data['config_complete_status'] = $this->request->post['config_complete_status'];
		} elseif ($this->config->get('config_complete_status')) {
			$data['config_complete_status'] = $this->config->get('config_complete_status');
		} else {
			$data['config_complete_status'] = array();
		}

		if (isset($this->request->post['config_fraud_status_id'])) {
			$data['config_fraud_status_id'] = $this->request->post['config_fraud_status_id'];
		} else {
			$data['config_fraud_status_id'] = $this->config->get('config_fraud_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['config_api_id'])) {
			$data['config_api_id'] = $this->request->post['config_api_id'];
		} else {
			$data['config_api_id'] = $this->config->get('config_api_id');
		}

		$this->load->model('user/api');

		$data['apis'] = $this->model_user_api->getApis();

		if (isset($this->request->post['config_stock_display'])) {
			$data['config_stock_display'] = $this->request->post['config_stock_display'];
		} else {
			$data['config_stock_display'] = $this->config->get('config_stock_display');
		}

		if (isset($this->request->post['config_stock_warning'])) {
			$data['config_stock_warning'] = $this->request->post['config_stock_warning'];
		} else {
			$data['config_stock_warning'] = $this->config->get('config_stock_warning');
		}

		if (isset($this->request->post['config_stock_checkout'])) {
			$data['config_stock_checkout'] = $this->request->post['config_stock_checkout'];
		} else {
			$data['config_stock_checkout'] = $this->config->get('config_stock_checkout');
		}

		if (isset($this->request->post['config_affiliate_auto'])) {
			$data['config_affiliate_approval'] = $this->request->post['config_affiliate_approval'];
		} elseif ($this->config->has('config_affiliate_commission')) {
			$data['config_affiliate_approval'] = $this->config->get('config_affiliate_approval');
		} else {
			$data['config_affiliate_approval'] = '';
		}

		if (isset($this->request->post['config_affiliate_auto'])) {
			$data['config_affiliate_auto'] = $this->request->post['config_affiliate_auto'];
		} elseif ($this->config->has('config_affiliate_auto')) {
			$data['config_affiliate_auto'] = $this->config->get('config_affiliate_auto');
		} else {
			$data['config_affiliate_auto'] = '';
		}

		if (isset($this->request->post['config_affiliate_commission'])) {
			$data['config_affiliate_commission'] = $this->request->post['config_affiliate_commission'];
		} elseif ($this->config->has('config_affiliate_commission')) {
			$data['config_affiliate_commission'] = $this->config->get('config_affiliate_commission');
		} else {
			$data['config_affiliate_commission'] = '5.00';
		}

		if (isset($this->request->post['config_affiliate_id'])) {
			$data['config_affiliate_id'] = $this->request->post['config_affiliate_id'];
		} else {
			$data['config_affiliate_id'] = $this->config->get('config_affiliate_id');
		}

		if (isset($this->request->post['config_return_id'])) {
			$data['config_return_id'] = $this->request->post['config_return_id'];
		} else {
			$data['config_return_id'] = $this->config->get('config_return_id');
		}

		if (isset($this->request->post['config_return_status_id'])) {
			$data['config_return_status_id'] = $this->request->post['config_return_status_id'];
		} else {
			$data['config_return_status_id'] = $this->config->get('config_return_status_id');
		}

		$this->load->model('localisation/return_status');

		$data['return_statuses'] = $this->model_localisation_return_status->getReturnStatuses();

		if (isset($this->request->post['config_captcha'])) {
			$data['config_captcha'] = $this->request->post['config_captcha'];
		} else {
			$data['config_captcha'] = $this->config->get('config_captcha');
		}

		$this->load->model('extension/extension');

		$data['captchas'] = array();

		// Get a list of installed captchas
		$extensions = $this->model_extension_extension->getInstalled('captcha');

		foreach ($extensions as $code) {
			$this->load->language('extension/captcha/' . $code);

			if ($this->config->get($code . '_status')) {
				$data['captchas'][] = array(
					'text'  => $this->language->get('heading_title'),
					'value' => $code
				);
			}
		}

		if (isset($this->request->post['config_captcha_page'])) {
			$data['config_captcha_page'] = $this->request->post['config_captcha_page'];
		} elseif ($this->config->has('config_captcha_page')) {
		   	$data['config_captcha_page'] = $this->config->get('config_captcha_page');
		} else {
			$data['config_captcha_page'] = array();
		}

		$data['captcha_pages'] = array();

		$data['captcha_pages'][] = array(
			'text'  => $this->language->get('text_register'),
			'value' => 'register'
		);
		
		$data['captcha_pages'][] = array(
			'text'  => $this->language->get('text_guest'),
			'value' => 'guest'
		);
		
		$data['captcha_pages'][] = array(
			'text'  => $this->language->get('text_review'),
			'value' => 'review'
		);

		$data['captcha_pages'][] = array(
			'text'  => $this->language->get('text_return'),
			'value' => 'return'
		);

		$data['captcha_pages'][] = array(
			'text'  => $this->language->get('text_contact'),
			'value' => 'contact'
		);

		if (isset($this->request->post['config_logo'])) {
			$data['config_logo'] = $this->request->post['config_logo'];
		} else {
			$data['config_logo'] = $this->config->get('config_logo');
		}

		if (isset($this->request->post['config_logo']) && is_file(DIR_IMAGE . $this->request->post['config_logo'])) {
			$data['logo'] = $this->model_tool_image->resize($this->request->post['config_logo'], 100, 100);
		} elseif ($this->config->get('config_logo') && is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $this->model_tool_image->resize($this->config->get('config_logo'), 100, 100);
		} else {
			$data['logo'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['config_icon'])) {
			$data['config_icon'] = $this->request->post['config_icon'];
		} else {
			$data['config_icon'] = $this->config->get('config_icon');
		}

		if (isset($this->request->post['config_icon']) && is_file(DIR_IMAGE . $this->request->post['config_icon'])) {
			$data['icon'] = $this->model_tool_image->resize($this->request->post['config_icon'], 100, 100);
		} elseif ($this->config->get('config_icon') && is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $this->model_tool_image->resize($this->config->get('config_icon'), 100, 100);
		} else {
			$data['icon'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['config_ftp_hostname'])) {
			$data['config_ftp_hostname'] = $this->request->post['config_ftp_hostname'];
		} elseif ($this->config->get('config_ftp_hostname')) {
			$data['config_ftp_hostname'] = $this->config->get('config_ftp_hostname');
		} else {
			$data['config_ftp_hostname'] = str_replace('www.', '', $this->request->server['HTTP_HOST']);
		}

		if (isset($this->request->post['config_ftp_port'])) {
			$data['config_ftp_port'] = $this->request->post['config_ftp_port'];
		} elseif ($this->config->get('config_ftp_port')) {
			$data['config_ftp_port'] = $this->config->get('config_ftp_port');
		} else {
			$data['config_ftp_port'] = 21;
		}

		if (isset($this->request->post['config_ftp_username'])) {
			$data['config_ftp_username'] = $this->request->post['config_ftp_username'];
		} else {
			$data['config_ftp_username'] = $this->config->get('config_ftp_username');
		}

		if (isset($this->request->post['config_ftp_password'])) {
			$data['config_ftp_password'] = $this->request->post['config_ftp_password'];
		} else {
			$data['config_ftp_password'] = $this->config->get('config_ftp_password');
		}

		if (isset($this->request->post['config_ftp_root'])) {
			$data['config_ftp_root'] = $this->request->post['config_ftp_root'];
		} else {
			$data['config_ftp_root'] = $this->config->get('config_ftp_root');
		}

		if (isset($this->request->post['config_ftp_status'])) {
			$data['config_ftp_status'] = $this->request->post['config_ftp_status'];
		} else {
			$data['config_ftp_status'] = $this->config->get('config_ftp_status');
		}

		if (isset($this->request->post['config_mail_protocol'])) {
			$data['config_mail_protocol'] = $this->request->post['config_mail_protocol'];
		} else {
			$data['config_mail_protocol'] = $this->config->get('config_mail_protocol');
		}

		if (isset($this->request->post['config_mail_parameter'])) {
			$data['config_mail_parameter'] = $this->request->post['config_mail_parameter'];
		} else {
			$data['config_mail_parameter'] = $this->config->get('config_mail_parameter');
		}

		if (isset($this->request->post['config_mail_smtp_hostname'])) {
			$data['config_mail_smtp_hostname'] = $this->request->post['config_mail_smtp_hostname'];
		} else {
			$data['config_mail_smtp_hostname'] = $this->config->get('config_mail_smtp_hostname');
		}

		if (isset($this->request->post['config_mail_smtp_username'])) {
			$data['config_mail_smtp_username'] = $this->request->post['config_mail_smtp_username'];
		} else {
			$data['config_mail_smtp_username'] = $this->config->get('config_mail_smtp_username');
		}

		if (isset($this->request->post['config_mail_smtp_password'])) {
			$data['config_mail_smtp_password'] = $this->request->post['config_mail_smtp_password'];
		} else {
			$data['config_mail_smtp_password'] = $this->config->get('config_mail_smtp_password');
		}

		if (isset($this->request->post['config_mail_smtp_port'])) {
			$data['config_mail_smtp_port'] = $this->request->post['config_mail_smtp_port'];
		} elseif ($this->config->has('config_mail_smtp_port')) {
			$data['config_mail_smtp_port'] = $this->config->get('config_mail_smtp_port');
		} else {
			$data['config_mail_smtp_port'] = 25;
		}

		if (isset($this->request->post['config_mail_smtp_timeout'])) {
			$data['config_mail_smtp_timeout'] = $this->request->post['config_mail_smtp_timeout'];
		} elseif ($this->config->has('config_mail_smtp_timeout')) {
			$data['config_mail_smtp_timeout'] = $this->config->get('config_mail_smtp_timeout');
		} else {
			$data['config_mail_smtp_timeout'] = 5;
		}

		if (isset($this->request->post['config_mail_alert'])) {
			$data['config_mail_alert'] = $this->request->post['config_mail_alert'];
		} elseif ($this->config->has('config_mail_alert')) {
		   	$data['config_mail_alert'] = $this->config->get('config_mail_alert');
		} else {
			$data['config_mail_alert'] = array();
		}

		$data['mail_alerts'] = array();

		$data['mail_alerts'][] = array(
			'text'  => $this->language->get('text_mail_account'),
			'value' => 'account'
		);

		$data['mail_alerts'][] = array(
			'text'  => $this->language->get('text_mail_affiliate'),
			'value' => 'affiliate'
		);

		$data['mail_alerts'][] = array(
			'text'  => $this->language->get('text_mail_order'),
			'value' => 'order'
		);

		$data['mail_alerts'][] = array(
			'text'  => $this->language->get('text_mail_review'),
			'value' => 'review'
		);

		if (isset($this->request->post['config_alert_email'])) {
			$data['config_alert_email'] = $this->request->post['config_alert_email'];
		} else {
			$data['config_alert_email'] = $this->config->get('config_alert_email');
		}

		if (isset($this->request->post['config_secure'])) {
			$data['config_secure'] = $this->request->post['config_secure'];
		} else {
			$data['config_secure'] = $this->config->get('config_secure');
		}

		if (isset($this->request->post['config_shared'])) {
			$data['config_shared'] = $this->request->post['config_shared'];
		} else {
			$data['config_shared'] = $this->config->get('config_shared');
		}

		if (isset($this->request->post['config_robots'])) {
			$data['config_robots'] = $this->request->post['config_robots'];
		} else {
			$data['config_robots'] = $this->config->get('config_robots');
		}

		if (isset($this->request->post['config_seo_url'])) {
			$data['config_seo_url'] = $this->request->post['config_seo_url'];
		} else {
			$data['config_seo_url'] = $this->config->get('config_seo_url');
		}

		if (isset($this->request->post['config_file_max_size'])) {
			$data['config_file_max_size'] = $this->request->post['config_file_max_size'];
		} elseif ($this->config->get('config_file_max_size')) {
			$data['config_file_max_size'] = $this->config->get('config_file_max_size');
		} else {
			$data['config_file_max_size'] = 300000;
		}

		if (isset($this->request->post['config_file_ext_allowed'])) {
			$data['config_file_ext_allowed'] = $this->request->post['config_file_ext_allowed'];
		} else {
			$data['config_file_ext_allowed'] = $this->config->get('config_file_ext_allowed');
		}

		if (isset($this->request->post['config_file_mime_allowed'])) {
			$data['config_file_mime_allowed'] = $this->request->post['config_file_mime_allowed'];
		} else {
			$data['config_file_mime_allowed'] = $this->config->get('config_file_mime_allowed');
		}

		if (isset($this->request->post['config_maintenance'])) {
			$data['config_maintenance'] = $this->request->post['config_maintenance'];
		} else {
			$data['config_maintenance'] = $this->config->get('config_maintenance');
		}

		if (isset($this->request->post['config_password'])) {
			$data['config_password'] = $this->request->post['config_password'];
		} else {
			$data['config_password'] = $this->config->get('config_password');
		}

		if (isset($this->request->post['config_encryption'])) {
			$data['config_encryption'] = $this->request->post['config_encryption'];
		} else {
			$data['config_encryption'] = $this->config->get('config_encryption');
		}

		if (isset($this->request->post['config_compression'])) {
			$data['config_compression'] = $this->request->post['config_compression'];
		} else {
			$data['config_compression'] = $this->config->get('config_compression');
		}

		if (isset($this->request->post['config_error_display'])) {
			$data['config_error_display'] = $this->request->post['config_error_display'];
		} else {
			$data['config_error_display'] = $this->config->get('config_error_display');
		}

		if (isset($this->request->post['config_error_log'])) {
			$data['config_error_log'] = $this->request->post['config_error_log'];
		} else {
			$data['config_error_log'] = $this->config->get('config_error_log');
		}

		if (isset($this->request->post['config_error_filename'])) {
			$data['config_error_filename'] = $this->request->post['config_error_filename'];
		} else {
			$data['config_error_filename'] = $this->config->get('config_error_filename');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('setting/setting', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'setting/setting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['config_meta_title']) {
			$this->error['meta_title'] = $this->language->get('error_meta_title');
		}

		if (!$this->request->post['config_name']) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if ((utf8_strlen($this->request->post['config_owner']) < 3) || (utf8_strlen($this->request->post['config_owner']) > 64)) {
			$this->error['owner'] = $this->language->get('error_owner');
		}

		if ((utf8_strlen($this->request->post['config_address']) < 3) || (utf8_strlen($this->request->post['config_address']) > 256)) {
			$this->error['address'] = $this->language->get('error_address');
		}

		if ((utf8_strlen($this->request->post['config_email']) > 96) || !filter_var($this->request->post['config_email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ((utf8_strlen($this->request->post['config_telephone']) < 3) || (utf8_strlen($this->request->post['config_telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}

		if (!empty($this->request->post['config_customer_group_display']) && !in_array($this->request->post['config_customer_group_id'], $this->request->post['config_customer_group_display'])) {
			$this->error['customer_group_display'] = $this->language->get('error_customer_group_display');
		}

		if (!$this->request->post['config_limit_admin']) {
			$this->error['limit_admin'] = $this->language->get('error_limit');
		}

		if ($this->request->post['config_login_attempts'] < 1) {
			$this->error['login_attempts'] = $this->language->get('error_login_attempts');
		}

		if (!$this->request->post['config_voucher_min']) {
			$this->error['voucher_min'] = $this->language->get('error_voucher_min');
		}

		if (!$this->request->post['config_voucher_max']) {
			$this->error['voucher_max'] = $this->language->get('error_voucher_max');
		}

		if (!isset($this->request->post['config_processing_status'])) {
			$this->error['processing_status'] = $this->language->get('error_processing_status');
		}

		if (!isset($this->request->post['config_complete_status'])) {
			$this->error['complete_status'] = $this->language->get('error_complete_status');
		}

		if ($this->request->post['config_ftp_status']) {
			if (!$this->request->post['config_ftp_hostname']) {
				$this->error['ftp_hostname'] = $this->language->get('error_ftp_hostname');
			}

			if (!$this->request->post['config_ftp_port']) {
				$this->error['ftp_port'] = $this->language->get('error_ftp_port');
			}

			if (!$this->request->post['config_ftp_username']) {
				$this->error['ftp_username'] = $this->language->get('error_ftp_username');
			}

			if (!$this->request->post['config_ftp_password']) {
				$this->error['ftp_password'] = $this->language->get('error_ftp_password');
			}
		}

		if (!$this->request->post['config_error_filename']) {
			$this->error['error_filename'] = $this->language->get('error_error_filename');
		} else {
			if (preg_match('/\.\.[\/\\\]?/', $this->request->post['config_error_filename'])) {
				$this->error['error_filename'] = $this->language->get('error_malformed_filename');
			}
		}

		if ((utf8_strlen($this->request->post['config_encryption']) < 32) || (utf8_strlen($this->request->post['config_encryption']) > 1024)) {
			$this->error['encryption'] = $this->language->get('error_encryption');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}
	
	public function theme() {
		if ($this->request->server['HTTPS']) {
			$server = HTTPS_CATALOG;
		} else {
			$server = HTTP_CATALOG;
		}
		
		// This is only here for compatibility with old themes.
		if ($this->request->get['theme'] == 'theme_default') {
			$theme = $this->config->get('theme_default_directory');
		} else {
			$theme = basename($this->request->get['theme']);
		}
		
		if (is_file(DIR_CATALOG . 'view/theme/' . $theme . '/image/' . $theme . '.png')) {
			$this->response->setOutput($server . 'catalog/view/theme/' . $theme . '/image/' . $theme . '.png');
		} else {
			$this->response->setOutput($server . 'image/no_image.png');
		}
	}	
}
