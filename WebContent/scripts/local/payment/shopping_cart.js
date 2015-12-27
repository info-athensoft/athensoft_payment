function goBackShopping() {
    //window.history.back();//history.go(-1)
    window.location = "ecomm_starter.do";
}

function removeProd(itemId){
	//alert('why');
	//alert("remove from shopping cart, itemId = "+itemId);
	
	//regular product
	if(itemId!=-1){
		window.location = "remove_product.do?itemId="+itemId;
	}
	//discount virtual entry
	else{
		cancelCoupon();
	}
	
}

function clearCart(){
	//alert("clearCart");
	window.location = "clear_cart.do";
}

function updateCart(itemId, obj){
	//alert('enter');
	if ( (obj.value+"").match(/^[1-9]\d*$/) ) {
		  // alert ('integer');
		window.location = "update_cart.do?itemId="+itemId+"&qty="+obj.value;
		}
	else {
		//alert ('not integer');
		$(obj).val('');
	}
	//$('input.itemid').match('integer', 'must be integer!');
	//alert("updateCart value=");
	
	
}

function applyCoupon(){
	var couponCode = $("#couponCode").val();
	
//	window.location = "apply_discount.do?couponCode="+couponCode;
	
	$.ajax({
		type:"get",
		url:"apply_discount.do?couponCode="+couponCode,
		dataType:"json",
//		timeout : 3000,
		
		success:function(data){
//			$("#couponCode").val(couponCode);
//			$("#couponCode").attr("disabled","disabled");
//			$("#discountAmt").html(data.discountAmt);
//			$("#orderTotal").html(data.orderTotal);
			location.reload();
			
		},
		
		error:function(){
			  alert("ERROR: coupon failed!");
		},
		
		complete: function(XMLHttpRequest, textStatus){
		}
	
	});

}

function cancelCoupon(){
	var couponCode = $("#couponCode").val();
	
	
	$.ajax({
		type:"get",
		url:"cancel_discount.do?couponCode="+couponCode,
		dataType:"json",
		
		success:function(data){
//			$("#couponCode").removeAttr("disabled");
//			$("#couponCode").val("");
//			$("#discountAmt").html(data.discountAmt);
//			$("#orderTotal").html(data.orderTotal);
			location.reload();
		},
		
		error:function(){
			  alert("ERROR: coupon failed!");
		},
		
		complete: function(XMLHttpRequest, textStatus){
		}
	
	});
	
}

/*
function getCouponObject(couponCode){
	var couponObject = new Object();			
	couponObject.couponCode = couponCode;
	couponObject.couponType = "percentage";//"amount";// 
	couponObject.couponValue = 50;
	couponObject.couponStatus = "valid";
	return couponObject;
}*/
		


