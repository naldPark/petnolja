<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petnolja.member.model.vo.Member, com.petnolja.pet.model.vo.Pet, java.util.ArrayList" %>

<%
	Member m = (Member)request.getAttribute("m");
	ArrayList<Pet> petList = (ArrayList<Pet>)request.getAttribute("petList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/adFavicon.ico">
<title>펫놀자?관리자!</title>
    <style>
        .outer {
            border: gray solid 1px;
            border-radius: 7px;
            width: 1200px;
            height: 800px;
            margin: auto;
            background-color: rgb(248, 248, 248);
            padding:10px;

        }

        div {
            box-sizing: border-box;
            /*border: solid red 1px;*/
        }

        .outer>div {
            width: 100%;
        }

        #petDetail1 {
            height: 10%;
        }

        #petDetail2 {
            height: 90%;
        }

        #petDetail2>div {
            float: left;
            height: 100%;
        }

        #petList {
            width: 25%;
            padding: 20px;
        }

        #petProfile {
            width: 75%;
            padding:20px;
        }

        #mem-info {
            float: left;
            padding: 10px;
            margin-top:10px;
            font-size: 15px;
        }

        #buttons {
            float: right;
        }

        #mem-info, #buttons>button {display: inline-block;}


        #pet-list {
            text-align: center;
            border: 1px solid gray;
            width: 250px;
            float: left;
            font-size: 13px;
        }
        
        <% if(!petList.isEmpty()) {%>
        #pet-list>tbody>tr:hover{
            background-color: rgb(255, 254, 190);
            cursor:pointer;
        }
        <% } %>

        #petProfile>div {
            height: 100%;
            float:left;
            background:azure;

        }

        #pet-img {
            width: 30%;
            padding-top:150px;
        }

        #petInfo {
            width: 70%;
            padding:15px;
        }

        #pet-img>img,
        #pet-img>label {
            display: block;
            margin:auto;
        }

        #pet-img>label{
            width:200px; 
            height:40px; 
            text-align: center; 
            font-weight: 700;
            font-size: 15px;
            background: white;
            line-height: 40px;
            border: 1px gray solid;
            border-radius: 6px;

            }

        /*pet-info ************************/
        #pet-info{
            font-size: 13px;
            background:rgb(248, 248, 248);
            margin-top: 155px;
            border:grey solid 1px;
        }

        #pet-info th{
            background:rgb(255, 221, 166);
            text-align: center; 
            vertical-align: middle;
        }

    </style>


</head>
<body>

<%@include file="adminMenubar.jsp" %>

    <div class="outer">
        <div id="petDetail1">
            <div class="top" id="mem-info" align="left">
                <label>고객명 : <%=m.getMemName() %></label>  
                <label>ID : <%=m.getMemId() %></label>
            </div>
            <div id="buttons">
                <button onclick="deletePet();" class="btn btn-warning btn-sm" style="font-size: 14px;">삭제</button>
                <button onclick="history.back();" class="btn btn-primary btn-sm" style="font-size: 14px;">목록으로</button>

            </div>
        </div>
        <div id="petDetail2">
            <div id="petList">
                <table class="table" id="pet-list">
                    <thead>
                        <tr class="table-info">
                            <th width="60px">선택</th>
                            <th width="80px">펫번호</th>
                            <th width="80px">펫이름</th>

                        </tr>
                    </thead>
                    <tbody>
                    <%if (petList.isEmpty()) { %>
                    	<tr>
                    		<td colspan="3">등록된 펫이 없습니다.</td>
                    	</tr>
                    <% } else { %>
                    
                    	<%for(Pet p : petList) {%>
	                        <tr>
	                            <td><input type="checkbox" onclick="event.stopPropagation();"></td>
	                            <td><%=p.getPetNo() %></td>
	                            <td><%=p.getPetName() %></td>
	                        </tr>
                        <% } %> 	
                    <% } %>

                    </tbody>
                </table>
            </div>
            <div id="petProfile">
                <div id="pet-img">
                    <img src="resources/images/logo.png" width="250px" height="250px">
                    <label id="petName"></label>
                </div>
                <div id="petInfo">
                    <table border="1px solid" class="table" id="pet-info">
                        <tr>
                            <th width="18%;">성별</th>
                            <td id="gender" width="23%;"></td>
                            <th width="18%;">등록</th>
                            <td id="chip" width="42%;"></td>
                        </tr>
                        <tr>
                            <th>견종</th>
                            <td id="breed"></td>
                            <th>예방접종</th>
                            <td id="vaccine" ></td>
                        </tr>
                        <tr>
                            <th>생일</th>
                            <td id="birth" ></td>
                            <th>주의사항</th>
                            <td id="caution" ></td>
                        </tr>
                        <tr>
                            <th>몸무게</th>
                            <td id="size" ></td>
                            <th>참고사항</th>
                            <td id="note" ></td>
                        </tr>
                        <tr>
                            <th>중성화</th>
                            <td id="neutered"></td>
                            <th style="height:70px;">병원정보</th>
                            <td id="hospital"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <br><br><br><br><br>
    
    <script>
    
    	$(function(){
       		$("#pet-list>tbody>tr").on("click", function(){

       			var petNo = $(this).children().eq(1).text();
       			var petName = $(this).children().eq(2).text();
       			
      			$.ajax({
      				url:"petdetail.ad",
      				data:{petNo: petNo},
      				type:"post",
      				success:function(p){
      					$("#petName").text(petName);
						$("#gender").text(p.petGender);
						$("#chip").text(p.chip);
						$("#breed").text(p.petBreed);
						$("#vaccine").text(p.vaccine);
						$("#birth").text(p.petBirth);
						$("#caution").text(p.caution);
						$("#size").text(p.petWeight + "kg (" + p.petSize + ")");
						$("#note").text(p.note);
						$("#neutered").text(p.neutered);
						$("#hospital").html(p.hospi + "<br>" + p.hospiTel);
      					
      				}, error : function(){
      					console.log("회원 펫정보 상세조회 ajax통신 실패");
      				}
      			});
       		});    		
    	});
    	
    	function deletePet(){
    		
    		var petNoArr = [];
    		$("input[type=checkbox]:checked").each(function(){
	    		petNoArr.push($(this).parent().siblings().eq(0).text());
    		});
    		
    		var petNoList = petNoArr.join(",");
    		
    		if(confirm("선택한 반려동물을 삭제하시겠습니까?")){
    			
	    		$.ajax({
	    			url:"petdelete.ad",
	    			data:{petNoList:petNoList},
	    			type:"post",
	    			success:function(result){
	    				
	    				if(result == petNoArr.length){
	    					alert("성공적으로 처리되었습니다.");
	    					location.reload();
	    				}
	    			}, error:function(){
	    				console.log("회원 펫정보 삭제 ajax통신 실패");
	    			}
	    		});
    		} else {
    			$(":checkbox").prop("checked", false);
    		}
    	}
    	
    

    </script>


</body>
</html>