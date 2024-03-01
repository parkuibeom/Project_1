window.onload = function () {
    var map = "";
    var kkoMap = {
        initKko: function (data) {
            areaId = data.mapId;
            option = data.option;

            mapContainer = document.getElementById('map'); // 지도를 표시할 div 
            var fixedCenter = new kakao.maps.LatLng(36.25, 127.5)
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
                });

                kakao.maps.event.addListener(map, 'dragstart', function () {
                    map.setCenter(fixedCenter);
                });

                map.setZoomable(zoomable);
            }



            fetch("map.json")
                .then(response => response.json())
                .then(jData => {
                    jData.features.forEach(feature => {
                        kkoMap.getPolycode(feature);
                    });
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
                fillColor: '#2e58bc',
                fillOpacity: 0.7
            }, option);

            var polygon = new kakao.maps.Polygon({
                name: data.name,
                path: data.path,
                strokeWeight: 2,
                strokeColor: '#004c80',
                strokeOpacity: 0.8,
                fillColor: '#2e58bc',
                fillOpacity: 0.7
            });

            kakao.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
                polygon.setOptions({ fillColor: '#09f' });
                customOverlay.setPosition(mouseEvent.latLng);
                customOverlay.setMap(map);
            });

            kakao.maps.event.addListener(polygon, 'mousemove', function (mouseEvent) {
                customOverlay.setPosition(mouseEvent.latLng);
            });

            kakao.maps.event.addListener(polygon, 'mouseout', function () {
                polygon.setOptions({ fillColor: '#2e58bc' });
                customOverlay.setMap(null);
            });

            kakao.maps.event.addListener(polygon, 'click', function () {
                console.log(data.name);
                if (data.name == '서울특별시') {
                    makeOverListenerSeoul();
                }
                if (data.name == '전라남도') {
                    makeOverListenerJeonnam();
                }
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
function makeOverListenerSeoul() {
    // localStorage.setItem('chartData', JSON.stringify(data));
    // localStorage.setItem('graphType', JSON.stringify(type1))
    location.href = 'policyJob.do?region_id=1';
}

//전남
function makeOverListenerJeonnam() {
    // localStorage.setItem('chartData', JSON.stringify(data));
    // localStorage.setItem('graphType', JSON.stringify(type3))
    location.href = 'policyJob.do?region_id=2';

}




