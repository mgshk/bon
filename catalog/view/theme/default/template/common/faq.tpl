<?php echo $header; ?>

<script type="text/javascript">

	function toggleFaq(){
		var faqvalue = $('#faqLanguage').val();
		if(faqvalue === 'english'){
			$('#englishFaq').show();
			$('#tamilFaq').hide();
		} else {
			$('#englishFaq').hide();
			$('#tamilFaq').show();
		}
	}
</script>

<div class="container faqtop">
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12">
<!-- faq modal -->
<h2 class="faqhead">FAQ:</h2>
<div id="site_faq_main">
	<div>
		<!-- Modal content-->
		<div>
			<div>

			<div class="slectLang">
				<label><span>Select language: </span> 
				<select class="form-control langu" onchange="toggleFaq()" id="faqLanguage">
					<option value="english">English</option>
					<option value="tamil">Tamil</option>
				</select>
				</label>
			</div>

			<div id="englishFaq">
					
					<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
          What is the purpose and uniqueness of this website?
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>Purpose:</h4>
        <p>Helps business of any level to promote in all places, irrespective of any number of competencies. Sellers can post their advertisement for free or they are allowed to bid and choose a desired position from the existing AD list. Buyers can view posted offers/advertisements instantly depending on the category needed. It acts as online exhibition favouring both sellers and buyers.</p>
        <h4>Uniqueness:</h4>
        <p>BoN treats all stores/entities at a same level, shows no partiality to low or high return stores/entities in seeking commission charges. It is the ONLY place for sellers with trading mind and buyers who likes to save their money, with no effort.</p>
		<p>Buyers mostly have a good opinion on few stores/entities. It is not practical or possible to analyse all stores/entities at the same time. This leads to lose their money and satisfaction on most or all the time. Using BoN alias buyonear.in buyers now can prevent this from happening.
		</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
          Why BoN, what is the need?
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse in">
      <div class="panel-body">
        <p>World is slowly (rather quickly) moving online. Business is not the same as how it was 10 or 20 years back. It will surely not be the same like how it is now sooner. So think online think BoN before it is too late. It is FREE.</p>
		<p>It is the single place to complete your search and get the best you want near you or from the place you are looking for. It will not force you to believe the best is what it shows on the item you are interested. </p>
		<p>“LET’S START SEARCHING FROM HERE!” before we do with untrusted, unreliable and unknown sellers.</p>
		<p>It is a centralized online exhibition. Where sellers meet buyers online, especially with lot many offers. The earlier you enrol, the more benefits you get.
		</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
          As a seller how this website helps?
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>Seller:</h4>
        <ul>
		<li>i. No technical knowledge required.</li>
		<li>ii. Irrespective of the level, move your business online.</li>
		<li>iii. BoN allows seller to add products, post advertisements, track buyer’s order and get buyer reviews without any effort. BoN takes care of marketing on your behalf.</li>
		<li>iv. Post advertisements and get immediate attention from buyers.</li>
		<li>v. Top the listing by featuring your store/entity to get more attention from buyers.</li>
		<li>vi. Add your products with offers or discounts if you have, for buyers to easily pick.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
          As a buyer how this website helps?
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>Buyer:</h4>
        <ul>
		<li>i.	Saves your money, time and effort.</li>
		<li>ii.	Most or all buyers though few may prefer online shopping sometimes, likes to do shopping themselves near them or from a place they want to. Buyers likes to spend their hard earned money wisely barring few percentage of it. BoN helps buyers do the same in a lot better and easier way.</li>
		<li>iii. Easy to filter advertisements and store/entity listing based on the needed category.</li>
		<li>iv.	Since it is free, brings all stores/entities near you to your hand.</li>
		<li>v.	It is the single place to complete your search and get the best you want near you or from the place you are looking for. It will not force you to believe the best is what it shows on the item you are interested.</li>
		<li>vi.	It is much more than a telephone directory.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
          Being a buyer can I use “Seller” feature or vice versa?
        </a>
      </h4>
    </div>
    <div id="collapseFive" class="panel-collapse collapse">
      <div class="panel-body">
        <p>Of course you can. While signing up, BoN will not ask whether you are a seller or buyer. Need to provide only at the time of logging into BoN with your credentials.</p>
		<p>Every seller is naturally a buyer too to run his daily life. Also most buyers who are house wives or new entrepreneurs, are willing to start own or home based business. More than money, marketing efforts makes them not to. For them BoN is the answer, it takes their business outside with no effort making them succeed in no time.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
          How is BoN good to both sellers and buyers?
        </a>
      </h4>
    </div>
    <div id="collapseSix" class="panel-collapse collapse">
      <div class="panel-body">
        <p>It is good to both sellers and buyers.</p>
		<p><strong>Assuming case 1:</strong></p>
		<p>All sellers are using BoN.</p>
		<p>Hurray!! Buyers job is made easier now, they get their best with low price in few minutes without a sweat like how they want it to be done before BoN.</p>
		<p><strong>Assuming case 2:</strong></p>
		<p>All buyers are using BoN.</p>
		<p>Hurray!! Sellers job is made easier now, they get all buyers to see what they are offering. BoN makes their visibility lot higher hence increasing their sales. It covers almost all essence of business to achieve more profit.</p>
		<p>It's a win-win situation to both Buyers and Sellers. Hence both needs to get others join as fast as they could to make it a big success for both of them.</p> 
		<p>Sellers who knows BoN should register and ask their usual Buyers to use BoN, to let them know offers every time sellers post instantly.</p>
		<p>Buyers who knows BoN should use and ask sellers nearby or whom they meet often to join BoN, to let other buyers know their offers.</p> 
		<p>It needs a push from both to make a good profit/savings.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">
          I am a seller, is there usability restriction for any type of business?
        </a>
      </h4>
    </div>
    <div id="collapseSeven" class="panel-collapse collapse">
      <div class="panel-body">
        <p>NO, it is for all types of businesses.</p>
		<p>It is the best approach for all sellers, especially to new sellers or to whom who really means business. Sellers who go by their names might think twice before joining BoN at first but seeing buyers using BoN makes them realise names matter less. And Sellers who doesn't have much buyers using BoN in their area will make them buy with the price they set.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">
          Sellers nearby my place do not use BoN, can I wait for someone to join before me?
        </a>
      </h4>
    </div>
    <div id="collapseEight" class="panel-collapse collapse">
      <div class="panel-body">
        <p>Considering the advantage and feature, it only takes less or no time in reaching everyone.</p>
		<p>If you delay, it is advantage to your competitor, so it's wise to join now itself. It is FREE. No need to pay for joining or for adding products or for posting AD's.</p>
		<p>Moreover you get lot more visibility and no fight!</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">
			I am a store/entity owner (seller), how do I get mine added in the website?
        </a>
      </h4>
    </div>
    <div id="collapseNine" class="panel-collapse collapse">
      <div class="panel-body">
        <p>It only takes few minutes to add your store/entity and get benefited. Please follow below simple steps.</p>
        <ul>
		<li>i.	Sign-up and login as a seller.</li>
		<li>ii.	In your account enter detail about your business. (Business name, banner, category(s), location, etc.)</li>
		<li>iii.	After approval you get added.</li>
		</ul>
		<p>Own a personal webstore for no cost and no marketing worries.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">
			If I want to buy something how do I go about it?
        </a>
      </h4>
    </div>
    <div id="collapseTen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>It just needs below simple steps.</p>
		<ul>
		<li>i.	Login as a buyer.</li>
		<li>ii.	Choose the category in home page to filter advertisements. Pick the store/entity which attracts you and find the product. Add it to your cart.</li>
		<li>iii.	Also you can search for the item you are interested. From the store/entity search result, find the item and add it to your cart.</li>
		<li>iv.	Proceed to check out.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">
			I do not see any stores around me in the website?
        </a>
      </h4>
    </div>
    <div id="collapseEleven" class="panel-collapse collapse">
      <div class="panel-body">
        <p>You do not see only because of below two reasons.</p>
        <ul>
		<li>i.	From the range you set, there is no available store/entity near you.
		Alter the range and search again. If you still do not find any, you can modify the location in home page and repeat your search.</li>
		<li>ii.	Stores/entities have not joined BoN.
		Since it is free, only possibility will be unawareness by sellers. Make them aware and join BoN for yours and others benefit.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve">
			Do you charge one time or monthly fees to register my store?
        </a>
      </h4>
    </div>
    <div id="collapseTwelve" class="panel-collapse collapse">
      <div class="panel-body">
        <p>NO, it is absolutely free to join and register your store/entity in BoN.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThirteen">
			Heard I can upload products or post advertisements for free in your website, is it true!?
        </a>
      </h4>
    </div>
    <div id="collapseThirteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>YES, it is free to upload products and post your advertisements.</p> 
		<p>Also since BoN covers all level of businesses from low to high returns, bidding approach is followed to make every seller happy. You can bid and choose a position from the existing AD list to post your advertisement according to your budget.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFourteen">
			I think ideally this is the best approach but how are you going to get all stores added in your website?
        </a>
      </h4>
    </div>
    <div id="collapseFourteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>It is free and more helpful for both sellers and buyers. We just need to spread the news.</p> 
		<p>Stage is beautifully set, gates are open for all, no entry fee for anyone and exit with more benefits… what else we need!!!</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFifteen">
			If I have a feedback or get into any issues, whom or how should I contact?
        </a>
      </h4>
    </div>
    <div id="collapseFifteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>You can post your feedback or issues or concerns in the ‘Feedback’. We will respond immediately.</p> 
		<p>If you want to pass any other information, please send email to bononlineservices@buyonear.in. We will respond in 24 to 48 hours.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSixteen">
			Why the advertisement I posted is of low image quality (blurred)?
        </a>
      </h4>
    </div>
    <div id="collapseSixteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>Please make sure below points before submitting the advertisement for BoN’s approval to get good image quality and high response.</p>
        <ul>
		<li>i.	Title should be clear and short.</li> 
		<li>ii.	Cropped image quality should be bright, easily understandable and of high image quality.</li>
		<li>iii.	Provide detailed description about the advertisement in ‘Description’ field. This is not mandatory.</li>
		<li>iv.	Provide URL if you have.</li>
		</ul>
		<p>True and good quality advertisement will surely increase the attention and your ranking which in turn increases your sales.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeventeen">
			When do I get to use My Wallet/Pay/Expense Report feature?
        </a>
      </h4>
    </div>
    <div id="collapseSeventeen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>They are under development. It needs minor adjustments according to the usability and feedback by the users.</p>
		<p>Once the design or approach is finalized after considering feedbacks by the users, will be released.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEighteen">
			Is there any other future improvements/plans you have?
        </a>
      </h4>
    </div>
    <div id="collapseEighteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>Yes, there are many more surprising ideas to be implemented sooner. Please await surprises to unfold and provide your cooperation in spreading the news at this time for everyone’s benefit.</p>
		<p>Let us work together for a better living.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNineteen">
			Does BoN website work in all browsers?
        </a>
      </h4>
    </div>
    <div id="collapseNineteen" class="panel-collapse collapse">
      <div class="panel-body">
        <p>BoN works very well in google chrome, internet explorer and firefox browser. Though we tested extensively in all three browsers, if you happen to get into any issues in one try in other browsers.</p>
		<p>Mobile app development is currently in progress. We are working hard to get them released for user’s convenience.</p>
		<p>You may post your issue in ‘Feedback’ menu if it does not work in any browsers.</p>
      </div>
    </div>
  </div>

</div>

</div>
<!-- english -->

<!-- tamil -->
	<div id="tamilFaq" style="display:none;">

		<div class="panel-group" id="accordion1">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne1">
          இந்த வலைத்தளத்தின் நோக்கம் மற்றும் தனித்துவம் என்ன?
        </a>
      </h4>
    </div>
    <div id="collapseOne1" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>நோக்கம்:</h4>
        <p>எத்தகைய வணிகமாக (குறு, சிறு மற்றும் பெருந்தொழில்) இருந்தாலும், எந்த இடத்தில இருந்தாலும், எவ்வளவு போட்டியாளர்கள் இருந்தாலும் உங்களின் விற்பனையை ஊக்குவிக்க BoN (buyonear.in) இணையத்தளம் உதவும். விற்பனையாளர்கள் தங்கள் விளம்பரங்களை “இலவசமாக” பதிவு செய்யலாம் அல்லது ஏற்கனவே இருக்கும் விளம்பரப் பட்டியலில் இருந்து பிடித்த இடத்தை தகுந்த ஏலத்திற்கு தேர்வு செய்ய அனுமதிக்கப்படுகிறார்கள்.</p>
        <p>வாடிக்கையாளர்கள், வெளியிடப்பட்ட சலுகைகளை/விளம்பரங்களை உடனடியாக தேவையான வகைக்கேற்ப பார்க்க முடியும். விற்பனையாளர்கள் மற்றும் வாடிக்கையாளர்கள் ஆகிய இருவருக்கும் சாதகமான ஆன்லைன் கண்காட்சியாக இது செயல்படுகிறது.</p>
        <h4>தனித்தன்மை:</h4>
        <p>BoN அனைத்துக் கடைகளையும் / நிறுவனங்களையும் ஒரே அளவில் பார்க்கிறது, கமிஷன் கட்டணத்திர்காக குறைந்த அல்லது அதிகமான வருமானம் உள்ள கடைகள் / நிறுவனங்களுக்கு எந்தப் பாரபட்சமும் பார்க்காது. இது வணிகம் விரும்பும் விற்பனையாளர்களுக்கு மற்றும் சேமிக்கும் வாடிக்கையாளர்களுக்கு ஒரே சிறந்த இடம்.</p>
		<p>வாடிக்கையாளர்கள் பெரும்பாலும் ஒரு சில கடைகளின் / நிறுவனங்களின் மீதே நன் மதிப்பு கொண்டிருப்பர். ஒரே நேரத்தில் அணைத்து கடைகளையும் / நிறுவனங்களையும் ஆராய மாட்டார்கள், அது நடைமுறைக்கு சாத்தியமும் அல்ல. பல அல்லது எல்லா நேரங்களிலும் இது அவர்களுக்கு நஷ்டத்தையும் கஷ்டத்தையுமே தரும். BoN / buyonear.in உபயோகித்தால் இதை தவிர்க்கலாம்.</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo2">
          ஏன் BoN, தேவை என்ன?
        </a>
      </h4>
    </div>
    <div id="collapseTwo2" class="panel-collapse collapse in">
      <div class="panel-body">
        <p>உலகம் மெதுவாக (மாறாக விரைவாக) ஆன்லைனை நோக்கி நகர்கிறது. இப்போதைய வணிகம் 10 அல்லது 20 ஆண்டுகளுக்கு முன்பு இருந்ததைவிட அதிகம் மாறிவிட்டது. இது நிலைக்கும் என்றும் சொல்லிவிட முடியாது, மாறிக்கொன்டே இருக்கும். அதனால் தாமதிக்காமல் ஆன்லைனுக்கு வாருங்கள், BoN’க்கு வாருங்கள். BoN முற்றிலும் இலவசம்.</p>
		<p>இது உங்கள் தேடலை எளிமையாக்கி, உங்கள் அருகில் அல்லது நீங்கள் விரும்பிய இடத்திலிருந்து விரும்பியதை பெற சிறந்த ஒரே இடம். நீங்கள் விரும்பியதை பெற உங்களை நம்பவிக்கும் நோக்கத்தோடு BoN எவ்வித முயற்சியும் செய்யாது. அறிமுகமில்லாத நம்பிக்கையில்லாத விற்பனையாளரிடம் தேடுவதற்குமுன் “LET’S START SEARCHING FROM HERE”!</p>
		<p>இது ஒரு மையப்படுத்தப்பட்ட ஆன்லைன் கண்காட்சி ஆகும், குறிப்பாக நிறைய சலுகைகளுடன். விரைவில் சேர்ந்திடுங்கள் அதிக பயனடைந்திடுங்கள்.</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree3">
          விற்பனையாளர்களுக்கு இந்த வலைத்தளம் எப்படி உதவுகிறது?
        </a>
      </h4>
    </div>
    <div id="collapseThree3" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>விற்பனையாளர்கள்:</h4>
        <ul>
		<li>i. தொழில்நுட்ப அறிவு தேவை இல்லை.</li>
		<li>ii.	எத்தகைய வணிகமாக (குறு, சிறு மற்றும் பெருந்தொழில்) இருந்தாலும், ஆன்லைனுக்கு நகர்த்துங்கள்.</li>
		<li>iii. BoN விற்பனையாளரின் பொருட்களை சேர்க்க, விளம்பரங்களை பதிவேற்ற, விற்பனையாளர்கள் ஆர்டர்களை கண்காணிக்க மற்றும் விற்பனையாளர்கள் மதிப்பை பெற எளிதாக அனுமதிக்கிறது. BoN உங்கள் சார்பாக வணிக விளம்பரத்தை கவனித்துக்கொள்கிறது.</li>
		<li>iv.	விளம்பரங்களை பதிவு செய்து வாடிக்கையாளர்களின் உடனடி கவனத்திற்கு கொண்டு செல்லும்.</li>
		<li>v.	கடை நிறுவன பட்டியலில் முதன்மை பெற்று வாடிக்கையாளர்களின் கவனத்தை பெற உதவும் </li>
		<li>vi.	நீங்கள் விற்கும் பொருட்களின் சலுகைகள் மற்றும் தள்ளுபடிகள் மூலம் வாடிக்கையாளர்களை ஈர்க்கலாம்.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour4">
          வாடிக்கையாளர்களுக்கு இந்த வலைத்தளம் எப்படி உதவுகிறது?
        </a>
      </h4>
    </div>
    <div id="collapseFour4" class="panel-collapse collapse">
      <div class="panel-body">
        <h4>வாடிக்கையாளர்கள்:</h4>
        <ul>
		<li>i.	உங்கள் பணம், நேரம் மற்றும் முயற்சி சேமிக்கப்படுகிறது.</li>
		<li>ii.	சில அல்லது பெரும்பாலான வாடிக்கையாளர்கள் ஆன்லைன் ஷாப்பிங்கை விரும்பலாம், மற்ற நேரங்களில் அவர்கள் அருகிலோ அல்லது விரும்பிய இடத்திலோ ஷாப்பிங் செய்யவே விரும்புவர். வாடிக்கையாளர்கள் சில சதவிகிதம் தவிர்த்து தங்கள் கடின உழைப்பினால் பெற்ற பணத்தை மிக புத்திசாலித்தனமாக செலவழிக்கவே விரும்புவர். BoN வாடிக்கையாளர்களின் எண்ணத்திற்கு ஏற்றவாறு ஒத்துழைத்து பயனளிக்கிறது.</li>
		<li>iii.	விளம்பரம் மற்றும் கடை/நிறுவன பட்டியலை தேவைக்கேற்ற வகையின் அடிப்படையில் வடிகட்ட (Filter) உதவுகிறது.</li>
		<li>iv.	இது இலவசம் என்பதால் அருகிலுள்ள கடை/நிறுவனங்களை உங்கள் முன்னே கொண்டு வரும்.</li>
		<li>v.	இது உங்கள் தேடலை எளிமையாக்கி, உங்கள் அருகில் அல்லது நீங்கள் விரும்பிய இடத்திலிருந்து விரும்பியதை பெற சிறந்த ஒரே இடம். நீங்கள் விரும்பியதை பெற உங்களை நம்பவிக்கும் நோக்கத்தோடு BoN எவ்வித முயற்சியும் செய்யாது.</li>
		<li>vi.	இது தொலைபேசி புத்தகத்தைவிட (Telephone Directory) மிக பயனுள்ளது.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive5">
          வடிக்கையாளராகிய நான் விற்பனையாளர் அம்சத்தை அல்லது விற்பனையாளராகிய நான் வாடிக்கையாளர் அம்சத்தை உபயோகப்படுத்த முடியுமா?
        </a>
      </h4>
    </div>
    <div id="collapseFive5" class="panel-collapse collapse">
      <div class="panel-body">
        <p>கண்டிப்பாக முடியம். பதிவு செய்யும் போது நீங்கள் ஒரு விற்பனையாளரா அல்லது வாடிக்கையாளரா என்பதை BoN கேட்காது. உங்கள் சான்றுகளுடன் BoN’ல் உள்நுழையும் நேரத்தில் மட்டுமே வழங்க வேண்டும்.</p>
		<p>ஒவ்வொரு விற்பனையாளரும் தினசரி வாழ்க்கையை நடத்துவதற்கு இயற்கையாக ஒரு வாடிக்கையாளரே. மேலும் வீட்டின் மனைவி அல்லது புதிய தொழில் முனைவோர் போன்ற பெரும்பாலானோர் சொந்த அல்லது வீட்டில் இருந்தபடியே தொழில் ஆரம்பிக்க எண்ணம் இருந்தாலும் மார்க்கெட்டிங் முயற்சியின் மேல் உள்ள பயத்தினாலேயே அவ்வெண்ணத்தை கைவிடுவர். அவர்களுக்கு BoN’எ பதில், இது வெளிஉலகிற்கு எந்த ஒரு முயற்சியுமின்றி கொண்டுசென்று உங்களை வெற்றியடைய செய்யும்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix6">
          விற்பனையாளர்களுக்கும் வாடிக்கையாளர்களுக்கும் இது எவ்வாறு நல்லது?
        </a>
      </h4>
    </div>
    <div id="collapseSix6" class="panel-collapse collapse">
      <div class="panel-body">
        <p>இது விற்பனையாளரகள் மற்றும் வாடிக்கையாளர்கள் இருவருக்கும் பயன் அளிக்கிறது.</p>
		<p><strong>முதல் அனுமானிப்பு (Assuming case 1):</strong></p>
		<p>அணைத்து விற்பனையாளர்களும் BoN’ஐ உபயோகிக்கின்றனர். </p>
		<p>அற்புதம்!! வாடிக்கையாளர்களின் வேலை இப்போது எளிதானது, அவர்கள் குறைந்த விலையில் குறைந்த நேரத்தில் குறைந்த முயற்சியில் BoN’ற்கு முன்னாள் எவ்வாறு செய்ய நினைத்தார்களோ அதை BoN’ன் மூலம் எளிதாக செய்ய முடியும்.</p>
		<p><strong>இரண்டாவது அனுமானிப்பு (Assuming case 2):</strong></p>
		<p>அணைத்து வாடிக்கையாளர்களும் BoN’ஐ உபயோகிக்கின்றனர்.</p>
		<p>அற்புதம்!! விற்பனையாளர்களின் வேலை இப்போது எளிதானது, வாடிக்கையாளர்களை எளிதாக அவர்களின் விளம்பரங்களின் மூலம் அணுகலாம். BoN விற்பனையாளர்கள் ஈர்ப்பை அதிகரித்து அவர்களின் விற்பனையை உயர்த்துகிறது. இது கிட்டத்தட்ட வணிகத்தின் அணைத்து பிரிவுகளையும் கவனித்து விற்பனையாளர்களின் இலாபத்தை உயர்த்துகிறது.</p>
		<p>இதனால் விற்பனையாளர் மற்றும் வாடிக்கையாளர் இருவருக்கும் பயனளிக்கிறது. அதனால் இருவரும் சேர்ந்து மற்றவர்களை Bon’ல் சேர உதவி செய்து வெற்றி காண வேண்டும்.</p> 
		<p>விற்பனையாளர் BoN’ல் சேர்ந்து அவர்களின் அன்றாட வாடிக்கையாளர்களை BoN’ஐ உபயோகப்படுத்துமாறு கேட்டு கொண்டு அவர்களின் வெளியிட்ட விளம்பரங்களை கண்டு பயன் பெற செய்ய வேண்டும்.</p>
		<p>வாடிக்கையாளர் BoN’ல் சேர்ந்து அவர்களின் அன்றாட விற்பனையாளர்களை BoN’ல் சேரச் சொல்லி அவர்களின் விளம்பரங்களை மற்ற வாடிக்கையாளர்களுக்கும் தெரியப் படுத்த வேண்டும்.</p> 
		<p>நல்ல இலாபம் / சேமிப்பு பெறுவதற்கு இருவரின் ஈடுபாடும் தேவை.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven7">
          நான் ஒரு விற்பனையாளர், சில வகை வியாபாரங்களுக்கு ஏதாவது பொருந்தக்கூடிய கட்டுப்பாடு இருக்கிறதா?
        </a>
      </h4>
    </div>
    <div id="collapseSeven7" class="panel-collapse collapse">
      <div class="panel-body">
        <p>இல்லை, இது அணைத்து வகை வியாபாரங்களுக்குமானது. </p>
		<p>இது எல்லா விற்பனையாளர்களுக்கும் சிறந்த அணுகுமுறை, குறிப்பாக புதிய விற்பனையாளர்களுக்கும் மற்றும் வணிக குறிக்கோளுடனான விற்பனையாளர்களுக்கும். தனது பெயரினால் நடத்தும் வியாபார வணிகர்கள் முதலில் BoN’ல் சேர யோசிக்கலாம் அனால் வாடிக்கையாளர்கள் BoN’ஐ உபயோகிப்பிப்பதை கண்டு தனது பெயரைவிட வாடிக்கையாளர்களை கவர்வதையே வியாபார யுக்தி என்று உணர்ந்து கொள்வர். மற்றும் BoN’ஐ உபயோகிக்காத வாடிக்கையாளர்கள் மத்தியில் விற்பனையாளர்கள் தான் வைத்த விலையே சரி என கருதலாம். </p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEight8">
          அருகிலுள்ள விற்பனையாளர்கள் என் இடத்தில் BoN‘ஐப் பயன்படுத்துவதில்லை, நான் சேருவதற்கு முன் யாராவது சேர காத்திருக்கலாமா?
        </a>
      </h4>
    </div>
    <div id="collapseEight8" class="panel-collapse collapse">
      <div class="panel-body">
        <p>BoN’ன் நன்மை மற்றும் வசதியைக் கருத்தில் கொண்டு, குறைவான அல்லது உடனே அனைவரையும் சென்றடைந்திடும்.</p>
		<p>விற்பனையாளர்கள் தாமதித்தால் அவர்களின் போட்டியாளர்களுக்கு சாதகமாகிவிடும், அதனால் உடனே BoN’ல் சேர்வது நல்லது. இது முற்றிலும் இலவசம். BoN’ல் சேர்வதற்கோ அல்லது தங்கள் பொருட்களை சேர்ப்பதற்கோ அல்லது விளம்பரத்தை பதிவிறக்குவதற்கோ எவ்வித கட்டணமும் வசூலிக்க படமாட்டாது.</p>
		<p>மேலும் போட்டியின்றி உங்கள் வணிகத்தை முன்னிறுத்தலாம்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNine9">
			நான் கடை/நிறுவன உரிமையாளர் (விற்பனையாளர்), நான் எப்படி BoN இணையத்தளத்தில் சேரலாம்?
        </a>
      </h4>
    </div>
    <div id="collapseNine9" class="panel-collapse collapse">
      <div class="panel-body">
        <p>நான் கடை/நிறுவன உரிமையாளர் (விற்பனையாளர்), நான் எப்படி BoN இணையத்தளத்தில் சேரலாம்?</p>
        <ul>
		<li>i.	BoN’ல் பதிந்து விற்பனையாளராக உள்நுழையவும்.</li>
		<li>ii.	உங்கள் ‘My Account’ல் வியாபாரத்தைப் பற்றிய விவரங்களை கொடுக்கவும். (Business name, banner, category(s), location, etc.)</li>
		<li>iii.	BoN’ன் ஒப்புதலுக்குப் பிறகு நீங்கள் சேர்க்கப்படுவீர்கள்.</li>
		</ul>
		<p>சொந்த இணையதள அங்காடியை எந்த செலவுமில்லாமல் மார்க்கெட்டிங் பற்றி சிறிதும் கவலையின்றி உரிமம் பெற்று பயனடையலாம்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTen10">
			நான் ஏதாவது ஒன்றை வாங்க வேண்டுமென்றால் எவ்வாறு BoN இணைய தளத்தைப் பயன்படுத்த முடியும்?
        </a>
      </h4>
    </div>
    <div id="collapseTen10" class="panel-collapse collapse">
      <div class="panel-body">
        <p>கீழுள்ள எளிய வழிமுறைகளை பின்பற்றவும்.</p>
		<ul>
		<li>i.	BoN’ல் பதிந்து வாடிக்கையாளராக உள்நுழையவும். </li>
		<li>ii.	விளம்பரங்களை வடிகட்ட, முகப்புப் பக்கத்தில் வகைகளைத் தேர்வுசெய்யவும். உங்களை ஈர்க்கும் கடை/நிறுவனத்தை தேர்ந்தெடுத்து விரும்பிய பொருளை தேடிடவும். தேடிய பொருளை உங்கள் cart’ல் (Add to cart) சேர்க்கவும்.</li>
		<li>iii.	மேலும் நீங்கள் விரும்பும் பொருளை முகப்பு பக்கத்தில் தேடலாம். தங்களது கடை/ நிறுவனம் தேடல் முடிவில் பொருட்களை தேடி cart’ல் (Add to cart) சேர்க்கவும்.</li>
		<li>iv.	Cart’ல் சேர்த்த பொருளை வாங்கவும்.</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven11">
			வலைத்தளத்தில் என்னைக் சுற்றி எந்த கடை/நிறுவனங்களையும் நான் காணவில்லை?
        </a>
      </h4>
    </div>
    <div id="collapseEleven11" class="panel-collapse collapse">
      <div class="panel-body">
        <p>நீங்கள் கீழுள்ள இரண்டு காரணங்களால் மட்டுமே காணவில்லை.</p>
        <ul>
		<li>i.	நீங்கள் அமைத்த வரம்பிலிருந்து, உங்கள் அருகில் எந்த கடை/நிறுவனமோ இல்லை. வரம்பை மாற்றி மீண்டும் தேடவும். நீங்கள் இன்னும் காணவில்லை என்றால், நீங்கள் முகப்பு பக்கத்தில் இடம் மாற்றி மறுபடியும் தேடி முயற்சிக்கவும். </li>
		<li>ii.	கடைகள்/நிறுவனங்கள் BoN’ல் இணைந்திருக்கவில்லை.
	இது இலவசம் என்பதால் விற்பனையாளர்களின் அறியாமையே காரணமாக இருக்க முடியும். அவர்களுக்கு அறியப்படுத்தி மற்றும் BoN’ல் இனைய செய்து உங்களுக்கும் மற்றவர்களுக்கும் பயன் பெற உதவவும்.
</li>
		</ul>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve12">
			நீங்கள் என் கடையை பதிவு செய்ய ஒரு முறை அல்லது மாத கட்டணம் வசூலிக்கிறீர்களா?
        </a>
      </h4>
    </div>
    <div id="collapseTwelve12" class="panel-collapse collapse">
      <div class="panel-body">
        <p>இல்லை, BoN’ல் சேர மற்றும் தங்களது கடை/நிறுவனத்தை பதிவு செய்ய முற்றிலும் “இலவசமாகும்”.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThirteen13">
			உங்கள் வலைத்தளத்தில் இலவசமாக பொருட்களைப் பதிவேற்றலாம் அல்லது விளம்பரங்களை வெளியிடலாம் என்பதை நான் கேள்விப்பட்டிருக்கிறேன், இது உண்மைதானா?
        </a>
      </h4>
    </div>
    <div id="collapseThirteen13" class="panel-collapse collapse">
      <div class="panel-body">
        <p>ஆம், உங்கள் பொருட்களை சேர்க்க மற்றும் விளம்பரங்களை பதிவேற்ற முற்றிலும் இலவசம். </p> 
		<p>மேலும் BoN’ன் கவனத்தில் குறைந்தது முதல் அதிக வருவாய் ஈட்டும் கடை/நிறுவனம் உள்ளது என்பதினால், அணைத்து விற்பனையாளர்களையும் மகிழ்விக்க ஏல அணுகுமுறை பின்பற்றப்படுகிறது. நீங்கள் ஏற்கனவே உள்ள பட்டியலிலிருந்து விரும்பிய இடத்தை பட்ஜெட்டின்படி தேர்வு செய்து தங்களது விளம்பரத்தை பதிவேற்றலாம்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFourteen14">
			இது தான் சிறந்த அணுகுமுறை என்று நான் நினைக்கிறேன், ஆனால் நீங்கள் BoN வலைத்தளத்தில் எப்படி அனைத்து கடைகளையும் சேர்க்க போகிறீர்கள்?
        </a>
      </h4>
    </div>
    <div id="collapseFourteen14" class="panel-collapse collapse">
      <div class="panel-body">
        <p>இது முற்றிலும் இலவசம் மற்றும் விற்பனையாளர்களுக்கும் வாடிக்கையாளர்களுக்கும் மிகவும் பயனுள்ளது என்பதால் அணைவருக்கும் தெரியப்படுத்த வேண்டும்.</p> 
		<p>மேடை அற்புதமாக அமைத்தாகிவிட்டது, கதவுகள் எல்லோருக்கும் திறந்துவிடப்பட்டுவிட்டது, நுழைவு கட்டணம் யாருக்கும் இல்லை மற்றும் முடிவில் அதிக பலனை பெற்றிடலாம்… வேறென்ன தேவை நமக்கு!!!</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFifteen15">
			என் பின்னூட்டம் (Feedback) அல்லது எந்தவொரு விஷயத்திற்காகவும் நான் தொடர்பு கொள்ள வேண்டும் என்றால் யாரை தொடர்பு கொள்ள வேண்டும்?
        </a>
      </h4>
    </div>
    <div id="collapseFifteen15" class="panel-collapse collapse">
      <div class="panel-body">
        <p>உங்கள் கருத்துகளை, பிரச்சனைகளை மற்றும் அக்கறைகளை முகப்பு பக்கத்திலுள்ள 'Feedback' menu’வில் பதிவு செய்யுங்கள். நாங்கள் உடனடியாக பதிலளிக்கிறோம்.</p>
<p>வேறு எந்த தகவலையும் அனுப்ப விரும்பினால், கொடுக்கப்பட்டுள்ள மின்னஞ்சலுக்கு அனுப்பவும் bononlineservices@buyonear.in. நாங்கள் 24 முதல் 48 மணி நேரத்தில் பதிலளிப்போம்.
</p> 

      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSixteen16">நான் வெளியிடும் விளம்பரம் நேரலையில் பார்க்கும்போது, அது குறைந்த பட தரமாக (மங்கலாக) காண்பிக்கிறதே?
        </a>
      </h4>
    </div>
    <div id="collapseSixteen16" class="panel-collapse collapse">
      <div class="panel-body">
        <p>BoN’ன் விளம்பர ஒப்புதல், நல்ல படத் தரம் மற்றும் விற்பனையாளர்கள் கவனத்தை எளிதில் பெறுவதற்கு முன் கீழே உள்ள புள்ளிகளை உறுதி செய்யுங்கள்.</p>
        <ul>
		<li>i.	தலைப்பு தெளிவாகவும் குறுகியதாகவும் இருக்க வேண்டும். </li> 
		<li>ii.	குறுக்கிடப்பட்ட படத் தரம் பிரகாசமானதாகவும், எளிதில் புரிந்துகொள்ளக்கூடியதாகவும், உயர்ந்த தரமானதாகவும் இருக்க வேண்டும்.</li>
		<li>iii.	'Description'ல் விளம்பரம் குறித்த விரிவான விளக்கத்தை வழங்கவும். இது கட்டாயமில்லை.</li>
		<li>iv.	URL’s உங்களிடமிருந்தால் வழங்கவும்.</li>
		</ul>
		<p>உண்மையான மற்றும் நல்ல தரமான விளம்பரமாக இருப்பின் நிச்சயம் வாடிக்கையாளரின் கவனத்தை அதிகரிக்கும் மற்றும் உங்கள் தரவரிசையையும் உங்கள் விற்பனையையும் அதிகரிக்கும்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeventeen17">
			நான் எப்போது My Wallet/Pay/Expense Report’ஐ பயன்படுத்த முடியும்?
        </a>
      </h4>
    </div>
    <div id="collapseSeventeen17" class="panel-collapse collapse">
      <div class="panel-body">
        <p>அவை வளர்ச்சியில் உள்ளன. பயனர்களின் பயன்பாட்டினைக் கருத்திற்கொண்டு சிறு மற்றம் செய்ய வேண்டிருக்கிறது.</p>
		<p>பயனர்களின் கருத்துக்களை கருத்தில் கொண்டு வடிவமைப்பு மற்றும் அணுகுமுறை முடிக்கப்பட்டவுடன், வெளியிடப்படும்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEighteen18">
			மேம்பாடுகள்/திட்டங்கள் ஏதாயினும் எதிர்காலத்தில் இருக்கிறதா?
        </a>
      </h4>
    </div>
    <div id="collapseEighteen18" class="panel-collapse collapse">
      <div class="panel-body">
        <p>ஆம், இன்னும் பல ஆச்சரியமான யோசனைகள் விரைவில் செயல்படுத்தப்பட உள்ளன. தயவு செய்து ஆச்சரியங்களுக்கு காத்திருங்கள் மற்றும் அனைவருக்கும் நன்மைக்கான செய்தியை பரப்புவதில் உங்கள் ஒத்துழைப்பை வழங்கவும்.
</p>
		<p>அனைவரின் நல் வாழ்க்கைக்கு ஒன்றாக செயல்படுவோம்.</p>
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNineteen19">
			BoN வலைத்தளம் அனைத்து ப்ரவுசர்களிலும் வேலை செயகிறதா?
        </a>
      </h4>
    </div>
    <div id="collapseNineteen19" class="panel-collapse collapse">
      <div class="panel-body">
        <p>கூகுள் குரோம், இன்டர்நெட் எஸ்ப்ளோரர் மற்றும் ஃபயர்ஃபாக்ஸ் ப்ரவுசர்களில் BoN வலைத்தளம் நன்றாக செயல்படுகிறது. நாங்கள் மூன்று ப்ரவுசர்களிலும் விரிவாக சோதனை செய்திருந்தாலும், எந்த ஒரு பிரௌசரிலும் எதேனும் சிக்கலை சந்திக்க நேர்ந்தால் மற்ற பிரௌசரில் முயற்சிக்கவும்.</p>

<p>Mobile app தற்போது வளர்ச்சியில் உள்ளது. பயனரின் வசதிக்காக அவற்றை வெளியிட கடினமாக உழைத்துக்கொண்டிருக்குகிறோம்.
</p>
		<p>மூன்று ப்ரவுசர்களிலும் செயல்படாவிட்டால் உங்கள் சிக்கலை ‘Feedback’ menu’வில் பதிவுசெய்யுங்கள்.</p>
      </div>
    </div>
  </div>

</div>



	</div>
<!-- tamil -->



				</div>
			</div>
		</div>
	</div>
	<!-- faq modal -->

  </div>
  </div>
  </div>

	<?php echo $footer; ?>