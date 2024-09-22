let currentPage = 1;

// 메뉴의 카테고리와 필터의 카테고리 동기화
function getCategoryFromURL() {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get('category');
}

window.addEventListener('load', function() {
    const categoryParam = getCategoryFromURL();
    if (categoryParam) {
        $('#category-list li.selector').removeClass('selected');

        $('#category-list li.selector').each(function () {
            if ($(this).data('value') === categoryParam) {
                $(this).addClass('selected');
                $('#hidden-category').val(categoryParam);
            }
        });
    } else {
        $('#category-list li.selector[data-value="all"]').addClass('selected');
        $('#hidden-category').val('all');
    }
});


$(document).ready(function () {


    // 스크롤 이벤트 처리
    $(window).scroll(function() {
        if ($(this).scrollTop() > 300) { // 스크롤이 200px 이상 내려갔을 때
            $('#scrollToTop').fadeIn(); // 버튼 보이기
        } else {
            $('#scrollToTop').fadeOut(); // 버튼 숨기기
        }
    });

    // 버튼 클릭 시 페이지 맨 위로 스크롤
    $('#scrollToTop').click(function() {
        $('html, body').animate({ scrollTop: 0 }, 500); // 500ms 동안 부드럽게 스크롤
        return false;
    });

// 더보기 기능
    $(document).on('click', '#load_more', function() {

    currentPage++;

    // 기존 필터 정보 유지
    const filters = {};
        // 체크박스 선택 항목 수집
        document.querySelectorAll('#selector-content input[type="checkbox"]:checked').forEach(function(cb) {
            filters[cb.name] = filters[cb.name] || [];
            filters[cb.name].push(cb.value);
        });

        // 카테고리, 가격대, 맞춤 가격대, 정렬 정보 유지
        filters['category'] = $('#category').val();
        filters['price'] = $('#price').val();
        filters['minPrice'] = $('#price_min').val();
        filters['maxPrice'] = $('#price_max').val();
        filters['sorting'] = $('#sorted').val();

        // 검색어 연계
        const search = $('#search_bar').val(); // 검색어가 있는 input 필드에서 값 가져오기
        let queryParams = '';
        if (search && search.trim() !== '') {
            queryParams = `?search=${encodeURIComponent(search)}`;
        }

        $.ajax({
        url: contextPath + '/product' + queryParams,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
                page: currentPage,
                filters: filters
        }),
        success: function(response) {
            $('#product_container').append(response);
            selectZzim();
            loadZzimStatus();

            $('#load_more').remove();

            console.log(isLastPage);
            if (!isLastPage) {
                $('#product-list').append(`
                  <div id="load_more_container" style="text-align: center;">
                  <button id="load_more" class="btn btn-outline-dark">더 보기</button>
                  </div>
                  `);
            }
        },
        error: function(xhr, status, error) {
            console.error('AJAX 요청 오류:', error);
            console.error('상태 코드:', xhr.status);
            console.error('응답 메시지:', xhr.responseText);
        }
    });
});

});

// 여기서부터 필터 기능 구현.... 너무 대장정이었다....

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
        	document.getElementById('product-list').innerHTML =
                `<div style="display:flex; width:100%; height:100%; justify-content:center; align-items:center;">
                <img src="${contextPath}/resources/img/no_result.png" style="display:block; width:45%;">
            </div>`; // 각 그룹에서 아무것도 선택되지 않으면 결과 비우기
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

        // 검색어 연계
        const search = $('#search_bar').val(); // 검색어가 있는 input 필드에서 값 가져오기
        let queryParams = '';
        if (search && search.trim() !== '') {
            queryParams = `?search=${encodeURIComponent(search)}`;
        }

        currentPage = 1;    // 필터적용된 결과 출력 시 페이지번호 초기화
        
        fetch(contextPath + '/product' + queryParams, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                page: currentPage,
                filters: selectedFilters })
        })
        .then(response => response.text())
        .then(html => {
            updateProductList(html);
            selectZzim();
            loadZzimStatus();

            let isLastPage = $('#page-checker').data('isLastPage');

            if (!isLastPage) {
                $('#product-list').append(`
                  <div id="load_more_container" style="text-align: center;">
                  <button id="load_more" class="btn btn-outline-dark">더 보기</button>
                  </div>
                  `);
            }

        });
    }
        
    // 상품 목록 업데이트 함수 (서버에서 받은 HTML을 DOM에 추가하는 방식)
    function updateProductList(productsHtml) {
    document.getElementById('product-list').innerHTML = productsHtml ||
        `<div style="display:flex; width:100%; height:100%; justify-content:center; align-items:center;">
                <img src="${contextPath}/resources/img/no_result.png" style="display:block; width:45%;">
            </div>`;
	}
	
});
