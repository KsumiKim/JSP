<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script> // javascript를 다룰 때 <script>를 사용한다.
var cookies = "";
var name = "test";
var value = "cookieTest";
cookies += name + "=" + value + ";";

// var expires = new Date();
// expires.setDate(expires.getDate() + 1); // Fri, 03 Jan 2012 07:00:03 GMT;
// cookies += "expires=" + expires.toGMTString() + ";"; 
    // 쿠키 만료에 대한 코드이다. 너무 길어서 jquery 라이브러리로 만들었다. (jquery 라이브러리 다운 받아 사용할 수 있다.)

document.cookie = cookies; // 개발자 도구에서 현재 쿠키를 보여준다.
document.write(cookies);
</script>


Jquery lib-----------------------------------------------------------------------


(function ($, document, undefined) {
	var pluses = /\+/g;
	
	function raw(s) {
		return s;
	}
	
	function decoded(s) {
		return decodeURIComponent(s.replace(pluses, ' '));
	}
	
	var config = $.cookie = function (key, value, options) {
		
		// write
		if(value !== undefined) {
			options = $.extend({}, config.defaults, options);
			
			if(value === null) {
				options.expires = -1;
			}
			
			if(typeof options.expires === 'number') {
				var days = options.expires, t = options.expires = new Date();
				t.setDate(t.getDate() + days);
			}
			
			value = config.json ? JSON.stringify(value) : String(value);
			
			return (document.cookie = [
			    encodeURIComponent(key), '=', config.raw ? value : encodeURIComponent(value),
			    options.expires ? '; expires=' + options.expires.toUTCString() : '',
			    options.path    ? '; path=' + options.path : '',
			    options.domain  ? '; domain=' + options.domain : '',
			    options.secure  ? '; secure' : ''
			].join(''));
		}
		
		// read
		var decode = config.raw ? raw : decoded;
		var cookies = document.cookie.split('; ');
		for(var i = 0, l = cookies.length; i < l; i++) {
			var parts = cookies[i].split('=');
			if(decode(parts.shift()) === key) {
				var cookie = decode(parts.join('='));
				return config.json ? JSON.parse(cookie) : cookie;
			}
		}
		
		return null;
	};
	
	config.defaults = {};
	
	$.removeCookie = function (key, options) {
		if($.cookie(key) !== null) {
			$.cookie(key, null, options);
			return true;
		}
		return false;
	};
})(jQuery, document);
                                                 
                                                 
     
jsp 코드 수정 후-----------------------------------------------------------------
                                                 
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="jquery.cookie.js"></script>
<script>
	$.cookie("key", "value");
	$.cookie("key2", "value2", { expires:1 } );
</script>
