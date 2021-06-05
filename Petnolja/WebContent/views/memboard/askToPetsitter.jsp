<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터</title>
<style>
        #outer{
          width:1000px;
          margin:auto;
          position:relative;
          font-family:'Noto Sans KR', sans-serif !important;
          border:1px solid lightgray;
          padding: 15px;
        }
        .table th{
            background-color: rgb(230, 230, 230);
            text-align: center; 
        }
        .filebox input[type="file"] {position: absolute;  overflow: hidden; clip:rect(0,0,0,0);} 
        .filebox label { display: inline-block; padding: .5em .75em; color: rgb(133, 132, 132);  cursor: pointer; border: 1px solid #ebebeb;} 
       .filebox .upload-name { background-color: #f5f5f5; border: 1px solid #ebebeb; }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer">
    <br>

        <h2>1:1 문의</h2>    
    <form action="<%=contextPath%>/askToWriter2.me" method="post">       
        <table class="table" style="border:1px solid lightgray">
            <tr>
                <th width="200">작성자</th>
                <td><input type="text" name="name" style="width:100%;height:100%; border:1px solid:lightgrey;" required></td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" style="width:100%;height:100%; border:1px solid:lightgrey;" required></td>
            </tr>
        </table>
        <label for="comment"><h4>본문 내용</h4></label>
          <div class="form-group" style="text-align: center;">
            
          <textarea class="form-control" rows="5" id="comment" name="content" style="resize:none; height: 400px" required></textarea>
          <br>         
		  <br>
          <button type="submit" class="btn btn-primary">문의하기</button>&nbsp;
          <button type="button" class="btn btn-secondary" onclick="history.back();">문의목록보기</button>
        </div>
        </form>
 </div>
 <script>
    $(document).ready(function(){ var fileTarget = $('.filebox .upload-hidden'); fileTarget.on('change', function(){
    if(window.FileReader){
    var filename = $(this)[0].files[0].name; } else { 
    var filename = $(this).val().split('/').pop().split('\\').pop(); 
     } 
    $(this).siblings('.upload-name').val(filename); }); });
    function checkSize(input) {
    if (input.files && input.files[0].size > (20 * 1024 * 1024)) {
        alert("파일 사이즈가 20mb 를 넘습니다.");
        input.value = null;
        }
    }
</script>

 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>