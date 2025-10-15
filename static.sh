#!/bin/bash
set -e

# Define directory
WEB_DIR="/var/www/html/jenkins.html"

# Create folder
sudo mkdir -p $WEB_DIR
sudo chmod -R 755 $WEB_DIR

# -------------------------------
# Page 1: index.html (Home Page)
# -------------------------------
sudo tee $WEB_DIR/index.html > /dev/null <<'EOFINDEX'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Jenkins - Home</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { 
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #0a0e27;
      min-height: 100vh;
      text-align: center;
      padding: 0;
      overflow-x: hidden;
      position: relative;
    }
    body::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: 
        radial-gradient(circle at 20% 50%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
        radial-gradient(circle at 80% 80%, rgba(221, 74, 74, 0.3) 0%, transparent 50%),
        radial-gradient(circle at 40% 80%, rgba(74, 144, 226, 0.3) 0%, transparent 50%);
      animation: moveGradient 15s ease infinite;
    }
    @keyframes moveGradient {
      0%, 100% { opacity: 0.5; transform: scale(1); }
      50% { opacity: 0.8; transform: scale(1.1); }
    }
    nav { 
      background: rgba(255, 255, 255, 0.05);
      padding: 20px;
      backdrop-filter: blur(20px);
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      animation: slideDown 0.6s ease-out;
      position: relative;
      z-index: 10;
    }
    @keyframes slideDown {
      from { opacity: 0; transform: translateY(-30px); }
      to { opacity: 1; transform: translateY(0); }
    }
    nav a { 
      margin: 0 20px;
      text-decoration: none;
      color: #fff;
      font-weight: 600;
      padding: 12px 28px;
      border-radius: 30px;
      transition: all 0.4s ease;
      display: inline-block;
      position: relative;
      overflow: hidden;
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid rgba(255, 255, 255, 0.1);
    }
    nav a::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
      transition: left 0.5s ease;
    }
    nav a:hover::before {
      left: 100%;
    }
    nav a:hover { 
      background: rgba(120, 119, 198, 0.3);
      border-color: rgba(120, 119, 198, 0.5);
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(120, 119, 198, 0.4);
    }
    .hero-section {
      position: relative;
      z-index: 1;
      padding: 80px 20px;
      max-width: 1200px;
      margin: 0 auto;
    }
    .card { 
      background: rgba(255, 255, 255, 0.03);
      padding: 60px 50px;
      border-radius: 30px;
      display: inline-block;
      max-width: 900px;
      box-shadow: 
        0 30px 90px rgba(0, 0, 0, 0.4),
        inset 0 0 0 1px rgba(255, 255, 255, 0.1);
      animation: fadeInUp 0.8s ease-out 0.3s both;
      backdrop-filter: blur(20px);
      border: 1px solid rgba(255, 255, 255, 0.05);
      position: relative;
      overflow: hidden;
    }
    .card::before {
      content: '';
      position: absolute;
      top: -50%;
      left: -50%;
      width: 200%;
      height: 200%;
      background: radial-gradient(circle, rgba(120, 119, 198, 0.1) 0%, transparent 70%);
      animation: rotateGlow 20s linear infinite;
    }
    @keyframes rotateGlow {
      from { transform: rotate(0deg); }
      to { transform: rotate(360deg); }
    }
    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(50px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .logo-container {
      position: relative;
      margin-bottom: 40px;
    }
    .logo-circle {
      width: 250px;
      height: 250px;
      border-radius: 50%;
      background: linear-gradient(135deg, rgba(120, 119, 198, 0.2), rgba(221, 74, 74, 0.2));
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 30px;
      position: relative;
      animation: pulse 3s ease-in-out infinite;
      box-shadow: 
        0 0 60px rgba(120, 119, 198, 0.5),
        inset 0 0 30px rgba(255, 255, 255, 0.1);
    }
    @keyframes pulse {
      0%, 100% { 
        transform: scale(1);
        box-shadow: 0 0 60px rgba(120, 119, 198, 0.5), inset 0 0 30px rgba(255, 255, 255, 0.1);
      }
      50% { 
        transform: scale(1.05);
        box-shadow: 0 0 90px rgba(120, 119, 198, 0.8), inset 0 0 40px rgba(255, 255, 255, 0.2);
      }
    }
    .logo-circle::before,
    .logo-circle::after {
      content: '';
      position: absolute;
      border-radius: 50%;
      border: 2px solid rgba(120, 119, 198, 0.3);
    }
    .logo-circle::before {
      width: 280px;
      height: 280px;
      animation: ripple 3s ease-out infinite;
    }
    .logo-circle::after {
      width: 310px;
      height: 310px;
      animation: ripple 3s ease-out 1.5s infinite;
    }
    @keyframes ripple {
      0% {
        transform: scale(0.8);
        opacity: 1;
      }
      100% {
        transform: scale(1.2);
        opacity: 0;
      }
    }
    img { 
      transition: transform 0.5s ease;
      animation: float 4s ease-in-out infinite;
      filter: drop-shadow(0 10px 25px rgba(0, 0, 0, 0.5));
      position: relative;
      z-index: 1;
    }
    @keyframes float {
      0%, 100% { transform: translateY(0px) rotate(0deg); }
      25% { transform: translateY(-15px) rotate(2deg); }
      75% { transform: translateY(-10px) rotate(-2deg); }
    }
    img:hover { 
      transform: scale(1.15) rotate(5deg);
      filter: drop-shadow(0 15px 35px rgba(120, 119, 198, 0.8));
    }
    h1 { 
      color: #fff;
      margin-bottom: 25px;
      font-size: 3.5em;
      font-weight: 800;
      background: linear-gradient(135deg, #fff, #7877c6, #dd4a4a);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      animation: shimmer 3s ease-in-out infinite;
      background-size: 200% 200%;
      position: relative;
      z-index: 1;
    }
    @keyframes shimmer {
      0%, 100% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
    }
    p { 
      color: rgba(255, 255, 255, 0.8);
      line-height: 1.9;
      font-size: 1.2em;
      margin-bottom: 35px;
      position: relative;
      z-index: 1;
      text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
    }
    .particles {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      z-index: 0;
    }
    .particle {
      position: absolute;
      width: 4px;
      height: 4px;
      background: rgba(255, 255, 255, 0.5);
      border-radius: 50%;
      animation: particle-rise linear infinite;
    }
    @keyframes particle-rise {
      from {
        transform: translateY(100vh) scale(0);
        opacity: 0;
      }
      10% {
        opacity: 1;
      }
      90% {
        opacity: 1;
      }
      to {
        transform: translateY(-100px) scale(1);
        opacity: 0;
      }
    }
    .particle:nth-child(1) { left: 10%; animation-duration: 8s; animation-delay: 0s; }
    .particle:nth-child(2) { left: 25%; animation-duration: 12s; animation-delay: 2s; }
    .particle:nth-child(3) { left: 40%; animation-duration: 10s; animation-delay: 4s; }
    .particle:nth-child(4) { left: 55%; animation-duration: 14s; animation-delay: 1s; }
    .particle:nth-child(5) { left: 70%; animation-duration: 9s; animation-delay: 3s; }
    .particle:nth-child(6) { left: 85%; animation-duration: 11s; animation-delay: 5s; }
  </style>
</head>
<body>
  <div class="particles">
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
  </div>
  <nav>
    <a href="index.html">Home</a>
    <a href="installation.html">Installation</a>
    <a href="features.html">Key Features</a>
  </nav>
  <div class="hero-section">
    <div class="card">
      <div class="logo-container">
        <div class="logo-circle">
          <img src="https://www.jenkins.io/images/logos/jenkins/jenkins.png" alt="Jenkins Logo" width="200">
        </div>
      </div>
      <h1>Welcome to Jenkins</h1>
      <p>Jenkins is an open-source automation server that helps automate the parts of software development related to building, testing, and deploying.</p>
    </div>
  </div>
</body>
</html>
EOFINDEX

# ----------------------------------
# Page 2: installation.html (Setup)
# ----------------------------------
sudo tee $WEB_DIR/installation.html > /dev/null <<'EOFINSTALL'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Jenkins Installation</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { 
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #0a0e27;
      min-height: 100vh;
      text-align: center;
      padding: 0;
      overflow-x: hidden;
      position: relative;
    }
    body::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: 
        radial-gradient(circle at 20% 50%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
        radial-gradient(circle at 80% 80%, rgba(221, 74, 74, 0.3) 0%, transparent 50%),
        radial-gradient(circle at 40% 80%, rgba(74, 144, 226, 0.3) 0%, transparent 50%);
      animation: moveGradient 15s ease infinite;
    }
    @keyframes moveGradient {
      0%, 100% { opacity: 0.5; transform: scale(1); }
      50% { opacity: 0.8; transform: scale(1.1); }
    }
    nav { 
      background: rgba(255, 255, 255, 0.05);
      padding: 20px;
      backdrop-filter: blur(20px);
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      animation: slideDown 0.6s ease-out;
      position: relative;
      z-index: 10;
    }
    @keyframes slideDown {
      from { opacity: 0; transform: translateY(-30px); }
      to { opacity: 1; transform: translateY(0); }
    }
    nav a { 
      margin: 0 20px;
      text-decoration: none;
      color: #fff;
      font-weight: 600;
      padding: 12px 28px;
      border-radius: 30px;
      transition: all 0.4s ease;
      display: inline-block;
      position: relative;
      overflow: hidden;
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid rgba(255, 255, 255, 0.1);
    }
    nav a::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
      transition: left 0.5s ease;
    }
    nav a:hover::before {
      left: 100%;
    }
    nav a:hover { 
      background: rgba(120, 119, 198, 0.3);
      border-color: rgba(120, 119, 198, 0.5);
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(120, 119, 198, 0.4);
    }
    .hero-section {
      position: relative;
      z-index: 1;
      padding: 80px 20px;
      max-width: 1200px;
      margin: 0 auto;
    }
    h1 { 
      color: #fff;
      margin-bottom: 40px;
      font-size: 3em;
      font-weight: 800;
      background: linear-gradient(135deg, #fff, #7877c6, #dd4a4a);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      animation: shimmer 3s ease-in-out infinite;
      background-size: 200% 200%;
      position: relative;
      z-index: 1;
    }
    @keyframes shimmer {
      0%, 100% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
    }
    ol { 
      text-align: left;
      display: inline-block;
      background: rgba(255, 255, 255, 0.03);
      padding: 50px 60px;
      border-radius: 30px;
      box-shadow: 
        0 30px 90px rgba(0, 0, 0, 0.4),
        inset 0 0 0 1px rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(20px);
      max-width: 800px;
      border: 1px solid rgba(255, 255, 255, 0.05);
      position: relative;
      overflow: hidden;
    }
    ol::before {
      content: '';
      position: absolute;
      top: -50%;
      left: -50%;
      width: 200%;
      height: 200%;
      background: radial-gradient(circle, rgba(120, 119, 198, 0.1) 0%, transparent 70%);
      animation: rotateGlow 20s linear infinite;
    }
    @keyframes rotateGlow {
      from { transform: rotate(0deg); }
      to { transform: rotate(360deg); }
    }
    li { 
      color: rgba(255, 255, 255, 0.9);
      margin: 25px 0;
      font-size: 1.15em;
      line-height: 1.8;
      padding-left: 10px;
      opacity: 0;
      animation: fadeInLeft 0.6s ease-out forwards;
      position: relative;
      z-index: 1;
    }
    li:nth-child(1) { animation-delay: 0.1s; }
    li:nth-child(2) { animation-delay: 0.2s; }
    li:nth-child(3) { animation-delay: 0.3s; }
    li:nth-child(4) { animation-delay: 0.4s; }
    li:nth-child(5) { animation-delay: 0.5s; }
    li:nth-child(6) { animation-delay: 0.6s; }
    @keyframes fadeInLeft {
      from { opacity: 0; transform: translateX(-20px); }
      to { opacity: 1; transform: translateX(0); }
    }
    li:hover { 
      transform: translateX(10px);
      transition: transform 0.3s ease;
      color: #fff;
    }
    code { 
      background: linear-gradient(135deg, rgba(120, 119, 198, 0.4), rgba(221, 74, 74, 0.4));
      color: #fff;
      padding: 6px 16px;
      border-radius: 8px;
      font-family: 'Courier New', monospace;
      font-size: 0.9em;
      transition: all 0.3s ease;
      display: inline-block;
      border: 1px solid rgba(255, 255, 255, 0.2);
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }
    code:hover {
      transform: scale(1.05);
      box-shadow: 0 6px 25px rgba(120, 119, 198, 0.5);
      border-color: rgba(120, 119, 198, 0.5);
    }
    .particles {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      z-index: 0;
    }
    .particle {
      position: absolute;
      width: 4px;
      height: 4px;
      background: rgba(255, 255, 255, 0.5);
      border-radius: 50%;
      animation: particle-rise linear infinite;
    }
    @keyframes particle-rise {
      from {
        transform: translateY(100vh) scale(0);
        opacity: 0;
      }
      10% {
        opacity: 1;
      }
      90% {
        opacity: 1;
      }
      to {
        transform: translateY(-100px) scale(1);
        opacity: 0;
      }
    }
    .particle:nth-child(1) { left: 10%; animation-duration: 8s; animation-delay: 0s; }
    .particle:nth-child(2) { left: 25%; animation-duration: 12s; animation-delay: 2s; }
    .particle:nth-child(3) { left: 40%; animation-duration: 10s; animation-delay: 4s; }
    .particle:nth-child(4) { left: 55%; animation-duration: 14s; animation-delay: 1s; }
    .particle:nth-child(5) { left: 70%; animation-duration: 9s; animation-delay: 3s; }
    .particle:nth-child(6) { left: 85%; animation-duration: 11s; animation-delay: 5s; }
  </style>
</head>
<body>
  <div class="particles">
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
  </div>
  <nav>
    <a href="index.html">Home</a>
    <a href="installation.html">Installation</a>
    <a href="features.html">Key Features</a>
  </nav>
  <div class="hero-section">
    <h1>How to Install Jenkins</h1>
    <ol>
      <li>Update your system: <code>sudo apt update</code></li>
      <li>Install Java: <code>sudo apt install openjdk-11-jdk -y</code></li>
      <li>Add Jenkins repo and key.</li>
      <li>Install Jenkins: <code>sudo apt install jenkins -y</code></li>
      <li>Start Jenkins service: <code>sudo systemctl start jenkins</code></li>
      <li>Access it via <code>http://localhost:8080</code></li>
    </ol>
  </div>
</body>
</html>
EOFINSTALL

# ----------------------------------
# Page 3: features.html (Key Features)
# ----------------------------------
sudo tee $WEB_DIR/features.html > /dev/null <<'EOFFEATURES'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Jenkins Key Features</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { 
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #0a0e27;
      min-height: 100vh;
      text-align: center;
      padding: 0;
      overflow-x: hidden;
      position: relative;
    }
    body::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: 
        radial-gradient(circle at 20% 50%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
        radial-gradient(circle at 80% 80%, rgba(221, 74, 74, 0.3) 0%, transparent 50%),
        radial-gradient(circle at 40% 80%, rgba(74, 144, 226, 0.3) 0%, transparent 50%);
      animation: moveGradient 15s ease infinite;
    }
    @keyframes moveGradient {
      0%, 100% { opacity: 0.5; transform: scale(1); }
      50% { opacity: 0.8; transform: scale(1.1); }
    }
    nav { 
      background: rgba(255, 255, 255, 0.05);
      padding: 20px;
      backdrop-filter: blur(20px);
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      animation: slideDown 0.6s ease-out;
      position: relative;
      z-index: 10;
    }
    @keyframes slideDown {
      from { opacity: 0; transform: translateY(-30px); }
      to { opacity: 1; transform: translateY(0); }
    }
    nav a { 
      margin: 0 20px;
      text-decoration: none;
      color: #fff;
      font-weight: 600;
      padding: 12px 28px;
      border-radius: 30px;
      transition: all 0.4s ease;
      display: inline-block;
      position: relative;
      overflow: hidden;
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid rgba(255, 255, 255, 0.1);
    }
    nav a::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
      transition: left 0.5s ease;
    }
    nav a:hover::before {
      left: 100%;
    }
    nav a:hover { 
      background: rgba(120, 119, 198, 0.3);
      border-color: rgba(120, 119, 198, 0.5);
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(120, 119, 198, 0.4);
    }
    .hero-section {
      position: relative;
      z-index: 1;
      padding: 80px 20px;
      max-width: 1200px;
      margin: 0 auto;
    }
    h1 { 
      color: #fff;
      margin-bottom: 40px;
      font-size: 3em;
      font-weight: 800;
      background: linear-gradient(135deg, #fff, #7877c6, #dd4a4a);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      animation: shimmer 3s ease-in-out infinite;
      background-size: 200% 200%;
      position: relative;
      z-index: 1;
    }
    @keyframes shimmer {
      0%, 100% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
    }
    ul { 
      text-align: left;
      display: inline-block;
      background: rgba(255, 255, 255, 0.03);
      padding: 50px 60px;
      border-radius: 30px;
      list-style: none;
      box-shadow: 
        0 30px 90px rgba(0, 0, 0, 0.4),
        inset 0 0 0 1px rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(20px);
      max-width: 800px;
      border: 1px solid rgba(255, 255, 255, 0.05);
      position: relative;
      overflow: hidden;
    }
    ul::before {
      content: '';
      position: absolute;
      top: -50%;
      left: -50%;
      width: 200%;
      height: 200%;
      background: radial-gradient(circle, rgba(120, 119, 198, 0.1) 0%, transparent 70%);
      animation: rotateGlow 20s linear infinite;
    }
    @keyframes rotateGlow {
      from { transform: rotate(0deg); }
      to { transform: rotate(360deg); }
    }
    li { 
      color: rgba(255, 255, 255, 0.9);
      margin: 25px 0;
      font-size: 1.15em;
      line-height: 1.8;
      padding-left: 45px;
      position: relative;
      opacity: 0;
      animation: fadeInRight 0.6s ease-out forwards;
      transition: all 0.3s ease;
      z-index: 1;
    }
    li:nth-child(1) { animation-delay: 0.1s; }
    li:nth-child(2) { animation-delay: 0.2s; }
    li:nth-child(3) { animation-delay: 0.3s; }
    li:nth-child(4) { animation-delay: 0.4s; }
    li:nth-child(5) { animation-delay: 0.5s; }
    li:nth-child(6) { animation-delay: 0.6s; }
    @keyframes fadeInRight {
      from { opacity: 0; transform: translateX(20px); }
      to { opacity: 1; transform: translateX(0); }
    }
    li:before {
      content: "\2713";
      position: absolute;
      left: 0;
      color: #fff;
      background: linear-gradient(135deg, rgba(120, 119, 198, 0.6), rgba(221, 74, 74, 0.6));
      width: 32px;
      height: 32px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      transition: all 0.4s ease;
      box-shadow: 0 4px 15px rgba(120, 119, 198, 0.3);
      border: 1px solid rgba(255, 255, 255, 0.2);
    }
    li:hover {
      transform: translateX(10px);
      color: #fff;
    }
    li:hover:before {
      transform: scale(1.2) rotate(360deg);
      box-shadow: 0 8px 25px rgba(120, 119, 198, 0.6);
      background: linear-gradient(135deg, rgba(120, 119, 198, 0.8), rgba(221, 74, 74, 0.8));
    }
    .particles {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      z-index: 0;
    }
    .particle {
      position: absolute;
      width: 4px;
      height: 4px;
      background: rgba(255, 255, 255, 0.5);
      border-radius: 50%;
      animation: particle-rise linear infinite;
    }
    @keyframes particle-rise {
      from {
        transform: translateY(100vh) scale(0);
        opacity: 0;
      }
      10% {
        opacity: 1;
      }
      90% {
        opacity: 1;
      }
      to {
        transform: translateY(-100px) scale(1);
        opacity: 0;
      }
    }
    .particle:nth-child(1) { left: 10%; animation-duration: 8s; animation-delay: 0s; }
    .particle:nth-child(2) { left: 25%; animation-duration: 12s; animation-delay: 2s; }
    .particle:nth-child(3) { left: 40%; animation-duration: 10s; animation-delay: 4s; }
    .particle:nth-child(4) { left: 55%; animation-duration: 14s; animation-delay: 1s; }
    .particle:nth-child(5) { left: 70%; animation-duration: 9s; animation-delay: 3s; }
    .particle:nth-child(6) { left: 85%; animation-duration: 11s; animation-delay: 5s; }
  </style>
</head>
<body>
  <div class="particles">
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
  </div>
  <nav>
    <a href="index.html">Home</a>
    <a href="installation.html">Installation</a>
    <a href="features.html">Key Features</a>
  </nav>
  <div class="hero-section">
    <h1>Key Features of Jenkins</h1>
    <ul>
      <li>Open Source and Free</li>
      <li>Easy Installation and Configuration</li>
      <li>Supports CI/CD Pipeline Automation</li>
      <li>Integrates with 1000+ Plugins</li>
      <li>Extensible and Scalable Architecture</li>
      <li>Supports Parallel and Distributed Builds</li>
    </ul>
  </div>
</body>
</html>
EOFFEATURES

echo "✅ Jenkins static website deployed at: $WEB_DIR"