<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true">
<%@page import="com.lexreception.util.CommonUtils"%>
<%@page import="com.lexreception.util.ModeUtil"%>
<%@page import="com.lexreception.controller.LexReceptionUpdateActionController"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Thank you | LexReception</title>
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<%@ include file="/includes/scripts.jsp" %> 
<%CommonUtils.writeCookies(request,response);%>
 <% 
	 ModeUtil mode = new ModeUtil();
	 String sMode = mode.getMode(); 
	 String trackingId   = "";
	 String modeValue    = "";
	    String tranxid 	= request.getParameter("company");
	    String personid =  request.getParameter("contactId");
	    System.out.println("Company value is :"+tranxid+" Person id : " +personid); 
	 if(sMode.equalsIgnoreCase("LIVE"))
	 {
	 	trackingId	    =	"UA-29364628-1";
	 	modeValue		=	"live";
	 }
	 else
	 {
	 	trackingId 		= 	"UA-29364628-3";
	 	modeValue		=	"staging";
	 }
  
%>  
<%-- 
<script type="text/javascript">
	var uniquePIN	= '<%=request.getParameter("contactId")%>';
	console.log("uniquePIN from request==========>"+uniquePIN);
	var _gaq = _gaq || [];

  _gaq.push(['_setAccount', '<%=trackingId%>']);
  _gaq.push(['_setDomainName', 'lex-reception.appspot.com']);
  if(typeof(_vis_opt_GA_track) == "function") { _vis_opt_GA_track(); }
  _gaq.push(['_trackPageview']);
  _gaq.push(['_addTrans',
	'<%=tranxid%>_<%=personid%>', // order ID - required
  'Registration', // affiliation or store name
  '0', // total - required
  '0', // tax
  '0', // shipping
  '', // city
  '', // state or province
  '' // country
  ]);

  // add item might be called for every item in the shopping cart
   // where your ecommerce engine loops through each item in the cart and
   // prints out _addItem for each
  _gaq.push(['_addItem',
    '<%=tranxid%>_<%=personid%>',           // transaction ID - required
    '<%=tranxid%>_<%=personid%>',           // SKU/code - required
    'Registration',        // product name
    'Lead',   // category or variation
    '0',          // unit price - required
    '1'               // quantity - required
  ]);
  _gaq.push(['_trackTrans']); //submits transaction to the Analytics servers

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script> --%>
<!-- Start Visual Website Optimizer Asynchronous Code -->
<script type='text/javascript'>
var _vwo_code=(function(){
var account_id=108165,
settings_tolerance=2000,
library_tolerance=2500,
use_existing_jquery=false,
// DO NOT EDIT BELOW THIS LINE
f=false,d=document;return{use_existing_jquery:function(){return use_existing_jquery;},library_tolerance:function(){return library_tolerance;},finish:function(){if(!f){f=true;var a=d.getElementById('_vis_opt_path_hides');if(a)a.parentNode.removeChild(a);}},finished:function(){return f;},load:function(a){var b=d.createElement('script');b.src=a;b.type='text/javascript';b.innerText;b.onerror=function(){_vwo_code.finish();};d.getElementsByTagName('head')[0].appendChild(b);},init:function(){settings_timer=setTimeout('_vwo_code.finish()',settings_tolerance);this.load('//dev.visualwebsiteoptimizer.com/j.php?a='+account_id+'&u='+encodeURIComponent(d.URL)+'&r='+Math.random());var a=d.createElement('style'),b='body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}',h=d.getElementsByTagName('head')[0];a.setAttribute('id','_vis_opt_path_hides');a.setAttribute('type','text/css');if(a.styleSheet)a.styleSheet.cssText=b;else a.appendChild(d.createTextNode(b));h.appendChild(a);return settings_timer;}};}());_vwo_settings_timer=_vwo_code.init();
</script>
<!-- End Visual Website Optimizer Asynchronous Code -->

</head>
<body class="register1">

	<!-- ClickTale Top part -->
	<script type="text/javascript" src="clicktale/clicktale_top.js"> </script>

	<!-- ClickTale end of Top part -->

<div id="wrapper">
	<%@ include file="/includes/header1.jsp" %>
    <div id="banner1">
    	<h2>Quick Signup, Huge Payoff</h2>
        <h1>Plans & Pricing</h1>
    </div><!-- banner1 -->
    <div class="content_wrapper">
		
<%-- 		<h2><center>The Plans We Offer After Your Trial</center></h2> --%>
     <div class="our_plan active_hold">
            <div class="plan_s">
                <h3><label>Suggested For You</label>Small</h3>
                <b>175 min. at $199/month</b>
                <p>$0 setup fee<br />1 free voicemail box<br />Free appointment setting<br />Access your messages online</p>
                <div class="btn_blue">
					<a href="javascript:void(0);" id="signup_url1" class="grey-text">Sign Up</a>
				</div>
            </div><!--plan_s-->

            <div class="plan_m active_plan">
                <h3><label>Suggested For You</label>Medium</h3>
                <b>350 min. at $349/month</b>
                <p>$0 setup fee<br />2 free voicemail boxes<br />Free appointment setting<br />Access your messages online</p>
                <div class="btn_blue">
				<a href="javascript:void(0);" id="signup_url2" class="grey-text">
					<!-- <span class="small">Most Popular Plan</span> -->
					Sign Up
				</a>
				</div>
            </div><!--plan_m-->

            <div class="plan_l">
                <h3><label>Suggested For You</label>Large</h3>
                <b>700 min. at $599/month</b>
                <p>$0 setup fee<br />3 free voicemail boxes<br />Free appointment setting<br />Access your messages online</p>
                <div class="btn_blue">
					<a href="javascript:void(0);" class="grey-text" id="signup_url3">Sign Up</a>
				</div>
            </div><!--plan_l-->
            <div class="clear"></div>
        </div><!--our_plan -->	
       
        <div class="clear"></div>
        <div class="more_min">
        	<h3>Looking For More Mintues Per Month?</h3>
        	<p>Contact us at <a>info@lexreception</a> or start a <a>Live Chat</a> with our sales team for<br/>information on custom plans.</p>
        </div>
    </div><!--content_wrapper-->
     <div class="content_wrapper pp_content">
    	<h3>Quick Signup, Huge Payoff</h3>
  		<div class="col1">
        	<p>First, we'll talk shop. Over the phone, your account manager will inquire about your business' specific needs, and you'll hear firsthand how they'll sound to your customers. Any questions you have, they'll answer. You're in control. You can choose whichever tools you need.</p>
        </div><!--col1-->
        <div class="col2">
        <p>LexReception is dynamic and completely adaptive.  As our relationship progresses, you might need (or not need) certain services, your customers' needs might change, or you might need us to handle spikes in call volume. <br /><b>Just let your account manager know.</b></p>
        </div><!--col2-->
        <div class="human_img"></div>
	<div class="clear"></div>
    </div><!--content_wrapper-->
    <div id="footer_wrapper">
    	<%@ include file="/includes/footer1.jsp" %> 
        <div class="clear"></div>
    </div><!-- footer_warpper-->
 </div><!-- wrapper --> 
   
<!-- <script type="text/javascript" src="http://webchat.conversionsupport.com/livechat/loadscript/1917887718"></script> -->
<script type="text/javascript">
	(function() {
		var stag = document.createElement('script'); stag.type = 'text/javascript'; stag.async = true;
		if(document.domain.indexOf("lexreceptionlive.appspot.com")!=-1 || document.domain=="www.lexreception.com")
		{
			stag.src = "http://webchat.conversionsupport.com/livechat/script_new/1917887718";	
		}
		else
		{
			stag.src = "http://staging.webchat.a-cti.com:8082/livechat/script_new/1917887718";	
		}
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(stag,s);
	})();
</script>

<!-- Google Code for New Registration Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 956110257;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "PEAjCP_BsgMQsav0xwM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/956110257/?label=PEAjCP_BsgMQsav0xwM&amp;guid=ON&amp;script=0"/>
</div>
</noscript> 

	<!-- ClickTale Bottom part -->
	<script type="text/javascript" src="clicktale/clicktale_bottom.js"> </script>
	<!-- ClickTale end of Bottom part -->

<!-- Google Code for Remarketing tag -->

<!-- Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. For instructions on adding this tag and more information on the above requirements, read the setup guide: google.com/ads/remarketingsetup -->

<script type="text/javascript">

/* <![CDATA[ */

var google_conversion_id = 956110257;

var google_conversion_label = "Q6jJCKfvzQQQsav0xwM";

var google_custom_params = window.google_tag_params;

var google_remarketing_only = true;

/* ]]> */

</script>

<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="../js/validatons.js"> </script>

<noscript>

<div style="display:inline;">

<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/956110257/?value=0&amp;label=Q6jJCKfvzQQQsav0xwM&amp;guid=ON&amp;script=0"/>

</div>

</noscript>
<script>
	$(document).ready(function() {
<%-- 		var numberDemo = '<%=session.getAttribute("demoNumber")%>'; --%>
		var numberDemo = '<%=request.getSession().getAttribute("demoNumber")%>';
		console.info("the number is this "+numberDemo);
		numberDemo	=	JSON.stringify(numberDemo).replace(/(\d{1})(\d{3})(\d{3})(\d{3})/, "$1 ($2) $3-$4");
		//(numberDemo).replace(/(\d{3})(\d{3})(\d{4})/, "($1) $2-$3");
		console.info("after formating :: "+numberDemo);
		numberDemo=JSON.parse(numberDemo);
		$('#demoNumber').append(numberDemo);
	});
</script>
<!-- start number replacer -->
<script type="text/javascript"><!--
vs_account_id      = "CtjSZVP7c5pt0gB9";
//--></script>
<script type="text/javascript" src="http://adtrack.voicestar.com/euinc/number-changer.js">
</script>
<!-- end ad widget -->
</body>
 </html>
 </compress:html>