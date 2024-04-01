// StatisticsPage.js
import React, { useState, useEffect } from "react";
import Navbar from "./Nav";
import Footer from "./Footer";
import ChartSection from "./ChartSection";
import Infobox from "./Infobox";
import DiseaseButtonGroup from "./DiseaseButtonGroup"; // 수정된 부분

import GraphTypeButtons from "./GraphTypeButtons";

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
  }, [selectedDisease, selectedRegion1]);

  useEffect(() => {
    fetchData(2, selectedRegion2, selectedDisease);
  }, [selectedDisease, selectedRegion2]);

  const fetchData = async (chartNumber, region, disease) => {
    try {
      const response = await fetch(
        `/dlt/disease/chartData?region=${region}&disease=${disease}`
      );
      if (!response.ok) {
        throw new Error(`Failed to fetch chart data`);
      }
      const data = await response.json();

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
          marginTop: "80px",
        }}
      >
        <div style={{ marginRight: "30px" }}>
          <ChartSection
            chartData={chartData1}
            selectedRegion={selectedRegion1}
            handleRegionChange={handleRegionChange}
            chartNumber={1}
            selectedGraphType={selectedGraphType}
          />
        </div>

        <div style={{ marginLeft: "30px" }}>
          <ChartSection
            chartData={chartData2}
            selectedRegion={selectedRegion2}
            handleRegionChange={handleRegionChange}
            chartNumber={2}
            selectedGraphType={selectedGraphType}
          />
        </div>
      </div>

      <div
        style={{ display: "flex", justifyContent: "center", marginTop: "30px" }}
      >
        <GraphTypeButtons
          selectedGraphType={selectedGraphType}
          handleGraphTypeChange={handleGraphTypeChange}
        />
      </div>
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
        }}
      >
        <DiseaseButtonGroup
          selectedDisease={selectedDisease}
          handleDiseaseButtonClick={handleDiseaseButtonClick}
        />{/* 수정된 부분 */}
      </div>
      <Infobox style={{ marginTop: "100px", marginBottom: "100px" }} />
      <Footer />
    </div>
  );
}

export default StatisticsPage;
