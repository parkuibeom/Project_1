window.onload = function () {
    new WOW().init();
    var map = "";
    var kkoMap = {
        initKko: function (data) {
            areaId = data.mapId;
            option = data.option;

            mapContainer = document.getElementById('map'); // 지도를 표시할 div 
            var fixedCenter = new kakao.maps.LatLng(36.25, 127.5);
            mapOption = Object.assign({
                center: fixedCenter,
                level: 13,
                draggable: false
            }, option);

            map = new kakao.maps.Map(mapContainer, mapOption);

            setZoomable(false);

            function setZoomable(zoomable) {
                kakao.maps.event.addListener(map, 'zoom_changed', function () {
                    map.setLevel(13);
                    map.setCenter(fixedCenter);
                });
                map.setZoomable(zoomable);
            }
            window.addEventListener('resize', () => {
                // 지도의 새로운 중심 좌표 설정
                map.setCenter(fixedCenter);

                // 리사이즈 후 지도 중심 유지
                map.panTo(fixedCenter);
            });



                
                
           
   // map.json 파일을 가져와서 처리하는 함수
     fetch("../json/map.json")
    .then(response => {
        // HTTP 응답 상태를 확인하고 오류가 발생하면 에러를 던집니다.
        if (!response.ok) {
            throw new Error('Failed to fetch map.json');
        }
        // JSON 형식으로 변환하여 반환합니다.
        return response.json();
    })
    .then(jsonData => {
        // JSON 데이터를 가져와서 각 feature를 처리합니다.
        jsonData.features.forEach(feature => {
            kkoMap.getPolycode(feature);
        });
    })
    .catch(error => {
        // 오류가 발생한 경우 콘솔에 에러 메시지를 출력합니다.
        console.error('Error fetching map.json:', error);
    });

                
                
        },
        getPolycode: function (feature) {
            var geometry = feature.geometry;

            if ("Polygon" === geometry.type) {
                var coordinate = geometry.coordinates[0];
                polygonArr = { "name": feature.properties.loc_nm, "path": [] };

                for (var c in coordinate) {
                    polygonArr.path.push(new kakao.maps.LatLng(coordinate[c][1], coordinate[c][0]));
                }

                kkoMap.setPolygon(polygonArr);
            } else if ("MultiPolygon" === geometry.type) {
                for (var c in geometry.coordinates) {
                    var multiCoordinates = geometry.coordinates[c];
                    polygonArr = { "name": feature.properties.loc_nm, "path": [] };

                    for (var z in multiCoordinates[0]) {
                        polygonArr.path.push(new kakao.maps.LatLng(multiCoordinates[0][z][1], multiCoordinates[0][z][0]));
                    }

                    kkoMap.setPolygon(polygonArr);
                }
            }
        },
        setPolygon: function (data, option) {
            polygonOption = Object.assign({
                strokeWeight: 2,
                strokeColor: '#004c80',
                strokeOpacity: 0.8,
                fillColor: '#4b8c97',
                fillOpacity: 0.7
            }, option);

            var polygon = new kakao.maps.Polygon({
                name: data.name,
                path: data.path,
                strokeWeight: 2,
                strokeColor: '#004c80',
                strokeOpacity: 0.8,
                fillColor: '#4b8c97',
                fillOpacity: 0.7
            });

            kakao.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
                polygon.setOptions({ fillColor: '#09f' });
            });


            kakao.maps.event.addListener(polygon, 'mouseout', function () {
                polygon.setOptions({ fillColor: '#4b8c97' });
            });

            kakao.maps.event.addListener(polygon, 'click', function () {
                 var url;
    if (data.name == '서울특별시') {
        url = '/dlt/disease/statisticsService?area=1';
    } else if (data.name == '전라남도') {
        url = '/dlt/disease/statisticsService?area=2';
    } else {
        return; // 다른 지역일 경우 동작하지 않음
    }
    window.open(url, 'PopupWindow', popupFeatures);
            });

            polygon.setMap(map);


        },

    }

    window.kkoMap = kkoMap;
}();

document.addEventListener("DOMContentLoaded", function () {
    kkoMap.initKko({
        mapId: "map",
        option: ""
    });
});

var popupWidth = 800;
var popupHeight = 600;
var popupX = (window.screen.width / 2) - (popupWidth / 2);
var popupY = (window.screen.height / 2) - (popupHeight / 2);
var popupFeatures = "status=no, height=" + popupHeight + ", width=" + popupWidth + ", left=" + popupX + ", top=" + popupY;



