<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/mainHome.css" type="text/css" />

<slide>
    <img class="slide1" src="/images/homeBanner/레전드.jpg" width="1400" height="400" alt>
    <img class="slide1" src="/images/homeBanner/블랙아담.jpg" width="1400" height="400" alt>
    <img class="slide1" src="/images/homeBanner/수리남.jpg" width="1400" height="400" alt>
    <img class="slide1" src="/images/homeBanner/종이의집.jpg" width="1400" height="400" alt>
    <img class="slide1" src="/images/homeBanner/테넷.jpg" width="1400" height="400" alt>
</slide>

<script>
    var index = 0; //이미지에 접근하는 인덱스
    window.onload = function () {
        slideShow();
    }

    function slideShow() {
        var i;
        var x = document.getElementsByClassName("slide1"); //slide1에 대한 dom 참조
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none"; //처음에 전부 display를 none으로 한다.
        }
        index++;
        if (index > x.length) {
            index = 1; //인덱스가 초과되면 1로 변경
        }
        x[index - 1].style.display = "block"; //해당 인덱스는 block으로
        setTimeout(slideShow, 4000); //함수를 4초마다 호출

    }
</script>

<form:form modelAttribute="netflexList" >

	<h2>넷플릭스 TOP 5</h2>
	
	<div id="list">
		<c:forEach items="${netflexList}" var="list">
			<ul>
				<li><a target="_blank" href="${list.link}"><img src="${list.poster}" width="240" height="320" alt /></a></li>
				<li>${list.title}</li>
			</ul>
		</c:forEach>
	</div>
	
</form:form>

<form:form modelAttribute="coupangList" >

	<h2>쿠팡 플레이 TOP 5</h2>
	
	<div id="list">
		<c:forEach items="${coupangList}" var="list">
			<ul>
				<li><img src="${list.poster}" width="240" height="320" alt /></li>
				<li>${list.title}</li>
			</ul>
		</c:forEach>
	</div>
	
</form:form>

<form:form modelAttribute="waveList" >

	<h2>웨이브 TOP 5</h2>
	
	<div id="list">
		<c:forEach items="${waveList}" var="list">
			<ul>
				<li><img src="${list.poster}" width="240" height="320" alt /></li>
				<li>${list.title}</li>
			</ul>
		</c:forEach>
	</div>
	
</form:form>

<form:form modelAttribute="watchaList" >

	<h2>왓챠 TOP 5</h2>
	
	<div id="list">
		<c:forEach items="${watchaList}" var="list">
			<ul>
				<li><img src="${list.poster}" width="240" height="320" alt /></li>
				<li>${list.title}</li>
			</ul>
		</c:forEach>
	</div>
	
</form:form>

<form:form modelAttribute="disneyList" >

	<h2>디즈니 플러스 TOP 5</h2>
	
	<div id="list">
		<c:forEach items="${disneyList}" var="list">
			<ul>
				<li><img src="${list.poster}" width="240" height="320" alt /></li>
				<li>${list.title}</li>
			</ul>
		</c:forEach>
	</div>
	
</form:form>

<form:form modelAttribute="tivingList" >

	<h2>티빙 TOP 5</h2>
	
	<div id="list">
		<c:forEach items="${tivingList}" var="list">
			<ul>
				<li><img src="${list.poster}" width="240" height="320" alt /></li>
				<li>${list.title}</li>
			</ul>
		</c:forEach>
	</div>
	
</form:form>




