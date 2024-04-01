import React, { useEffect, useRef } from "react";
import Chart from "chart.js/auto";

const ChartComponent = ({ chartData, selectedGraphType }) => {
  const chartRef = useRef(null);
  const chartInstance = useRef(null);

  useEffect(() => {
    if (!chartData || !chartRef.current) return;

    if (chartInstance.current) {
      chartInstance.current.destroy();
    }

    const demeniaData = [];
    const diabetesData = [];
    const hyperlipidemiaData = [];
    const hypertensionData = [];
    const years = [];

    for (let i = 0; i < chartData.length; i++) {
      const year = 2009 + i;
      years.push(year);
      const yearData = chartData[i];

      if (yearData) {
        if (yearData.demeniaData !== undefined) {
          demeniaData.push(parseFloat(yearData.demeniaData));
        }
        if (yearData.diabetesData !== undefined) {
          diabetesData.push(parseFloat(yearData.diabetesData));
        }
        if (yearData.hyperlipidemiaData !== undefined) {
          hyperlipidemiaData.push(parseFloat(yearData.hyperlipidemiaData));
        }
        if (yearData.hypertensionData !== undefined) {
          hypertensionData.push(parseFloat(yearData.hypertensionData));
        }
      }
    }

    const chartType = selectedGraphType === "bar" ? "bar" : "line";

    chartInstance.current = new Chart(chartRef.current, {
      type: chartType,
      data: {
        labels: years,
        datasets: [
          {
            label: "치매",
            data: demeniaData,
            backgroundColor: "rgba(255, 99, 132, 0.2)",
            borderColor: "rgba(255, 99, 132, 1)",
            borderWidth: 1,
          },
          {
            label: "당뇨",
            data: diabetesData,
            backgroundColor: "rgba(54, 162, 235, 0.2)",
            borderColor: "rgba(54, 162, 235, 1)",
            borderWidth: 1,
          },
          {
            label: "고지혈증",
            data: hyperlipidemiaData,
            backgroundColor: "rgba(255, 206, 86, 0.2)",
            borderColor: "rgba(255, 206, 86, 1)",
            borderWidth: 1,
          },
          {
            label: "고혈압",
            data: hypertensionData,
            backgroundColor: "rgba(75, 192, 192, 0.2)",
            borderColor: "rgba(75, 192, 192, 1)",
            borderWidth: 1,
          },
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          y: {
            beginAtZero: true,
            title: {
              display: true,
              text: "질병률",
              font: {
                size: 16,
                weight: "bold",
              },
            },
          },
          x: {
            title: {
              display: true,
              text: "년도",
              font: {
                size: 16,
                weight: "bold",
              },
            },
          },
        },
      },
    });
  }, [chartData, selectedGraphType]);

  return <canvas ref={chartRef} />;
};

export default ChartComponent;
