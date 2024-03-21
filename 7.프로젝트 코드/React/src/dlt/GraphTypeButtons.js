// GraphTypeButtons.js
import React from "react";

function GraphTypeButtons({ selectedGraphType, handleGraphTypeChange }) {
  return (
    <div
      className="btn-group mt-3"
      role="group"
      aria-label="Graph type"
      style={{ marginBottom: "50px" }}
    >
      <button
        type="button"
        className={`btn ${
          selectedGraphType === "line" ? "btn-success" : "btn-secondary"
        }`}
        style={{ width: "150px" }}
        onClick={() => handleGraphTypeChange("line")}
        disabled={selectedGraphType === "line"}
      >
        선 그래프
      </button>
      <button
        type="button"
        className={`btn ${
          selectedGraphType === "bar" ? "btn-success" : "btn-secondary"
        }`}
        style={{ width: "150px" }}
        onClick={() => handleGraphTypeChange("bar")}
        disabled={selectedGraphType === "bar"}
      >
        막대 그래프
      </button>
    </div>
  );
}

export default GraphTypeButtons;
