// DiseaseButtonGroup.js
import React from "react";
import DiseaseButton from "./DiseaseButton";

const DiseaseButtonGroup = ({ selectedDisease, handleDiseaseButtonClick }) => {
  return (
    <div
      style={{
        display: "flex",
        justifyContent: "space-between",
        width: "600px",
      }}
    >
      <DiseaseButton
        selectedDisease={selectedDisease}
        handleDiseaseButtonClick={handleDiseaseButtonClick}
        diseaseValue="hyperlipidemia"
        disease="고지혈증"
      />
      <DiseaseButton
        selectedDisease={selectedDisease}
        handleDiseaseButtonClick={handleDiseaseButtonClick}
        diseaseValue="dementia"
        disease="치매"
      />
      <DiseaseButton
        selectedDisease={selectedDisease}
        handleDiseaseButtonClick={handleDiseaseButtonClick}
        diseaseValue="diabetes"
        disease="당뇨"
      />
      <DiseaseButton
        selectedDisease={selectedDisease}
        handleDiseaseButtonClick={handleDiseaseButtonClick}
        diseaseValue="hbp"
        disease="고혈압"
      />
    </div>
  );
};

export default DiseaseButtonGroup;
