<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <!DOCTYPE html>
    <html lang="en">
    <head>
 
        <title></title>


    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    

    </head>
    <body>

        <a id="kakao-link-btn" href="javascript:sendLink()">
            <img
              src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
            />
          </a>
          <script type="text/javascript">
           Kakao.init('518a1db685dd196ff66389baf3fa57a8')
            function sendLink() {
              Kakao.Link.sendDefault({
                objectType: 'text',
                text:
                  '당신의 인증번호는 petnolja 입니다',
                link: {
                  mobileWebUrl: 'http://nald.fun/petnolja/',
                  webUrl: 'http://nald.fun/petnolja/',
                },
              })
            }
          </script>
          
          
      
    </body>
    </html>