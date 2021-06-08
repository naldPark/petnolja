<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.petsitter.model.vo.Petsitter, java.util.ArrayList"%>
 <%
 	String[] pics = (String[])request.getAttribute("pics"); 
 	Petsitter info = (Petsitter)request.getAttribute("info");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<style>
        .largerCheckbox{
          width:20px;
          height:20px;
        }
        #outer{
          width:1000px;
          height: 950px;
          margin:auto;
          border:1px solid lightgray;
          padding: 30px;
        }
        #enroll-f input{margin-bottom: 10px;}
        .titleImg{width:235px; height:170px;}
        #file-area{display: none;}
</style>
</head>
<body>
    <%@ include file="serviceMenu.jsp" %>
<br><br>
    <div id="outer">
        <br>
        <div style="text-align:center">
            <h3 align="center">프로필 수정</h3><br>
            이용자들에게 보여줄 프로필을 작성 해 주세요 <br>
        </div><br><br>
        <div>
            <table id="tablePetImg" align="center" style="text-align: center;">
                <tr>
                    <th>	
                        메인이미지*
                    </th>
                    <th>	
                        추가이미지1
                    </th>
                    <th>	
                        추가이미지2
                    </th>
                    <th>	
                        추가이미지3
                    </th>
                </tr>
                <tr>
                    <td>	
                        <img class="titleImg" id="titleImg" style="background-image:url('<%=contextPath%>/resources/images/member/plus.png'); background-repeat:no-repeat;background-position: center">
                    </td>
                    <td>	
                        <img class="titleImg" id="contentImg1" style="background-image:url('<%=contextPath%>/resources/images/member/plus.png'); background-repeat:no-repeat;background-position: center">
                    </td>
                    <td>	
                        <img class="titleImg" id="contentImg2" style="background-image:url('<%=contextPath%>/resources/images/member/plus.png'); background-repeat:no-repeat;background-position: center">
                    </td>
                    <td>	
                        <img class="titleImg" id="contentImg3" style="background-image:url('<%=contextPath%>/resources/images/member/plus.png'); background-repeat:no-repeat;background-position: center">
                    </td>
                </tr>
                <tr>
                    <th colspan="4"> +버튼을 눌러 시터님을 소개할 사진을 추가 해 주세요</th>
                </tr>
			</table>
		</div>
        <form action="<%=contextPath %>/contentUpdate.sitn" id="enroll-form" method="post" enctype="multipart/form-data">
            <div id="file-area">
                <input type="file" id="file1" name="file1" onchange="checkSize(this); loadImg(this, 1);">
                <input type="file" id="file2" name="file2" onchange="checkSize(this); loadImg(this, 2);">
                <input type="file" id="file3" name="file3" onchange="checkSize(this); loadImg(this, 3);">
                <input type="file" id="file4" name="file4" onchange="checkSize(this); loadImg(this, 4);">
            </div>

            <br><br>  
            <div class="form-group">
                <span>
                    <b>시터 소개글 제목*</b> &nbsp;&nbsp;
                    <input type="text" name="title" class="form-control"  placeholder="예) 한강산책 가능한 경력많은 펫시터입니다" required value="<%=info.getSitterTitle()%>">
                </span>
                <br>
                <span>
                    <b>본문내용 *</b> &nbsp;&nbsp;
                    <textarea name="selfIntro" id="comment" style="width:100%; height: 200px; resize: none; border:1px solid lightgray"  placeholder="시터님과 환경에 대한 소개를 1000자이내로 자유롭게 적어주세요" required><%=info.getSitterContent()%></textarea>
                    <div style="text-align:right; font-size:10pt"><span id="count" >0</span> / 1000</div>
                </span><br>
                <div align="center">
                    <input class="largerCheckbox" type="checkbox" id="allAgree"> <label for="allAgree">입력사항은 모두 사실이며 허위사항의 책임은 작성자에게 있음을 확인합니다.</label><br><br>
                    <button type="submit" id="submit" class="btn btn-primary" style="margin-right: 20px; width:200px"  onclick="return validate();">등록하기</button>
                    <button type="reset" class="btn btn-outline-secondary" style="margin-right: 20px; width:200px">초기화</button>
                </div>
            </div>
         </form>
            
            
            <!--첨부파일 클릭시 사진 추가 기능(첨부파일버튼 숨기기)-->
	<script>
		$(function(){
            var eq=0;
            <%for(int i=0; i< pics.length;i+=2){%>
                <%if(pics[i]!=null){%>
                 var pic ="<%=contextPath%>/<%=pics[i+1]%>";
                 $("#tablePetImg").children().children().children().children("img").eq(eq).attr("src",pic);
                <%}%>
                 eq++;
        <%}%>
    })


// $("#reviewSitterImg").attr('src',arr[2]);





		$(function(){		
            		$("#titleImg").click(function(){
            			$("#file1").click();
            		})
            		$("#contentImg1").click(function(){
            			$("#file2").click();
            		})
            		$("#contentImg2").click(function(){
            			$("#file3").click();
            		})
            		$("#contentImg3").click(function(){
            			$("#file4").click();
            		})
            	})
	</script>

	<!--해당 이미지 미리보기-->
	<script>


	function loadImg(inputFile, num){
                	if(inputFile.files.length == 1){ 
                		var reader = new FileReader();
                		reader.readAsDataURL(inputFile.files[0]);
                		reader.onload = function(e){
                			switch(num){
                			case 1: $("#titleImg").attr("src", e.target.result); break;
                			case 2: $("#contentImg1").attr("src", e.target.result); break;
                			case 3: $("#contentImg2").attr("src", e.target.result); break;
                			case 4: $("#contentImg3").attr("src", e.target.result); break;
                			}
                		}
                	}else{ 
                		switch(num){
            			case 1: $("#titleImg").attr("src", null); break;
            			case 2: $("#contentImg1").attr("src", null); break;
            			case 3: $("#contentImg2").attr("src", null); break;
            			case 4: $("#contentImg3").attr("src", null); break;
            			}
                	}
                	
                }

		function checkSize(input) {
			pathpoint = input.value.lastIndexOf('.');
        	filepoint = input.value.substring(pathpoint+1,input.length);
        	filetype = filepoint.toLowerCase();

        	if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
        	} else {
        		alert('이미지 파일만 첨부 할 수 있습니다');
                input.value = null; 
        	}

			if (input.files && input.files[0].size > (2 * 1024 * 1024)) {
				alert("파일 사이즈가 2mb 를 넘습니다.");
				input.value = null;
			}
		}
		

        $(function(){
          $("#comment").keyup(function(){
              $("#count").text($(this).val().length);
              if($(this).val().length > 999) {
                 alert("글자수는 1000을 초과할 수 없습니다");
                 $(this).val($(this).val().substring(0, 999));
            }})        
        })


        function validate(){

                        
                if($("#allAgree").prop("checked")){
                }else{ 
                    window.alert("동의사항에 체크해주세요");
                    return false;
                }
            }
      </script>


    </div><br><br>

 <%@ include file = "../common/footer.jsp"%>
</body>


</html>