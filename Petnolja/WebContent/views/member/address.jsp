<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78c48ff942d4b0a9d168f063558d8359&libraries=services"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
    <div id="addressDiv">
    <input id="member_post" required type="text" placeholder="우편번호" readonly onclick="findAddr()" class="form-control" value="" style="background-color:white!important; float: left; width: 420px">
    <button type="button"  class="btn btn-secondary" style="width: 148px; margin-left:10px"  onclick="findAddr()">우편번호 찾기</button>
    <input name="address" required id="address" type="text" placeholder="주소" readonly class="form-control"  onclick="findAddr()" style="background-color:white!important;" value="">
    <input type="text" name="address2" required id="address2" placeholder="상세주소" class="form-control" >
    <input type="hidden" name="latitude" required value="" id="latitude">
    <input type="hidden" name="longtitude" required value="" id="longtitude">
    </div> 
 <script>
    function findAddr(){
        new daum.Postcode({
            oncomplete: function(data) {
                
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress; 
    
                document.getElementById('member_post').value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("address").value = roadAddr;
                } 
                else if(jibunAddr !== ''){
                    document.getElementById("address").value = jibunAddr;
                }

                var geocoder = new kakao.maps.services.Geocoder();
                    geocoder.addressSearch($("#address").val(), function(result, status) {
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