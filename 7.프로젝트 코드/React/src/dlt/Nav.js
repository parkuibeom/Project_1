import React from "react";
import logo from "./css/logo.png";

function Navbar({ userId }) {
  return (
    <nav
      id="topnav"
      className="navbar navbar-expand-lg bg-white navbar-light px-4 px-lg-5"
    >
      <a
        href="/dlt"
        className="navbar-brand d-flex align-items-center"
        id="mainLogoBox"
      >
        <img src={logo} alt="Logo" />
      </a>
      <button
        type="button"
        className="navbar-toggler me-0"
        data-bs-toggle="collapse"
        data-bs-target="#navbarCollapse"
      >
        <span className="navbar-toggler-icon"></span>
      </button>
      <div className="collapse navbar-collapse" id="navbarCollapse">
        <div className="navbar-nav ms-auto p-4 p-lg-0">
          <div className="nav-item dropdown">
            <a
              className="nav-link dropdown-toggle"
              href="/dlt/disease/map"
              role="button"
              data-bs-toggle="dropdown"
            >
              건강·정책
            </a>
            <div className="dropdown-menu">
              <a className="dropdown-item" href="/dlt/disease/map">
                질병 정보
              </a>
              <a className="dropdown-item" href="policy.jsp">
                정책
              </a>
            </div>
          </div>
          <div className="nav-item dropdown">
            <a
              className="nav-link dropdown-toggle"
              href="lifeService.jsp"
              role="button"
              data-bs-toggle="dropdown"
            >
              삶의 질 분석
            </a>
            <div className="dropdown-menu">
              <a className="dropdown-item" href="lifeService.jsp">
                기대수명 예측
              </a>
              <a className="dropdown-item" href="survey.jsp">
                당신의 만족도는?
              </a>
            </div>
          </div>
          <a href="/dlt/community/list?page=1" className="nav-item nav-link">
            커뮤니티
          </a>
          {userId === null ? (
            <a href="/dlt/member/login" className="nav-item nav-link">
              로그인
            </a>
          ) : (
            <a href="/dlt/member/logout" className="nav-item nav-link">
              로그아웃
            </a>
          )}
        </div>
      </div>
    </nav>
  );
}

export default Navbar;
