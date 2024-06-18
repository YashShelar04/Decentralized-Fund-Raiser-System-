import React from 'react';
import './Home.css';
import logo from "/src/images/Glorious Purpose.svg";
import charityImg from "/src/images/charity-img.png";
import disasterImg from '/src/images/diasater-img.png';
import medicalImg from '/src/images/medical-img.png';
import crowdImg from '/src/images/crowdf-img.png';
import ellipse from '/src/images/Ellipse 2.svg';
import useResponsive from '/src/useResponsive';
import {Link,NavLink} from 'react-router-dom';


function Home() {
    const { width } = useResponsive();
  
    return (
      <div className="App">
        <header className="top">
          <nav className="nav">
            <img src={logo} alt="Logo" className="logo" />
            <button className="btn" id="abt">About us</button>
            {/* <button className="btn" id="login-button">Login</button> */}
            <Link className='btn' to="dashboard">
            Login
            </Link>
          </nav>
        </header>
  
        <div className="space"></div>
  
        <div className="ani-cont">
          <DisplayBox title="Charity" imgSrc={charityImg} width={width} />
          <DisplayBox title="Disaster Relief" imgSrc={disasterImg} width={width} />
          <DisplayBox title="Medical funds" imgSrc={medicalImg} width={width} />
          <DisplayBox title="Crowd Funding" imgSrc={crowdImg} width={width} />
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
  
  function DisplayBox({ title, imgSrc, width }) {
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

  export default Home;
  