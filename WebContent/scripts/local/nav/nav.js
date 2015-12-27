function setCurrency(currencyCode){
	//alert('setCurrency()');
	
	$.ajax({
		type:"post",
		url:"set_currency.do?currencyCode="+currencyCode,
		dataType:"json",
		timeout : 30000,
		
		success:function(data){
			alert(data.currency);
			$("#txt_currency").html(data.currency);
			//location.reload();
		},
		error:function(){
			alert("ERROR: Currency changing failed.");	 
		},			
		complete: function(XMLHttpRequest, textStatus){
			
		}		
	});
}