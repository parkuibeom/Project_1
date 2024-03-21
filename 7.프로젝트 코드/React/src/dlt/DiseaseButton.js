// DiseaseButton.js
import React from "react";

function DiseaseButton({
  selectedDisease,
  handleDiseaseButtonClick,
  diseaseValue,
  disease,
}) {
  let buttonColor;
  switch (diseaseValue) {
    case "hyperlipidemia":
      buttonColor = "rgba(255, 206, 86)"; // Yellow
      break;
    case "dementia":
      buttonColor = "rgba(255, 99, 132)"; // Red
      break;
    case "diabetes":
      buttonColor = "rgba(54, 162, 235)"; // Blue
      break;
    case "hbp":
      buttonColor = "rgba(75, 192, 192)"; // Green
      break;
    default:
      buttonColor = "rgba(255, 206, 86)"; // Default to Yellow
  }

  return (
    <button
      className="btn btn-primary"
      style={{ backgroundColor: buttonColor, width: "120px" }}
      onClick={() => handleDiseaseButtonClick(diseaseValue)}
    >
      {disease}
    </button>
  );
}

export default DiseaseButton;
