// 찜 등록 및 취소

function selectZzim() {
const zzim_buttons = document.querySelectorAll('.zzim-button');
zzim_buttons.forEach(button => {
	button.addEventListener('click', function() {
	    const product_id = this.getAttribute('data-product_id');
	    const member_id = this.getAttribute('data-member_id');
	    const contextPath = "/secondhand4989";
	    
	    if (member_id === null || member_id === '') {
	    	alert('로그인한 회원만 이용가능한 기능입니다')
	    	window.location.href = contextPath + '/member/login';	
	    } else {
		    fetch(contextPath + '/zzim/save', {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify({ product_id: product_id, member_id: member_id })
	    	})
	    	.then(response => response.json())
	    	.then(data => {
	        	if (data.save) {
	        		button.classList.add('active');
	        	} else {
	        		button.classList.remove('active');
	       		}
	    	})
	    .catch(error => {
	        console.error('Error:', error);
	    	});
   		}
	});
});
};

//찜 여부 가져와서 표시

function loadZzimStatus() {
	 const contextPath = "/secondhand4989";
 const member_id = document.querySelector('.zzim-button').getAttribute('data-member_id');

 if (member_id !== null && member_id !== '') {
 	//찜 버튼이 달려있는 (열람된 모든) 상품들의 product_id를 배열로 만들어 저장
 	const productIds = Array.from(document.querySelectorAll('.zzim-button')).map(button => button.getAttribute('data-product_id'));
		
     fetch(contextPath + '/zzim/status', {
         method: 'POST',
         headers: {
             'Content-Type': 'application/json'
         },
         body: JSON.stringify({ member_id: member_id, product_ids: productIds })
     })
     .then(response => response.json())
     .then(data => {
    	 const allButtons = Array.from(document.querySelectorAll('.zzim-button'));
         data.zzimList.forEach(product => {
        	 const matchingButton = allButtons.find(button => button.getAttribute('data-product_id') === product.product_id);
             if (matchingButton && product.isZzimSaved) {
                 matchingButton.classList.add('active');
             } else if (matchingButton) {
                 matchingButton.classList.remove('active');
             }
         });
     })
     .catch(error => {
         console.error('Error:', error);
     });
 }
};


// 처음 창 열릴 때 찜 활성화

window.onload = function() {
	loadZzimStatus();
	selectZzim();
};



