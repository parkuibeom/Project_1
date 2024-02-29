//서블릿에서 데이터를 JSON 형태로 받아옴
//서버는 아직 미구현이기에 임시로 JSON 형식 데이터 할당
//데이터는 지역 -> 연도 -> 4대 질병(고지혈증, 치매, 당뇨, 고혈압) 순으로 저장
var newChart;
var region;
var labelData = []; // 라벨 데이터

var selectYearStart = document.getElementById("year-select-start");
var selectYearEnd = document.getElementById("year-select-end");
var selectYearStartValue
var selectYearEndValue

// 강남 고지혈증, 치매, 당뇨병, 고혈압 임시 변수
var seoulInputHyper;
var seoulInputDementia;
var seoulInputDiabetes;
var seoulInputHbp;



// 고지혈증, 치매, 당뇨, 고혈압 순 데이터
var seoulHyper = [];
var seoulDementia = [];
var seoulDiabetes = [];
var seoulHbp = [];


// 각 질병 버튼 상태
var hyperBtnStatus = "on";
var demenBtnStatus = "off";
var diaBtnStatus = "off";
var hbpBtnStatus = "off";

/* DB와 연결되면 유동적으로 데이터를 바꿀 수 있게 설정 */
var seoulData = { // 서울 데이터
   2009: {
       'hyperlipidemia': 0,   // 고지혈증
       'dementia': 0,        // 치매
       'diabetes': 0,        // 당뇨
       'hbp': 0              // 고혈압   
   }, 
    2010: {
        'hyperlipidemia': 0,   // 고지혈증
        'dementia': 0,        // 치매
        'diabetes': 0,        // 당뇨
        'hbp': 0              // 고혈압
    },          // 고혈압
    2011: {
        'hyperlipidemia': 0,   // 고지혈증
        'dementia': 0,        // 치매
        'diabetes': 0,        // 당뇨
        'hbp': 0              // 고혈압
    },
    2012: {
        'hyperlipidemia': 0,   // 고지혈증
        'dementia': 0,        // 치매
        'diabetes': 0,        // 당뇨
        'hbp': 0              // 고혈압
    },
    2013: {
        'hyperlipidemia': 0,   // 고지혈증
        'dementia': 0,        // 치매
        'diabetes': 0,        // 당뇨
        'hbp': 0              // 고혈압
    },
    2014: {
        'hyperlipidemia': 0,
        'dementia': 0,
        'diabetes': 0,
        'hbp': 0
    },
    2015: {
        'hyperlipidemia': 0,
        'dementia': 0,
        'diabetes': 0,
        'hbp': 0
    },
    2016: {
        'hyperlipidemia': 0,
        'dementia': 0,
        'diabetes': 0,
        'hbp': 0
    },
    2017: {
        'hyperlipidemia': 0,
        'dementia': 0,
        'diabetes': 0,
        'hbp': 0
    },
    2018: {
        'hyperlipidemia': 0,
        'dementia': 0,
        'diabetes': 0,
        'hbp': 0
    },
    2019: {
        'hyperlipidemia': 0,
        'dementia': 0,
        'diabetes': 0,
        'hbp': 0
    },
    2020: {
        'hyperlipidemia': 0,
        'dementia': 0,
        'diabetes': 0,
        'hbp': 0
    },
    2021: {
        'hyperlipidemia': 0,
        'dementia': 0,
        'diabetes': 0,
        'hbp': 0
    }
};

//페이지 로드 이벤트 핸들러


function initData() {
    labelData = []; // 라벨 데이터 초기화
    // 데이터 초기화
    seoulHyper = [];
    seoulDementia = [];
    seoulDiabetes = [];
    seoulHbp = [];

    selectYearStartValue = selectYearStart.options[selectYearStart.selectedIndex].value;
    selectYearEndValue = selectYearEnd.options[selectYearEnd.selectedIndex].value;

    for (let i = selectYearStartValue; i <= selectYearEndValue; i++) {
        labelData.push(i);
        seoulHyper.push(seoulData[i]["hyperlipidemia"]);
        seoulDementia.push(seoulData[i]["dementia"]);
        seoulDiabetes.push(seoulData[i]["diabetes"]);
        seoulHbp.push(seoulData[i]["hbp"]);
    }
}

// 질병 데이터 체크 함수
function checkBtn() {
    // 고지혈증 버튼
    if (hyperBtnStatus === "on") {
        seoulInputHyper = seoulHyper;
    }

    else if (hyperBtnStatus === "off") {
        seoulInputHyper = [];
    }

    // 치매 버튼
    if (demenBtnStatus === "on") {
        seoulInputDementia = seoulDementia;
    }

    else if (demenBtnStatus === "off") {
        seoulInputDementia = [];
    }

    // 당뇨병 버튼
    if (diaBtnStatus === "on") {
        seoulInputDiabetes = seoulDiabetes;
    }

    else if (diaBtnStatus === "off") {
        seoulInputDiabetes = [];
    }

    // 고혈압 버튼
    if (hbpBtnStatus === "on") {
        seoulInputHbp = seoulHbp;
    }

    else if (hbpBtnStatus === "off") {
        seoulInputHbp = [];
    }
}



// 셀렉트 차트 적용(데이터)
document.getElementById('seoul-select').addEventListener('change', function () {
    chartSet();
});




// 차트 생성
function chartSet() {
    initData();
    checkBtn();
    newChart.destroy();
    if (hyperBtnStatus === "on") {
        newChart.destroy();
        newChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labelData, // x라벨
                datasets: [{ // chart에 넣을 데이터
                    label: '고지혈증',
                    data: seoulInputHyper,
                    borderWidth: 1,
                    backgroundColor: ['red'],
                    borderColor: ['red'],
                    fill: false
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: '고지혈증 데이터(단위 : %)',
                        font: {
                            size: 20,
                        },
                        padding: {
                            top: 10,
                            bottom: 30
                        }
                    }
                }
                ,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 30
                    }
                }
                , responsive: true, // 차트 반응형 옵션
                maintainAspectRatio: true,
            }
        });
    }
    if (demenBtnStatus === "on") {
        newChart.destroy();
        newChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labelData, // x라벨
                datasets: [{ // chart에 넣을 데이터
                    label: '치매',
                    data: seoulInputDementia,
                    borderWidth: 1,
                    backgroundColor: ['green'],
                    borderColor: ['green']
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: '치매 데이터(단위 : %)',
                        font: {
                            size: 20,
                        },
                        padding: {
                            top: 10,
                            bottom: 30
                        }
                    }
                }
                ,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 2
                    }
                }
                , responsive: true, // 차트 반응형 옵션
                maintainAspectRatio: true,
            }
        });
    }
    if (diaBtnStatus === "on") {
        newChart.destroy();
        newChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labelData, // x라벨
                datasets: [{ // chart에 넣을 데이터
                    label: '당뇨',
                    data: seoulInputDiabetes,
                    borderWidth: 1,
                    backgroundColor: ['black'],
                    borderColor: ['black']
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: '당뇨 데이터(단위 : %)',
                        font: {
                            size: 20,
                        },
                        padding: {
                            top: 10,
                            bottom: 30
                        }
                    }
                }
                ,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 10
                    }
                }
                , responsive: true, // 차트 반응형 옵션
                maintainAspectRatio: true,
            }
        });
    }
    if (hbpBtnStatus === "on") {
        newChart.destroy();
        newChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labelData, // x라벨
                datasets: [{ // chart에 넣을 데이터
                    label: '고혈압',
                    data: seoulInputHbp,
                    borderWidth: 1,
                    backgroundColor: ['lightblue'],
                    borderColor: ['lightblue']
                }
                ]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: '고혈압 데이터(단위 : %)',
                        font: {
                            size: 20,
                        },
                        padding: {
                            top: 10,
                            bottom: 30
                        }
                    }
                }
                ,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 25
                    }
                }
                , responsive: true, // 차트 반응형 옵션
                maintainAspectRatio: true,
            }
        });
    }
}

// 창 로딩시
window.onload = function () {
    new WOW().init();
}






// 차트 DOM으로 받아오기
var ctx = document.getElementById('myChart');

labelData = Object.keys(seoulData);


let chartData;

// 차트 초기 생성
function initChart() {
    initData();
    seoulInputHyper = seoulHyper;
    chartData = {
        type: 'bar',
        data: {
            labels: labelData, // x라벨
            datasets: [{ // chart에 넣을 데이터
                label: '고지혈증',
                data: seoulInputHyper,
                borderWidth: 1,
                backgroundColor: ['red'],
                borderColor: ['red']
            }]
        },
        options: {
            layout: {
                padding: 10
            },
            plugins: {
                title: {
                    display: true,
                    text: '지역 데이터(단위 : %)',
                    font: {
                        size: 20,
                    },
                    padding: {
                        top: 10,
                        bottom: 30
                    }
                }
            }
            ,
            scales: {
                y: {
                    beginAtZero: true,
                    max: 60
                }
            }
            , responsive: true, // 차트 반응형 옵션
            maintainAspectRatio: true,
        }
    }
    setTimeout(function () {
        chartSet();
    }, 200); // 1000 밀리초(1초) 지연

    // 차트 틀 생성
    newChart = new Chart(ctx, chartData);
}

// 차트 데이터 입력
initChart();

// 고지혈증 버튼
document.getElementById('hyper').addEventListener('click', function () {
    if (hyperBtnStatus === "off") {
        hyperBtnStatus = "on";
        demenBtnStatus = "off";
        diaBtnStatus = "off";
        hbpBtnStatus = "off";
    }
    chartSet();
})

// 치매 버튼
document.getElementById('dementia').addEventListener('click', function () {
    if (demenBtnStatus === "off") {
        hyperBtnStatus = "off";
        demenBtnStatus = "on";
        diaBtnStatus = "off";
        hbpBtnStatus = "off";
    }
    chartSet();
})

// 당뇨 버튼
document.getElementById('diabetes').addEventListener('click', function () {
    if (diaBtnStatus === "off") {
        hyperBtnStatus = "off";
        demenBtnStatus = "off";
        diaBtnStatus = "on";
        hbpBtnStatus = "off";
    }
    chartSet();
})

// 고혈압 버튼
document.getElementById('hbp').addEventListener('click', function () {
    if (hbpBtnStatus === "off") {
        hyperBtnStatus = "off";
        demenBtnStatus = "off";
        diaBtnStatus = "off";
        hbpBtnStatus = "on";
    }
    chartSet();
})



function addYearOption() {
    removeYearOptions();
    var selectYear1 = document.getElementById("year-select-start");
    var selectYear2 = document.getElementById("year-select-end");
    for (var year = parseInt(selectYear1.value) + 1; year <= 2023; year++) {
        var option = document.createElement("option");
        option.value = year;
        option.text = year;
        selectYear2.add(option);
    }
}

function removeYearOptions() {
    var selectYear2 = document.getElementById("year-select-end");
    while (selectYear2.options.length > 1) {
        selectYear2.remove(1);
    }
}
window.addEventListener('load', function () {
   var district = document.getElementById('seoul-select').value
   console.log(district);
   getData(district);
});



document.getElementById('seoul-select').addEventListener('change', function () {
   var district = document.getElementById('seoul-select').value
   console.log(district);
   getData(district);
});



function getData(district) {
    fetch('/TeamProject/getChart.do?district=' + district, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(response => response.json())
        .then(data => {

            let year = 2009;
            for (let i = 0; i < data.length; i++) {
                seoulData[year].hyperlipidemia = data[i].hyperlipidemia_data;
                seoulData[year].dementia = data[i].dementia_data;
                seoulData[year].diabetes = data[i].diabetes_data;
                seoulData[year].hbp = data[i].hypertension_data;
                year++;
            }
            console.log(data);
            chartSet();
        })
        .catch(error => console.error(error));
}

function toggleInfo() {
    var infoBox = document.getElementById("infoBox");
    infoBox.style.display = (infoBox.style.display === "block") ? "none" : "block";
}