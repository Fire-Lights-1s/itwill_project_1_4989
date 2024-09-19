// 찜 등록 및 취소

function selectZzim() {
    const zzim_buttons = document.querySelectorAll('.zzim-button');
    zzim_buttons.forEach(button => {
        // 중복 방지를 위해 기존 리스너를 제거하고 새로 등록
        button.removeEventListener('click', zzimHandler);  // 기존 리스너 제거
        button.addEventListener('click', zzimHandler);      // 새 리스너 등록
    });
}

function zzimHandler(event) {
    const product_id = this.getAttribute('data-product_id');
    const member_id = this.getAttribute('data-member_id');
    const contextPath = "/secondhand4989";

    if (member_id === null || member_id === '') {
        alert('로그인한 회원만 이용 가능한 기능입니다');
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
	        console.log(data);
           if (data.save) {
		        setTimeout(() => {
		            this.classList.add('active');
		        }, 0);  // DOM이 업데이트될 시간을 줌
		    } else {
		        setTimeout(() => {
		            this.classList.remove('active');
		        }, 0);
		    }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
}

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



