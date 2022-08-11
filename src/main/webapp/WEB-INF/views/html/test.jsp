<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var options = {
                enableHighAccuracy: true,
                timeout: 5000,
                maximumAge: 0
            };

            function success(position) {
                //좌표를 알아낼 수 있는데, 여기서 알아낸 좌표를 kakaoAPI url에 사용할 것이다.
                console.log('위도 : ' + position.coords.latitude);
                console.log('경도: ' + position.coords.longitude);
            };

            function error(err) {
                console.warn('ERROR(' + err.code + '): ' + err.message);
            };


            function onGeoOk(position) {
                const lat = position.coords.latitude;
                const lon = position.coords.longitude;

                //kakao REST API에 get 요청을 보낸다.
                //파라미터 x,y에 lon,lat을 넣어주고 API_KEY를 Authorization헤더에 넣어준다.
                axios.get(
                        `https://dapi.kakao.com/v2/local/geo/coord2address.json?x=` + lon + '&y=' +
                        lat + '&input_coord=WGS84', {
                            headers: {
                                Authorization: `KakaoAK 5653dd9c92eb40c48bfce93c60c9cc5f`
                            }
                        }
                    )
                    .then(res => {
                        const si = res.data.documents[0].address.region_1depth_name;
                        const gu = res.data.documents[0].address.region_2depth_name;
                        const address = si + ' ' + gu;
                        console.log('this is the address : ', address);

                        fetch('/mylocation?storeAddress=' + address)
                            .then(res => res.json())
                            .then(replyMap => {
                                makeLocationDom(replyMap);
                            });
                    }).catch(e => console.log('e: ', e))
            }

            function makeLocationDom({
                masterList,
                prdList
            }) {
                console.log(masterList);

                // 각 리스트 하나의 태그
                let tag = '';


                if (masterList === null || masterList.length === 0) {
                    tag += "<div id='locationList'>주변에 식당이 없습니다! ㅠㅠ</div>";
                } else {
                    for (let i = 0; i < masterList.length; i++) {
                        tag +=
                            `<div class="item">` +
                            `   <div class="strip">` +
                            `       <figure>` +
                            `           <img src="img/lazy-placeholder.png" data-src="img/location_1.jpg" class="owl-lazy" alt="">` +
                            `           <a href="detail-restaurant.html" class="strip_info">` +
                            `               <div class="item_title">` +
                            `                   <h3>` + masterList[i].storeName + `</h3>` +
                            `                   <small>` + masterList[i].storeAddress + `</small>` +
                            `               </div>` +
                            `           </a>` +
                            `       </figure>` +
                            `       <ul>` +
                            `           <li><span class="loc_open">Now Open</span></li>` +
                            `           <li>` +
                            `               <div class="score"><span>근처 맛집<em>` + prdList[i].reviewCnt +
                            `개 리뷰</em></span><strong>` + prdList[i].avgStarRate + `</strong></div>` +
                            `           </li>` +
                            `       </ul>` +
                            `   </div>` +
                            `</div>`;
                    }
                }
            }

            // function printAddress(address) {
            //     console.log(address);

            // }


            function onGeoError() {
                alert("위치권한을 확인해주세요");
            }


            //navigator.geolocation.getCurrentPosition(위치받는함수, 에러났을때 함수)
            navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError)
        });
    </script>

</body>

</html>