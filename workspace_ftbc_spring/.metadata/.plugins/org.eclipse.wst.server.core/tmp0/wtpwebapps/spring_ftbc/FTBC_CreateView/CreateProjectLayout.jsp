<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 만들기</title>
<!--=============================================================================================
	프로젝트 만드는 페이지 레이아웃 탭 부분만 교체됨.
	날짜:2019-09-12
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="CreateProjectLayout.css?125">
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
	<div>
		<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
	</div>
	<div class="container-fluid">
		<div class="row" id="top">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="row" id="top_title">
					<span id="title">제목</span>
				</div>
				<div class="row" id="top_rule">
					<img id="img_rule">
				</div>
				<div class="row" id="top_notice">
					<img id="img_notice">
				</div>
				<div class="row" id="content">
					<div class="col-lg-8 ">
						<ul class="nav nav-tabs">
							<li class="active" id="tab1"><a class="tab_menu" data-toggle="tab" href="#menu1"> 
									<span id="check_tab1"><img
										src="../FTBC_Images/check1.png"></span>&nbsp;프로젝트 개요
							</a></li>
							<li id="tab2"><a class="tab_menu" data-toggle="tab" href="#menu2"> 
									<span id="check_tab2"><img
										src="../FTBC_Images/check1.png"></span>&nbsp;펀딩 및 선물 구성
							</a></li>
							<li id="tab3"><a class="tab_menu" data-toggle="tab" href="#menu3">
									<span id="check_tab3"><img
										src="../FTBC_Images/check1.png"></span>&nbsp;스토리텔링
							</a></li>
							<li id="tab4"><a class="tab_menu" data-toggle="tab" href="#menu4">
									<span id="check_tab4"><img
										src="../FTBC_Images/check1.png"></span>&nbsp;계좌 설정
							</a></li>
						</ul>
					</div>
					<div class="col-lg-1 "></div>
					<div class="col-lg-1 "></div>
					<div class="col-lg-2 ">
						<div class="btns" id="btns">
							<div id="d_request">
								<a href="#" id="btn_request" data-toggle="modal"
									data-target="#myModal" onClick="check_modal()"><b>검토 요청하기</b></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-2 "></div>
		</div>
		<div class="row" id="bottom">
			<div class="col-lg-2 bottom_side" id="bottom_left"></div>
			<div class="col-lg-8">
				<div class="tab-content">
					<!-- =================================[프로젝트 개요 MENU 1]====================================== -->
					<div id="menu1" class="tab-pane fade in active">
						<%@ include file="Project_Summary.jsp"%>
					</div>

					<!-- =================================[선물 및 펀딩 구성 MENU 2]====================================== -->
					<div id="menu2" class="tab-pane fade">
						<%@ include file="Project_Composition.jsp"%>
					</div>

					<!-- =================================[스토리 텔링 MENU 3]====================================== -->
					<div id="menu3" class="tab-pane fade">
						<%@ include file="Project_StoryTelling.jsp"%>

					</div>

					<!-- =================================[계좌 설정 MENU 4]====================================== -->
					<div id="menu4" class="tab-pane fade">
						<%@ include file="Project_Account.jsp"%>
					</div>
				</div>
			</div>
			<!-- end of tab-content  -->
			<div class="col-lg-2 bottom_side" id="bottom_right"></div>
		</div>
	</div>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<script type="text/javascript">
				function check_modal() {
					check_count();
					composition_check_count();
					story_check_count();
					account_check_count();
					var count = null;
					count = check.split(",");
					$("#modal_check").empty();
					if (count.length > 1) {
						for (var i = 1; i < count.length; i++) {
							$("#modal_img").html(
									'<img src="../FTBC_Images/pro.png" />');
							$("#modal_check")
									.append(
											'<div id="blank_entry" style="border:2px solid #E6E6E6; padding:5px; margin-top:5px; margin-right:5px; margin-left:5px; align:center; border-radius:5px; float:left">'
													+ count[i] + '</div>');
						}
					} else if (count.length == 1) {
						$("#modal_msg").html(
								'<h5>작성 완료 하였습니다. 검토 요청을 보내겠습니다.</h5>');
						$("#modal_img").html(
								'<img src="../FTBC_Images/success.png" />');
						$("#modal-footer")
								.html(
										'<button type="button" onClick="save()" class="btn btn-default" data-dismiss="modal" style="background-color:#FF4643;border-radius:5px;color:#fff">Close</button>');
					}
				}
				function save() {
					$.post("/Project/createProject.ftbc", $(".create_form")
							.serialize(), function(data) {
						var result = data;
						location.href = '/FTBC_MainView/FTBC_Main.jsp';
					});

				}
			</script>
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="text-align: center;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">필수 항목 점검</h4>
				</div>
				<div class="modal-body">
					<div id="modal_img" style="text-align: center;"></div>
					<div style="text-align: center;" id="modal_msg">
						<h5>아직 프로젝트가 완성되지 않았습니다</h5>
						<p>검토를 요청하기 전에 다음 항목의 값을 입력해주세요</p>
					</div>
					<div>
						<div id="modal_check" class="row"
							style="margin-left: 10px; margin-right: auto; text-align: center;"></div>
					</div>
				</div>
				<div class="modal-footer" id="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="background-color: #FF4643; border-radius: 5px; color: #fff">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>