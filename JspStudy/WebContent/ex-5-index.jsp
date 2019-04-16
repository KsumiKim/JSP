popup창을 여는 코드-------------------------------------------

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="jquery.cookie.js"></script>
<script>
	var value = $.cookie("open");
	// cookie가 null이면 오늘 하루 열지 않음 체크를 안 했으니 pop-up창 열기
	if(value == null) {
		window.open("./ex-5-popup.jsp", "", "width=400 height=300");
	} else {
		
	}
 // ÆË¾÷Ã¢ »ý¼º ÄÚµå - window.open("./ex-5-popup.jsp", "", "width=400 height=300");
</script>



popup창 열고 난 후 -------------------------------------------

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="jquery.cookie.js"></script>
<script>
 	function closePopup() {
 		var isCheck = $("#popup").is(":checked");
 		if(isCheck == true) {
 			// 쿠키 저장 name:open
 			$.cookie("open", "djdjdjdj", {expires:1} );
 		}
 		window.close();
 	}
 // 팝업창 제거 코드 - window.close();
</script>
<input type="checkbox" id="popup"> 오늘 하루 열지 않음
 <a href="#" onclick="closePopup()">[닫기]</a> 
// 버튼을 클릭하면 원하는 기능을 하도록 만들 수 있다.
