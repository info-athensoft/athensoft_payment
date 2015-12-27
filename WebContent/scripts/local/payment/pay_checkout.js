function action_cont(cur_section_id, next_section_id) {
	/* save all billing fields into session object */
	/* show all billing info in Preview area*/
	
	
	//alert(cur_section_id);
	
	
	/* expand next section for next step and hide this section */
	
	//alert('action_continue');
	$('#'+cur_section_id).hide();
	
	var new_next_section_id = next_section_id;
	
	var value = $('input[name=bill_select_ship_addr]:checked').val();
	//alert (value);
	
	if(cur_section_id=="section_bill_info"){
		if(value == 'v1'){
			new_next_section_id = "section_ship_mthd";
		}
//		if(value == 'v2'){
//			new_next_section_id = "nextnext_id";
//		}
	}	
	$('#'+new_next_section_id).show();
	
	
	//
	if (cur_section_id == 'section_bill_info') {
		save_billing_info();
		if(value == 'v1'){
			//ship to billing address
			//step.1 save billing form as shipping form (literal value)
			//step.2 save shipping form into session
			save_shipping_from_billing_info()
		}
		if(value == 'v2'){
			//ship to different address (shipping address)
		}
		
		
	}
	else if (cur_section_id == 'section_ship_info') {
		//alert("cur_section_id= "+cur_section_id);
		save_shipping_info();
	}
	else if (cur_section_id == 'section_ship_mthd') {
		save_ship_freight();  //including shipping methods
		
		//alert("ok");
		get_cart_form_session();  //get cart details
		
		
	}
	else if (cur_section_id == 'section_pay_method') {
		save_pay_method();
	}
}

function action_back(cur_section_id, pre_section_id) {
	//alert('action_continue');
	$('#'+cur_section_id).hide();
	
	var new_pre_section_id = pre_section_id;
	
	var value = $('input[name=bill_select_ship_addr]:checked').val();
	//alert (value);
	
	if(cur_section_id=="section_ship_mthd"){
		if(value == 'v1'){
			new_pre_section_id = "section_bill_info";
		}
	}
	
	$('#'+new_pre_section_id).show();
}

function ship_use_bill_addr_toggle() {
	
//	var value = $('#ship_use_bill_addr').val();
//	alert (value);
	if ($('#ship_use_bill_addr').is(":checked")) {//if (value == 'on') {
		$("#ship_paymentAmount").val($('#bill_paymentAmount').val());
		//$("#ship_paymentType").val($('#bill_paymentType').val());
		$("#ship_fname").val($('#bill_fname').val());
		$("#ship_lname").val($('#bill_lname').val());
		$("#ship_company").val($('#bill_company').val());
		$("#ship_email").val($('#bill_email').val());
		$("#ship_addr1").val($('#bill_addr1').val());
		$("#ship_addr2").val($('#bill_addr2').val());
		$("#ship_city").val($('#bill_city').val());
		$("#ship_prov").val($('#bill_prov').val());
		$("#ship_postal").val($('#bill_postal').val());
		$("#ship_country").val($('#bill_country').val());
		$("#ship_phone").val($('#bill_phone').val());
		$("#ship_fax").val($('#bill_fax').val());
	}
	else {
		//alert('value is not on!');
		//$("#ship_paymentType").val(''); //removeAttr('value');//
		$("#ship_fname").val('');
		$("#ship_lname").val('');
		$("#ship_company").val('');
		$("#ship_email").val('');
		$("#ship_addr1").val('');
		$("#ship_addr2").val('');
		$("#ship_city").val('');
		$("#ship_prov").val('');
		$("#ship_postal").val('');
		$("#ship_country").val('');
		$("#ship_phone").val('');
		$("#ship_fax").val('');
	}
}

function select_payment_option() {
	var paymentOption = $("input[name='paymentOption']:checked").val();
	//alert(paymentOption);
	if (paymentOption=="PayPal") {
		$('#form_checkout').submit();
	}
	else {
		//show card info
		//alert("CC");
		var cur_section_id = 'section_pay_method';
		var next_section_id = 'section_cc_info';
		action_cont(cur_section_id, next_section_id);
	}
	
	//window.location = "do_billing.do";
}





/* checkout form process */
function save_billing_info() {
	
	//create a json object
	var p1 = $("#bill_paymentAmount").val();
	var p2 = $("#bill_currencyCodeType").val();
	var p3 = $("#bill_paymentType").val();
	var p4 = $("#bill_fname").val();
	var p5 = $("#bill_lname").val();
	var p6 = $("#bill_company").val();
	var p7 = $("#bill_email").val();
	var p8 = $("#bill_addr1").val();
	var p9 = $("#bill_addr2").val();
	var p10 = $("#bill_city").val();
	var p11 = $("#bill_prov").val();
	var p12 = $("#bill_postal").val();
	var p13 = $("#bill_country").val();
	var p14 = $("#bill_phone").val();
	var p15 = $("#bill_fax").val();
	
	//alert(p1);
	var itemClassObject =
	{
			paymentAmount : p1 ,
			currencyCodeType : p2 ,
			paymentType : p3 ,
			fname : p4 ,
			lname : p5 ,
			company : p6 ,
			email : p7 ,
			addr1 : p8 ,
			addr2 : p9 ,
			city : p10 ,
			prov : p11 ,
			postal : p12 ,
			country : p13 ,
			phone : p14 ,
			fax : p15
	};
	
	
	$.ajax({
		type:"post",
		url:"form_billing.do?itemJSONString="+JSON.stringify(itemClassObject),
		dataType:"json",
		timeout : 5000,
		success:function(data){
			var billingForm = data.billingForm;
			//alert(billingForm.paymentAmount);
			
			var str = "<h4>Billing info</h4>"+
						"paymentAmount : "+billingForm.paymentAmount+"<br />"+
						"currencyCodeType : "+billingForm.currencyCodeType+"<br />"+
						"paymentType : "+billingForm.paymentType+"<br />"+
						"billToName : "+billingForm.fname+" "+billingForm.lname+"<br />"+
						"Company : "+billingForm.company+"<br />"+
						"billToStreet : "+billingForm.addr1+"<br />"+
						"billToStreet2 : "+billingForm.addr2+"<br />"+
						"billToCity : "+billingForm.city+"<br />"+
						"billToState : "+billingForm.prov+"<br />"+
						"billToCountryCode : "+billingForm.country+"<br />"+
						"billToZip : "+billingForm.postal+"<br />"+
						"phoneNum : "+billingForm.phone+"<br />";
			
			$("#preview_billing").html(str);
		},
		error:function(){
			alert("save_billing_info failed.");	 
		},			
		complete: function(XMLHttpRequest, textStatus){
			//reset to avoid duplication
		}		
	});
}


function save_shipping_info() {
	
	//create a json object
	var p1 = $("#ship_paymentAmount").val();
	var p2 = $("#ship_currencyCodeType").val();
	var p3 = $("#ship_paymentType").val();
	var p4 = $("#ship_fname").val();
	var p5 = $("#ship_lname").val();
	var p6 = $("#ship_company").val();
	var p7 = $("#ship_email").val();
	var p8 = $("#ship_addr1").val();
	var p9 = $("#ship_addr2").val();
	var p10 = $("#ship_city").val();
	var p11 = $("#ship_prov").val();
	var p12 = $("#ship_postal").val();
	var p13 = $("#ship_country").val();
	var p14 = $("#ship_phone").val();
	var p15 = $("#ship_fax").val();
	
	//alert(p1);
	var itemClassObject =
	{
			paymentAmount : p1 ,
			currencyCodeType : p2 ,
			paymentType : p3 ,
			fname : p4 ,
			lname : p5 ,
			company : p6 ,
			email : p7 ,
			addr1 : p8 ,
			addr2 : p9 ,
			city : p10 ,
			prov : p11 ,
			postal : p12 ,
			country : p13 ,
			phone : p14 ,
			fax : p15
	};
	
	
	$.ajax({
		type:"post",
		url:"form_shipping.do?itemJSONString="+JSON.stringify(itemClassObject),
		dataType:"json",
		timeout : 5000,
		success:function(msg){
			var shippingForm = msg.shippingForm;
			//alert('shipingForm.paymentAmount');
			//alert(shippingForm.paymentAmount);
			var str = "<h4>Shiping info</h4>"+
						"paymentAmount : "+shippingForm.paymentAmount+"<br />"+
						"currencyCodeType : "+shippingForm.currencyCodeType+"<br />"+
						"paymentType : "+shippingForm.paymentType+"<br />"+
						"shipToName : "+shippingForm.fname+" "+shippingForm.lname+"<br />"+
						"Company : "+shippingForm.company+"<br />"+
						"shipToStreet : "+shippingForm.addr1+"<br />"+
						"shipToStreet2 : "+shippingForm.addr2+"<br />"+
						"shipToCity : "+shippingForm.city+"<br />"+
						"shipToState : "+shippingForm.prov+"<br />"+
						"shipToCountryCode : "+shippingForm.country+"<br />"+
						"shipToZip : "+shippingForm.postal+"<br />"+
						"phoneNum : "+shippingForm.phone+"<br />";
			
			$("#preview_shipping").html(str);
		},
		error:function(){
			alert("save_shipping_info failed.");	 
		},			
		complete: function(XMLHttpRequest, textStatus){
			//reset to avoid duplication
		}		
	});
}

function save_shipping_from_billing_info() {
	
	//create a json object
	var p1 = $("#bill_paymentAmount").val();
	var p2 = $("#bill_currencyCodeType").val();
	var p3 = $("#bill_paymentType").val();
	var p4 = $("#bill_fname").val();
	var p5 = $("#bill_lname").val();
	var p6 = $("#bill_company").val();
	var p7 = $("#bill_email").val();
	var p8 = $("#bill_addr1").val();
	var p9 = $("#bill_addr2").val();
	var p10 = $("#bill_city").val();
	var p11 = $("#bill_prov").val();
	var p12 = $("#bill_postal").val();
	var p13 = $("#bill_country").val();
	var p14 = $("#bill_phone").val();
	var p15 = $("#bill_fax").val();
	
	//alert(p1);
	var itemClassObject =
	{
			paymentAmount : p1 ,
			currencyCodeType : p2 ,
			paymentType : p3 ,
			fname : p4 ,
			lname : p5 ,
			company : p6 ,
			email : p7 ,
			addr1 : p8 ,
			addr2 : p9 ,
			city : p10 ,
			prov : p11 ,
			postal : p12 ,
			country : p13 ,
			phone : p14 ,
			fax : p15
	};
	
	
	$.ajax({
		type:"post",
		url:"form_shipping.do?itemJSONString="+JSON.stringify(itemClassObject),
		dataType:"json",
		timeout : 5000,
		success:function(msg){
			var shippingForm = msg.shippingForm;
			//alert('shipingForm.paymentAmount');
			//alert(shippingForm.paymentAmount);
			var str = "<h4>Shiping info</h4>"+
						"paymentAmount : "+shippingForm.paymentAmount+"<br />"+
						"currencyCodeType : "+shippingForm.currencyCodeType+"<br />"+
						"paymentType : "+shippingForm.paymentType+"<br />"+
						"shipToName : "+shippingForm.fname+" "+shippingForm.lname+"<br />"+
						"Company : "+shippingForm.company+"<br />"+
						"shipToStreet : "+shippingForm.addr1+"<br />"+
						"shipToStreet2 : "+shippingForm.addr2+"<br />"+
						"shipToCity : "+shippingForm.city+"<br />"+
						"shipToState : "+shippingForm.prov+"<br />"+
						"shipToCountryCode : "+shippingForm.country+"<br />"+
						"shipToZip : "+shippingForm.postal+"<br />"+
						"phoneNum : "+shippingForm.phone+"<br />";
			
			$("#preview_shipping").html(str);
		},
		error:function(){
			alert("save_shipping_info failed.");	 
		},			
		complete: function(XMLHttpRequest, textStatus){
			//reset to avoid duplication
		}		
	});
}

function save_ship_freight() {
	var value = $('input[name=ship_method]:checked').val(); //v1:standard shipping, v2: free shipping, v3: pickup in store
//	alert (value);
	
	var p1 ; //ship method
	var p2 ; //freight rule
	var p3 ; //fright amount
	
	/*
	 *  if value = v1   
	 *  p1 = ShipMethod.CanadaPost
	 *  p2 = FreightRule.CHARGE
	 *  p3 = 9.95
	 *  
	 *  
	 *  if value = v2
	 *  p1 = ShipMethod.CanadaPost
	 *  p2 = FreightRule.FREE
	 *  p3 = 0
	 *  
	 *  
	 *  if value = v3
	 *  p1 = ShipMethod.PickUp
	 *  p2 = FreightRule.FREE
	 *  p3 = 0
	 * 
	 * 
	 */
	
	if(value=='v1'){
		p1 = "canadapost";
		p2 = "charge";
		p3 = 9.95;
	}
	if(value=='v2'){
		p1 = "canadapost";
		p2 = "free";
		p3 = 0;
	}
	if(value=='v3'){
		p1 = "pickup";
		p2 = "free";
		p3 = 0;
	}
	
	
	var itemClassObject =
	{
			shipMethod : p1,
			freightRule : p2,
			freightAmount : p3
	};
	
	$.ajax({
		type:"post",
		url:"form_freight.do?itemJSONString="+JSON.stringify(itemClassObject),
		dataType:"json",
		timeout : 5000,
		success:function(msg){
			// display payment detail
			var freightForm = msg.freightForm;
			
			var str = "<h4>Your order summary</h4>"+
						"shipMethod : "+freightForm.shipMethod+"<br />"+
						"freightRule : "+freightForm.freightRule+"<br />"+
						"freightAmount : "+freightForm.freightAmount+"<br />";
						
			
			$("#preview_order").html(str);
		},
		error:function(){
			alert("save_ship_mthd failed.");	 
		},			
		complete: function(XMLHttpRequest, textStatus){
			//reset to avoid duplication
		}		
	});
	
}

function get_cart_form_session(){
	
	$.ajax({
		type:"post",
		url:"cart_detail.do",
		dataType:"json",
		timeout : 5000,
		success:function(msg){
			//order info
			var itemAmount = msg.itemAmount;
			var taxAmount = msg.taxAmount;
			var shippingFee = msg.shippingFee;
			var handlingFee = msg.handlingFee;
			var paymentAmount = msg.paymentAmount;
			
			
			// display payment detail
			var itemCartMap = msg.itemCartMap;
			//var itemCartMapStat = msg.itemCartMapStat;
			
			var str = "<h3>Cart Details</h3>";
			for (var i in itemCartMap)	{
				str += (itemCartMap[i].itemCode+" "+itemCartMap[i].itemName+" "+itemCartMap[i].itemDesc+" "+itemCartMap[i].price+" "+itemCartMap[i].qty)+"<br/>";
			} 		
			
			$("#preview_order_detail").html(str);
			
			
			//order info
			var str2 = "<h4>order info</h4>";
			str2 += "itemAmount"+itemAmount+"<br/>";
			str2 += "taxAmount"+taxAmount+"<br/>";
			str2 += "shippingFee"+shippingFee+"<br/>";
			str2 += "handlingFee"+handlingFee+"<br/>";
			str2 += "paymentAmount"+paymentAmount+"<br/>";
			
			$("#preview_order_info").html(str2);
			
			
		},
		error:function(){
			alert("ERROR: get cart detail failed.");	 
		},			
		complete: function(XMLHttpRequest, textStatus){
			//reset to avoid duplication
		}		
	});
}


//2015-08-08 for athensoft website
function placeOrder(){
	var paymentOption = $("input[name='paymentOption']:checked").val();
	alert(paymentOption);
	//if (paymentOption=="PayPal") {
		$('#form_checkout').submit();
	//}
}

function paypalClick() {
	$("#creditTitle").css("display", "none");
	$("#creditContent").css("display", "none");
	$("#paypalTitle").css("display", "none");
	$("#paypalContent").css("display", "block");
	$("#changePaymentMethodSection").css("display", "block");
}

function creditCardClick() {
	$("#creditTitle").css("display", "none");
	$("#creditContent").css("display", "block");
	$("#paypalTitle").css("display", "none");
	$("#paypalContent").css("display", "none");
	$("#changePaymentMethodSection").css("display", "block");
}

function changePaymentMethodClick() {
	$("#creditContent").css("display", "none");
	$("#paypalContent").css("display", "none");
	$("#paypalTitle").css("display", "block");
	$("#creditTitle").css("display", "block");
	$("#changePaymentMethodSection").css("display", "none");
	
}


function initAlertMessage(){
	$("#alert-success").css("display", "none");
	$("#alert-danger").css("display", "none");
}

function successMessage(){
	//alert("successMessage");
	$("#alert-danger").css("display", "none");
	$("#alert-success").css("display", "block");
	
}


//only for step 6
function doCreditPayment(){
	$('#form_checkout').submit();
}

//paypal method - confirm payment
//2015-10-04
function doConfirmPayment(){
	var url = "do_confirm.do";
	$.ajax({
		type:"post",
		url:"do_confirm.do",
		dataType:"json",
		timeout : 30000,
		success:function(data){
//			alert(data);
			
			var strAck = data.Payment_Ack;	
			
			//alert(strAck);
			
			if(strAck=="Success"|| strAck=="SuccessWithWarning" || strAck=="success" || strAck=="successWithWarning"){
				$("#alert-success").css("display", "block");
				$("#alert-danger").css("display", "none");
				
				
				var str_btn_return = '<button class="btn btn-success btn-lg" onclick="returnHome();" >Return home</button>';
				$("#post_payment").html(str_btn_return);
				
			}else{
				$("#alert-success").css("display", "none");
				$("#alert-danger").css("display", "block");
			}
			
			
		},
		error:function(){
			alert("ERROR: payment via paypal failed.");	 
		},			
		complete: function(XMLHttpRequest, textStatus){
			//reset to avoid duplication
		}		
	});
}

function returnHome(){
	window.location = "index.jsp";
}




