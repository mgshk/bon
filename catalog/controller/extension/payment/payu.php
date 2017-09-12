<?php
class ControllerExtensionPaymentPayu extends Controller {

	public function index() {	
    	$data['button_confirm'] = $this->language->get('button_confirm');
		$this->load->model('checkout/order');
		$this->language->load('extension/payment/payu');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		$data['merchant'] = $this->config->get('payu_merchant');
		
		 /////////////////////////////////////Start Payu Vital  Information /////////////////////////////////
		
		if($this->config->get('payu_test')=='demo')
			$data['action'] = 'https://test.payu.in/_payment';
		else
		    $data['action'] = 'https://secure.payu.in/_payment.php';
		
		//$txnid      = 	$this->session->data['order_id'];
		$txnid 		= 	substr(hash('sha256', mt_rand() . microtime()), 0, 20);

		             
		$data['key'] = $this->config->get('payu_merchant');
		$data['salt'] = $this->config->get('payu_salt');
		$data['txnid'] = $txnid;
		$data['amount'] = (int)$order_info['total'];
		$data['productinfo'] = 'opencart products information';
		$data['firstname'] = $order_info['payment_firstname'];
		$data['Lastname'] = $order_info['payment_lastname'];
		$data['Zipcode'] = $order_info['payment_postcode'];
		$data['email'] = $order_info['email'];
		$data['phone'] = $order_info['telephone'];
		$data['address1'] = $order_info['payment_address_1'];
        $data['address2'] = $order_info['payment_address_2'];
        $data['state'] = $order_info['payment_zone'];
        $data['city']=$order_info['payment_city'];
        $data['country']=$order_info['payment_country'];
		$data['Pg'] = 'CC';
		$data['surl'] = $this->url->link('extension/payment/payu/callback');//HTTP_SERVER.'/index.php?route=extension/payment/payu/callback';
		$data['Furl'] = $this->url->link('extension/payment/payu/callback');//HTTP_SERVER.'/index.php?route=extension/payment/payu/callback';
	  //$this->data['surl'] = $this->url->link('checkout/success');//HTTP_SERVER.'/index.php?route=extension/payment/payu/callback';
      //$this->data['furl'] = $this->url->link('checkout/cart');//HTTP_SERVER.'/index.php?route=extension/payment/payu/callback';
		$data['curl'] = $this->url->link('extension/payment/payu/callback');
		$key          =  $this->config->get('payu_merchant');
		$amount       = (int)$order_info['total'];
		$productInfo  = $data['productinfo'];
	    $firstname    = $order_info['payment_firstname'];
		$email        = $order_info['email'];
		$salt         = $this->config->get('payu_salt');
		$Hash=hash('sha512', $key.'|'.$txnid.'|'.$amount.'|'.$productInfo.'|'.$firstname.'|'.$email.'|||||||||||'.$salt); 
		$data['user_credentials'] = $this->data['key'].':'.$this->data['email'];
		$data['Hash'] = strtolower($Hash);
		$service_provider = 'payu_paisa';
		$data['service_provider'] = $service_provider;
					/////////////////////////////////////End Payu Vital  Information /////////////////////////////////
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/extension/payment/payu.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/extension/payment/payu', $data);
		} else {
			return $this->load->view('extension/payment/payu', $data);
		}		
		
		
		
	}	
	
	public function callback() {
		
		if (isset($this->request->post['key']) && ($this->request->post['key'] == $this->config->get('payu_merchant'))) {
			
			$this->language->load('extension/payment/payu');
			
			$data['title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));

			if (!isset($this->request->server['HTTPS']) || ($this->request->server['HTTPS'] != 'on')) {
				$data['base'] = HTTP_SERVER;
			} else {
				$data['base'] = HTTPS_SERVER;
			}
		
			$data['charset'] = $this->language->get('charset');
			$data['language'] = $this->language->get('code');
			$data['direction'] = $this->language->get('direction');
			$data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
			$data['text_response'] = $this->language->get('text_response');
			$data['text_success'] = $this->language->get('text_success');
			$data['text_success_wait'] = sprintf($this->language->get('text_success_wait'), $this->url->link('checkout/success'));
			$data['text_failure'] = $this->language->get('text_failure');
			$data['text_cancelled'] = $this->language->get('text_cancelled');
			$data['text_cancelled_wait'] = sprintf($this->language->get('text_cancelled_wait'), $this->url->link('checkout/cart'));
			$data['text_pending'] = $this->language->get('text_pending');
			$data['text_failure_wait'] = sprintf($this->language->get('text_failure_wait'), $this->url->link('checkout/cart'));
			
			 $this->load->model('checkout/order');
			// $orderid = $this->request->post['txnid'];
			 $orderid = $this->session->data['order_id'];
			 $order_info = $this->model_checkout_order->getOrder($orderid);
			 
			
				$key          		=  	$this->request->post['key'];
				$amount      		= 	$this->request->post['amount'];
				$productInfo  		= 	$this->request->post['productinfo'];
				$firstname    		= 	$this->request->post['firstname'];
				$email        		=	$this->request->post['email'];
				$salt        		= 	$this->config->get('payu_salt');
				$txnid		 		=   $this->request->post['txnid'];
				$keyString 	  		=  	$key.'|'.$txnid.'|'.$amount.'|'.$productInfo.'|'.$firstname.'|'.$email.'||||||||||';
				$keyArray 	  		= 	explode("|",$keyString);
				$reverseKeyArray 	= 	array_reverse($keyArray);
				$reverseKeyString	=	implode("|",$reverseKeyArray);
			 
			 
			 if (isset($this->request->post['status']) && $this->request->post['status'] == 'success') {
				 
				$this->model_checkout_order->updateAdsStatus($orderid);
				
			 	$saltString     = $salt.'|'.$this->request->post['status'].'|'.$reverseKeyString;
				$sentHashString = strtolower(hash('sha512', $saltString));
			 	$responseHashString=$this->request->post['hash'];
				
				//$order_id = $this->request->post['txnid'];
				$message = '';
				//$message .= 'orderId: ' . $this->request->post['txnid'] . "\n";
				$message .= 'orderId: ' . $orderid . "\n";
				$message .= 'Transaction Id: ' . $this->request->post['mihpayid'] . "\n";
				foreach($this->request->post as $k => $val){
					$message .= $k.': ' . $val . "\n";
				}
					if($sentHashString==$this->request->post['hash']){
							$this->model_checkout_order->addOrderHistory($orderid, $this->config->get('payu_order_status_id'), $message, false);
							//$data['continue'] = $this->url->link('checkout/success');
							$data['continue'] = $this->url->link('sellerprofile/sellerprofile&tab_section=store&inner_store=approved#contentt');
							$_SESSION['payment_success'] = 'Your payment was successfully. Your tranaction Id is '.$this->request->post['mihpayid'];

							//SMS Integration
							$this->load->model('selleradvertise/advertise');
							$phone_num = $order_info['telephone'];
							$transaction_id = $this->request->post['mihpayid'];
							$sender_id = $this->config->get('sms_sender_ads');
							$sms_type = "payment";
							$this->model_selleradvertise_advertise->sendsms_payment($phone_num, $transaction_id, $sender_id, 'success', $sms_type);
							//SMS Integration
							//E-Mail Integration
							$email = $order_info['email'];
							$this->model_selleradvertise_advertise->sendemail_payment($transaction_id, 'success', $email);
							//E-Mail Integration

							$data['column_left'] = $this->load->controller('common/column_left');
				            $data['column_right'] = $this->load->controller('common/column_right');
				            $data['content_top'] = $this->load->controller('common/content_top');
				            $data['content_bottom'] = $this->load->controller('common/content_bottom');
				            $data['footer'] = $this->load->controller('common/footer');
				            $data['header'] = $this->load->controller('common/header');
							if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/extension/payment/payu_success.tpl')) {
								$this->response->setOutput($this->load->view($this->config->get('config_template') . '/extension/payment/payu_success', $data));
							} else {
								$this->response->setOutput($this->load->view('extension/payment/payu_success', $data));
							}	
							
							
								
							}
			 
			 
			 }else {
    			$data['continue'] = $this->url->link('sellerprofile/sellerprofile&tab_section=store&inner_store=approved#content');
				$data['column_left'] = $this->load->controller('common/column_left');
				$data['column_right'] = $this->load->controller('common/column_right');
				$data['content_top'] = $this->load->controller('common/content_top');
				$data['content_bottom'] = $this->load->controller('common/content_bottom');
				$data['footer'] = $this->load->controller('common/footer');
				$data['header'] = $this->load->controller('common/header');

				//SMS Integration
				$this->load->model('selleradvertise/advertise');
				$phone_num = $order_info['telephone'];
				$transaction_id = '';
				$sms_type = "payment";
				$sender_id = $this->config->get('sms_sender_ads');
				$this->model_selleradvertise_advertise->sendsms_payment($phone_num, $transaction_id, $sender_id, 'failed', $sms_type);
				//SMS Integration
				//E-Mail Integration
				$email = $order_info['email'];
				$this->model_selleradvertise_advertise->sendemail_payment($transaction_id, 'failed', $email);
				//E-Mail Integration

		        if(isset($this->request->post['status']) && $this->request->post['unmappedstatus'] == 'userCancelled')
				{
			
				 if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/extension/payment/payu_cancelled.tpl')) {
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/extension/payment/payu_cancelled', $data));
				} else {
				    $this->response->setOutput($this->load->view('extension/payment/payu_cancelled', $data));
				}
				}
				else {
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/extension/payment/payu_failure.tpl')) {
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/extension/payment/payu_failure', $data));
				} else {
					$this->response->setOutput($this->load->view('extension/payment/payu_failure', $data));
				}	
				
				}					
			}
		}
	}
}
?>