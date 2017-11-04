<?php
class ControllerCheckoutFailure extends Controller {
	public function index() {
		$this->load->language('checkout/failure');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->session->data['order_id'])){
			$data['order_id'] = $this->session->data['order_id'];
			$data['txnstatus']=$this->session->data['txnstatus'];
			$this->load->model('checkout/order');	
		    $data['order_info'] = $this->model_checkout_order->getOrder($this->session->data['order_id']);
			unset($this->session->data['txnstatus']);
		} 
		else
		{
			$data['txnstatus'] = 'failed';	
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_failure'),
			'href' => $this->url->link('checkout/failure')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_message'] = sprintf($this->language->get('text_message'), $this->url->link('information/contact'));

		$data['button_continue'] = $this->language->get('button_click_go_back');

		if(strpos($data['order_info']['comment'], 'Feature')===false){
			$data['continue'] = $this->url->link('sellerprofile/sellerprofile&tab_section=store&inner_store=approved#content');
		}
		else
		{
			$data['continue'] = $this->url->link('sellerprofile/sellerprofile&tab_section=store_detail#content');
		}
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/success', $data));
	}
}