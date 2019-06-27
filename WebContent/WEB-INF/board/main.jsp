<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/jquery.fancybox.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<c:set var="pop" value="${requestScope.pop }"></c:set>
<c:set var="close" value="${requestScope.close }"></c:set>
<c:set var="newest" value="${requestScope.newest }"></c:set>
<jsp:useBean id="now" class="java.util.Date"/>

<section>
      <div class="container">
        <div class="section-header">
          <h2>최다 후원</h2>
        </div>
        <div class="container site">
			<div class="row" style="position: relative;">
			<c:forEach var="pop" items="${pop }">
				<c:set var="date" value="${pop.finaldate }"/>
				<fmt:parseDate var="parsedate" value="${date }" pattern="yyyy-MM-dd"></fmt:parseDate>
				<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 d-flex justify-content-center">
					<div class="thumbnail">
						<a class="fancybox" rel="img" href="upload/${pop.imagepath }"><img class="img-responsive" src="upload/${pop.imagepath }" alt="img"></a>
         				<div class="caption">
            				<h5><a href="spondetail.do?no=${pop.boardno }">${pop.boardtitle }</a> </h5>
            				<p>${pop.boardwriter }</p>
            				<div class="progress">
            					<div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: ${pop.nowmoney div pop.destmoney *100}%;">
            						<span class="sr-only">90% Complete</span>
            					</div>
            				</div>	
            				<fmt:parseNumber value="${now.time/(1000*60*60*24) }" integerOnly="true" var="nowDays"/>
            				<fmt:parseNumber value="${parsedate.time/(1000*60*60*24) }" integerOnly="true" var="oldDays"/>
            				<c:set value="${oldDays - nowDays }" var="dateDiff"/>
            				<div class="row">
            					<p class="col-7"><span class="glyphicon glyphicon-gift"></span><span>${dateDiff }일</span></p>
            					<p class="col-5 d-flex justify-content-center"><span class="glyphicon glyphicon-usd"></span><span>${pop.nowmoney }만원</span></p>
            				</div>
       					</div>
					</div>
				</div>
			</c:forEach>
		</div>
      </div>
</section>

<section>
      <div class="container">
        <div class="section-header">
          <h2>마감임박</h2>
        </div>
        <div class="container site">
			<div class="row" style="position: relative;">
				<c:forEach var="close" items="${close }">
					<c:set var="date" value="${close.finaldate }"/>
					<fmt:parseDate var="parsedate" value="${date }" pattern="yyyy-MM-dd"></fmt:parseDate>
					<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 d-flex justify-content-center">
						<div class="thumbnail">
							<a class="fancybox" rel="img" href="upload/${close.imagepath }"><img class="img-responsive" src="upload/${close.imagepath }" alt="img"></a>
         					<div class="caption">
            				<h5><a href="spondetail.do?no=${close.boardno }">${close.boardtitle }</a> </h5>
            				<p>${pop.boardwriter }</p>
            					<div class="progress">
            						<div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: ${close.nowmoney div close.destmoney *100}%;">
            							<span class="sr-only">90% Complete</span>
            						</div>
            					</div>	
            				<fmt:parseNumber value="${now.time/(1000*60*60*24) }" integerOnly="true" var="nowDays"/>
            				<fmt:parseNumber value="${parsedate.time/(1000*60*60*24) }" integerOnly="true" var="oldDays"/>
            				<c:set value="${oldDays - nowDays }" var="dateDiff"/>
            				<div class="row">
            					<p class="col-7"><span class="glyphicon glyphicon-gift"></span><span>${dateDiff }일</span></p>
            					<p class="col-5 d-flex justify-content-center"><span class="glyphicon glyphicon-usd"></span><span>${close.nowmoney }만원</span></p>
            				</div>
       					</div>
					</div>
				</div>
			</c:forEach>
		</div>
      </div>
</section>

<section>
      <div class="container">
        <div class="section-header">
          <h2>새로 등록된 후원</h2>
        </div>
        <div class="container site">
			<div class="row" style="position: relative;">
				<c:choose>
					<c:when test="${empty newest }">
						<tr><td colspan="5">게시물이 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="newest" items="${newest }">
							<c:set var="date" value="${newest.finaldate }"/>
							<fmt:parseDate var="parsedate" value="${date }" pattern="yyyy-MM-dd"></fmt:parseDate>
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 d-flex justify-content-center">
								<div class="thumbnail">
									<a class="fancybox" rel="img" href="upload/${newest.imagepath }"><img class="img-responsive" src="upload/${newest.imagepath }" alt="img"></a>
         							<div class="caption">
            							<h5><a href="spondetail.do?no=${newest.boardno }">${newest.boardtitle }</a> </h5>
            								<p>${newest.boardwriter }</p>
            							<div class="progress">
            								<div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: ${newest.nowmoney div newest.destmoney *100}%;">
            									<span class="sr-only">90% Complete</span>
            								</div>
            							</div>	
            							<fmt:parseNumber value="${now.time/(1000*60*60*24) }" integerOnly="true" var="nowDays"/>
            							<fmt:parseNumber value="${parsedate.time/(1000*60*60*24) }" integerOnly="true" var="oldDays"/>
            							<c:set value="${oldDays - nowDays }" var="dateDiff"/>
            							<div class="row">
            								<p class="col-7"><span class="glyphicon glyphicon-gift"></span><span>${dateDiff }일</span></p>
            								<p class="col-5 d-flex justify-content-center"><span class="glyphicon glyphicon-usd"></span><span>${newest.nowmoney }만원</span></p>
            							</div>
       							</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>	
			</c:choose>
		</div>
      </div>
</section>


<section>
			<article>
				<header>
					<h2>최신 공지사항</h2>
					<a href="">전체보기</a>
				</header>
				<div>
				<table>
					<tr>
						<th>제목</th>
						<th>등록일</th>
					</tr>
					<c:forEach var="newNotice" items="${newNotice }">
						<tr>
							<td>
								<a href="qaboard adress 입력=${newNotice.qano}">${newNotice.title }</a>
							</td>
							<td><fmt:formatDate value="${newNotice.date }"/></td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</article>
		</section>

</body>
</html>