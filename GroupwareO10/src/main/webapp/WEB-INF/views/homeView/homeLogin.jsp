<!-- 로그인 시 보이는 화면 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/homeLayout.css" type="text/css">
<link rel="stylesheet" href="css/menubar.css" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>MJS Welfare System</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/homeView/menubar.jsp"></jsp:include>
	<div class="mbody">
		<div class="mcontWidth">
			<jsp:include page="/WEB-INF/views/homeView/userInfoBox.jsp"></jsp:include>
			<div class="rightBox">
								
				<div class="left">
					<jsp:include page="/WEB-INF/views/homeView/homeNoticeList.jsp" flush="true"></jsp:include>
				</div>

				<div class="right">
					<jsp:include page="/WEB-INF/views/homeView/homeCommunityList.jsp" flush="true"></jsp:include>
				</div>
			</div>
			<!-- rightBox -->
		</div>
		<!-- mcont_width -->
	</div>
	<!-- mbody -->
</body>
<script>
	$(document).ready(function() {
      let result = '<c:out value="${Checker}"/>';
      checkAlert(result);

      function checkAlert(result) {
         if (result === '') {
            return;
         } else if (result === "NoTeamList") {
            alert("소속된 팀이 없습니다.");
         }else if(result==="NoUserID"){
            alert("없는 유저 아이디 입니다.");            
         }
      }
   });
</script>
</html>