<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %> 
<%@ page import="com.petnolja.common.model.vo.PageInfo, java.util.ArrayList, com.petnolja.petsitter.model.vo.Petsitter, java.time.*" %>
	
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Petsitter> list = (ArrayList<Petsitter>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기존 펫시터 목록</title>


<style>
.outer {
	border: gray solid 1px;
	border-radius: 7px;
	width: 1200px;
	height: 800px;
	margin: auto;
	background-color: rgb(248, 248, 248);
	padding: 10px;
}

#old-petsitter-list {
	text-align: center;
	border: 1px solid gray;
	width: 100%;
	font-size: 13px;
	background-color: white;
}

#old-petsitter-list td {
	height: 60px;
	border: none;
}

#search {
	float: left;
}

#buttons {
	float: right;
}

#buttons>button {
	font-size: 14px;
}

#old-petsitter-list button {
	width: 90px !important;
	height: 30px !important;
	font-size: 12px !important;
	line-height: 10px !important;
}

#paging-area>button {
	width: 30px;
	height: 30px;
	font-size: 12px;
	text-align: center;
}

#old-petsitter-list p {
	margin: 0;
}
</style>

</head>
<body>

	<%@include file="adminMenubar.jsp"%>

	<div class="outer" align="center">
		<div class="top" id="search" align="left">
			<input type="search" id="petsitter-search-box" class="form-control-sm" placeholder="펫시터ID" style="font-size: 14px;">
		</div>
		<div class="top" id="buttons" align="right">
			<button onclick="blockPetsitter()" class="btn btn-warning btn-sm">삭제</button>
		</div>

		<br> <br>
		<table class="table" id="old-petsitter-list">
			<thead>
				<tr class="table-info">
					<th width="60px">선택</th>
					<th width="80px">고객번호</th>
					<th width="80px">ID</th>
					<th width="80px">반려견 수</th>
					<th width="200px">제공 서비스</th>
					<th width="130px">자격증</th>
					<th width="100px">펫시팅 경험</th>
					<th width="120px">서비스기간</th>
					<th width="100px">승인일</th>
				</tr>
			</thead>
			<tbody>
			
				<% if(list.isEmpty()) { %>
				
					<td colspan="9"> 조회 결과가 없습니다.</td>	
				
				<% }else { %>
					<% for(Petsitter n: list) {%>
						<tr>
							<td><input type="checkbox"></td>
							<td><%= n.getSitterNo()%></td>
							<td>
								<p class="rowColumn" contenteditable="false" data-default="<%= n.getMemID()%>"><%= n.getMemID()%></p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false" data-default="<%= n.getPetNo()%>"><%= n.getPetNo()%>마리</p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false" data-default="<%= n.getAdditions()%>"><%= n.getAdditions()%></p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false" data-default="<%= n.getLicense()%>"><%= n.getLicense()%></p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false" data-default="<% if(n.getExperience().equals(null)) {%>N<%}else { %>Y<% } %>">
									<% if(n.getExperience().equals(null)) {%>
										N	
									<%}else { %>
										Y
									<% } %>
									</p>
							</td>
							<td>
								<%= n.getDuration() %>개월
							</td>
							<td><%= n.getpDate() %></td>
						</tr>
					<% } %>
				<% } %>
					
			</tbody>
		</table>

		<!-- 페이징바 -->

		<div id="paging-area">
			<% if(currentPage != 1){ %>
            	<button onclick="location.href='<%=contextPath%>/oldlist.ad?currentPage=<%=currentPage-1%>';" class="btn btn-outline-primary btn-sm"> &lt; </button>
			<% } %>

            <% for(int p=startPage; p<=endPage; p++){ %>
            	
            	<% if(p != currentPage){ %>
	            	<button onclick="location.href='<%=contextPath%>/oldlist.ad?currentPage=<%= p %>';" class="btn btn-outline-primary btn-sm"><%= p %></button>
	            <% }else { %>
	            	<button class="btn btn-outline-primary btn-sm" disabled><%= p %></button>
            	<% } %>
            	
            <% } %>

			<% if(currentPage != maxPage){ %>
            	<button onclick="location.href='<%=contextPath%>/oldlist.ad?currentPage=<%=currentPage+1%>';" class="btn btn-outline-primary btn-sm"> &gt; </button>
			<% } %>
			
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	
	<script>
		function blockPetsitter(){
			//console.log("되나?");
			
			var sitterNoArr = [];
			$("input[type=checkbox]:checked").each(function(){
			    sitterNoArr.push($(this).parent().siblings().eq(0).text());
			});
			
		    var sitterNoList = sitterNoArr.join(",");
		    
		    if(confirm("선택한 펫시터의 펫시터 권한을 차단하시겠습니까?")){
			    $.ajax({
					url:"sitterblock.ad",
					type:"post",
					data:{sitterNoList:sitterNoList},
					success:function(result){
						if(result == sitterNoArr.length){
					   		alert("문의내역이 정상적으로 삭제되었습니다.");
					    	location.reload();
						} else {
							alert("회원 삭제에 실패했습니다.");
						}
				}, error:function(){
					console.log("펫시터 권한 차단 ajax통신 실패");
				}
			});
			} else {
				$(":checkbox").prop("checked", false);
			} 		
		}
	</script>


	<script type="text/javascript">

    // @breif contenteditable 속성을 가진경우

    contents = document.getElementsByClassName("rowColumn");

    document.addEventListener("DOMContentLoaded", function () {


        // @breif rowColumn 클래스의 갯수 만큼 반복문을 실행한다.
        Array.from(contents).forEach(function (content) {

            // @breif 마우스로 해당영역을 더블클릭 한경우
            content.addEventListener("dblclick", function (event) {



                // @breif 전체 테이블 컬럼( td > p )에서 현재 사용중인 값의 존재여부를 확인한다.
                Array.from(contents).forEach(function (defaultVal) {

                    /*
                    // @details 빈값( null )이 존재하는지 체크한다.
                    if(
                           defaultVal.textContent == ""
                        || defaultVal.textContent == null
                        || defaultVal.textContent == undefined
                        || (defaultVal.textContent != null
                        && typeof defaultVal.textContent == "object"
                        && !Object.keys(defaultVal.textContent).length == ""))
                    {

                        // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
                        defaultVal.textContent = defaultVal.dataset.default;
                    }
                    */

                    // @details 저장하지 않은 내용이라고 판단하여 data 태그의 기본값으로 되돌린다.
                    defaultVal.textContent = defaultVal.dataset.default;

                    // @breif 수정 불가 상태로 되돌린다.

                    defaultVal.contentEditable = false;

                    defaultVal.style.border = "0px";

                });  



                if (content.isContentEditable == false) {



                    // @details 편집 가능 상태로 변경
                    content.contentEditable = true;



                    // @details 텍스트 문구 변경
                    // content.textContent = "";



                    // @details CSS 효과 추가

                    content.style.border = "1px solid #FFB6C1";



                    // @details 포커스 지정
                    content.focus();

                }

            });



            // @breif 키보드 입력이 방생한 경우 실행
            content.addEventListener("keypress", function (event) {


                // @breif Enter키 입력시 실행
                if (event.keyCode == "13") {

                    if (confirm("저장하시겠습니까?")) {


                        // @details 입력된 값이 빈값( null )인지 체크한다.
                        if (

                            content.textContent == ""
                            || content.textContent == null
                            || content.textContent == undefined
                            || (content.textContent != null

                                && typeof content.textContent == "object"
                                && !Object.keys(content.textContent).length == "")) {


                            // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
                            content.textContent = content.dataset.default;

                        } else {

                            // @details 내용의 수정이 완료되었다면 data 태그의 기본값도 바꿔준다.
                            content.dataset.default = content.textContent;

                        }

                        // @breif 수정 불가 상태로 되돌린다.
                        content.contentEditable = false;

                        content.style.border = "0px";

                        var memNo = $(this).parent().siblings().eq(1).children().text();
                        var updateValue = content.dataset.default;
                        var updateCol = "";

                        switch ($(this).parent().index()) {
                            case 2: updateCol = "MEM_Id"; break;
                            case 3: updateCol = "PET_NO"; break;
                            case 4: updateCol = "ADDITIONS"; break;
                            case 5: updateCol = "LICENSE"; break;
                            case 6: updateCol = "EXPERIENCE"; break;
                        }


                        console.log(memNo);         // 변경이 발생한 고객의 고객번호
                        console.log(updateValue);   // 변경된 값
                        console.log(updateCol);     // 변경이 발생한 컬럼

                        //location.href = "update.me?mno="+memNo+"&"+updateCol+"="+updateValue;
                        // 이렇게 서블릿 호출해서 값 넘기면 되지 않을까?
                        // 화면 우측 상단 저장 버튼은 없애야 함. (-- 없앴음)
                        // 근데 엔터키 두개 중에서 하나만 먹힘. 왜그럴까,,,?

                        $.ajax({
                    		url:"sitterupdate.ad",
                    		data:{
                    			sitterNo:sitterNo,
                    			updateCol:updateCol,
                    			updateVal:updateValue
                    		},
                    		type:"post",
                    		success:function(result){
                    			if(result > 0){
                    				
                    				var val = '<td><p class="rowColumn" contenteditable="false" data-default="' + updateValue + '">' + updateValue + '</p></td>'
                    				
                    				$(this).parent().html(val);
                    			}
                    			
                    		}, error:function(){
                    			console.log("펫시터정보 수정 ajax통신 실패");
                    		}
                    	});


                    } else {
                        content.textContent = content.dataset.default;
                        content.contentEditable = false;
                        content.style.border = "0px";

                    }

                }

            });

        });

    });


    // 아이디로 검색  // 조회버튼 필요없음

    $(document).ready(function () {
        $("#petsitter-search-box").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#old-petsitter-list>tbody>tr").filter(function () {
                $(this).toggle($(this).children().eq(2).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });


</script>

</body>

</html>