<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>와이파이 정보 구하기</title>
    <link rel="stylesheet" href="index.css">
    <script>
	    function getLocation() {
	        if (navigator.geolocation) {
	            navigator.geolocation.getCurrentPosition(showPosition, showError);
	        } else {
	            alert("이 브라우저에서는 위치 정보를 사용할 수 없습니다.");
	        }
	    }
	
	    function showPosition(position) {
	        // LAT과 LNT 입력 필드에 위치 정보를 설정
	        document.getElementById("lat").value = position.coords.latitude; // 위도
	        document.getElementById("lng").value = position.coords.longitude; // 경도
	    }
	
	    function showError(error) {
	        switch(error.code) {
	            case error.PERMISSION_DENIED:
	                alert("사용자가 위치 정보를 허용하지 않았습니다.");
	                break;
	            case error.POSITION_UNAVAILABLE:
	                alert("위치 정보를 사용할 수 없습니다.");
	                break;
	            case error.TIMEOUT:
	                alert("위치 정보 요청 시간이 초과되었습니다.");
	                break;
	            case error.UNKNOWN_ERROR:
	                alert("알 수 없는 오류가 발생했습니다.");
	                break;
	        }
	    }
    </script>
    <style>
        form
    </style>
</head>
<body>
    <h1>와이파이 정보 구하기</h1>
    <div>
        <a href="./">홈</a> |
        <a href="locationHistory.jsp">위치 히스토리 목록</a> |
        <a href="openApiWifi.jsp">Open API 와이파이 정보 가져오기</a> |
        <a href="favoritesView.jsp">즐겨 찾기 보기</a> |
        <a href="favoritesGroupManagement.jsp">즐겨 찾기 그룹 관리</a>
    </div>
    
    <form action="getWifiInfo" method="get" name="searchForm">
        <label for="lat">LAT:</label>
        <input type="text" id="lat" name="lat" value="0.0" required>
        <label for="lng">LNT:</label>
        <input type="text" id="lng" name="lng" value="0.0" required>
        <button type="button" onclick="getLocation()">내 위치 가져오기</button>
        <button type="button" onclick="insertLocHst()">근처 WIPI 정보 보기</button>
    </form>

    <table id="LocWifiList">
        <thead>
            <tr>
                <th>거리(Km)</th>
                <th>관리번호</th>
                <th>자치구</th>
                <th>와이파이명</th>
                <th>도로명주소</th>
                <th>상세주소</th>
                <th>설치위치(총)</th>
                <th>설치유형</th>
                <th>설치기관</th>
                <th>서비스구분</th>
                <th>망종류</th>
                <th>설치년도</th>
                <th>실내외구분</th>
                <th>WIFI환경</th>
                <th>X좌표</th>
                <th>Y좌표</th>
                <th>작업일자</th>
            </tr>
        </thead>
        <tbody>
            <!-- 여기에 서버에서 가져온 데이터가 추가될 예정입니다 -->
        </tbody>
    </table>
</body>
</html>
