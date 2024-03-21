import React from "react";

function Footer() {
  return (
    <div
      className="container-fluid footer py-5"
      style={{ backgroundColor: "#1c3664" }}
    >
      <div className="container">
        <div className="row g-5">
          <div className="col-lg-8 col-md-6">
            <h5 className="text-white mb-4">Our Office</h5>
            <p className="mb-2 text-white">
              <i className="fa fa-map-marker-alt me-3"></i>서울시 서대문구
              이대역 바로앞
            </p>
            <p className="mb-2 text-white">
              <i className="fa fa-phone-alt me-3"></i>+012 3456 7890
            </p>
            <p className="mb-2 text-white">
              <i className="fa fa-envelope me-3"></i>dbwjdals62@gmail.com
            </p>
          </div>

          <div className="col-lg-4 col-md-6">
            <h5 className="text-white mb-4">Working Hours</h5>
            <p className="mb-1 text-white">Monday - Friday</p>
            <h6 className="text-light">09:00 am - 06:00 pm</h6>
            <p className="mb-1 text-white">Saturday/Sunday</p>
            <h6 className="text-light">Closed</h6>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Footer;
