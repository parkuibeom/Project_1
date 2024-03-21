// RegionSelect.js
import React from "react";

function RegionSelect({ selectedRegion, handleRegionChange, chartNumber }) {
  return (
    <select
      className="form-select"
      value={selectedRegion}
      onChange={(event) => handleRegionChange(event, chartNumber)}
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
    </select>
  );
}

export default RegionSelect;
