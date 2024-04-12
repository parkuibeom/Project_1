// RegionSelect.js
import React from "react";

const regionOptions = [
  "서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시",
  "대전광역시", "울산광역시", "경기도", "강원도", "충청북도", "충청남도",
  "전라북도", "전라남도", "경상북도", "경상남도", "제주특별자치도"
];

function RegionSelect({ selectedRegion, handleRegionChange, chartNumber }) {
  return (
    <select
      className="form-select"
      value={selectedRegion}
      onChange={(event) => handleRegionChange(event, chartNumber)}
    >
      {regionOptions.map(option => (
        <option key={option} value={option}>
          {option}
        </option>
      ))}
    </select>
  );
}

export default RegionSelect;