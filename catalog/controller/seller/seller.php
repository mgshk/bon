<?php

class Controllersellerseller extends Controller
{
    public function index()
    {
        $this->load->language('seller/seller');

        $this->load->model('seller/seller');
        $this->load->model('tool/image');
        $this->load->model('account/address');
        $this->load->model('sellerprofile/sellerprofile');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_index'] = $this->language->get('text_index');
        $data['text_empty'] = $this->language->get('text_empty');
		$data['seller_empty'] = $this->language->get('seller_empty');

        $data['button_continue'] = $this->language->get('button_continue');

		$data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', '', 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('seller/seller&path='.$this->request->get['path'], '', 'SSL'),
        );

		$this->load->model('catalog/category');


		if (isset($this->request->get['path'])) {
			$category_id = $this->request->get['path'];
		} else {
			$category_id = '';
		}

		if (isset($this->request->get['searcha'])) {
			$search_val = $this->request->get['searcha'];
		} else {
			$search_val = '';
		}

		if (isset($this->request->get['by_search'])) {
			$by_search_val = $this->request->get['by_search'];
		} else {
			$by_search_val = '';
		}

		/*if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);
			
			$category_id = (int)array_pop($parts);			
		}*/		

		$limit = 4;
		$count='';

        $data['categories'] = array();
        $store_address = array();
        $results = $this->model_seller_seller->getsellersList($category_id, $search_val, $by_search_val, $limit, $count);

		//echo "<pre>"; print_r($results);

        foreach ($results as $result) {
            if (is_numeric(utf8_substr($result['name'], 0, 1))) {
                $key = '0 - 9';
            } else {
                $key = utf8_substr(utf8_strtoupper($result['name']), 0, 1);
            }

			//$seller_add = $this->model_seller_seller->getsellers_address($result['address_id']);

			$seller_info = $this->model_sellerprofile_sellerprofile->getseller($result['customer_id']);
			$address_info = $this->model_account_address->getAddress($seller_info['address_id']);

			if ($seller_info['address_1']) {
	            $address_1 = $seller_info['address_1'];
	            $address_2 = $seller_info['address_2'];
	            $city = $seller_info['city'];
	            $postcode = $seller_info['postcode'];
	        } else {
	            $address_1 = $address_info['address_1'];
	            $address_2 = $address_info['address_2'];
	            $city = $address_info['city'];
	            $postcode = $address_info['postcode'];
	        }

			$store_address[] = $address_1;
	        $store_address[] = $address_2;
	        $store_address[] = $city;
	        $store_address[] = $address_info['zone'];
	        $store_address[] = $address_info['country'];
	        $store_address[] = $postcode;

        	$seller_address = implode(array_filter($store_address), ", ");

			//print_r($seller_add);

			// if(!empty($seller_add)) {
			// 	$seller_address = $seller_add[0]['address_1'].' '.$seller_add[0]['address_2'].' '.$seller_add[0]['city'].' '.$seller_add[0]['postcode'];
			// } else {
			// 	$seller_address = '';
			// }

			if (!empty($result) && is_file(DIR_IMAGE.$result['banner'])) {
				$banner_image = $result['banner'];
			} else {
				$banner_image = 'no_store_img.png';
			}

			//echo "<pre>"; print_r($results);

            //$data['categories'][$key]['seller'][] = array(
			$data['categories'][] = array(
				'id' => $result['customer_id'],
                'name' => $result['name'],
				'nickname' => $result['nickname'],
				'seller_address' => $seller_address,
				'image' => $banner_image,
				'lat' => $result['lat'],
				'lng' => $result['lng'],
				'rating' => $result['rating'],
				'filtered' => $result['filtered'],
				'review_count' => $result['review_count'],
				'store_ads' => $result['store_ads'],
				'telephone' => $result['telephone'],
				'description' => $result['description'],
				'seller_verified' => $result['seller_verified'],
				'distance' => ($result['distance']*1.609344),
                'href' => $this->url->link('seller/seller/info&seller_id='.$result['customer_id'].'&path='.$this->request->get['path'].'&counter=1'),
            );
        }

		//echo "<pre>"; print_r($data['categories']);

		//$data['categoriet'] = $data['categories'];

		$data['categories_seller'] = $this->model_catalog_category->getCategories(0);

        $data['continue'] = $this->url->link('common/home');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
		$data['left_menu'] = $this->load->controller('common/left_menu');


        $this->response->setOutput($this->load->view('seller/seller_list', $data));

    }
	
	public function advertisement_seller_list()
    {

		$this->load->language('seller/seller');

        $this->load->model('seller/seller');
        $this->load->model('tool/image');
        $this->load->model('account/address');
        $this->load->model('sellerprofile/sellerprofile');

		$this->load->model('catalog/category');
		if (isset($this->request->get['path'])) {
			$category_id = $this->request->get['path'];
		} else {
			$category_id = '';
		}

		if (isset($this->request->get['searcha'])) {
			$search_val = $this->request->get['searcha'];
		} else {
			$search_val = '';
		}

		if (isset($this->request->get['by_search'])) {
			$by_search_val = $this->request->get['by_search'];
		} else {
			$by_search_val = '';
		}

		/*if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);
			
			$category_id = (int)array_pop($parts);			
		}*/
		if (isset($this->request->get['count'])) {
			$count = $this->request->get['count'];
			$data['count'] = $count;
		} else {
			$count = '';
			$data['count'] ='';
		}
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = '6';
		}	

        $data['categories'] = array();
        $store_address = array();
        $results = $this->model_seller_seller->getsellersList($category_id, $search_val, $by_search_val, $limit, $count);

		//echo "<pre>"; print_r($results);

        foreach ($results as $result) {
            if (is_numeric(utf8_substr($result['name'], 0, 1))) {
                $key = '0 - 9';
            } else {
                $key = utf8_substr(utf8_strtoupper($result['name']), 0, 1);
            }

            //if (!isset($data['categories'][$key])) {
                //$data['categories'][$key]['name'] = $key;
            //}

			//$seller_add = $this->model_seller_seller->getsellers_address($result['address_id']);

			$seller_info = $this->model_sellerprofile_sellerprofile->getseller($result['customer_id']);
			$address_info = $this->model_account_address->getAddress($seller_info['address_id']);

			if ($seller_info['address_1']) {
	            $address_1 = $seller_info['address_1'];
	            $address_2 = $seller_info['address_2'];
	            $city = $seller_info['city'];
	            $postcode = $seller_info['postcode'];
	        } else {
	            $address_1 = $address_info['address_1'];
	            $address_2 = $address_info['address_2'];
	            $city = $address_info['city'];
	            $postcode = $address_info['postcode'];
	        }

			$store_address[] = $address_1;
	        $store_address[] = $address_2;
	        $store_address[] = $city;
	        $store_address[] = $address_info['zone'];
	        $store_address[] = $address_info['country'];
	        $store_address[] = $postcode;

        	$seller_address = implode(array_filter($store_address), ", ");

			// if(!empty($seller_add)) {
			// 	$seller_address = $seller_add[0]['address_1'].' '.$seller_add[0]['address_2'].' '.$seller_add[0]['city'].' '.$seller_add[0]['postcode'];
			// } else {
			// 	$seller_address = '';
			// }

			//echo "<pre>"; print_r($results);

            //$data['categories'][$key]['seller'][] = array(
			$data['categories'][] = array(
				'id' => $result['customer_id'],
                'name' => $result['name'],
				'nickname' => $result['nickname'],
				'seller_address' => $seller_address,
				'image' => $result['image'],
				'lat' => $result['lat'],
				'lng' => $result['lng'],
				'rating' => $result['rating'],
				'filtered' => $result['filtered'],
				'review_count' => $result['review_count'],
				'store_ads' => $result['store_ads'],
				'telephone' => $result['telephone'],
				'description' => $result['description'],
				'distance' => ($result['distance']*1.609344),
                'href' => $this->url->link('seller/seller/info&seller_id='.$result['customer_id'].'&path='.$this->request->get['path'].'&counter=1'),
            );
        }

		 $this->response->setOutput($this->load->view('seller/load_more_seller_list', $data));

	}

	 public function advertisement_store_info()
    {
        $this->load->language('seller/seller');

        $this->load->model('seller/seller');

        $this->load->model('catalog/product');
		$data['seller_id'] = (int) $this->request->get['seller_id'];

		if (isset($this->request->get['seller_id'])) {
            $seller_id = (int) $this->request->get['seller_id'];
        } else {
            $seller_id = 0;
        }

		if (isset($this->request->get['count'])) {
			$count = $this->request->get['count'];
			$data['count'] = $count;			
		} else {
			$count = '';
			$data['count'] ='';			
		}
		
		$limit = '6';
		
		$sort =(isset($this->request->get['sort']) && $this->request->get['sort'] !='') ? $this->request->get['sort'] : '' ;
		$order =(isset($this->request->get['order']) && $this->request->get['order'] !='') ? $this->request->get['order'] : '' ;
		$category_id =(isset($this->request->get['path']) && $this->request->get['path'] !='') ? $this->request->get['path'] : '' ;
		$prod_search =(isset($this->request->get['prod_search']) && $this->request->get['prod_search'] !='') ? $this->request->get['prod_search'] : '' ;

        $this->load->model('tool/image');
		$data['image_resize'] = $this->model_tool_image;
		if($this->request->get['tab_id'] == 'tab-sellerads') { 
			$data['advertisement_store'] = $this->model_seller_seller->getAdvertisesFrontStore(6, $seller_id, $limit, $count);
		} else {
			$filter_data = array(
                'filter_seller_id' => $seller_id,
                'sort' => $sort,
                'order' => $order,
                'start' => $count,
                'limit' => $limit,
				'filter_category_id' => $category_id,
				'filter_prod_search' => $prod_search,
            );
			$data['products'] = $this->model_seller_seller->getProducts($filter_data);
		}
		$this->response->setOutput($this->load->view('error/not_found', $data));

		 $this->response->setOutput($this->load->view('seller/seller_product_load_more', $data));
	}
	
	public function pay_wallet()
    {
        $this->load->language('seller/seller');

        $this->load->model('seller/seller');
		

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'p.sort_order';
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

        if (isset($this->request->get['limit'])) {
    			$limit = (int)$this->request->get['limit'];
    		} else {
    			$limit = (int)$this->config->get($this->config->get('config_theme') . '_product_limit');
    		}

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_brand'),
            //'href' => $this->url->link('seller/seller'),
			'href' => $this->url->link('seller/seller&path='.$this->request->get['path']),
        );
	
		$url ='';

		$seller_info = $this->model_seller_seller->getseller($this->request->get['seller_id']);	

		$data['breadcrumbs'][] = array(
			'text' => $seller_info['title'],
			'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].$url.'&path='.$this->request->get['path']),
		);

		$data['breadcrumbs'][] = array(
			'text' => "Pay Wallet",
			'href' => $this->url->link('seller/seller/pay_wallet', 'seller_id='.$this->request->get['seller_id'].$url.'&path='.$this->request->get['path']),
		);




            $this->document->setTitle("Pay Wallet");            

            $data['continue'] = $this->url->link('common/home');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

		 $this->response->setOutput($this->load->view('seller/seller_pay_wallet', $data));
	}

	public function check_wallet_balance()
    {	$json = array();
		if((isset($_POST['enter_amt']) && $_POST['enter_amt'] != '') && (isset($_POST['optradio']) && $_POST['optradio'] !='')) {
			$amount = $_POST['enter_amt'];
			$opt_radio = $_POST['optradio'];
			$json['error'] = "Your wallet balance is lesser than the amount entered";
		} else {
			$json['error'] = "Enter the amount";
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));		
	}

    public function info()
    {
        $this->load->language('seller/seller');

        $this->load->model('seller/seller');
        $this->load->model('catalog/product');
        $this->load->model('tool/image');
        $this->load->model('account/address');
        $this->load->model('sellerprofile/sellerprofile');

		$data['cus_logged'] = $this->customer->isLogged();	

		$seller_images = $this->model_seller_seller->getsellerImages($this->request->get['seller_id']);

		$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');

		foreach($seller_images as $seller_image) {
			//if ($seller_image['image']) {
				$seller_images_val[] = $this->model_tool_image->resize($seller_image['image'], 975, 300);		
			//} else {
				//$data['seller_images'] = $this->model_tool_image->resize($seller_image['image'], 500, 500);
			//}
		}

		//print_r($data['seller_images']);

        $data['sellerreviewstatus'] = $this->config->get('config_sellerreview');

        // Captcha
            if ($this->config->get('config_sellerreview') && $this->config->get($this->config->get('config_captcha').'_status')) {
                $data['captcha'] = $this->load->controller('captcha/'.$this->config->get('config_captcha'));
            } else {
                $data['captcha'] = '';
            }

        if ($this->config->get('config_sellerreview_guest') || $this->customer->isLogged()) {
            $data['sellerreviewguest'] = true;
        } else {
            $data['sellerreviewguest'] = false;
        }
        $data['text_seller_login'] = sprintf($this->language->get('text_seller_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));

		if(isset($this->request->get['counter']) == 1) {
			$this->model_seller_seller->sellercounter($this->request->get['seller_id']);
		}

		if(isset($this->session->data['login_type'])){
			$data['login_type'] = $this->session->data['login_type'];
		} else {
			$data['login_type'] = '';
		}

        $data['seller_id'] = (int) $this->request->get['seller_id'];
        $data['text_write'] = $this->language->get('text_write');
        $data['tab_sellerreview'] = $this->language->get('tab_sellerreview');
		$data['tab_sellerads'] = $this->language->get('tab_sellerads');
		$data['tab_sellerproducts'] = $this->language->get('tab_sellerproducts');
        $data['entry_name'] = $this->language->get('entry_name');
		$data['entry_phone'] = $this->language->get('entry_phone');
        $data['text_loading'] = $this->language->get('text_loading');
        $data['entry_sellerreview'] = $this->language->get('entry_sellerreview');
        $data['entry_rating'] = $this->language->get('entry_rating');
        $data['entry_good'] = $this->language->get('entry_good');
        $data['entry_bad'] = $this->language->get('entry_bad');
        $data['text_products_number'] = $this->language->get('text_products_number');
        $data['text_seller_years'] = $this->language->get('text_seller_years');
        $data['entry_captcha'] = $this->language->get('entry_captcha');
        $data['text_note'] = $this->language->get('text_note');

        if (isset($this->request->get['seller_id'])) {
            $seller_id = (int) $this->request->get['seller_id'];
        } else {
            $seller_id = 0;
        }

		if ($this->customer->isLogged()) {
			$data['customer_number'] = $this->customer->getTelephone();
		} else {
			$data['customer_number'] = '';
		}

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'p.sort_order';
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

        if (isset($this->request->get['limit'])) {
    			$limit = (int)$this->request->get['limit'];
    		} else {
    			$limit = (int)$this->config->get($this->config->get('config_theme') . '_product_limit');
    		}

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_brand'),
            //'href' => $this->url->link('seller/seller'),
			'href' => $this->url->link('seller/seller&path='.$this->request->get['path']),
        );

		$data['store_favourites'] = $this->model_seller_seller->getstore_favourites($seller_id, $this->customer->getID());

		$data['store_timings_front'] = $this->model_seller_seller->getstore_timings($seller_id);

		//echo "<pre>"; print_r($store_timings); die;
		
		//if(!empty($store_favourites)) {
			//$data['fav_email'] = $store_favourites['email'];
			//$data['fav_notification'] = $store_favourites['notification'];
		//}

        $seller_review_single = $this->model_seller_seller->getseller_review_single($seller_id, $this->customer->getID());
				
		$seller_info = $this->model_seller_seller->getseller($seller_id);		

		$seller_rating = $this->model_seller_seller->getseller_rating($seller_id);

		//print_r($seller_info); die;

		if(!empty($seller_info)) {			
			$data['ins'] = $seller_info['instagram'];
			$data['goo'] = $seller_info['googleplus'];
			$data['twi'] = $seller_info['twitter'];
			$data['fac'] = $seller_info['facebook'];
			$data['web'] = $seller_info['website'];
		}
		//print_r($data); die;
		
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

		if (isset($this->request->get['count'])) {
			$count = $this->request->get['count'];
			$data['count'] = $count;
		} else {
			$count = '';
			$data['count'] ='';
		}
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = '8';
		}	

		$data['image_resize'] = $this->model_tool_image;
		$data['advertisement_store'] = $this->model_seller_seller->getAdvertisesFrontStore(6, $seller_id, $limit, $count);
 
		//echo "<pre>"; print_r($data['advertisement_store']); die;

		//$seller_add = $this->model_seller_seller->getsellers_address($seller_info['address_id']);

		$store_address_details = $this->model_sellerprofile_sellerprofile->getseller($seller_id);
		$address_info = $this->model_account_address->getAddress($seller_info['address_id']);

		if ($store_address_details['address_1']) {
            $address_1 = $store_address_details['address_1'];
            $address_2 = $store_address_details['address_2'];
            $city = $store_address_details['city'];
            $postcode = $store_address_details['postcode'];
        } else {
            $address_1 = $address_info['address_1'];
            $address_2 = $address_info['address_2'];
            $city = $address_info['city'];
            $postcode = $address_info['postcode'];
        }

        $store_address = array();

		$store_address[] = $address_1;
        $store_address[] = $address_2;
        $store_address[] = $city;
        $store_address[] = $address_info['zone'];
        $store_address[] = $address_info['country'];
        $store_address[] = $postcode;

    	$data['seller_address'] = implode(array_filter($store_address), ", ");

		// if(!empty($seller_add)) {
		// 	$data['seller_address'] = $seller_add[0]['address_1'].' '.$seller_add[0]['address_2'].' '.$seller_add[0]['city'].' '.$seller_add[0]['postcode'];
		// } else {
		// 	$data['seller_address'] = '';
		// }

		if($seller_info['delivery_type'] == 1) {
			$data['delivery_type'] = "Cash on home delivery";
		} elseif($seller_info['delivery_type'] == 2) {
			$data['delivery_type'] = "Cash on store delivery";
		} elseif($seller_info['delivery_type'] == 3) {
			$data['delivery_type'] = "Cash on store and home delivery";
		} else {
			$data['delivery_type'] = "";
		}

		//echo "<pre>"; print_r($seller_info); die;
        $data['seller_verified'] = $seller_info['seller_verified'];
		$data['path'] = (isset($this->request->get['path']) && $this->request->get['path'] !='') ? $this->request->get['path'] : '';
		$data['tab_section'] = (isset($this->request->get['tab_section']) && $this->request->get['tab_section'] !='') ? $this->request->get['tab_section'] : '';
		$data['prod_search'] = (isset($this->request->get['prod_search']) && $this->request->get['prod_search'] !='') ? $this->request->get['prod_search'] : '';

        if ($seller_info) {
			if (isset($this->request->get['path'])) {
				$path = '';

				$parts = explode('_', (string)$this->request->get['path']);
				
				$category_id = (int)array_pop($parts);			
			}

			$prod_search = '';
			if (isset($this->request->get['prod_search'])) {		
				$prod_search = $this->request->get['prod_search'];	
			}			

            $this->document->setTitle("Store/Entity detail - ".$seller_info['nickname']);
            $this->document->addLink($this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id']), 'canonical');

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

            if (isset($this->request->get['limit'])) {
                $url .= '&limit='.$this->request->get['limit'];
            }

			if (isset($this->request->get['path'])) {
                $url .= '&path='.$this->request->get['path'];
            }

			if (isset($this->request->get['seller_id'])) {
                $url .= '&seller_id='.$this->request->get['seller_id'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $seller_info['title'],
                'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].$url.'&path='.$this->request->get['path']),
            );

            //$data['heading_title'] = "Store/Entity detail - ".$seller_info['title'];
            $data['seller_name'] = $seller_info['title'];
            $this->load->model('tool/image');
            if ($this->config->get('config_sellerprofileimage')) {
                $data['sellerprofileimage'] = '1';
            } else {
                $data['sellerprofileimage'] = '0';
            }

            if ($seller_info['image']) {
                $data['seller_image'] = $this->model_tool_image->resize($seller_info['image'], 150, 150);
            } else {
                $data['seller_image'] = $this->model_tool_image->resize('no_person_img.png', 150, 150);
            }

			$data['review_count'] = $seller_info['review_count'];

            function GetAge($dob)
            {
                    $dob=explode("-",$dob);
                    $curMonth = date("m");
                    $curDay = date("j");
                    $curYear = date("Y");
                    $age = $curYear - $dob[0];
                    if($curMonth<$dob[1] || ($curMonth==$dob[1] && $curDay<$dob[2]))
                            $age--;
                    return $age+1;
            }

            $data['seller_date_added'] =  getAge(date('Y-m-d', strtotime($seller_info['seller_date_added'])));

            if ($seller_info['banner']) {
                $seller_banner[] = $this->model_tool_image->resize($seller_info['banner'], 975, 300);
            } else {
                $seller_banner[] = $this->model_tool_image->resize('no_store_img.png', 975, 300);
            }

			//print_r($seller_images_val);
			//print_r($seller_banner);
			if(!empty($seller_images_val)) {
				$data['seller_images_full'] = array_merge($seller_images_val, $seller_banner);
			} else {
				$seller_images_val = array();
				$data['seller_images_full'] = array_merge($seller_images_val, $seller_banner);
			}

			//print_r($data['seller_images_full']);
			//die;

            $data['lat'] = $seller_info['lat'];
			$data['lng'] = $seller_info['lng'];
			$data['nickname'] = $seller_info['nickname'];
			$data['store_mobile_num'] = $seller_info['store_mobile_num'];
			$data['store_ll_num'] = $seller_info['store_ll_num'];
			$data['store_email'] = $seller_info['store_email'];
			$data['description'] = $seller_info['description'];
			$data['owner_name'] = $seller_info['owner_name'];
			$data['seller_rating'] = (int) $seller_info['rating'];
            $data['sellertwitter'] = $seller_info['twitter'];
            $data['sellergoogleplus'] = $seller_info['googleplus'];
            $data['sellerfacebook'] = $seller_info['facebook'];
            $data['sellerinstagram'] = $seller_info['instagram'];
            $data['seller_description'] =  html_entity_decode($seller_info['description'], ENT_QUOTES, 'UTF-8');

            $data['text_empty'] = $this->language->get('text_empty');
			$data['seller_empty'] = $this->language->get('seller_empty');
            $data['text_quantity'] = $this->language->get('text_quantity');
            $data['text_seller'] = $this->language->get('text_seller');
            $data['text_model'] = $this->language->get('text_model');
            $data['text_price'] = $this->language->get('text_price');
            $data['text_tax'] = $this->language->get('text_tax');
            $data['text_points'] = $this->language->get('text_points');
            $data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
            $data['text_sort'] = $this->language->get('text_sort');
            $data['text_limit'] = $this->language->get('text_limit');

            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');
            $data['button_continue'] = $this->language->get('button_continue');
            $data['button_list'] = $this->language->get('button_list');
            $data['button_grid'] = $this->language->get('button_grid');

            $data['compare'] = $this->url->link('seller/compare');

            $data['products'] = array();

            $filter_data = array(
                'filter_seller_id' => $seller_id,
                'sort' => $sort,
                'order' => $order,
                'start' => ($page - 1) * $limit,
                'limit' => $limit,
				'filter_category_id' => $category_id,
				'filter_prod_search' => $prod_search,
            );

            $data['seller_products_total'] =  $product_total = $this->model_seller_seller->getTotalProductsSeller($filter_data);

            $results = $this->model_seller_seller->getProducts($filter_data);

            foreach ($results as $result) {//print_r($result); die;
              if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
              } else {
                $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
              }

              if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
              } else {
                $price = false;
              }

                /*if ((float) $result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $special = false;
                }*/

				if ((float) $result['special_price']) {
                    $special = $this->currency->format($this->tax->calculate($result['special_price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $special = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float) $result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
                } else {
                    $tax = false;
                }

                if ($this->config->get('config_review_status')) {
                    $rating = (int) $result['rating'];
                } else {
                    $rating = false;
                }

                $data['products'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb' => $image,
                    'name' => $result['name'],
                    //'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')).'..',
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                    'price' => $price,
                    'special' => $special,
                    'tax' => $tax,
                    'rating' => $result['rating'],
                    'href' => $this->url->link('product/product', '&product_id='.$result['product_id'].$url),
                );
            }

            $url = '&path='.$this->request->get['path'].'&tab_section=product_tab';

            if (isset($this->request->get['limit'])) {
                $url .= '&limit='.$this->request->get['limit'];
            }

            $data['sorts'] = array();

            $data['sorts'][] = array(
                'text' => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].'&sort=p.sort_order&order=ASC'.$url),
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].'&sort=pd.name&order=ASC'.$url),
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].'&sort=pd.name&order=DESC'.$url),
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].'&sort=p.price&order=ASC'.$url),
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].'&sort=p.price&order=DESC'.$url),
            );

            if ($this->config->get('config_review_status')) {
                $data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_desc'),
                    'value' => 'rating-DESC',
                    'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].'&sort=rating&order=DESC'.$url),
                );

                $data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_asc'),
                    'value' => 'rating-ASC',
                    'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].'&sort=rating&order=ASC'.$url),
                );
            }

            $data['sorts'][] = array(
                'text' => $this->language->get('text_model_asc'),
                'value' => 'p.model-ASC',
                'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].'&sort=p.model&order=ASC'.$url),
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_model_desc'),
                'value' => 'p.model-DESC',
                'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].'&sort=p.model&order=DESC'.$url),
            );

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            $data['limits'] = array();

          	$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

            sort($limits);

            foreach ($limits as $value) {
                $data['limits'][] = array(
                    'text' => $value,
                    'value' => $value,
                    'href' => $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].$url.'&limit='.$value),
                );
            }

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit='.$this->request->get['limit'];
            }

            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('seller/seller/info', 'seller_id='.$this->request->get['seller_id'].$url.'&page={page}');

            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

            $data['sort'] = $sort;
            $data['order'] = $order;
            $data['limit'] = $limit;

			// Category

			if (isset($this->request->get['path'])) {
				$parts = explode('_', (string)$this->request->get['path']);
			} else {
				$parts = array();
			}

			if (isset($parts[0])) {
				$data['category_id'] = $parts[0];
			} else {
				$data['category_id'] = 0;
			}

			if (isset($parts[1])) {
				$data['child_id'] = $parts[1];
			} else {
				$data['child_id'] = 0;
			}

			// CategoriesMenu3rdLevel
			if (isset($parts[2])) {
				$data['child_lv3_id'] = $parts[2];
			} else {
				$data['child_lv3_id'] = 0;
			}

			$this->load->model('catalog/category');

			$this->load->model('catalog/product');

			$data['categories'] = array();

			$categories = $this->model_catalog_category->getSellerCategories(0, $this->request->get['seller_id']);
			//print_r($categories); die;

			foreach ($categories as $category) {
				$children_data = array();

				//if ($category['category_id'] == $data['category_id']) {
					$children = $this->model_catalog_category->getSellerCategories($category['category_id'], $this->request->get['seller_id']);

					foreach($children as $child) {
						// CategoriesMenu3rdLevel>>>
						$children_lv3_data = array();
						
						//if ($child['category_id'] == $data['child_id']) {
							$children_lv3 = $this->model_catalog_category->getSellerCategories($child['category_id'], $this->request->get['seller_id']);
						
							foreach ($children_lv3 as $child_lv3) {
								$filter_data_lv3 = array(
									'filter_category_id'  => $child_lv3['category_id'],
									'filter_sub_category' => true
								);
							
								$children_lv3_data[] = array(
									'category_id' => $child_lv3['category_id'],
									'name'  => $child_lv3['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data_lv3) . ')' : ''),
									'href'  => $this->url->link('seller/seller/info', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_lv3['category_id'].'&seller_id=' . $this->request->get['seller_id'])
								);
							}
						
						//}
						// <<<CategoriesMenu3rdLevel
						$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

						$children_data[] = array(
							'category_id' => $child['category_id'],
							'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
							// CategoriesMenu3rdLevel>>>
							'children_lv3' => $children_lv3_data,
							// <<<CategoriesMenu3rdLevel
							'href' => $this->url->link('seller/seller/info', 'path=' . $category['category_id'] . '_' . $child['category_id'].'&seller_id=' . $this->request->get['seller_id'])
						);
					}
				//}

				$filter_data = array(
					'filter_category_id'  => $category['category_id'],
					'filter_sub_category' => true
				);

				$data['categories'][] = array(
					'category_id' => $category['category_id'],
					'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					'children'    => $children_data,
					'href'        => $this->url->link('seller/seller/info', 'path=' . $category['category_id'].'&seller_id=' . $this->request->get['seller_id'])
				);
			}

			//echo "<pre>"; print_r($categories); die;

			$data['allow_products'] = $seller_info['allow_products'];
			$data['allow_cart']     = $seller_info['allow_cart'];

            $data['continue'] = $this->url->link('common/home');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
			$data['seller_left_menu'] = $this->load->controller('common/seller_left_menu');


                $this->response->setOutput($this->load->view('seller/seller_info', $data));

        } else {
            $url = '';

            if (isset($this->request->get['seller_id'])) {
                $url .= '&seller_id='.$this->request->get['seller_id'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit='.$this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('seller/seller/info', $url),
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_error');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'].' 404 Not Found');

            $data['header'] = $this->load->controller('common/header');
            $data['footer'] = $this->load->controller('common/footer');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');


                $this->response->setOutput($this->load->view('error/not_found', $data));

        }
    }


    public function autocomplete()
    {
        $json = array();

        if (isset($this->request->get['filter_name'])) {
            $this->load->model('seller/seller');

            $filter_data = array(
                'filter_name' => $this->request->get['filter_name'],
                'start' => 0,
                'limit' => 5,
            );

            $results = $this->model_seller_seller->getsellers($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'seller_id' => $result['seller_id'],
                    'name' => strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8')),
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

    public function sellerreview()
    {
        $this->load->language('seller/seller');

        $this->load->model('seller/seller');

        $data['text_no_sellerreviews'] = $this->language->get('text_no_sellerreviews');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['sellerreviews'] = array();

        $sellerreview_total = $this->model_seller_seller->getTotalsellerreviewsBysellerId($this->request->get['seller_id']);

        $results = $this->model_seller_seller->getsellerreviewsBysellerId($this->request->get['seller_id'], ($page - 1) * 5, 5);

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
        $pagination->limit = 5;
        $pagination->url = $this->url->link('seller/seller/sellerreview', 'seller_id='.$this->request->get['seller_id'].'&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($sellerreview_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($sellerreview_total - 5)) ? $sellerreview_total : ((($page - 1) * 5) + 5), $sellerreview_total, ceil($sellerreview_total / 5));


            $this->response->setOutput($this->load->view('seller/seller_review', $data));

    }

    public function write()
    {
        $this->load->language('seller/seller');

        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            /*if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 15)) {
                $json['error'] = $this->language->get('error_name');
            }*/

			//if ((utf8_strlen($this->request->post['phone']) < 3) || (utf8_strlen($this->request->post['phone']) > 10)) {
                //$json['error'] = $this->language->get('error_phone');
            //}

            /*if ((utf8_strlen($this->request->post['text']) < 8) || (utf8_strlen($this->request->post['text']) > 1000)) {
                $json['error'] = $this->language->get('error_text');
            }*/

            if (empty($this->request->post['rate_rating']) || $this->request->post['rate_rating'] < 0 || $this->request->post['rate_rating'] > 5) {
                $json['error'] = $this->language->get('error_rating');
            }

            //if ($this->config->get('config_sellerreview') && $this->config->get($this->config->get('config_captcha').'_status')) {
                //$captcha = $this->load->controller('captcha/'.$this->config->get('config_captcha').'/validate');

                //if ($captcha) {
                    //$json['error'] = $captcha;
                //}
            //}

            //unset($this->session->data['captcha']);

            if (!isset($json['error'])) {
                $this->load->model('seller/seller');
                $this->model_seller_seller->addsellerReview($this->request->get['seller_id'], $this->request->post);
				if($this->request->post['text']){
					$json['success'] = $this->language->get('text_success');
				} else {
					$json['success'] = "Thank you for your review.";
				}
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

	public function store_favourites()
    {
        $this->load->language('seller/seller');

        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			$this->load->model('seller/seller');
			$message = $this->model_seller_seller->addstorefavourite($this->request->get['seller_id'], $this->request->post);

			$fav_stores = $this->model_seller_seller->getstore_favourites_front($this->customer->getID());
			$json['total'] = count($fav_stores);

			$json['success'] = $message;
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

	public function store_feedback()
    {
        //$this->load->language('seller/seller');

        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			if ((utf8_strlen($this->request->post['str_feedback']) < 10) || (utf8_strlen($this->request->post['str_feedback']) > 500)) {
                $json['error'] = 'Warning: Review text must be between 10 and 500 characters!';
            }

            if (!isset($json['error'])) {
                $this->load->model('seller/seller');
                $this->model_seller_seller->addstore_feedback($this->request->get['seller_id'], $this->request->post);

                $json['success'] = "Store feedback successfully submitted";
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
