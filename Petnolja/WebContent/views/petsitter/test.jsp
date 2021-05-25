<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html>

  <head>

    <style>
      .top {
        margin-top: 20px;
        width: 1000px;
        height: 80px;
        display: table;
      }

      .container {
        width: 1000px;
        margin: 0 auto;
      }

      .container div span {
        display: table-cell;
        vertical-align: middle;
      }

      .middle {
        margin-top: 10px;
        width: 1000px;
        height: 500px;
        position: relative;
      }

      .middle-right {

        position: absolute;
        top: 0px;
        width: 380px;
        height: 500px;
        background-color: #E1F0FA;
      }

      .middle-right {
        position: absolute;
        top: 0px;
        left: 620px;
        width: 480px;
        height: 490px;
      }

      .middle-left-1 {

        width: 600px;
        height: 150px;
        background-color: #E1F0FA;
      }

      .middle-left-2 {

        margin-top: 20px;
        width: 600px;
        height: 150px;
        background-color: #E1F0FA;
      }

      .middle-left-3 {

        margin-top: 20px;
        width: 600px;
        height: 150px;
        background-color: #E1F0FA;
      }

      #btn1 {
        border: 0px;
        margin-right: 5px;
        margin-left: 5px;
        background-color: #3498DB;
        color: white;
        border-radius: 5px;
      }
      .my-hr {
        border: 0;
        height: 3px;
        background: #ccc;
  }
    </style>
  </head>

  <body>
    <%@ include file="../common/menubar.jsp" %>
      <div class="container">
        <%@ include file="../sitter/exa-menu.jsp" %>
        
        
        <!-- MIDDLE -->
        <div class="middle">
        </div>
  </body>

  </html>