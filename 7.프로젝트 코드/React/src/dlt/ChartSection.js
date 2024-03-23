import React from "react";
import ChartComponent from "./ChartComponent";
import RegionSelect from "./RegionSelect";

function ChartSection({
  chartData,
  selectedRegion,
  handleRegionChange,
  chartNumber,
  selectedGraphType,
}) {
  return (
    <div>
      <div style={{ width: "700px", height: "500px", marginBottom: "20px" }}>
        <ChartComponent
          chartData={chartData}
          selectedGraphType={selectedGraphType}
        />
      </div>

      <RegionSelect
        selectedRegion={selectedRegion}
        handleRegionChange={handleRegionChange}
        chartNumber={chartNumber}
      />
    </div>
  );
}

export default ChartSection;
