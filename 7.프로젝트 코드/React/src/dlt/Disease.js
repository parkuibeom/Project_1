import React, { useState, useEffect } from "react";
import Navbar from "./Nav";
import Footer from "./Footer";
import ChartComponent from "./DiseaseChart";
import Infobox from "./Infobox";

import "bootstrap/dist/css/bootstrap.min.css";
import "../dlt/css/style.css";
import "../dlt/css/animate.css";
import "../dlt/css/animate.min.css";

function StatisticsPage() {
  const [chartData1, setChartData1] = useState(null);
  const [chartData2, setChartData2] = useState(null);
  const [selectedDisease, setSelectedDisease] = useState("hyperlipidemia");
  const [selectedRegion1, setSelectedRegion1] = useState("서울특별시");
  const [selectedRegion2, setSelectedRegion2] = useState("서울특별시");
  const [selectedGraphType, setSelectedGraphType] = useState("line");

  useEffect(() => {
    fetchData(1, selectedRegion1, selectedDisease);
    fetchData(2, selectedRegion2, selectedDisease);
  }, [selectedDisease, selectedRegion1, selectedRegion2]);

  const fetchData = async (chartNumber, region, disease) => {
    try {
      const response = await fetch(
        `http://localhost:8181/dlt/disease/chartData?region=${region}&disease=${disease}`
      );
      if (!response.ok) {
        throw new Error(`Failed to fetch chart data`);
      }
      const data = await response.json();

      console.log(data);
      if (chartNumber === 1) {
        setChartData1(data);
      } else if (chartNumber === 2) {
        setChartData2(data);
      }
    } catch (error) {
      console.error("Error fetching chart data:", error);
    }
  };

  const handleDiseaseButtonClick = (disease) => {
    setSelectedDisease(disease);
  };

  const handleRegionChange = (event, chartNumber) => {
    const selectedRegion = event.target.value;
    if (chartNumber === 1) {
      setSelectedRegion1(selectedRegion);
    } else if (chartNumber === 2) {
      setSelectedRegion2(selectedRegion);
    }
  };

  const handleGraphTypeChange = (type) => {
    setSelectedGraphType(type);
  };

  return (
    <div>
      <Navbar />
      <div className="jumbotron text-center">
        <h1>"차트 데이터 제공 서비스"</h1>
        <p>차트 정보를 한눈에 제공합니다.</p>
      </div>
      <div
        className="container"
        style={{
          display: "flex",
          justifyContent: "center",
          marginTop: "100px",
        }}
      >
        <div
          className="container"
          style={{
            display: "flex",
            justifyContent: "center",
            marginTop: "80px",
          }}
        >
          <div style={{ marginRight: "30px" }}>
            <div
              style={{ width: "700px", height: "500px", marginBottom: "20px" }}
            >
              <ChartComponent
                chartData={chartData1}
                selectedGraphType={selectedGraphType}
              />
            </div>

            <select
              className="form-select"
              value={selectedRegion1}
              onChange={(event) => handleRegionChange(event, 1)}
            >
              <option value="서울특별시">서울</option>
              <option value="부산광역시">부산</option>
              <option value="대구광역시">대구</option>
              <option value="인천광역시">인천</option>
              <option value="광주광역시">광주</option>
              <option value="대전광역시">대전</option>
              <option value="울산광역시">울산</option>
              <option value="경기도">경기</option>
              <option value="강원도">강원</option>
              <option value="충청북도">충북</option>
              <option value="충청남도">충남</option>
              <option value="전라북도">전북</option>
              <option value="전라남도">전남</option>
              <option value="경상북도">경북</option>
              <option value="경상남도">경남</option>
              <option value="제주특별자치도">제주</option>
              {/* 필요한 지역 옵션들을 추가하세요 */}
            </select>
          </div>

          <div style={{ marginLeft: "30px" }}>
            <div
              style={{ width: "700px", height: "500px", marginBottom: "20px" }}
            >
              <ChartComponent
                chartData={chartData2}
                selectedGraphType={selectedGraphType}
              />
            </div>
            <select
              className="form-select"
              value={selectedRegion2}
              onChange={(event) => handleRegionChange(event, 2)}
            >
              <option value="서울특별시">서울</option>
              <option value="부산광역시">부산</option>
              <option value="대구광역시">대구</option>
              <option value="인천광역시">인천</option>
              <option value="광주광역시">광주</option>
              <option value="대전광역시">대전</option>
              <option value="울산광역시">울산</option>
              <option value="경기도">경기</option>
              <option value="강원도">강원</option>
              <option value="충청북도">충북</option>
              <option value="충청남도">충남</option>
              <option value="전라북도">전북</option>
              <option value="전라남도">전남</option>
              <option value="경상북도">경북</option>
              <option value="경상남도">경남</option>
              <option value="제주특별자치도">제주</option>
              {/* 필요한 지역 옵션들을 추가하세요 */}
            </select>
          </div>
        </div>
      </div>

      <div
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          marginRight: "20px",
          marginTop: "60px",
        }}
      >
        <div
          className="btn-group mt-3"
          role="group"
          aria-label="Graph type"
          style={{ marginBottom: "50px" }}
        >
          <button
            type="button"
            className={`btn btn-primary ${
              selectedGraphType === "line" && "active"
            }`}
            style={{
              backgroundColor:
                selectedGraphType === "line" ? "#007bff" : "#6c757d",
              borderColor: selectedGraphType === "line" ? "#007bff" : "#6c757d",
              width: "150px",
            }}
            onClick={() => handleGraphTypeChange("line")}
          >
            선 그래프
          </button>
          <button
            type="button"
            className={`btn btn-primary ${
              selectedGraphType === "bar" && "active"
            }`}
            style={{
              backgroundColor:
                selectedGraphType === "bar" ? "#28a745" : "#6c757d",
              borderColor: selectedGraphType === "bar" ? "#28a745" : "#6c757d",
              width: "150px",
            }}
            onClick={() => handleGraphTypeChange("bar")}
          >
            막대 그래프
          </button>
        </div>
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            width: "600px",
          }}
        >
          <button
            className={`btn btn-primary ${
              selectedDisease === "hyperlipidemia" && "active"
            }`}
            style={{ backgroundColor: "rgba(255, 206, 86)", width: "120px" }}
            onClick={() => handleDiseaseButtonClick("hyperlipidemia")}
          >
            고지혈증
          </button>

          <button
            className={`btn btn-primary ${
              selectedDisease === "dementia" && "active"
            }`}
            style={{ backgroundColor: "rgba(255, 99, 132)", width: "120px" }}
            onClick={() => handleDiseaseButtonClick("dementia")}
          >
            치매
          </button>

          <button
            className={`btn btn-primary ${
              selectedDisease === "diabetes" && "active"
            }`}
            style={{ backgroundColor: "rgba(54, 162, 235)", width: "120px" }}
            onClick={() => handleDiseaseButtonClick("diabetes")}
          >
            당뇨
          </button>

          <button
            className={`btn btn-primary ${
              selectedDisease === "hbp" && "active"
            }`}
            style={{ backgroundColor: "rgba(75, 192, 192)", width: "120px" }}
            onClick={() => handleDiseaseButtonClick("hbp")}
          >
            고혈압
          </button>
        </div>
      </div>
      <Infobox style={{ marginTop: "100px", marginBottom: "100px" }} />
      <Footer />
    </div>
  );
}

export default StatisticsPage;
