// 카테고리 필터
document.querySelectorAll('#category-list li').forEach(function(item) {
    item.addEventListener('click', function() {
        // 모든 항목에서 'selected' 클래스 제거
        document.querySelectorAll('#category-list li').forEach(function(li) {
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


// 가격대 필터
document.querySelectorAll('#price-list li').forEach(function(item) {
    item.addEventListener('click', function() {
        // 모든 항목에서 'selected' 클래스 제거
        document.querySelectorAll('#price-list li').forEach(function(li) {
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


// 항목별 필터링 이벤트
document.querySelectorAll('#selector-content input[type="checkbox"], #category, #price').forEach(function(input) {
    input.addEventListener('change', function() {
        applyFilters();
    });
});

// 가격 직접 입력 버튼 이벤트
document.getElementById('price_selector').addEventListener('click', function() {
    applyFilters();
});


function applyFilters() {
	
    let selectedFilters = {};	// 필터링 요소를 담을 배열 변수
    
    console.log('start' + selectedFilters);
    
    // 체크박스 선택 항목 수집
    document.querySelectorAll('#selector-content input:checked').forEach(function(cb) {
        selectedFilters[cb.name] = selectedFilters[cb.name] || [];
        selectedFilters[cb.name].push(cb.value);
    });
    
    // 카테고리 선택 수집
    let category = document.getElementById('category').value;
    selectedFilters['category'] = category;
    
    // 가격대 선택 수집
    let price = document.getElementById('price').value;
    selectedFilters['price'] = price;

    // 맞춤 가격대 입력값 수집
    let minPrice = document.getElementById('price_min').value;
    let maxPrice = document.getElementById('price_max').value;
    if (minPrice) selectedFilters['minPrice'] = minPrice;
    if (maxPrice) selectedFilters['maxPrice'] = maxPrice;
    
    console.log(selectedFilters);
    /* 
    // 서버로 비동기 요청 보내기
    fetch('/filter-products', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(selectedFilters)
    })
    .then(response => response.json())
    .then(data => {
        // 상품 목록 업데이트
        updateProductList(data.products);
    }); */
}

function updateProductList(products) {
    let productListDiv = document.getElementById('product-list');
    productListDiv.innerHTML = '';
    products.forEach(product => {
        productListDiv.innerHTML += `<div class="product-item">${product.name}</div>`;
    });

}
}