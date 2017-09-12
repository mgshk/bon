<?php

class Controllersellerreviewsellerreview extends Controller
{
    public function index()
    {
        $this->load->language('seller/seller');

        $this->load->model('seller/seller');

        $this->document->setTitle("Reviews");

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_index'] = $this->language->get('text_index');
        $data['text_empty'] = $this->language->get('text_empty');
		$data['seller_empty'] = $this->language->get('seller_empty');

        $data['button_continue'] = $this->language->get('button_continue');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_brand'),
            'href' => $this->url->link('sellerprofile/sellerprofile'),
        );

        $data['text_no_sellerreviews'] = $this->language->get('text_no_sellerreviews');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

		$seller_info = $this->model_seller_seller->getseller($this->customer->getId());

		$data['seller_rating_single'] = $seller_info['rating'];

		$data['review_count'] = $seller_info['review_count'];

        $data['sellerreviews'] = array();

        $sellerreview_total = $this->model_seller_seller->getTotalsellerreviewsBysellerId($this->customer->getId());

        $results = $this->model_seller_seller->getsellerreviewsBysellerId($this->customer->getId(), ($page - 1) * 10, 10);

        foreach ($results as $result) {
            $data['sellerreviews'][] = array(
                'customer_name' => $result['customer_name'],
				'phone' => $result['phone'],
                'text' => nl2br($result['text']),
                'rating' => (int) $result['rating'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
            );
        }

        $pagination = new Pagination();
        $pagination->total = $sellerreview_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('sellerreview/sellerreview', 'seller_id='.$this->customer->getId().'&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($sellerreview_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($sellerreview_total - 10)) ? $sellerreview_total : ((($page - 1) * 10) + 10), $sellerreview_total, ceil($sellerreview_total / 10));


		$seller_rating = $this->model_seller_seller->getseller_rating($this->customer->getId());

		//print_r($seller_info); die;
		
		if(!empty($seller_rating)) {
			foreach($seller_rating as $rate) {
				$rate_res[$rate['rating']] = $rate['totalCount'];			
			}

			$rate_count = array_sum($rate_res);

			if(!empty($rate_res[5])){
				$rest_res1[5] = ($rate_res[5]/$rate_count)*100;
			} else {
				$rest_res1[5] = 0;
			}

			if(!empty($rate_res[4])){
				$rest_res1[4] = ($rate_res[4]/$rate_count)*100;
			} else {
				$rest_res1[4] = 0;
			}

			if(!empty($rate_res[3])){
				$rest_res1[3] = ($rate_res[3]/$rate_count)*100;
			} else {
				$rest_res1[3] = 0;
			}

			if(!empty($rate_res[2])){
				$rest_res1[2] = ($rate_res[2]/$rate_count)*100;
			} else {
				$rest_res1[2] = 0;
			}

			if(!empty($rate_res[1])){
				$rest_res1[1] = ($rate_res[1]/$rate_count)*100;
			} else {
				$rest_res1[1] = 0;
			}		
			
			$data['rating_chart'] = implode(",",$rest_res1);
		} else {
			$data['rating_chart'] = "0,0,0,0,0";
		}

		$data['continue'] = $this->url->link('common/home');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
		$data['left_menu'] = $this->load->controller('common/left_menu');

        $this->response->setOutput($this->load->view('seller/seller_review_back', $data));

    }
}