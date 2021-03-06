<%@page import="java.util.Map"%>
<%@page import="vo.GiftVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String gift_code = request.getParameter("gift_code");
	String mem_email = null;
	if (session.getAttribute("mem_email") != null) {
		mem_email = session.getAttribute("mem_email").toString();
	}
	String mem_name = null;
	if (session.getAttribute("mem_name") != null) {
		mem_name = session.getAttribute("mem_name").toString();
	}
	ProjectVO payFund = null;
	String pjo_longtitle = null;
	String gift_unitmoney = null;
	if (request.getAttribute("payFund") != null) {
		payFund = (ProjectVO) request.getAttribute("payFund");
		pjo_longtitle = payFund.getPjo_longtitle();
		gift_unitmoney = payFund.getGift_unitmoney();
	}
	String donation = null;
	if (request.getAttribute("donation") != null) {
		donation = (String) request.getAttribute("donation");
	}
	String jsonOption = null;
	if(request.getAttribute("jsonOption") != null) {
		jsonOption = request.getAttribute("jsonOption").toString();
	} else {
		jsonOption = "옵션없음";
	}
%>

<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>FTBC</title>
<!--=============================================================================================
	결제 페이지
	날짜:2019-09-25
	필요한 정보
	pay_method, name, amount, buyer_email, buyer_name, buyer_tel, buyer_addr,  buyer_postcode
	지불정보 설정페이지에서 설정한 부분들을 가져오자. 
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/FTBC_FundView/Pay_Project.css">
</head>
<body>
	<script type="text/javascript">
	
		var pritxt; // 구매자의 개인키
		var jsonOption;
		$(document).ready(function() {

			var IMP = window.IMP; // 생략가능
			IMP.init('imp78617543'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용]
			$('.modal').on('hidden.bs.modal', function() {
				$(this).find('form')[0].reset();
				console.log("modal closing~~~");
				$('#prkchooser').val('');
				$('#private-txt').val('');
				console.log("modal clos!" + $('#prkchooser').val());
				console.log("modal clos!!!" + $('#private-txt').val());
			})
			jsonOption = '<%=jsonOption %>';
		});
		
		

		
		function payment() {//모두 필수 입력해야 함.
			// 다 입력됬을 경우 전송

			if($("#buyer_tel").val()!=""&&$("#buyer_addr").val()!=""&&$("#buyer_post1").val()!=""
										&&$("#buyer_post2").val()!=""&&$("#buyer_addr_detail").val()!=""){
			console.log("pritxt : " + pritxt);
			var p_title = $("#Pay_title").text(); // 프로젝트 긴 제목
			console.log("p_title : " + p_title);

			var p_gift_code = $("#gift_code").val();
			var p_buyer = $("#buyer_name").val();
			var p_amount = $("#amount").val();
			var p_email = $("#buyer_email").val();
			var p_tel = $("#buyer_tel").val();
			var p_addr = $("#buyer_addr").val();
			var p_post = $("#buyer_post1").val() + "-"
					+ $("#buyer_post2").val();
			var p_addr_detail = $("#buyer_addr_detail").val();
			if (p_amount.includes(',')) {
				p_amount = p_amount.replace(',', '');
			}

			console.log("아이템 이름 " + p_gift_code);
			console.log("구매자 이름 " + p_buyer);
			console.log("아이템 가격 " + p_amount);
			console.log("구매자 메일 " + p_email);
			console.log("구매자 주소" + p_addr);
			console.log("우편 번호 " + p_post);
			console.log("구매자 상세 주소 "+p_addr_detail);
			IMP.request_pay({
				pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
				pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
				merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
				name : p_gift_code,
				amount : p_amount,
				buyer_email : p_email,
				buyer_name : p_buyer,
				buyer_tel : p_tel, //누락되면 이니시스 결제창에서 오류
				buyer_addr : p_addr, // 구매자 주소
				buyer_postcode : p_post, // 우편번호
			}, function(rsp) {
				// 결제가 성공되었을 시
				if (rsp.success) {
					// 쿼리스트링으로 전송 시 '+' 기호를 예약어로써 지워버리는 문제를 해결하기 위한 코드
					pritxt = pritxt.replace(/\+/g, "%2B");
					location.href = "/chain/addTransaction.ftbc?paid_amount=" + rsp.paid_amount
							+ "&buyer_email="+ rsp.buyer_email + "&buyer_name=" + rsp.buyer_name
							+ "&p_gift_code="+ rsp.name + "&p_title=" + p_title 
							+ "&buyer_addr="+ rsp.buyer_addr + "&buyer_postcode="+rsp.buyer_postcode
							+ "&buyer_detailAddr="+p_addr_detail+"&jsonOption="+jsonOption+"&pritxt="+ pritxt;
					// - 있는거 : 구매자이름, 구매가격, 구매자메일, 개인키, 구매자주소, 구매자 우편번호, 구매자 상세주소
					// - 없는거 : 객관식 | 주관식 옵션 
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
			}
			else{
		         alert("모든 항목을 입력하셔야 결제가 가능합니다.");
		      }
		}

		//////////////////privatekey 인증 받기/////////////////////
		function textPK(target) {
			var text = target.value;
			if (text == '') {
				$('#modal-submit').attr('disabled', 'disabled');
			} else {
				$('#modal-submit').removeAttr('disabled');
			}
		}
		function pk_submit() {
			//폼전송 
			var pk_form = $("form[name=time_form").serialize();
		}

		////////////////////.ftbc파일 가져와서 모달 textarea에 박아주기
		$(function() {
			//이벤트 리스너 등록.
			document.getElementById('prkchooser').addEventListener('change',
					readFile2, false);

		});   

		function readFile2(e) {
			var file = e.target.files[0];
			if (!file) {
				return;
			}
			var reader = new FileReader();
			reader.onload = function(e) {

				fileData = e.target.result;
				//file데이터를 읽어서 처리할 로직.
				console.log("fileData " + fileData);
				$("#private-txt").val(fileData);
				btnable();
			};
			reader.readAsText(file, 'euc-kr');
		}

		function btnable() {
			pritxt = $("#private-txt").val();
			console.log("22pritxt " + pritxt);
			if (pritxt == '') {
				$('#modal-submit').attr('disabled', 'disabled');
			} else {
				$('#modal-submit').removeAttr('disabled');
			}

		}
		function verifyKeys() {
			$('input[name=mem_email]').val($('#buyer_email').val());
			var pk_form = $("form[name=pk_form").serialize();
			$.ajax({
				type : 'post',
				url : '/restchain/verifyKeys.ftbc',
				data : pk_form,
				success : function(data) {
					console.log("data " + data);
					if (data.includes('인증되었습니다.')) {
						$("#buyer_pk").val("인증 완료!");
						$('#btn_pg').removeAttr('disable');
						$('#pk_btn').attr('disabled', 'disabled');
						$('#pay_btn').removeAttr('disabled');
					} else {
						alert(data);
					}
				},
				error : function(e) {
					console.log("error " + e);
				}
			});
		}
		function onlyNumber(event){
		    event = event || window.event;
		    var keyID = (event.which) ? event.which : event.keyCode;
		    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		        return;
		    else
		        return false;
		}
		function removeChar(event) {
		    event = event || window.event;
		    var keyID = (event.which) ? event.which : event.keyCode;
		    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )  {
		        return;
		    } else {
		        event.target.value = event.target.value.replace(/[^0-9]/g, "");
		    }
		}
	</script>
	<div id="PayTop_bar">
		<div>
			<span id="Pay_title"><%=pjo_longtitle%></span>
		</div>
		<div id="funditem_info" class="pay_row">
			<small>선택한 선물</small><br>
			<%
				if (gift_unitmoney == null) {
			%>
			<span>선물없음/ 1,000원 후원</span>
			<%
				} else {
			%>
			<span><%=gift_unitmoney%>원 선물/ <%=donation%>원 후원</span>
			<%
				}
			%>
		</div>
	</div>
	<div class="container-fluid">
		<input type="hidden" id="gift_code" value="<%=gift_code%>">
		<div class="pay_row pay_box">
			<label>구매자 이름</label> <input type="text" id="buyer_name"
				value="<%=mem_name%>" readonly>
		</div>

		<div class="pay_row pay_box">
			<label>구매 가격</label> <input type="text" id="amount"
				value="<%=donation%>" readonly>
		</div>

		<div class="pay_row pay_box">
			<label>구매자 메일</label> <input type="text" id="buyer_email"
				value="<%=mem_email%>" readonly>
		</div>
		<div id="pregyulJaeConfirm" class="pay_row pay_box"><b style="color:red">아래 모든 항목을 입력하시면 결제가 가능합니다.</b></div>
		<div class="pay_row pay_box">
			<label>구매자 전화번호 &nbsp; - &nbsp;<span id="span_confirm_tel"></span></label> 
			<input type="text" id="buyer_tel" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="11"
				placeholder=" 전화번호는 -를 뺀 숫자만 입력해주세요." style="font-size: 13px">
		</div>

		<div class="pay_row pay_box">
			<label>구매자 주소</label> <input type="text" id="buyer_addr" readonly
				class="postcodify_address">
		</div>


		<div class="pay_row pay_box">
			<label>구매자 우편번호</label> <br> <input type="text" size="4" readonly
				class="postcodify_postcode6_1 postcode" id="buyer_post1" /> &ndash;
			<label></label><input type="text" size="4" readonly
				class="postcodify_postcode6_2 postcode" id="buyer_post2" /> &nbsp;
			<button id="search_addr">검색</button>
		</div>

		<div class="pay_row pay_box">
			<label>구매자 상세 주소</label> <input type="text" id="buyer_addr_detail"
				class="postcodify_address_detail">
		</div>

		<script type="text/javascript">
			$("#search_addr").postcodifyPopUp();
		</script>

		<div class="pay_row pay_box">
			<label>개인키 /공개키 인증</label><br> <input type="text" id="buyer_pk">
			<button id="pk_btn" data-toggle="modal" data-target="#pk_modal">인증</button>
		</div>

		<div class="pay_row">
			<input id="pay_btn" type="button" onclick="payment()"
				disabled="disabled" value="결제">
		</div>

	</div>

	<!-- pk인증 모달  -->
	<div class="modal fade" id="pk_modal" role="dialog">
		<div id="modal-dialog" class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div id="modal-header" class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					개인키 인증하기
				</div>
				<div id="modal-body" class="modal-body">
					<!-- #form태그 -->
					<form id="pk_form" name="pk_form">
						<div class=".modal_filediv">
							<label id="prk_upload" for="prkchooser" class="file_upload">개인키
								파일 선택</label> <input id="prkchooser" class="ml8" type="file" />
						</div>
						<div>
							<textarea id="private-txt" class="form-control"
								name="encoded_prk" oninput="javascript:textPK(this)"
								placeholder="파일 선택버튼을 눌러서 개인키 파일(.prk)을 넣어주세요" rows="8"
								style="width: 100%;"></textarea>
						</div>
						<%
							// ##String loginID = session.getAttribute("loginID");
						%>
						<input class="hidden" name="mem_email">
					</form>
				</div>
				<div class="modal-footer">
					<button id="modal-cancle" type="button" class="btn btn-default"
						data-dismiss="modal">
						<i class="fa fa-ban" style="margin-right: 5px"></i>취소하기
					</button>
					<button id="modal-submit" type="button" class="btn btn-default"
						onclick="verifyKeys()" disabled data-dismiss="modal">
						<i class="fa fa-envelope" style="margin-right: 5px"></i>보내기
					</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>