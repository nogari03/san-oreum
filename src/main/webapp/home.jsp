<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="/common/header.jsp" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/views/home.css">
<body class="container pt-4">
<!-- cover -->
<div class="inner-cover justify-content-center align-self-center" style="display:flex;height: 400px">
	<div class="justify-content-center align-self-center text-center" style="display: inline">
		<p style="font-size: 3em">등산 좋아하세요?</p>
		<div class="form-inline">
			<input id="keyword" type="text" class="form-control" style="width:500px;height: 50px" placeholder="등산모임 검색하기">
			<a href="#" class="pl-2" onclick="mainSearch()">
				<img src="../resources/img/search.png" width="25" height="25" onclick="">
			</a>
		</div>
		<div class="text-left">
			<div style="display: inline-block">인기검색어</div>
			<div id="keywordRank" class="text-left pl-3" style="display: inline-block"></div>
		</div>
	</div>
</div>
<hr />
<header>
	<div id="carouselExampleIndicators" class="carousel slide container" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- Slide One - Set the background image for this slide in the line below -->
			<div class="carousel-item active" style="background-image: url('resources/img/slider/slider1-1.jpg')">
				<div class="carousel-caption">
					<h3 class="display-4">가을에는 역시~ 단풍구경이죠</h3>
					<p class="lead">국내 단풍명소 10선을 소개합니다 ..더보기</p>
				</div>
			</div>
			<!-- Slide Two - Set the background image for this slide in the line below -->
			<div class="carousel-item" style="background-image: url('/resources/img/slider/slider1-2.jpg')">
				<div class="carousel-caption">
					<h3 class="display-4">겨울산행을 미리 준비하는 이유</h3>
					<p class="lead">올해도 일출 보러 가실거죠? ..더보기</p>
				</div>
			</div>
			<!-- Slide Three - Set the background image for this slide in the line below -->
			<div class="carousel-item" style="background-image: url('/resources/img/slider/slider1-3.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-4">한사랑 산악회</h3>
					<p class="lead">산과 함께 호흡하는 그대들이 아름답다 ..더보기</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</header>
	<hr />
	<div class="pt-3">
		<label for="groupList">
			<h1>인기 등산모임</h1>
		</label>
		<div id="groupList" class="row"></div>
	</div>
	<hr />
	<div class="row">
		<div class="col-sm-12 col-md-6">
			<label for="afterList">
				<h1>인기 등산후기</h1>
			</label>
			<div id="afterList"></div>
		</div>
		<div class="col-sm-12 col-md-6">
			<label for="moimList">
				<h1>인기 산악회</h1>
			</label>
			<div id="moimList"></div>
		</div>
	</div>
	<hr />
	<div class="row">
		<div class="col-sm-12 col-md-6">
			<p><h2>공지사항</h2></p>
			<ul id="noticeList" class="list-group">
			</ul>
		</div>
		<div class="col-sm-12 col-md-6">
			<p><h2>이벤트</h2></p>
			<a href="/board/261.do"><img src="./resources/img/test/event1.jpg" style="max-width: 100%"></a>
		</div>
	</div>
	<hr />
	<div id="memberCount" class="text-center" style="width:100%;justify-content: center;flex-direction: column">
		<div class="memberCountCon col-12" style="font-size:40px;"></div>
	</div>
	<hr />
</div>

<!-- js -->
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function (){
		mainGroupList();
		mainAfterList();
		mainMoimList();
		mainNotice();
		keywordRank();
		ticker();
		tickerover();
	})

	var memberCountConTxt= 296842;

	$({ val : 0 }).animate({ val : memberCountConTxt }, {
		duration: 1000,
		step: function() {
			var num = numberWithCommas(Math.floor(this.val));
			$(".memberCountCon").text("현재 "+num+ "번의 등산이 이루어졌어요");
		},
		complete: function() {
			var num = numberWithCommas(Math.floor(this.val));
			$(".memberCountCon").text("현재 "+num+ "번의 등산이 이루어졌어요" );
		}
	});

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function moveToMain(){
		var location = document.querySelector('header').offsetTop;
		window.scrollTo({top:location, behavior:"smooth"})
	}

	function mainSearch(){
		location.href = "/main/search.do?keyword="+$('#keyword').val()+"";
	}
	function ticker(){
		timer = setTimeout(function (){
			$('#keywordRank li:first').animate({marginTop: '-20px'}, 400, function (){
				$(this).detach().appendTo('ul#keywordRank').removeAttr('style');
			});
			ticker();
		},2000);
	}

	function tickerover(){
		$('#keywordRank').mouseover(function (){
			clearTimeout(timer);
		});
		$('#keywordRank').mouseout(function (){
			ticker();
		})
	}

	function keywordRank() {
		$.ajax({
			type: "GET",
			url: "/search/rank.do",
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			success: function (response) {

				for (var i = 0; i < response.length; i++) {
					var html = '';

					html += '<li>';
					html += '<span style="color: lightseagreen">' + (i + 1) + '</span>' + ' ';
					html += '<a onclick="setKeyword(\'' + response[i].KEYWORD + '\')">' + response[i].KEYWORD + '</a>';
					html += '</li>';
					$('#keywordRank').append(html)
				}
			},
			error: function (response) {
				console.log("error")
			}
		})
	}
	function setKeyword(keyword){
		$('#keyword').val(keyword)
	}

	function mainGroupList(){

		$.ajax({
			type: "GET",
			url: "/main/groupList.do",
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			success: function (response){

				for(var i=0;i<response.length;i++) {

					var editorContent = response[i].DETAIL;
					var covertContent = editorContent.replace(/(<([^>]+)>)/ig,"");

					var html = '';

					html += '<div class="pt-3 col-lg-4 col-sm-6" id="groupList">';
					html += '<div class="card border-0" >';
					html += '<a href="/group/' + response[i].GROUPNUM + '">';
					html += '<img class="card-img-top" src="<spring:eval expression="@config[\'imgPath\']" />' + response[i].STOREDFILENAME + '" alt="..." style="width: 100%" />'
					html += '</a>';
					html += '<div class="card-body row p-3 pl-4">';
					html += '<a href="/profile/' + response[i].ID + '" onclick=\"window.open(this.href,\'\',\'width=500, height=600\'); return false;">';
					html += '<img src="<spring:eval expression="@config[\'imgPath\']" />' + response[i].CONTENT2 + '" class="rounded-circle" style="width: 40px;height: 40px;">';
					html += '</a>';
					html += '<div class="col-10 p-0 pl-2">';
					html += '<h5 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">';

					if (response[i].STATUS == '모집중') {
						html += '<span style="color: limegreen">';
					} else if (response[i].STATUS == '마감') {
						html += '<span style="color: red">';
					}

					html += '[' + response[i].STATUS + ']</span>';
					html += response[i].NAME;
					html += '</h5>';
					html += '<p class="card-text text-muted mb-1" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">' + covertContent + '</p>';
					html += '<p class="text-muted">' + response[i].STARTDAY + ' 출발</p>'
					html += '</div></div></div></div>';

					$('#groupList').append(html);
				}
			},
			error: function(response){
				console.log("error");
			}
		})
	}

	function mainAfterList(){
		$.ajax({
			type: "GET",
			url: "/main/afterList.do",
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			success: function (response){
				for(var i=0;i<response.length;i++){

					var html = '';

					html += '<a href="/after/'+response[i].AFTERNUM+'.do">';
					html += '<div class="media p-1">';
					html += '<img src="<spring:eval expression="@config['imgPath']" />'+response[i].CONTENT2+'" class="mr-3 rounded" style="width: 50px;height: 50px">';
					html += '<div class="media-body">';
					html += '<span>';
					html += '<h4 class="m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">['+response[i].MTNM+'] '+response[i].TITLE+'</h4>';
					html += '<div class="text-muted">'+response[i].CREATEDAT+'</div>'
					html += '</span></div></div></a>';

					$('#afterList').append(html);
				}


			},
			error: function(response){
				console.log("error");
			}
		})
	}

	function mainMoimList(){

		var data = {
			keyword : "like",
			rowNum : 0
		}

		$.ajax({
			type: "GET",
			url: "/main/commuList.do",
			data: data,
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			success: function (response){

				for(var i=0;i<5;i++){

					var html = '';

					html += '<a href="/commu/commuPageView.do?groupNum='+response[i].GROUPNUM+'">';
					html += '<div class="media p-1">';
					html += '<img src="<spring:eval expression="@config[\'imgPath\']" />'+response[i].STOREDFILENAME+'" class="mr-3 rounded" style="width: 50px;height: 50px">';
					html += '<div class="media-body">';
					html += '<span>';
					html += '<h4 class="m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+response[i].NAME+'</h4>';
					html += '<div class="text-muted"> 멤버 '+ response[i].STAFFCURRENT +'/'+ response[i].AREA+ '</div>'
					html += '</span></div></div></a>';

					$('#moimList').append(html);
				}


			},
			error: function(response){
				console.log("error");
			}
		})
	}

	function mainNotice(){
		$.ajax({
			type: "GET",
			url: "/main/noticeList.do",
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			success: function (response){
				for(var i=0;i<5;i++){

					var html = '';
					html += '<li class="list-group-item"><a href="/board/'+response[i].CSPOSTNUM+'.do" class="notice-item" style="color: black">'
					html += response[i].TITLE
					if(response[i].NEW<5){
						html += '<span class="badge badge-success">NEW</span>'
					}
					html += '</a></li>';

					$('#noticeList').append(html);
				}
			},
			error: function(response){
				console.log("error");
			}
		})
	}
</script>
</body>
<jsp:include page="/common/footer.jsp" />
