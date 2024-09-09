let productID = chatRoomProductID ;
let buyerID = chatRoomBuyerID ;
let sellerID = chatRoomSellerID;
let title = chatRoomTitle;

		console.log(chatRoomProductID);
		console.log(chatRoomBuyerID);
		console.log(chatRoomSellerID);
		console.log(chatRoomTitle);
$(document).ready(function(){

	$("#startChat").click(function(){
	
		var form = document.createElement('form');
	
		var objs;
	
		objs = document.createElement('input');
		objs.setAttribute('type', 'hidden');
		objs.setAttribute('type', 'hidden');
		objs.setAttribute('name', 'product_id');
		objs.setAttribute('value', productID);
		form.appendChild(objs);
		
		objs = document.createElement('input');
		objs.setAttribute('type', 'hidden');
		objs.setAttribute('name', 'buyer_id');
		objs.setAttribute('value', buyerID);
		form.appendChild(objs);
		
		objs = document.createElement('input');
		objs.setAttribute('type', 'hidden');
		objs.setAttribute('name', 'seller_id');
		objs.setAttribute('value', sellerID);
		form.appendChild(objs);
		
		objs = document.createElement('input');
		objs.setAttribute('type', 'hidden');
		objs.setAttribute('name', 'title');
		objs.setAttribute('value', title);
		form.appendChild(objs);
	
		form.setAttribute('method', 'post');
	
		form.setAttribute('action', "../chat/createRoom");
	
		document.body.appendChild(form);
		
		form.submit();
	});	

});