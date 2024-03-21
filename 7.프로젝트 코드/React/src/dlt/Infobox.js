import React, { useState } from "react";

const InfoBox = ({ style }) => {
  const [showInfo, setShowInfo] = useState(false);

  const toggleInfo = () => {
    setShowInfo(!showInfo);
    console.log(showInfo);
  };

  return (
    <div className="container" style={style}>
      <div className="row">
        <div id="data-card" style={{ width: "100%" }}>
          <div className="card-body wow fadeIn" data-wow-delay="0.5s">
            <div className="row no-gutters align-items-center">
              <div>
                <h4>4대 질병이란?</h4>
                <button id="infoBoxbtm" onClick={toggleInfo}>
                  차트 단위 확인하기
                </button>
              </div>
              {showInfo && (
                <div id="info" className="mt-3">
                  <p>
                    해당 차트에서 사용된 단위는 %단위로 전 국민 중 의료 서비스를
                    이용하여 해당 질병이 있다고 판정받은 사람의 비율입니다.
                    <br /> (계산식 : 질병 판정 인원/전체 인구 x 100, 출처 :
                    국민건강보험공단)
                  </p>
                  {/* 추가적인 설명을 여기에 추가할 수 있습니다. */}
                </div>
              )}
            </div>
            <div className="col-auto mt-3">
              <p>
                <strong>고지혈증</strong> : 혈중의 지질(콜레스테롤 및 중성지방)
                수치가 정상 수치를 초과할 때 발생하며, 동맥경화 및 심혈관 질환의
                위험을 증가시킬 수 있습니다.
              </p>
              <p>
                <strong>치매</strong> : 퇴행성 뇌질환 또는 뇌 혈관계 질환 등에
                의해 기억력, 언어능력, 판단력 및 수행 능력등의 인지기능 저하를
                일으켜 일상생활에 지장을 초래하는 후천적인 다발성 장애를
                말합니다.
              </p>
              <p>
                <strong>당뇨</strong> : 혈액 속의 포도당 수치가 정상인보다 높은
                상태를 말하며, 인슐린의 분비량이 부족하거나 정상적인 기능이
                이루어지지 않는 질환입니다.
              </p>
              <p>
                <strong>고혈압</strong> : 혈관에 과도한 압력이 가해짐으로써
                발생하며, 이는 심장 질환, 뇌졸중 및 기타 심혈관 질환의 원인이 될
                수 있습니다.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default InfoBox;
