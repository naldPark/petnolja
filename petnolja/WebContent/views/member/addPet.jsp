<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<style>
    #outer{
      width:1000px;
      margin:auto;
      position:relative;
      font-family:'Noto Sans KR', sans-serif !important;
      border:1px solid lightgray;
      padding: 15px;
    }
    .petImg{
        position:relative;
        width:130px;
        height:130px;
        overflow: hidden;
        float: left;
        margin-right: 20px;
        }
    .petImg>img{
        position: absolute;
        top: -9999px;
        left: -9999px;
        right: -9999px;
        bottom: -9999px;
        margin: auto;
        }
    .petBox{
        margin-bottom:30px; padding:15px; height:160px; border: 1px solid lightgrey; margin:5px;
    }

   
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<br><br>
<div id="outer">
<br>
    
    <h3>반려동물을 추가해보세요</h3>   
    반려동물을 추가하지 않으면 예약이 진행되지 않습니다<br><br>
    <!--검색조회기능-->
    <div align="right">
    <button type=button class="btn btn-primary" onclick="location.href='<%=contextPath%>/views/member/dogAdd.jsp'"> 반려동물 추가</button></div><br>
   <!-- 뭉뭉이 리스트 시작-->
        <div class="petBox"> 
            <div class="petImg"><img src="../../resources/images/temp/dog1.jpg" style="height: 130px;"></div>
            <div style="float:left;">
                <br>
                <h6><b>개똥이</b></h6><br>
                <span>푸들 / 3세 / 남아 / 1.3kg(소형) </span><br>
            </div>
            <div id="linkList" style="padding-left:750px; text-align: center;">
                <button type="button" class="btn btn-outline-primary btn-block">자세히보기</button>
                <button type="button" class="btn btn-outline-secondary btn-block">수정</button>
                <button type="button" class="btn btn-outline-secondary btn-block" data-toggle="modal" data-target=".deletePet">삭제</button><br>
            </div>
        </div><br>
        <div class="petBox"> 
            <div class="petImg"><img src="../../resources/images/temp/dog1.jpg" style="height: 130px;"></div>
            <div style="float:left;">
                <br>
                <h6><b>개똥이</b></h6><br>
                <span>푸들 / 3세 / 남아 / 1.3kg(소형) </span><br>
            </div>
            <div id="linkList" style="padding-left:750px; text-align: center;">
                <button type="button" class="btn btn-outline-primary btn-block">자세히보기</button>
                <button type="button" class="btn btn-outline-secondary btn-block">수정</button>
                <button type="button" class="btn btn-outline-secondary btn-block" data-toggle="modal" data-target=".deletePet">삭제</button><br>
            </div>
        </div><br>
        <div class="petBox"> 
            <div class="petImg"><img src="../../resources/images/temp/dog1.jpg" style="height: 130px;"></div>
            <div style="float:left;">
                <br>
                <h6><b>개똥이</b></h6><br>
                <span>푸들 / 3세 / 남아 / 1.3kg(소형) </span><br>
            </div>
            <div id="linkList" style="padding-left:750px; text-align: center; ">
                <button type="button" class="btn btn-outline-primary btn-block" >자세히보기</button>
                <button type="button" class="btn btn-outline-secondary btn-block">수정</button>
                <button type="button" class="btn btn-outline-secondary btn-block" data-toggle="modal" data-target=".deletePet">삭제</button><br>
            </div>
        </div><br>


      <!-- 뭉뭄이 리스트 끝-->


        <div class="modal deletePet" id="deletePet">
            <div class="modal-dialog">
              <div class="modal-content" style="width:400px">
                <div class="modal-body" align="center">
                <br>
                    <h4><b>개똥이 삭제</b></h4><br>삭제 이후 복원이 불가합니다.<br>반려동물의 정보를 모두 삭제하시겠습니까?<br><br>
                    <button type="button" class="btn btn-primary" id="deleteButton">
                        삭제
                      </button>
                    <button type="button" class="btn btn-secondary"  data-dismiss="modal">
                        취소
                      </button>
                      <br><br>
                </div>
              </div>
            </div>
          </div>

          <div class="modal" id="finDeletePet">
            <div class="modal-dialog">
              <div class="modal-content" style="width:400px">
                <div class="modal-body" align="center">
                <br>
                    <h4><b>개똥이 삭제</b></h4><br><br>삭제가 완료되었습니다.<br><br>
                    <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/views/member/addPet.jsp'" data-dismiss="modal">
                        확인
                      </button>
                      <br><br>
                </div>
              </div>
            </div>
          </div>

          <script>
    
            $(function(){        
                $("#deleteButton").click(function(){
                    $("#deletePet").css("display","none");
                    $("#finDeletePet").css("display","block");
                });  
            });       
            </script>
  </div>


<br><br>
<%@ include file = "../common/footer.jsp"%>
</html>