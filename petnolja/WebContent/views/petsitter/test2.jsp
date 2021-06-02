<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script>
    $(function(){
  $("input[type='checkBox']").change(function(){
    var len = $("input[type='checkBox']:checked").length;
    if(len == 0)
      $("input[type='submit']").prop("disabled", true);
    else
      $("input[type='submit']").removeAttr("disabled");
  });
  $("input[type='checkBox']").trigger('change');
});
</script>
<body>
    <input type="submit" id="submitButton" th:value="Speichern" name="submit" disabled="disabled"/>
    <table>
        <tr>
          <td><input  type="checkbox" name="searchValues" /></td>
          <td><input  type="checkbox" name="searchValues" /></td>
          <td><input  type="checkbox" name="searchValues" /></td>
        </tr>
      </table>
</body>
</html>