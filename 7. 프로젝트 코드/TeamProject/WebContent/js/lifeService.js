window.onload = function () {
    new WOW().init();
    getChartData();
    getPastChartData();

    const textMessage = document.getElementById('textMessage');
    textMessage.innerHTML = '<div class="col mb-3"><p id="katex_formula" data-katex="\\frac{a}{b}"></p><p id="katex_formula_explain" data-katex="\\frac{a}{b}"></p></div>';


    var formula = 'y = -840.6 + 0.4627x_1 - (3.601x_2 + (1.234 \\times 10^{-6})x_3 + 0.1269x_4) ';
    var element = document.getElementById('katex_formula_region');
    katex.render(formula, element, {
        throwOnError: false
    });
    
    formula = 'x_1 : 연도, x_2 : 지역 , x_3 : GRDP, x_4 : 고혈압 비율(-840.6 : 편향 )'
        element = document.getElementById('katex_formula_region_explain');
        katex.render(formula, element, {
            throwOnError: false
        });


    formula = 'y = 82.96 + 1.87x_1 - (0.88x_2 + 0.1x_3 + 0.09x_4 + 0.77x_5 + 0.067x_6)';
    element = document.getElementById('katex_formula');
    katex.render(formula, element, {
        throwOnError: false
    });

    formula = 'x_1 : 성별, x_2 : 연령대, x_3 : 흡연 여부, x_4 : 음주 여부, x_5 : 고혈압 여부, x_6 : 당뇨 여부(82.96 : 편향 )'
    element = document.getElementById('katex_formula_explain');
    katex.render(formula, element, {
        throwOnError: false
    });

};

//차트 저장 변수
var myPastChart;
var myChart;



//과거 차트 틀
var pastChartData = {
    datasets: [
        {
            label: "서울특별시",
            backgroundColor: "white",
            borderColor: "#FFA447",
            borderWidth: 3,
        }]
};


//차트 틀
var chartData = {
    datasets: [
        {
            label: "서울특별시",
            backgroundColor: "white",
            borderColor: "#F6B17A",
            borderWidth: 2,
        },
        {
            label: "전라남도",
            backgroundColor: "white",
            borderColor: "#86A7FC",
            borderWidth: 2,
        }]
};



//fetch를 사용한 서비스 구현
function getChartData() {
    var regionSecond;
    var regionFirst;

    regionFirst = document.getElementById('selectedRegionFirst').value;
    regionSecond = document.getElementById('selectedRegionSecond').value;
    var yearStart = 2023;
    var yearEnd = document.getElementById('year-select-end').value;

    //시작 연도가 더 큰 값을 설정할 때
    if (yearStart > yearEnd) {
        let temp;
        temp = yearStart;
        yearStart = yearEnd;
        yearEnd = temp;
    }


    //fetch(차트 비동기)
    fetch(`regionLife.do?regionFirst=${regionFirst}&regionSecond=${regionSecond}&yearStart=${yearStart}&yearEnd=${yearEnd}`)
        .then(response => response.json())
        .then(data => {
            let map = new Map();
            map.set(1, "서울특별시");
            map.set(2, "전라남도");
            map.set(3, "강원도");
            map.set(4, "경기도");
            map.set(5, "경상남도");
            map.set(6, "경상북도");
            map.set(7, "광주광역시");
            map.set(8, "대구광역시");
            map.set(9, "대전광역시");
            map.set(10, "부산광역시");
            map.set(11, "세종특별자치시");
            map.set(12, "울산광역시");
            map.set(13, "인천광역시");
            map.set(14, "전라북도");
            map.set(15, "제주특별자치도");
            map.set(16, "충청남도");
            map.set(17, "충청북도");

            var firstRegionData = data.filter(item => map.get(item.region_id) == regionFirst).map(item => item.value);
            var secondRegionData = data.filter(item => map.get(item.region_id) == regionSecond).map(item => item.value);

            var selectedYears = [];
            for (var i = parseInt(yearStart); i <= parseInt(yearEnd); i++) {
                selectedYears.push(String(i));
            }

            console.log(firstRegionData);
            console.log(secondRegionData);

            //라벨, 데이터 설정
            chartData.labels = selectedYears;
            chartData.datasets[0].label = regionFirst;
            chartData.datasets[1].label = regionSecond;
            chartData.datasets[0].data = firstRegionData;
            chartData.datasets[1].data = secondRegionData;
            drawChart("serviceChart", chartData);
        })
        .catch(error => {
            console.log(error);
            console.log("fetch가 제대로 작동하지 않습니다.");
        });
}

//fetch를 사용한 서비스 구현2
function getPastChartData() {
    var regionFirst;

    regionFirst = document.getElementById('pastRegion').value;


    console.log();
    //fetch(차트 비동기)
    fetch(`regionLife.do?regionFirst=${regionFirst}&yearStart=2013&yearEnd=2022`)
        .then(response => response.json())
        .then(data => {
            let map = new Map();
            map.set(1, "서울특별시");
            map.set(2, "전라남도");
            map.set(3, "강원도");
            map.set(4, "경기도");
            map.set(5, "경상남도");
            map.set(6, "경상북도");
            map.set(7, "광주광역시");
            map.set(8, "대구광역시");
            map.set(9, "대전광역시");
            map.set(10, "부산광역시");
            map.set(11, "세종특별자치시");
            map.set(12, "울산광역시");
            map.set(13, "인천광역시");
            map.set(14, "전라북도");
            map.set(15, "제주특별자치도");
            map.set(16, "충청남도");
            map.set(17, "충청북도");

            var firstRegionData = data.filter(item => map.get(item.region_id) == regionFirst).map(item => item.value);

            var selectedYears = [2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022];

            console.log(firstRegionData);

            //라벨, 데이터 설정
            pastChartData.labels = selectedYears;
            pastChartData.datasets[0].label = regionFirst;
            pastChartData.datasets[0].data = firstRegionData;
            pastDrawChart("pastChart", pastChartData);
        })
        .catch(error => {
            console.log(error);
            console.log("fetch가 제대로 작동하지 않습니다.");
        });
}


//chart load
function drawChart(chartId, data) {
    var ctx = document.getElementById(chartId).getContext('2d');

    if (myChart) {
        myChart.destroy(); // 기존 차트가 있으면 파괴
    }

    myChart = new Chart(ctx, {
        type: "line",
        data: data,
        options: {
            layout: {
                padding: 30
            },
            plugins: {
                title: {
                    display: true,
                    padding: {
                        top: 10,
                    }
                }
            }
            ,
            scales: {
                y: {
                    max: 88,
                    min: 83,
                    beginAtZero: false
                }
            }
            , responsive: true, //차트 반응형 옵션
            maintainAspectRatio: false,
        },
    });
    myChart.update();
}

//chart load
function pastDrawChart(chartId, data) {
    var ctx = document.getElementById(chartId).getContext('2d');

    if (myPastChart) {
        myPastChart.destroy(); // 기존 차트가 있으면 파괴
    }


    myPastChart = new Chart(ctx, {
        type: "line",
        data: data,
        options: {
            layout: {
                padding: 30
            },
            plugins: {
                title: {
                    display: true,
                    padding: {
                        top: 10,
                    }
                }
            }
            ,
            scales: {
                y: {
                    max: 87,
                    min: 80,
                    beginAtZero: false
                }
            }
            , responsive: true, //차트 반응형 옵션
            maintainAspectRatio: false,
        },
    });
    myPastChart.update();
}





//개인 기대 수명 정보 제공 서비스

document.getElementById("personalForm").addEventListener('submit', function () {
    event.preventDefault();
    var ageCheck = document.getElementById("age").value;
    var genderNode = document.getElementsByName("genderCheck");
    var smokeNode = document.getElementsByName("smokeCheck");
    var drinkingNode = document.getElementsByName("drinkingCheck");
    var hbpNode = document.getElementsByName("hbpCheck");
    var diaNode = document.getElementsByName("diabetesCheck");

    var genderCheck;
    var smokeCheck;
    var drinkingCheck;
    var hbpCheck;
    var diaCheck;



    for (var i = 0; i < genderNode.length; i++) {
        if (genderNode[i].checked) {
            genderCheck = genderNode[i].value;
        }
    }

    for (var i = 0; i < smokeNode.length; i++) {
        if (smokeNode[i].checked) {
            smokeCheck = smokeNode[i].value;
        }
    }

    for (var i = 0; i < genderNode.length; i++) {
        if (drinkingNode[i].checked) {
            drinkingCheck = drinkingNode[i].value;
        }
    }

    for (var i = 0; i < hbpNode.length; i++) {
        if (hbpNode[i].checked) {
            hbpCheck = hbpNode[i].value;
        }
    }

    for (var i = 0; i < diaNode.length; i++) {
        if (diaNode[i].checked) {
            diaCheck = diaNode[i].value;
        }
    }


    if (ageCheck == "") {
        alert("나이를 입력해주세요.");
    }

    else if (genderCheck == undefined) {
        alert("성별을 선택해주세요.");
    }
    else if (smokeCheck == undefined) {
        alert("흡연 여부를 선택해주세요");
    }
    else if (drinkingCheck == undefined) {
        alert("음주 여부를 선택해주세요");
    }
    else if (hbpCheck == undefined) {
        alert("고혈압 여부를 선택해주세요");
    }

    else if (diaCheck == undefined) {
        alert("당뇨병 여부를 선택해주세요");
    }
    else {
        let sendData = {
            personal_age: ageCheck,
            genderCheck: genderCheck,
            smokeCheck: smokeCheck,
            drinkingCheck: drinkingCheck,
            hbpCheck: hbpCheck,
            diabetesCheck: diaCheck
        }
        fetch('personalLife.do', {
            method: 'POST',
            body: JSON.stringify(sendData)
        })
            .then(response => response.json())
            .then(data => {
                const lifeContainer = document.getElementById('inputLife');
                lifeContainer.innerHTML = '<div class = "col mb-1" style="font-weight : bold;">사용자의 기대 수명은  ' + (parseInt(sendData.personal_age) + data.age) + '세이며 <br> 남은 기대 여명은 ' + data.age + '세입니다. </div> <a href="#textMessage" class="btn btn-primary">값 도출 식 보기</a>';
            })
            .catch(error => {
                console.log(error);
                console.log("fetch가 제대로 작동하지 않습니다.");
            });
    }

})




