import React from 'react';
import './App.css';
import logo from "./images/Glorious Purpose.svg";
import charityImg from "./images/charity-img.png";
import disasterImg from './images/diasater-img.png';
import medicalImg from './images/medical-img.png';
import crowdImg from './images/crowdf-img.png';
import ellipse from './images/Ellipse 2.svg';

function App() {
  return (
    <div className="App">
      <header className="top">
        <nav className="nav">
          <img src={logo} alt="Logo" className="logo" />
          <button className="btn" id="abt">About us</button>
          <button className="btn" id="login-button">Login</button>
        </nav>
      </header>

      <div className="space"></div>

      <div className="ani-cont">
        <DisplayBox title="Charity" imgSrc={charityImg} />
        <DisplayBox title="Disaster Relief" imgSrc={disasterImg} />
        <DisplayBox title="Medical funds" imgSrc={medicalImg} />
        <DisplayBox title="Crowd Funding" imgSrc={crowdImg} />
      </div>

      <div className="quote">
        “LETS SUPPORT THOSE IN NEED”
      </div>
      
      <div className="ellipse">
        <img src={ellipse} alt="Ellipse" />
        <AboutSection />
      </div>
    </div>
  );
}

function DisplayBox({ title, imgSrc }) {
  return (
    <div className="dis-box">
      <div className="g-text">{title}</div>
      <div className="img-box">
        <img src={imgSrc} alt={title} />
      </div>
    </div>
  );
}

function AboutSection() {
  return (
    <div className="about-section">
      <h2>About Us</h2>
      <p id="about">
        Welcome to our fundraiser website!<br />
        We are dedicated to making a positive impact in the community by creating a platform to raise funds for various causes and initiatives. Our team consists of passionate individuals who believe in the power of collective action to bring about change.
      </p>
    </div>
  );
}

export default App;
