// 카테고리 선택
window.addEventListener('load', function() {
	
	document.querySelectorAll('#category-list li.selector').forEach(function(item) {
       item.addEventListener('click', function() {
           // 모든 항목에서 'selected' 클래스 제거
           document.querySelectorAll('#category-list li.selector').forEach(function(li) {
               li.classList.remove('selected');
           });
           
           // 클릭한 항목에 'selected' 클래스 추가
           this.classList.add('selected');
           
           // hidden input 값 설정
           document.getElementById('category').value = this.getAttribute('data-value');
           
           // 필터 적용 (비동기 요청)
           applyFilters();
       });
   });

 // 가격대 선택
 document.querySelectorAll('#price-list li.selector').forEach(function(item) {
     item.addEventListener('click', function() {
         // 모든 항목에서 'selected' 클래스 제거
         document.querySelectorAll('#price-list li.selector').forEach(function(li) {
             li.classList.remove('selected');
         });
         
         // 클릭한 항목에 'selected' 클래스 추가
         this.classList.add('selected');
         
         // hidden input 값 설정
         document.getElementById('price').value = this.getAttribute('data-value');
         
         // 필터 적용 (비동기 요청)
         applyFilters();
     });
 });

    // 체크박스 필터링
    document.querySelectorAll('#selector-content input[type="checkbox"]').forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            applyFilters();
        });
    });

    // 맞춤 가격 필터 적용 버튼
    document.getElementById('price_selector').addEventListener('click', function() {
    	// 위의 가격대 선택 해제
    	document.querySelectorAll('#price-list li.selector').forEach(function(li) {
            li.classList.remove('selected');
        });
        applyFilters();
    });
    
	 // 정렬 정보 수집
	document.querySelectorAll('#sorting button.sort_btn').forEach(function(item) {
   	item.addEventListener('click', function() {
       // 모든 항목에서 'selected' 클래스 제거
       document.querySelectorAll('#sorting button.sort_btn').forEach(function(button) {
           button.classList.remove('selected');
       });
       
       // 클릭한 항목에 'selected' 클래스 추가
       this.classList.add('selected');
       
       // hidden input 값 설정
       document.getElementById('sorted').value = this.getAttribute('data-value');
       
       // 필터 적용 (비동기 요청)
       applyFilters();
   		});
	});		
	
    
    
    // 필터 적용 함수
    function applyFilters() {
        let selectedFilters = {}; // 필터 데이터를 담을 객체

        let tradeMethodSelected = false;
        let paymentMethodSelected = false;
		let tradeStatusSelected = false;
        
        // 체크박스 선택 항목 수집
        document.querySelectorAll('#selector-content input[type="checkbox"]:checked').forEach(function(cb) {
            selectedFilters[cb.name] = selectedFilters[cb.name] || [];
            selectedFilters[cb.name].push(cb.value);
            
            // 거래상태 필터 그룹 확인
            if (cb.name === "trade") {
                tradeStatusSelected = true;
            }
            
            // 거래방법 필터 그룹 확인
            if (cb.name === "method") {
                tradeMethodSelected = true;
            }
            
            // 결제수단 필터 그룹 확인
            if (cb.name === "pay") {
                paymentMethodSelected = true;
            }
        });

        if (!tradeMethodSelected || !paymentMethodSelected || !tradeStatusSelected) {
        	document.getElementById('product-list').innerHTML = '<p style="text-align:center;">결과가 없습니다.</p>'; // 각 그룹에서 아무것도 선택되지 않으면 결과 비우기
            return; // 함수 종료
        }
        
        // 카테고리 선택 수집
        selectedFilters['category'] = document.getElementById('category').value;

        // 가격대 선택 수집
        selectedFilters['price'] = document.getElementById('price').value;

        // 맞춤 가격대 수집        
        let minPrice = document.getElementById('price_min').value;
		let maxPrice = document.getElementById('price_max').value;

		// 빈 문자열일 경우 0으로 처리
		selectedFilters['minPrice'] = (minPrice !== "") ? minPrice : null;
		selectedFilters['maxPrice'] = (maxPrice !== "") ? maxPrice : null;
        
		// 정렬 선택 수집
		selectedFilters['sorting'] = document.getElementById('sorted').value;
		
        console.log(selectedFilters); // 최종 필터 데이터 확인 (비동기 요청 전에)
        
        const contextPath = "/secondhand4989";
        
        fetch(contextPath + '/product/filter', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(selectedFilters)
        })
        .then(response => response.text())
        .then(html => {
            updateProductList(html);
        });
    }
        
    // 상품 목록 업데이트 함수 (서버에서 받은 HTML을 DOM에 추가하는 방식)
    function updateProductList(productsHtml) {
    document.getElementById('product-list').innerHTML = productsHtml || '<p>결과가 없습니다.</p>';
	}
	
	loadZzimStatus();
	selectZzim();
	
});


