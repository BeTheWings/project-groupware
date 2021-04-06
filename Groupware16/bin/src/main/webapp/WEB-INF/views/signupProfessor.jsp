<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/signup.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/signupProfessor.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<title>sign up</title>
</head>
<body>
	<div class="mjs_ws">
		<div class="container">
			<section id="signup">
				<h2>ȸ������</h2>
				<br>
				
				<!--���� ȸ������-->
				<div id="teacher_signup" style="display: block;">
					<table>
						<form action="${path}/signup.do" name="signup" method="POST"
							id="form">
							<tr>
								<td class="col1"><label for="id">���̵�(�й�)</label></td>
								<td class="col2"><input type="text" name="userLoginID"
									id="userLoginID1" class="inputBox" placeholder="" autofocus
									autocomplete="off" ></td>
								<td class="col3"><input type="submit" value="�ߺ� Ȯ��"
									id="idcheck"></td>
							</tr>
							<tr>
								<td class="col1"><label for="password">�н�����</label></td>
								<td class="col2"><input type="password" name="userLoginPwd"
									id="userLoginPwd" class="inputBox" autocomplete="off"></td>
							</tr>
							<tr>
								<td class="col1"><label for="name">�̸�</label></td>
								<td class="col2"><input type="text" name="userName"
									id="userName" class="inputBox" autocomplete="off"></td>
							</tr>
							
							<tr>
								<td class="col1"><label for="phoneNumber">����ó</label></td>
								<td class="col2"><input type="text" name="userPhoneNum"
									id="userPhoneNum" class="inputBox" autocomplete="off"></td>
							</tr>
							<tr>
								<td class="col1"><label for="professorColleges">�ܰ�����</label></td>
								<td class="col2"><select name="professorColleges"
									id="professorColleges">
										<option value=" "> </option>
										<option value="humanities">�ι�����</option>
										<option value="socialScience">��ȸ���д���</option>
										<option value="business">�濵����</option>
										<option value="law">��������</option>
										<option value="ictConvergence">ict���մ���</option>
										<option value="futureConvergence">�̷����մ���</option>
								</select></td>
							</tr>
							<tr>
								<td class="col1"><label for="professorMajor">����</label></td>
								<td class="col2"><select name="professorMajor"
									id="professorMajor">
										<option value=" "> </option>	
										<option value="korean">������а�</option>
										<option value="english">������а�</option>
										<option value="chinese">�߾��߹��а�</option>
										<option value="japanese">�Ͼ��Ϲ��а�</option>
										<option value="history">���а�</option>
										<option value="literatureInfo">���������а�</option>
										<option value="arabRegion">�ƶ������а�</option>
										<option value="artHistory">�̼����а�</option>
										<option value="philosophy">ö�а�</option>
										<option value="creativeWriting">����â���а�</option>
										<option value="administration">�����а�</option>
										<option valu**e="economy">�����а�</option>
										<option value="politicalDiplomacy">��ġ�ܱ��а�</option>
										<option value="digitalMedia">�����й̵���а�</option>
										<option value="pediatrics">�Ƶ��а�</option>
										<option value="youthGuidance">û�ҳ������а�</option>
										<option value="managementInformation">�濵�����а�</option>
										<option value="internationalTrade">��������а�</option>
										<option value="law">���а�</option>
										<option value="convergenceSoftware">���ռ���Ʈ�����к�</option>
										<option value="digitalContent">�������������������а�</option>
										<option value="creativeConvergenceTalent">â�����������к�</option>
										<option value="socialWelfare">��ȸ�����а�</option>
										<option value="realEstate">�ε����а�</option>
										<option value="legalAdministration">���������а�</option>
										<option value="psychotherapy">�ɸ�ġ���а�</option>
										<option value="futureConvergenceManagement">�̷����հ濵�а�</option>
										<option value="multiDesign">��Ƽ�������а�</option>
										<option value="contract">����а�</option>
								</select></td>
							</tr>
							<tr>
								<td class="col1"><label for="professorRoom">������</label></td>
								<td class="col2"><input type="text" name="professorRoom"
									id="professorRoom" class="inputBox" autocomplete="off"></td>
							</tr>
							<tr>
								<td class="col1"><label for="professorRoom">������
										��ȭ��ȣ</label></td>
								<td class="col2"><input type="text" name="professorRoomNum"
									id="professorRoomNum" class="inputBox" autocomplete="off"></td>
							</tr>
							
						</form>
					</table>
				</div>
				<br> <br> <input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div id="">
					<input type="submit" id="SignupComplete" value="ȸ������">
				</div>
				
			</section>
		</div>
	</div>
</body>
</html>