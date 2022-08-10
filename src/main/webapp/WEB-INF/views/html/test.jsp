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

            navigator.geolocation.getCurrentPosition(success, error, options);

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
                        // printAddress(res.data.documents[0].address.address_name);

                        const address = res.data.documents[0].address.address_name;
                        // fetch('/foodieList?addr='+address).then
                    }).catch(e => console.log('e: ', e))
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