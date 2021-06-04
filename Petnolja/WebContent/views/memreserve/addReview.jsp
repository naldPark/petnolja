<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>


#popup {
  display: flex;
  justify-content: center;
  position: fixed;
  top: 0;
  bottom: 100;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, .7);
  z-index: 1;
  overflow:auto;
}
#popup.hide {
  display: none;
}
.findContent {
  height: 770px; width: 500px;
  font-size:15px;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  margin-top: 20px;
  overflow:auto;
}
#starList{font-size: 30pt; font-weight: bolder; letter-spacing :15px; cursor: pointer;} 
.filebox input[type="file"] {position: absolute;  overflow: hidden; clip:rect(0,0,0,0);} 
.filebox label { display: inline-block; padding: .5em .75em; color: rgb(133, 132, 132); cursor: pointer; border: 1px solid #ebebeb;} 
.filebox .upload-name { background-color: #f5f5f5; border: 1px solid #ebebeb; } 
</style>
<title>펫시터</title>
</head>
<body>

<div id="popup" class="hide">
  <div class="findContent">
    <div style="height: 50px; background-color: rgb(230, 240, 247); text-align: center; padding:10px;"><h4>리뷰 작성</h4></div><br>
    <div><img id="reviewSitterImg" src="<%=contextPath%>/<" style="height: 80px; float:left; margin-right:20px;"></div>
    <div style="margin-top:15px; margin-bottom: 25px; text-align: left;">
        
        <h6 id="reviewSitterTitle">타이틀</h6>
        <p id="reviewSitterName">펫시터: 이름</p>
    </div>
    <hr>
    <div style="height: 100px; text-align: center;"><h6>서비스는 만족하셨나요 ?</h6><span style="color:gray;">별점을 선택해 주세요</span>
        <div id="starList">
        <span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span>
        </div>
    </div><hr><br>
    <form action="<%=contextPath %>/reviewInsert.mem" id="reviewForm" method="post" enctype="multipart/form-data">
    <div style="height: 300px; text-align: center;"><h6>어떤점이 좋았나요 ?</h6>
        <div class="form-group">
       	  	<input type="hidden" name ="reviewInputNo" value="">
       	  	<input type="hidden" name ="starCount" id="starCount" value="">
            <textarea class="form-control" rows="5" name="comment" id="comment" style="resize:none; height: 180px" placeholder="최소 10자 이상 입력해주세요"></textarea>
            <div style="margin-left:320px; font-size:10pt"><span id="count" >0</span> / 1000<br></div><br>
            <div class="filebox">
                <input class="upload-name" value="" disabled="disabled"> 
                <label for="rwFilename" style="font-size: 11pt;">사진 첨부하기</label> 
                <input type="file" id="rwFilename" name="rwFilename" class="upload-hidden" onchange="checkSize(this)"> 
            </div>
                <span>            20MB이하의 파일만 첨부 가능합니다.</span><br><br>
                <button type="submit" class="btn btn-primary btn-sm"  onclick="return validate();">등록</button>&nbsp;
                <button type="button" class="btn btn-secondary btn-sm" onclick="closePopup();">취소</button>
        </div>
    </div>  
  </form>    
  </div>
</div>
<script>
  var filledStar = "";
    //팝업 열기
      function openPopup(id){
        console.log("아이디"+id);
        $("#popup").removeClass('hide'); 
        var reviewReserveNum= id.replace("review","");
        $("#reviewInputNo").val(+reviewReserveNum);
        $("#starList").children().each(function(){
            $(this).html('&#9734;');
            filledStar="";
          }) // 별초기화
        $("#reviewForm")[0].reset();  //input값 초기화
        $.ajax({
            url:"reviewReservInfo.mem",
            data:{
              reserveNo:reviewReserveNum
            },
            type:"post",
            success:function(arr){	
              $("#reviewSitterImg").attr('src',arr[2]);
              $("#reviewSitterTitle").text(arr[1]);
              $("#reviewSitterName").text(arr[0]);
            },error:function(){
              console.log("ajax통신 실패");
            }
          });


       }  
        // 팝업 닫기
        function closePopup(){
          $("#popup").addClass('hide'); 
          $("#reviewSitterImg").attr('src',"");
          $("#reviewSitterTitle").text("");
          $("#reviewSitterName").text("");
        }   
      
      // 리뷰 별 바꾸기
      $("#starList").children().on('click',function(){
          filledStar = $(this).index()+1;  //&#9733;
          $("#starCount").val(filledStar);
          for(var i = 0; i< 5;i++){
              if(i<filledStar){
                  $("#starList").children().eq(i).html('&#9733;');
              }else{
                  $("#starList").children().eq(i).html('&#9734;');
              }
          }
      })
      
      // 파일첨부 시작
      $(document).ready(function(){
        var fileTarget = $('.filebox .upload-hidden'); fileTarget.on('change', function(){
            if(window.FileReader){
              var filename = $(this)[0].files[0].name; 
            } else { 
              var filename = $(this).val().split('/').pop().split('\\').pop(); 
            } 
            $(this).siblings('.upload-name').val(filename); 
          }); 
       });
        function checkSize(input) {
          if (input.files && input.files[0].size > (20 * 1024 * 1024)) {
              alert("파일 사이즈가 20mb 를 넘습니다.");
              input.value = null; 
            }
          } //파일첨부 끝
       
           //글자수세기
        $(function(){
          $("#comment").keyup(function(){
              $("#count").text($(this).val().length);
              if($(this).val().length > 999) {
                 alert("글자수는 1000을 초과할 수 없습니다");
                 $(this).val($(this).val().substring(0, 999));
            }})        
        })


        function validate(){
          if(filledStar==""){
            alert("별점을 눌러주세요");
            return false;
            }
        }
</script>
</body>
</html>