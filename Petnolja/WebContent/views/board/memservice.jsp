<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #outer{
          width:1000px;
          height:100%;
          margin:auto;
          font-family:'Noto Sans KR', sans-serif !important;
          border:1px solid lightgray;
          padding: 15px;
        }
        .question{cursor:pointer; border-radius:10px; }
        .question>th{text-align: center; font-weight: normal;}
        .answer{
                height:100px;
                margin-top:5px;
                border-radius:10px;  
                display:none;
                /* border-collapse:collapse; */
            }

        .answer>td{background-color: rgb(247, 247, 247);}
        .classification:hover{cursor: pointer;}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer">
    <br>
    <script>

    </script>


        <h2>고객센터</h2><br>
        <div style="border:1px solid lightgray; padding: 40px;">
            <div style="float:left; width:400px;">
                <h5><b>자주묻는 질문 검색</b></h5><br>
                <div class="input-group mb-3">
                <input type="text" class="form-control" id="myInput" placeholder="검색어를 입력하세요">
                </div>
            </div>
            <div style="margin-left:500px;" align="center">
                <h5><b>찾으시는 질문이 없다면 ?</b></h5><br>
                <button type="button" onclick="location.href='<%=contextPath%>/views/memboard/askToAdminList.jsp'" class="btn btn-secondary" style="width:200px">1:1문의</button>
            </div>
           
        </div><br>
        <div style="text-align: left;" >&nbsp; <span id="showAll">전체</span>           | 
            <span style="text-decoration: none; color:gray" class="classification">회원정보</span> | 
            <span style="text-decoration: none; color:gray" class="classification">결제/환불/취소</span> | 
            <span style="text-decoration: none; color:gray" class="classification">이용관련</span> | 
            <span style="text-decoration: none; color:gray" class="classification">기타</span>
        </div>

          <div class="container mt-3">
            <table class="table table-bordered">
              <thead>
                <tr style="background: lightgray; text-align: center;">
                    <th width="100">번호</th>
                    <th width="200">분류</th>
                    <th width="700">내용</th>
                  </tr>
              </thead>
              <tbody id="myTable">
                  <tr class="question">
                    <th>1</th>
                    <th>회원정보</th>
                    <td>Q. 이름을 개명했어요</td>
                  </tr>
                  <tr class="answer">
                    <td colspan="2"></td>
                    <td>A. 그래서요?</td>
                  </tr></p>
                  <tr class="question">
                    <th>2</th>
                    <th>결제/환불/취소</th>
                    <td>Q. 환불했는데 환불 대금은 언제 들어오나요?</td>
                  </tr>
                  <tr class="answer">
                    <td colspan="2"></td>
                    <td>A. 언젠간 들어오겠죠?</td>
                  <tr class="question">
                    <th>3</th>
                    <th>이용관련</th>
                    <td>Q. 예약요청 후 진행절차를 알고 싶어요</td>
                  </tr>
                  <tr class="answer">
                    <td colspan="2"></td>
                    <td>A. 기다려보세요</td>
                  </tr>
                  <tr class="question">
                    <th>4</th>
                    <th>결제/환불/취소</th>
                    <td>Q. 너구리는 맛있나요 ?</td>
                  </tr>
                  <tr class="answer">
                    <td colspan="2"></td>
                    <td>A. 개인적으로 라면계의 탑이라고 생각합니다</td>
                  </tr>
                  <tr class="question">
                    <th>5</th>
                    <th>기타</th>
                    <td>Q. 스낵면은요?</td>
                  </tr>
                  <tr class="answer">
                    <td colspan="2"></td>
                    <td>A. 별미</td>
                  </tr>
                  <tr class="question">
                    <th>6</th>
                    <th>이용관련</th>
                    <td>Q. 펫시터랑 연락이 두절되었어요</td>
                  </tr>
                  <tr class="answer">
                    <td colspan="2"></td>
                    <td>A. 왜그럴까요 ?</td>
                  </tr>
                  <tr class="question">
                    <th>7</th>
                    <th>이용관련</th>
                    <td>Q. 펫시터가 되는데 무슨 조건이 필요한가요 ?</td>
                  </tr>
                  <tr class="answer">
                    <td colspan="2"></td>
                    <td>A. 움....</td>
                  </tr>
                </tbody>
            </table>
         </div>
          
         <script>
          $(document).ready(function(){
            //검색창에 입력시 필터링
            $("#myInput").on("keyup", function() {
                $(".answer").hide(); 
                $(".question").show();
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                   
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                $(".answer").hide();
                });
             });
             //질문입력시 다른 질문은 닫히고 입력한 질문이 열림
            $(".question").click(function(){         
                if($(this).next().slideUp()){
                    $(".answer").slideUp();         
                    $(this).next().slideDown(); 
                }
              })
            //분류선택시 일단 창이 닫히고 분류로 구분해서 해당 내용만 보여줌
             $(".classification").click(function(){
            var temp = $(".question").children("th:odd");
            for(var i=0 ; i<temp.length;i++){
              if($(this).text()==temp.eq(i).text()){
                $(".answer").hide();     
                temp.parent().hide(); 
                temp.eq(i).parent().show();      
              }
            }
          })
          //전체 선택시 기존으로 돌아감
          $("#showAll").click(function(){
            $(".answer").slideUp(); 
            $(".question").show();
          })
         });
        </script>


<br><br>
<ul class="pagination justify-content-center">
    <li class="page-item"><a class="page-link" href="#">이전</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">다음</a></li>
  </ul>    
 </div>
 
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>