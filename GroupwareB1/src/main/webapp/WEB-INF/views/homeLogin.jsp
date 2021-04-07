<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/homeLayout.css" type="text/css">
    <title>MJS Welfare System</title>
  </head>
  <body>
    <div class="mjs_ws">

      <div class="mheader">
        <!--���ȭ��-->
        <div id="mjs_film"
        style="z-index: 99997; position:absolute; display:none; width:100%;height:100%;
        background-color:#000000; filter:Alpha(opacity=60); opacity:0.4; -moz-opacity:0.6;"></div>
        <!--�޴� -->
         <div id="auth_check_div" align="center" style="z-index: 99999; position:absolute;"></div>
         <div class="menubar">
	          <div class="menubar_width">
		            <div class="menubar_logo"><!--�ΰ��߰��ϱ�-->
		            </div>
	               <div class="menubar_mid">
			                <ul class="top_info">
				                    <li><a href="">����Ʈ��</a></li>
                            <li><a href="">����������</a></li>
				                     <li><a href="">����</a></li>
                             <li><a href="home">�α׾ƿ�</a></li>
                      </ul>
                      <!-- �޴� -->
                      <ul class="top_menu">
                        <li id="home_tab" class="t_menu">
                          <a href="home"><span class="tmenu_pack mover">Ȩ</span></a>
                        </li>
					              <li id="mail_tab" class="t_menu">
                          <a href=""><span class="tmenu_pack mover">����</span></a>
                        </li>
                        <li id="gboard_tab" class="t_menu">
                          <a href=""><span class="tmenu_pack mover">�Խ���</span></a>
                        </li>
                        <li id="rectureRoom_tab" class="t_menu">
                          <a href=""><span class="tmenu_pack mover">���ǽ�</span></a>
                        </li>
                        <li id="scheduling_tab" class="t_menu">
                          <a href=""><span class="tmenu_pack mover">��������</span></a>
                        </li>
                        <li id="memo_tab" class="t_menu">
                          <a href=""><span class="tmenu_pack mover">�޸�</span></a>
                        </li>
                        <li id="inquiry_tab" class="t_menu">
                          <a href=""><span class="tmenu_pack mover">��ȸ</span></a>
                        </li>
                        <li id="teammates_tab" class="t_menu">
                          <a href=""><span class="tmenu_pack mover">��������</span></a>
                        </li>
                        <li id="documents_tab" class="t_menu">
                          <a href=""><span class="tmenu_pack mover">��������</span></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>

      <div class="mbody">
        <div id="mask"></div>
        <div class="mcont_width">
        <div class="left_box">
          <div class="left_info">
            <!--�α��� �� ȭ��-->
            <div class=img>
                <img src="user.png" alt="userimg" width="50" height="50">
            </div>
            <br>
            <div class=userName>��, �ȳ��ϼ���!</div>
            <div class="userColleges"><h4 color="blue">�Ҽ� : </h4></div>
            <div class="userGrade"><h4 color="blue">�г� : </h4></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>