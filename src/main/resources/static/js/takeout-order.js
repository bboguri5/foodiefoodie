// 즉시 실행
(function () {

    // 메뉴 추가 버튼 클릭 이벤트
    menuAddClickEvent();

    // 주문 버튼 클릭 이벤트
    submitOrderClickEvent();

})();

// 메뉴 추가 버튼 클릭 이벤트
function menuAddClickEvent() {
    const menuAddBtn = document.querySelector('.menu-gallery');
    menuAddBtn.addEventListener('click', e => {
        // console.log(e.target.classList);
        if (e.target.classList.contains('menuAddBtn')) {
            // console.log('menuAddBtn clicked');
            addToOrder(e.target);
        }
    });
}

// ADD TO ORDER SUMMARY LIST
function addToOrder(target) {

    // get menu info
    const menuId = target.id;
    const menuInfo = document.getElementById('menu' + menuId);
    const menuName = document.getElementById('menu-name' + menuId).textContent;
    const menuPrice = document.getElementById('menu-price' + menuId).textContent;
    var totalPrice = document.getElementById('total').textContent;
    // console.log('totalPrice = ', totalPrice);

    // 이미 메뉴가 리스트에 들어있으면 quantity & price 정보 수정
    if (document.getElementById('order-name' + menuId) !== null) {

        // increase current quantity
        const currQuantity = document.querySelector('.order-quantity' + menuId).textContent;
        // console.log('current quantity - ', currQuantity);
        document.querySelector('.order-quantity' + menuId).textContent = parseInt(currQuantity) + 1;

        // increase menu price and total price
        document.getElementById('total').textContent = parseInt(totalPrice) + parseInt(menuPrice);
        var currentPrice = document.getElementById('order-price' + menuId).textContent;
        document.getElementById('order-price' + menuId).textContent = parseInt(currentPrice) + parseInt(
            menuPrice);
    } else { // 리스트에 비동기로 정보 추가

        let tag = '';
        tag +=
            `   <li id="order-name` + menuId + `">` +
            `       <a class="removeMenu" href="#0">` + menuName + `</a>` +
            `       <div id="order-quantity` + menuId + `" class="quantity ` + menuId + `">` +
            `           <i id="minus` + menuId + `" class=""></i><strong class="order-quantity` +
            menuId +
            `">0</strong><i id="plus` + menuId + `" class="icon_plus_alt2"></i>` + // maybe delete id
            `       </div>` +
            `       <span id="order-price` + menuId + `">` + menuPrice + `</span>` +
            `   </li>`;

        document.getElementById('async-order-list').innerHTML += tag;

        // 최종 가격 업데이트
        document.getElementById('total').textContent = parseInt(totalPrice) + parseInt(menuPrice);

    }

    // 주문 메뉴 개수 업다운 버튼 이벤트
    upDownQuantityClickEvent();

    // 주문 메뉴 삭제 이벤트
    deleteMenuFromOrderClickEvent();
}

// 주문 메뉴 개수 업다운 버튼 이벤트
function upDownQuantityClickEvent() {
    const targetBtn = document.querySelector('.click-target');

    targetBtn.onclick = e => {
        const menuId = e.target.parentElement.classList[1];
        if (e.target.classList.contains('icon_plus_alt2')) {
            console.log('plus clicked ', menuId);

            // increase current quantity
            const currQuantity = document.querySelector('.order-quantity' + menuId).textContent;
            // console.log('current quantity - ', currQuantity);
            document.querySelector('.order-quantity' + menuId).textContent = parseInt(currQuantity) + 1;

            // add minus button if more than one
            const newQuantity = document.querySelector('.order-quantity' + menuId).textContent;
            if (newQuantity > 1) {
                const minusBtn = document.getElementById('minus' + menuId);
                minusBtn.classList.add('icon_minus_alt2');

            }

            // increase menu price and total price
            var totalPrice = document.getElementById('total').textContent;
            const menuPrice = document.getElementById('menu-price' + menuId).textContent;
            document.getElementById('total').textContent = parseInt(totalPrice) + parseInt(menuPrice);
            var currentPrice = document.getElementById('order-price' + menuId).textContent;
            document.getElementById('order-price' + menuId).textContent = parseInt(currentPrice) + parseInt(
                menuPrice);

        } else if (e.target.classList.contains('icon_minus_alt2')) {
            console.log('minus clicked', menuId);

            // increase current quantity
            const currQuantity = document.querySelector('.order-quantity' + menuId).textContent;
            // console.log('current quantity - ', currQuantity);
            document.querySelector('.order-quantity' + menuId).textContent = parseInt(currQuantity) - 1;

            // add minus button if less than or equal to one
            const newQuantity = document.querySelector('.order-quantity' + menuId).textContent;
            if (newQuantity <= 1) {
                const minusBtn = document.getElementById('minus' + menuId);
                minusBtn.classList.remove('icon_minus_alt2');

            }

            // increase menu price and total price
            var totalPrice = document.getElementById('total').textContent;
            const menuPrice = document.getElementById('menu-price' + menuId).textContent;
            document.getElementById('total').textContent = parseInt(totalPrice) - parseInt(menuPrice);
            var currentPrice = document.getElementById('order-price' + menuId).textContent;
            document.getElementById('order-price' + menuId).textContent = parseInt(currentPrice) - parseInt(
                menuPrice);
        }
    }
}

// 주문 메뉴 삭제 이벤트
function deleteMenuFromOrderClickEvent() {
    const targetBtn = document.querySelector('.click-target');
    targetBtn.addEventListener('click', e => {
        if (e.target.classList.contains('removeMenu')) {
            // remove menu2
            // console.log('remove clicked - ', e.target.parentElement);
            e.target.parentElement.remove();
            document.getElementById('total').textContent = 0;
        }

    });
}

// 주문 버튼 클릭 이벤트
function submitOrderClickEvent() {
    document.getElementById('submit-order').onclick = e => {
        e.preventDefault();
        makeOrderInfo();
    };
}

function makeOrderInfo() {
    // console.log('make order list clicked');

    // menu 정보를 담을 객체 리스트
    const menuList = [];
    const orderList = document.getElementById('async-order-list').children;

    // console.log(orderList);
    // console.log('business_no : ' + '${master.businessNo}');

    for (let i = 0; i < orderList.length; i++) {
        // console.log(orderList[i].innerText);
        var orderArray = orderList[i].innerText.split(/\s+/);
        // console.log('orderArray - ', orderArray);

        var menuName = "";
        for (let j = 0; j < orderArray.length - 2; j++) {
            menuName += orderArray[j] + ' ';
        }

        const businessNo = '${master.businessNo}';

        const menu = {
            menuName: menuName,
            menuPrice: orderArray[orderArray.length - 1],
            quantity: orderArray[orderArray.length - 2],
            businessNo: businessNo
        };

        menuList[menuList.length] = menu;

    }

    submitOrder(menuList);
    // console.log(menuList);

}

// 주문 정보 전송 메서드
function submitOrder(menuList) {

    // POST요청을 위한 요청 정보 객체
    const reqInfo = {
        method: 'POST',
        headers: {
            'content-type': 'application/json'
        },
        body: JSON.stringify(menuList)
    };

    // console.log(data);


    fetch('/kakao/order/check', reqInfo)
        .then(res => res.text())
        .then(msg => console.log(msg));
}
