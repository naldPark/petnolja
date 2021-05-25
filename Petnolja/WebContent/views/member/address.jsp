<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a3fded1fd07016125ac9fdf2d65bcd4&libraries=services"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
    <div id="addressDiv">
    <input id="member_post" required type="text" placeholder="우편번호" readonly onclick="findAddr()" class="form-control" value="" style="background-color:white!important; float: left; width: 420px">
    <button type="button"  class="btn btn-secondary" style="width: 148px; margin-left:10px"  onclick="findAddr()">우편번호 찾기</button>
    <input id="member_addr" required  type="text" placeholder="주소" readonly class="form-control"  onclick="findAddr()" style="background-color:white!important;" value="">
    <input type="text" required  placeholder="상세주소" class="form-control">
    <input type="hidden" required value="" id="latitude">
    <input type="hidden" required value="" id="longtitude">
    </div> 
 <script>
    function findAddr(){
        new daum.Postcode({
            oncomplete: function(data) {
                
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress; 
    
                document.getElementById('member_post').value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("member_addr").value = roadAddr;
                } 
                else if(jibunAddr !== ''){
                    document.getElementById("member_addr").value = jibunAddr;
                }

                var geocoder = new kakao.maps.services.Geocoder();
                    geocoder.addressSearch($("#member_addr").val(), function(result, status) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    $("#latitude").val(result[0].y);
                    $("#longtitude").val(result[0].x);
                })
            }
        }).open();

      

        
    }
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>


</html>