<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.model.Match"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Live Cricket Score</title>
<style type="text/css">

body {
    background-repeat: no-repeat;
    background-size: cover;
    background-image: url(https://www.mykhel.com/img/2022/01/cricket-1642491052.jpg);
}
.card {
    width: 45%;
    height: 371px;
    border-radius: 23px;
    display: inline-flex;
    color: black;
    position: relative;
    flex-direction: column;
  
        background-color: #c9dbf569;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
    overflow: hidden;
    margin: 2%;
}

.card:hover {
  box-shadow: rgb(0,0,0) 5px 10px 50px ,rgb(0,0,0) -5px 0px 250px;
}
.time-text {
    font-size: 18px;
    margin-top: 3px;
    margin-left: 4%;
    font-weight: 900;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    color: #000000ba;
}

.time-sub-text {
  font-size: 15px;
  margin-left: 5px;
}
.day-text {
    font-size: 30px;
    margin-top: 16px;
    /* margin-left: 22px; */
    background-color: black;
    width: 100%;
    color: white;
        display: flex;
    justify-content: center;
}
.day-text2 {
    font-size: 22px;
    margin-top: 8px;
    font-weight: 900;
    background-color: cadetblue;
    color: whitesmoke;
    display: flex;
    justify-content: center;
}

.day-text3 {
    font-size: 22px;
    margin-top: 3px;
    /* margin-left: 5%; */
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    display: flex;
    justify-content: center;
}


.day-text4 {
    display: flex;
    font-size: 22px;
    margin-top: 3px;
    /* margin-left: revert; */
    font-weight: 600;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    justify-content: center;
    /* color: white; */
    /* border: 2px solid black; */
}
.moon {
  font-size: 20px;
  position: absolute;
  right: 15px;
  top: 15px;
  transition: all 0.3s ease-in-out;
}

.card:hover > .moon {
  font-size: 23px;
}

nav {
    
    background-color: #3586ff;
    margin: -8px;
    padding: 1px;
    height: 80px;
}
.container {
    height: 74px;
    margin-top: -38px;
    margin-left: 100px;
}
.btn {
 position: relative;
 font-size: 17px;
 text-transform: uppercase;
 text-decoration: none;
 padding: 1em 2.5em;
 display: inline-block;
 border-radius: 6em;
 transition: all .2s;
 border: none;
 font-family: inherit;
 font-weight: 500;
 color: black;
 background-color: white;
 cursor: pointer;
}

.btn:hover {
 transform: translateY(-3px);
 box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.btn:active {
 transform: translateY(-1px);
 box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.btn::after {
 content: "";
 display: inline-block;
 height: 100%;
 width: 100%;
 border-radius: 100px;
 position: absolute;
 top: 0;
 left: 0;
 z-index: -1;
 transition: all .4s;
}

.btn::after {
 background-color: #fff;
}

.btn:hover::after {
 transform: scaleX(1.4) scaleY(1.6);
 opacity: 0;
}
.animate-charcter{
   text-transform: uppercase;
  background-image: linear-gradient(
    -225deg,
    #231557 0%,
    #44107a 29%,
    #ff1361 67%,
    #fff800 100%
  );
  background-size: auto auto;
  background-clip: border-box;
  background-size: 200% auto;
  color: #fff;
  background-clip: text;
  text-fill-color: transparent;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: textclip 2s linear infinite;
  display: inline-block;
      font-size: 50px;
      
}

@keyframes textclip {
  to {
    background-position: 200% center;
  }
}
.but {
    margin: -20px 114px;
    
}

/*  Footer*/
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap");



.footer {
  position: relative;
  width: 93%;
  background: #3586ff;
  min-height: 50px;
  padding: 20px 50px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.social-icon,
.menu {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 10px 0;
  flex-wrap: wrap;
}

.social-icon__item,
.menu__item {
  list-style: none;
}

.social-icon__link {
  font-size: 2rem;
  color: #fff;
  margin: 0 10px;
  display: inline-block;
  transition: 0.5s;
}
.social-icon__link:hover {
  transform: translateY(-10px);
}

.menu__link {
  font-size: 1.2rem;
  color: #fff;
  margin: 0 10px;
  display: inline-block;
  transition: 0.5s;
  text-decoration: none;
  opacity: 0.75;
  font-weight: 300;
}

.menu__link:hover {
  opacity: 1;
}

.footer p {
  color: #fff;
  margin: 15px 0 10px 0;
  font-size: 1rem;
  font-weight: 300;
}

@media (max-width : 1000px) {
    .card {
        width: 74%;
        height: 43vh;
        border-radius: 27px;
        /* display: inline-flex; */
        color: black;
        position: relative;
        flex-direction: column;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
        overflow: hidden;
        margin: 2%;
        margin-left: 13%;
    }
}




</style>
</head>

<body>
<header>
<nav>
<div class="container">
  <div class="row">
    <div class="col-md-12 text-center">
      <h3 class="animate-charcter"> LIVE CRICKET SCORE</h3>
    </div>
  </div>
</div>
<div align="right" class="but" >
<button class="btn" id="refresh-button" > REFRESH
</button>
</div>
</nav>
</header>

<% List<Match> mt = (List<Match>)request.getAttribute("data"); %>


<% for(Match m1 :  mt){%>
<div class="card">
<p class="day-text"><%=m1.getTeamHeading() %></p>
<p class="time-text"><%=m1.getMatchNumberVenue() %></p>
<p class="day-text2"><%=m1.getBattingTeam()+"       "+m1.getBattingTeamScore()%></p>
<p class="day-text2"><%=m1.getBowlTeam()+"                "+m1.getBowlTeamScore()%></p>
<p class="day-text3"><%=m1.getLiveText()%></p>
<p class="day-text4"><%=m1.getTextComplete()%></p> 

</div>
<% } %>	

<body>
  <footer class="footer">
    <div class="waves">
      <div class="wave" id="wave1"></div>
      <div class="wave" id="wave2"></div>
      <div class="wave" id="wave3"></div>
      <div class="wave" id="wave4"></div>
    </div>
    <ul class="social-icon">
      <li class="social-icon__item"><a class="social-icon__link" href="https://www.facebook.com/hitesh.chaudhari.90281">
          <ion-icon name="logo-facebook"></ion-icon>
        </a></li>
      <li class="social-icon__item"><a class="social-icon__link" href="https://github.com/HiteshChaudhari007">
          <ion-icon name="logo-github"></ion-icon>
        </a></li>
      <li class="social-icon__item"><a class="social-icon__link" href="https://www.linkedin.com/in/hitesh-chaudhari-88380b21b/">
          <ion-icon name="logo-linkedin"></ion-icon>
        </a></li>
      <li class="social-icon__item"><a class="social-icon__link" href="https://www.instagram.com/__.hitesh.__07/">
          <ion-icon name="logo-instagram"></ion-icon>
        </a></li>
    </ul>
    
    <p>&copy;2024 Hitesh Chaudhari  | All Rights Reserved</p>
  </footer>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

<script type="text/javascript">
var refreshButton = document.getElementById("refresh-button");
refreshButton.addEventListener("click", function(event) {
    window.location.reload();
});
</script>
</body>
</html>