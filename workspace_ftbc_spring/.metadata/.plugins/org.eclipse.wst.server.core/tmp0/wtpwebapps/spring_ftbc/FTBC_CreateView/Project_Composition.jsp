<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 만들기 ::FTBC</title>
<!--=============================================================================================
	펀딩 및 선물 구성 2019- 10- 14(월) 정원형 뷰 수정.
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="../FTBC_CreateView/Project_Composition.css?30">
<script>
	var check =null;
	$(document).on("keyup", "input[class=chundanwigubun]", function() {
		var $this = $(this);
		var num = $this.val().replace(/[,]/g, "");
		var parts = num.toString().split(".");
		parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$this.val(parts.join("."));
	});
	//////////////////////////////text박스 number만 입력받고 천단위 구분기호 넣기 끝//////////////////////////
	function checkLimted() {
		if (limitedCheck.checked == true) {
			limitedQuantity.disabled = false;
		} else {
			limitedQuantity.disabled = true;
		}
	}
	////////////////////아이템 수량 설정///////////////////////////
	function itemQuantityOption0(value) {
		itemQuantity = $("#itemQuantityOption0").val();
		if (value == "plus") {
			var newValue = parseFloat(itemQuantity) + 1;
		} else {
			if (itemQuantity > 0) {
				var newValue = parseFloat(itemQuantity) - 1;
			} else {
				newValue = 0;
			}
		}
		$("#itemQuantityOption0").val(newValue);
	}
	function itemQuantityOption1(value) {
		itemQuantity = $("#itemQuantityOption1").val();
		if (value == "plus") {
			var newValue = parseFloat(itemQuantity) + 1;
		} else {
			if (itemQuantity > 0) {
				var newValue = parseFloat(itemQuantity) - 1;
			} else {
				newValue = 0;
			}
		}
		$("#itemQuantityOption1").val(newValue);
	}
	function itemQuantityOption2(value) {
		itemQuantity = $("#itemQuantityOption2").val();
		if (value == "plus") {
			var newValue = parseFloat(itemQuantity) + 1;
		} else {
			if (itemQuantity > 0) {
				var newValue = parseFloat(itemQuantity) - 1;
			} else {
				newValue = 0;
			}
		}
		$("#itemQuantityOption2").val(newValue);
	}
	function itemQuantityOption3(value) {
		itemQuantity = $("#itemQuantityOption3").val();
		if (value == "plus") {
			var newValue = parseFloat(itemQuantity) + 1;
		} else {
			if (itemQuantity > 0) {
				var newValue = parseFloat(itemQuantity) - 1;
			} else {
				newValue = 0;
			}
		}
		$("#itemQuantityOption3").val(newValue);
	}
	function itemQuantityOption4(value) {
		itemQuantity = $("#itemQuantityOption4").val();
		if (value == "plus") {
			var newValue = parseFloat(itemQuantity) + 1;
		} else {
			if (itemQuantity > 0) {
				var newValue = parseFloat(itemQuantity) - 1;
			} else {
				newValue = 0;
			}
		}
		$("#itemQuantityOption4").val(newValue);
	}
	/////////////////////////////////////////////////////////////////

	//////////////////여기서부터는 처음 페이지 쇼하이드 관련./////////////////
	$(document).ready(function() {
		$("#goalMoneyShow").hide();
		$("#projectEndDateShow").hide();
		$("#moneyEstimatedDateShow").hide();
		$("#giftAddInfo").hide();
		$("#giftConfiguration").hide();
		$("#refundAndExchangesShow").hide();
		$("#goalMoneyInputShow").hide();
		$("#goalMoneyEditShow").hide();
		$("#projectEndDateInputShow").hide();
		$("#projectEndDateEditShow").hide();
		$("#defaultHide").hide();
		$("#itemListDeleteShow0").hide();
		$("#itemListEditShow0").hide();
		$("#itemListDeleteShow1").hide();
		$("#itemListEditShow1").hide();
		$("#itemListDeleteShow2").hide();
		$("#itemListEditShow2").hide();
		$("#itemListDeleteShow3").hide();
		$("#itemListEditShow3").hide();
		$("#itemListDeleteShow4").hide();
		$("#itemListEditShow4").hide();
		if($("#goalMoneyOutput").val() == ""&& $("#prjectEndDateOutput").val() == ""
	         && $("#payEndDate").val() == ""&& $("#receiptDate").val() == ""
	             && $("#refundAndExchangeSpan").val() == ""){
	         		$("#check_tab2").html('<img id="check_tab2" src="../FTBC_Images/check.png">');
		}
	});
	function goalMoneyShow() {
		$("#goalMoneyShow").show();
		$("#goalMoney").hide();
		$("#projectEndDateShow").hide();
		$("#giftConfiguration").hide();
		$("#refundAndExchangesShow").hide();
		$("#projectEndDate").show();
		$("#giftAddButtonForm").show();
	}
	function goalMoneyShowHide() {
		$("#goalMoneyShow").hide();
		$("#goalMoney").show();
		$("#projectEndDate").show();
		$("#giftAddButtonForm").show();
		$("#refundAndExchanges").show();
	}
	function projectEndDateShow() {
		$("#projectEndDate").hide();
		$("#projectEndDateShow").show();
		$("#goalMoneyShow").hide();
		$("#giftConfiguration").hide();
		$("#refundAndExchangesShow").hide();
		$("#goalMoney").show();
		$("#refundAndExchanges").show();
		$("#giftAddButtonForm").show();
	}
	function projectEndDateShowHide() {
		$("#projectEndDate").show();
		$("#projectEndDateShow").hide();
		$("#goalMoney").show();
		$("#giftAddButtonForm").show();
		$("#refundAndExchanges").show();
	}
	function moneyEstimatedDateShow() {
		$("#moneyEstimatedDateShow").show();
		$("#projectEndDate").show();
		$("#moneyEstimatedDate").hide();
		$("#projectEndDateShow").hide();
	}
	function giftConfigShow() {
		$("#giftAddButtonForm").hide();
		$("#giftConfiguration").show();
		$("#projectEndDateShow").hide();
		$("#refundAndExchangesShow").hide();
		$("#goalMoneyShow").hide();
		$("#projectEndDate").show();
		$("#goalMoney").show();
		$("#refundAndExchanges").show();
	}
	function giftConfigShowHide() {
		$("#giftConfiguration").hide();
		$("#giftAddButtonForm").show();
		$("#refundAndExchanges").show();
		$("#goalMoney").show();
		$("#projectEndDate").show();
	}
	function refundAndExchangesShow() {
		$("#refundAndExchangesShow").show();
		$("#refundAndExchanges").hide();
		$("#refundAndExchangesDefault").hide();
		$("#projectEndDateShow").hide();
		$("#giftConfiguration").hide();
		$("#goalMoneyShow").hide();
		$("#goalMoney").show();
		$("#projectEndDate").show();
		$("#giftAddButtonForm").show();
	}
	function refundAndExchangesShowHide() {
		$("#refundAndExchangesShow").hide();
		$("#refundAndExchanges").show();
		$("#goalMoney").show();
		$("#projectEndDate").show();
		$("#giftAddButtonForm").show();
	}
	function itemAddShow() {
		$("#itemAdd").hide();
		$("#itemAddShow").show();
		$("#itemListEditShow").hide();
		$("#itemListDeleteShow").hide();
	}
	function itemConfigShowHide() {
		$("#itemAdd").show();
		$("#itemAddShow").hide();
	}
	//////////////////////////////모달 안에 아이템 추가 옵션입력후 확인 버튼 눌렀을때 이벤트 시작/////////////
	/*
	 * 아래 itemAddConfirm설명
	 첫 분기는 tr이 append 되는것이 항상 3개씩 들어가기때문. 5쌍까지만 입력가능하도록 제한을 걸어놨고. length가 14까지만 가능
	 두번째 분기부터는 Tbody안에 해당 Id를 가진 tr이 들어가있는지 확인하는 코드임.
	 이렇게 한 이유가 삭제한 tr을 그대로 다시 넣어주기 위함임. replace는 들어가는 tr이 각각 다른 펑션를 호출하기 위해서 if문마다 0~4번호가 붙음.
	 e.ereplace 부분의 gi는 앞의 문자열을 e에서 모두 찾아서 뒤에 설정한것으로 바꿔주는것. gi없이 그냥 문자열만 넣으면 한개만하고 동작안함.
	 document.getElementById("itemListNameInput0").value = $("#newMakeItemName").val();이부분은 아이템 추가할때 아이템 이름적은거 넣어주는것.
	
	 */
	function itemAddConfirm() {
		 if($("#removedTr").length!=null){
		 $("#removedTr").remove();			 
		 }
		 if($("#removedTr2").length!=null){
			 $("#removedTr2").remove();
		 }
		if ($("#itemListHeaderTbody tr").length <= 14) { //itemListHeaderTbody의 tr 개수가 14까지 즉 15가 되면 더 이상 저장할 수 없다.
			if ($("#itemListHeaderTbody").has(
					document.getElementById('itemListEditShow0')).html() == undefined) {
				var a = $("#defaultHideList").html();
				a = a.replace(">수", "onclick='itemListEditShow0()'>수");
				a = a.replace(">삭", "onclick='itemListDeleteShow0()'>삭");
				a = a.replace(/itemListOptionInput/gi, "itemListOptionInput0");
				a = a.replace(/itemListNameInput/gi, "itemListNameInput0");
				$("#itemListHeaderTbody").append(a);
				var c = $("#itemListEditShowView0").html();
				var d = $("#itemListDeleteShowView0").html();
				$("#itemListHeaderTbody").append(c);
				$("#itemListHeaderTbody").append(d);
				var e = $("#giftDefaultHideList").html();
				e = e.replace(/itemQuantityOption/gi, "itemQuantityOption0");
				e = e.replace(/itemListNameOutput/gi, "itemListNameOutput0");
				e = e
						.replace(/itemListOptionOutput/gi,
								"itemListOptionOutput0");
				e = e.replace(/YesNoGroup/gi, "YesNoGroup0");
				$("#giftConfigListTbody").append(e);
				document.getElementById("itemListNameInput0").value = $(
						"#newMakeItemName0").val();
				document.getElementById("itemListNameOutput0").value = $(
						"#newMakeItemName0").val();
				if ($("input:radio[id='option1']:checked").length == 1) {
					document.getElementById("itemListOptionInput0").value = "없음";
					document.getElementById("itemListOptionOutput0").value = "없음";
				} else if ($("input:radio[id='option2']:checked").length == 1) {
					var select = "선택:";
					var change = $("#multipleChoiceInput").val();
					select = select.concat(change);
					document.getElementById("itemListOptionInput0").value = select
							.replace(/\n/gi, ",");
					document.getElementById("itemListOptionOutput0").value = select
							.replace(/\n/gi, ",");
				} else if ($("input:radio[id='option3']:checked").length == 1) {
					var ipryuk = "입력:";
					var input = $("#jugwanSicInput").val();
					ipryuk = ipryuk.concat(input);
					document.getElementById("itemListOptionInput0").value = ipryuk;
					document.getElementById("itemListOptionOutput0").value = ipryuk;
				}
			} else if ($("#itemListHeaderTbody").has(
					document.getElementById('itemListEditShow1')).html() == undefined) {
				var a = $("#defaultHideList").html();
				a = a.replace(">수", "onclick='itemListEditShow1()'>수");
				a = a.replace(">삭", "onclick='itemListDeleteShow1()'>삭");
				a = a.replace(/itemListOptionInput/gi, "itemListOptionInput1");
				a = a.replace(/itemListNameInput/gi, "itemListNameInput1");
				$("#itemListHeaderTbody").append(a);
				var c = $("#itemListEditShowView1").html();
				var d = $("#itemListDeleteShowView1").html();
				$("#itemListHeaderTbody").append(c);
				$("#itemListHeaderTbody").append(d);
				var e = $("#giftDefaultHideList").html();
				e = e.replace(/itemQuantityOption/gi, "itemQuantityOption1");
				e = e.replace(/itemListNameOutput/gi, "itemListNameOutput1");
				e = e
						.replace(/itemListOptionOutput/gi,
								"itemListOptionOutput1");
				e = e.replace(/YesNoGroup/gi, "YesNoGroup1");
				$("#giftConfigListTbody").append(e);
				document.getElementById("itemListNameInput1").value = $(
						"#newMakeItemName0").val();
				document.getElementById("itemListNameOutput1").value = $(
						"#newMakeItemName0").val();
				if ($("input:radio[id='option1']:checked").length == 1) {
					document.getElementById("itemListOptionInput1").value = "없음";
					document.getElementById("itemListOptionOutput1").value = "없음";
				} else if ($("input:radio[id='option2']:checked").length == 1) {
					var select = "선택:";
					var change = $("#multipleChoiceInput").val();
					select = select.concat(change);
					document.getElementById("itemListOptionInput1").value = select
							.replace(/\n/gi, ",");
					document.getElementById("itemListOptionOutput1").value = select
							.replace(/\n/gi, ",");
				} else if ($("input:radio[id='option3']:checked").length == 1) {
					var ipryuk = "입력:";
					var input = $("#jugwanSicInput").val();
					ipryuk = ipryuk.concat(input);
					document.getElementById("itemListOptionInput1").value = ipryuk;
					document.getElementById("itemListOptionOutput1").value = ipryuk;
				}
			} else if ($("#itemListHeaderTbody").has(
					document.getElementById('itemListEditShow2')).html() == undefined) {
				var a = $("#defaultHideList").html();
				a = a.replace(">수", "onclick='itemListEditShow2()'>수");
				a = a.replace(">삭", "onclick='itemListDeleteShow2()'>삭");
				a = a.replace(/itemListOptionInput/gi, "itemListOptionInput2");
				a = a.replace(/itemListNameInput/gi, "itemListNameInput2");
				$("#itemListHeaderTbody").append(a);
				var c = $("#itemListEditShowView2").html();
				var d = $("#itemListDeleteShowView2").html();
				$("#itemListHeaderTbody").append(c);
				$("#itemListHeaderTbody").append(d);
				var e = $("#giftDefaultHideList").html();
				e = e.replace(/itemQuantityOption/gi, "itemQuantityOption2");
				e = e.replace(/itemListNameOutput/gi, "itemListNameOutput2");
				e = e
						.replace(/itemListOptionOutput/gi,
								"itemListOptionOutput2");
				e = e.replace(/YesNoGroup/gi, "YesNoGroup2");
				$("#giftConfigListTbody").append(e);
				document.getElementById("itemListNameInput2").value = $(
						"#newMakeItemName0").val();
				document.getElementById("itemListNameOutput2").value = $(
						"#newMakeItemName0").val();
				if ($("input:radio[id='option1']:checked").length == 1) {
					document.getElementById("itemListOptionInput2").value = "없음";
					document.getElementById("itemListOptionOutput2").value = "없음";
				} else if ($("input:radio[id='option2']:checked").length == 1) {
					var select = "선택:";
					var change = $("#multipleChoiceInput").val();
					select = select.concat(change);
					document.getElementById("itemListOptionInput2").value = select
							.replace(/\n/gi, ",");
					document.getElementById("itemListOptionOutput2").value = select
							.replace(/\n/gi, ",");
				} else if ($("input:radio[id='option3']:checked").length == 1) {
					var ipryuk = "입력:";
					var input = $("#jugwanSicInput").val();
					ipryuk = ipryuk.concat(input);
					document.getElementById("itemListOptionInput2").value = ipryuk;
					document.getElementById("itemListOptionOutput2").value = ipryuk;
				}
			} else if ($("#itemListHeaderTbody").has(
					document.getElementById('itemListEditShow3')).html() == undefined) {
				var a = $("#defaultHideList").html();
				a = a.replace(">수", "onclick='itemListEditShow3()'>수");
				a = a.replace(">삭", "onclick='itemListDeleteShow3()'>삭");
				a = a.replace(/itemListOptionInput/gi, "itemListOptionInput3");
				a = a.replace(/itemListNameInput/gi, "itemListNameInput3");
				$("#itemListHeaderTbody").append(a);
				var c = $("#itemListEditShowView3").html();
				var d = $("#itemListDeleteShowView3").html();
				$("#itemListHeaderTbody").append(c);
				$("#itemListHeaderTbody").append(d);
				var e = $("#giftDefaultHideList").html();
				e = e.replace(/itemQuantityOption/gi, "itemQuantityOption3");
				e = e.replace(/itemListNameOutput/gi, "itemListNameOutput3");
				e = e
						.replace(/itemListOptionOutput/gi,
								"itemListOptionOutput3");
				e = e.replace(/YesNoGroup/gi, "YesNoGroup3");
				$("#giftConfigListTbody").append(e);
				document.getElementById("itemListNameInput3").value = $(
						"#newMakeItemName0").val();
				document.getElementById("itemListNameOutput3").value = $(
						"#newMakeItemName0").val();
				if ($("input:radio[id='option1']:checked").length == 1) {
					document.getElementById("itemListOptionInput3").value = "없음";
					document.getElementById("itemListOptionOutput3").value = "없음";
				} else if ($("input:radio[id='option2']:checked").length == 1) {
					var select = "선택:";
					var change = $("#multipleChoiceInput").val();
					select = select.concat(change);
					document.getElementById("itemListOptionInput3").value = select
							.replace(/\n/gi, ",");
					document.getElementById("itemListOptionOutput3").value = select
							.replace(/\n/gi, ",");
				} else if ($("input:radio[id='option3']:checked").length == 1) {
					var ipryuk = "입력:";
					var input = $("#jugwanSicInput").val();
					ipryuk = ipryuk.concat(input);
					document.getElementById("itemListOptionInput3").value = ipryuk;
					document.getElementById("itemListOptionOutput3").value = ipryuk;
				}
			} else if ($("#itemListHeaderTbody").has(
					document.getElementById('itemListEditShow4')).html() == undefined) {
				var a = $("#defaultHideList").html();
				a = a.replace(">수", "onclick='itemListEditShow4()'>수");
				a = a.replace(">삭", "onclick='itemListDeleteShow4()'>삭");
				a = a.replace(/itemListOptionInput/gi, "itemListOptionInput4");
				a = a.replace(/itemListNameInput/gi, "itemListNameInput4");
				$("#itemListHeaderTbody").append(a);
				var c = $("#itemListEditShowView4").html();
				var d = $("#itemListDeleteShowView4").html();
				$("#itemListHeaderTbody").append(c);
				$("#itemListHeaderTbody").append(d);
				var e = $("#giftDefaultHideList").html();
				e = e.replace(/itemQuantityOption/gi, "itemQuantityOption4");
				e = e.replace(/itemListNameOutput/gi, "itemListNameOutput4");
				e = e
						.replace(/itemListOptionOutput/gi,
								"itemListOptionOutput4");
				e = e.replace(/YesNoGroup/gi, "YesNoGroup4");
				$("#giftConfigListTbody").append(e);
				document.getElementById("itemListNameInput4").value = $(
						"#newMakeItemName0").val();
				document.getElementById("itemListNameOutput4").value = $(
						"#newMakeItemName0").val();
				if ($("input:radio[id='option1']:checked").length == 1) {
					document.getElementById("itemListOptionInput4").value = "없음";
					document.getElementById("itemListOptionOutput4").value = "없음";
				} else if ($("input:radio[id='option2']:checked").length == 1) {
					var select = "선택:";
					var change = $("#multipleChoiceInput").val();
					select = select.concat(change);
					document.getElementById("itemListOptionInput4").value = select
							.replace(/\n/gi, ",");
					document.getElementById("itemListOptionOutput4").value = select
							.replace(/\n/gi, ",");
				} else if ($("input:radio[id='option3']:checked").length == 1) {
					var ipryuk = "입력:";
					var input = $("#jugwanSicInput").val();
					ipryuk = ipryuk.concat(input);
					document.getElementById("itemListOptionInput4").value = ipryuk;
					document.getElementById("itemListOptionOutput4").value = ipryuk;
				}//////////////end of inner else if
			}//////////////////end of out else if
		} /////////end of out if
		else {//15이상(5개 아이템까지만 등록가능)
			alert("더 이상 등록이 불가능합니다.");
		}//////////////end of if
		$("#itemAdd").show();//등록하면 아이템 추가하기 창을띄워주고
		$("#itemAddShow").hide();//edit창 닫아주는것.
		document.getElementById("newMakeItemName0").value = null;
		document.getElementById("multipleChoiceInput").value = null;
		document.getElementById("jugwanSicInput").value = null;
		$("input:radio[id='option1']").prop('checked', true);
		$("#multipleChoiceInput").hide();
		$("#jugwanSicInput").hide();
	}//////////////end of function
	//////////////////////////////모달 안에 아이템 추가 옵션입력후 확인 버튼 눌렀을때 이벤트 끝/////////////////
	/////////////////////아이템 관리하기 모달의 주관식 객관식  입력창 오픈 클로즈 관련///////////////////////
	/////////////////////여긴 추가되어서 수정삭제하는곳이 아니고 그냥 추가버튼 눌렀을때 나오는거 관련된거임!/////////////
	$(document).ready(function() {
		$("#itemAddShow").hide();
		$("#multipleChoiceInput").hide();
		$("#jugwanSicInput").hide();
		$("#multipleChoiceInput0").hide();
		$("#jugwanSicInput0").hide();
		$("#multipleChoiceInput1").hide();
		$("#jugwanSicInput1").hide();
		$("#multipleChoiceInput2").hide();
		$("#jugwanSicInput2").hide();
		$("#multipleChoiceInput3").hide();
		$("#jugwanSicInput3").hide();
		$("#multipleChoiceInput4").hide();
		$("#jugwanSicInput4").hide();
		$("#refundAndExchangeOutput").hide();
		$("#remainQuantity").hide();
		$("#giftAddDefault").hide();
		$("#option1").click(function() {
			if (($("#option1").is(':checked'))) {
				$("#multipleChoiceInput").hide();
				$("#jugwanSicInput").hide();
				$("#multipleChoiceInput0").hide();
				$("#jugwanSicInput0").hide();
				$("#multipleChoiceInput1").hide();
				$("#jugwanSicInput1").hide();
				$("#multipleChoiceInput2").hide();
				$("#jugwanSicInput2").hide();
				$("#multipleChoiceInput3").hide();
				$("#jugwanSicInput3").hide();
				$("#multipleChoiceInput4").hide();
				$("#jugwanSicInput4").hide();
			} else if (($("#option2").is(':checked'))) {
				$("#multipleChoiceInput").show();
				$("#jugwanSicInput").hide();
				$("#multipleChoiceInput0").show();
				$("#jugwanSicInput0").hide();
				$("#multipleChoiceInput1").show();
				$("#jugwanSicInput1").hide();
				$("#multipleChoiceInput2").show();
				$("#jugwanSicInput2").hide();
				$("#multipleChoiceInput3").show();
				$("#jugwanSicInput3").hide();
				$("#multipleChoiceInput4").show();
				$("#jugwanSicInput4").hide();
			} else if (($("#option3").is(':checked'))) {
				$("#jugwanSicInput").show();
				$("#multipleChoiceInput").hide();
				$("#jugwanSicInput0").show();
				$("#multipleChoiceInput0").hide();
				$("#jugwanSicInput1").show();
				$("#multipleChoiceInput1").hide();
				$("#jugwanSicInput2").show();
				$("#multipleChoiceInput2").hide();
				$("#jugwanSicInput3").show();
				$("#multipleChoiceInput3").hide();
				$("#jugwanSicInput4").show();
				$("#multipleChoiceInput4").hide();
			}
		});
		$("#option2").click(function() {
			if (($("#option1").is(':checked'))) {
				$("#multipleChoiceInput").hide();
				$("#jugwanSicInput").hide();
				$("#multipleChoiceInput0").hide();
				$("#jugwanSicInput0").hide();
				$("#multipleChoiceInput1").hide();
				$("#jugwanSicInput1").hide();
				$("#multipleChoiceInput2").hide();
				$("#jugwanSicInput2").hide();
				$("#multipleChoiceInput3").hide();
				$("#jugwanSicInput3").hide();
				$("#multipleChoiceInput4").hide();
				$("#jugwanSicInput4").hide();
			} else if (($("#option2").is(':checked'))) {
				$("#multipleChoiceInput").show();
				$("#jugwanSicInput").hide();
				$("#multipleChoiceInput0").show();
				$("#jugwanSicInput0").hide();
				$("#multipleChoiceInput1").show();
				$("#jugwanSicInput1").hide();
				$("#multipleChoiceInput2").show();
				$("#jugwanSicInput2").hide();
				$("#multipleChoiceInput3").show();
				$("#jugwanSicInput3").hide();
				$("#multipleChoiceInput4").show();
				$("#jugwanSicInput4").hide();
			} else if (($("#option3").is(':checked'))) {
				$("#jugwanSicInput").show();
				$("#multipleChoiceInput").hide();
				$("#jugwanSicInput0").show();
				$("#multipleChoiceInput0").hide();
				$("#jugwanSicInput1").show();
				$("#multipleChoiceInput1").hide();
				$("#jugwanSicInput2").show();
				$("#multipleChoiceInput2").hide();
				$("#jugwanSicInput3").show();
				$("#multipleChoiceInput3").hide();
				$("#jugwanSicInput4").show();
				$("#multipleChoiceInput4").hide();
			}
		});
		$("#option3").click(function() {
			if (($("#option1").is(':checked'))) {
				$("#multipleChoiceInput").hide();
				$("#jugwanSicInput").hide();
				$("#multipleChoiceInput0").hide();
				$("#jugwanSicInput0").hide();
				$("#multipleChoiceInput1").hide();
				$("#jugwanSicInput1").hide();
				$("#multipleChoiceInput2").hide();
				$("#jugwanSicInput2").hide();
				$("#multipleChoiceInput3").hide();
				$("#jugwanSicInput3").hide();
				$("#multipleChoiceInput4").hide();
				$("#jugwanSicInput4").hide();
			} else if (($("#option2").is(':checked'))) {
				$("#multipleChoiceInput").show();
				$("#jugwanSicInput").hide();
				$("#multipleChoiceInput0").show();
				$("#jugwanSicInput0").hide();
				$("#multipleChoiceInput1").show();
				$("#jugwanSicInput1").hide();
				$("#multipleChoiceInput2").show();
				$("#jugwanSicInput2").hide();
				$("#multipleChoiceInput3").show();
				$("#jugwanSicInput3").hide();
				$("#multipleChoiceInput4").show();
				$("#jugwanSicInput4").hide();

			} else if (($("#option3").is(':checked'))) {
				$("#jugwanSicInput").show();
				$("#multipleChoiceInput").hide();
				$("#jugwanSicInput0").show();
				$("#multipleChoiceInput0").hide();
				$("#jugwanSicInput1").show();
				$("#multipleChoiceInput1").hide();
				$("#jugwanSicInput2").show();
				$("#multipleChoiceInput2").hide();
				$("#jugwanSicInput3").show();
				$("#multipleChoiceInput3").hide();
				$("#jugwanSicInput4").show();
				$("#multipleChoiceInput4").hide();
			}
		});
	});
	/////////////////////주관식 객관식  입력창 오픈 클로즈 관련 끝///////////////////////
	//////////////////////////모달 안에 아이템 리스트 수정하기/////////////////////////////
	function ltemListAddEdit0() {
		var i = $("#itemListEditShow0").index();//tr의 index뽑아서 비교
		if (i <= 2) {//수정버튼을 호출한 tr인덱스가 1~3번줄
			$("#itemListNameInput0").val($("#newMakeItemName1").val());
			$("#itemListNameOutput0").val($("#newMakeItemName1").val());
			if ($("input:radio[id='tbodyoption01']:checked").length == 1) {
				document.getElementById("itemListOptionInput0").value = "없음";
				document.getElementById("itemListOptionOutput0").value = "없음";
			} else if ($("input:radio[id='tbodyoption02']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput0").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput0").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput0").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption03']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput0").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput0").value = ipryuk
				document.getElementById("itemListOptionOutput0").value = ipryuk
			}
			$("#itemListAddEditShow0").hide();
		} else if (i > 2 && i <= 5) {//수정버튼을 호출한 tr인덱스가 4~6번줄
			$("#itemListNameInput1").val($("#newMakeItemName2").val());
			$("#itemListNameOutput1").val($("#newMakeItemName2").val());
			if ($("input:radio[id='tbodyoption11']:checked").length == 1) {
				document.getElementById("itemListOptionInput1").value = "없음";
				document.getElementById("itemListOptionOutput1").value = "없음";
			} else if ($("input:radio[id='tbodyoption12']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput1").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput1").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput1").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption13']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput1").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput1").value = ipryuk
				document.getElementById("itemListOptionOutput1").value = ipryuk
			}
			$("#itemListAddEditShow1").hide();
		} else if (i > 5 && i <= 8) {//수정버튼을 호출한 tr인덱스가 7~9번줄
			$("#itemListNameInput2").val($("#newMakeItemName3").val());
			$("#itemListNameOutput2").val($("#newMakeItemName3").val());
			if ($("input:radio[id='tbodyoption21']:checked").length == 1) {
				document.getElementById("itemListOptionInput2").value = "없음";
				document.getElementById("itemListOptionOutput2").value = "없음";
			} else if ($("input:radio[id='tbodyoption22']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput2").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput2").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput2").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption23']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput2").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput2").value = ipryuk
				document.getElementById("itemListOptionOutput2").value = ipryuk
			}
			$("#itemListAddEditShow2").hide();
		} else if (i > 8 && i <= 11) {//수정버튼을 호출한 tr인덱스가 10~12번줄
			$("#itemListNameInput3").val($("#newMakeItemName4").val());
			$("#itemListNameOutput3").val($("#newMakeItemName4").val());
			if ($("input:radio[id='tbodyoption31']:checked").length == 1) {
				document.getElementById("itemListOptionInput3").value = "없음";
				document.getElementById("itemListOptionOutput3").value = "없음";
			} else if ($("input:radio[id='tbodyoption32']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput3").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput3").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput3").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption33']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput3").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput3").value = ipryuk
				document.getElementById("itemListOptionOutput3").value = ipryuk
			}
			$("#itemListAddEditShow3").hide();
		} else if (i > 11 && i <= 14) {//수정버튼을 호출한 tr인덱스가 13~15번줄
			$("#itemListNameInput4").val($("#newMakeItemName5").val());
			$("#itemListNameOutput4").val($("#newMakeItemName5").val());
			if ($("input:radio[id='tbodyoption41']:checked").length == 1) {
				document.getElementById("itemListOptionInput4").value = "없음";
				document.getElementById("itemListOptionOutput4").value = "없음";
			} else if ($("input:radio[id='tbodyoption42']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput4").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput4").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput4").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption43']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput4").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput4").value = ipryuk
				document.getElementById("itemListOptionOutput4").value = ipryuk
			}
			$("#itemListAddEditShow4").hide();
		}
	}
	function ltemListAddEdit1() {
		var i = $("#itemListEditShow1").index();//tr의 index뽑아서 비교
		if (i <= 2) {//수정버튼을 호출한 tr인덱스가 1~3번줄
			$("#itemListNameInput0").val($("#newMakeItemName1").val());
			$("#itemListNameOutput0").val($("#newMakeItemName1").val());
			if ($("input:radio[id='tbodyoption01']:checked").length == 1) {
				document.getElementById("itemListOptionInput0").value = "없음";
				document.getElementById("itemListOptionOutput0").value = "없음";
			} else if ($("input:radio[id='tbodyoption02']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput0").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput0").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput0").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption03']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput0").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput0").value = ipryuk
				document.getElementById("itemListOptionOutput0").value = ipryuk
			}
			$("#itemListAddEditShow0").hide();
		} else if (i > 2 && i <= 5) {//수정버튼을 호출한 tr인덱스가 4~6번줄
			$("#itemListNameInput1").val($("#newMakeItemName2").val());
			$("#itemListNameOutput1").val($("#newMakeItemName2").val());
			if ($("input:radio[id='tbodyoption11']:checked").length == 1) {
				document.getElementById("itemListOptionInput1").value = "없음";
				document.getElementById("itemListOptionOutput1").value = "없음";
			} else if ($("input:radio[id='tbodyoption12']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput1").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput1").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput1").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption13']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput1").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput1").value = ipryuk
				document.getElementById("itemListOptionOutput1").value = ipryuk
			}
			$("#itemListAddEditShow1").hide();
		} else if (i > 5 && i <= 8) {//수정버튼을 호출한 tr인덱스가 7~9번줄
			$("#itemListNameInput2").val($("#newMakeItemName3").val());
			$("#itemListNameOutput2").val($("#newMakeItemName3").val());
			if ($("input:radio[id='tbodyoption21']:checked").length == 1) {
				document.getElementById("itemListOptionInput2").value = "없음";
				document.getElementById("itemListOptionOutput2").value = "없음";
			} else if ($("input:radio[id='tbodyoption22']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput2").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput2").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput2").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption23']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput2").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput2").value = ipryuk
				document.getElementById("itemListOptionOutput2").value = ipryuk
			}
			$("#itemListAddEditShow2").hide();
		} else if (i > 8 && i <= 11) {//수정버튼을 호출한 tr인덱스가 10~12번줄
			$("#itemListNameInput3").val($("#newMakeItemName4").val());
			$("#itemListNameOutput3").val($("#newMakeItemName4").val());
			if ($("input:radio[id='tbodyoption31']:checked").length == 1) {
				document.getElementById("itemListOptionInput3").value = "없음";
				document.getElementById("itemListOptionOutput3").value = "없음";
			} else if ($("input:radio[id='tbodyoption32']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput3").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput3").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput3").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption33']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput3").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput3").value = ipryuk
				document.getElementById("itemListOptionOutput3").value = ipryuk
			}
			$("#itemListAddEditShow3").hide();
		} else if (i > 11 && i <= 14) {//수정버튼을 호출한 tr인덱스가 13~15번줄
			$("#itemListNameInput4").val($("#newMakeItemName5").val());
			$("#itemListNameOutput4").val($("#newMakeItemName5").val());
			if ($("input:radio[id='tbodyoption41']:checked").length == 1) {
				document.getElementById("itemListOptionInput4").value = "없음";
				document.getElementById("itemListOptionOutput4").value = "없음";
			} else if ($("input:radio[id='tbodyoption42']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput4").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput4").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput4").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption43']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput4").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput4").value = ipryuk
				document.getElementById("itemListOptionOutput4").value = ipryuk
			}
			$("#itemListAddEditShow4").hide();
		}
	}
	function ltemListAddEdit2() {
		var i = $("#itemListEditShow2").index();//tr의 index뽑아서 비교
		if (i <= 2) {//수정버튼을 호출한 tr인덱스가 1~3번줄
			$("#itemListNameInput0").val($("#newMakeItemName1").val());
			$("#itemListNameOutput0").val($("#newMakeItemName1").val());
			if ($("input:radio[id='tbodyoption01']:checked").length == 1) {
				document.getElementById("itemListOptionInput0").value = "없음";
				document.getElementById("itemListOptionOutput0").value = "없음";
			} else if ($("input:radio[id='tbodyoption02']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput0").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput0").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput0").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption03']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput0").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput0").value = ipryuk
				document.getElementById("itemListOptionOutput0").value = ipryuk
			}
			$("#itemListAddEditShow0").hide();
		} else if (i > 2 && i <= 5) {//수정버튼을 호출한 tr인덱스가 4~6번줄
			$("#itemListNameInput1").val($("#newMakeItemName2").val());
			$("#itemListNameOutput1").val($("#newMakeItemName2").val());
			if ($("input:radio[id='tbodyoption11']:checked").length == 1) {
				document.getElementById("itemListOptionInput1").value = "없음";
				document.getElementById("itemListOptionOutput1").value = "없음";
			} else if ($("input:radio[id='tbodyoption12']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput1").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput1").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput1").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption13']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput1").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput1").value = ipryuk
				document.getElementById("itemListOptionOutput1").value = ipryuk
			}
			$("#itemListAddEditShow1").hide();
		} else if (i > 5 && i <= 8) {//수정버튼을 호출한 tr인덱스가 7~9번줄
			$("#itemListNameInput2").val($("#newMakeItemName3").val());
			$("#itemListNameOutput2").val($("#newMakeItemName3").val());
			if ($("input:radio[id='tbodyoption21']:checked").length == 1) {
				document.getElementById("itemListOptionInput2").value = "없음";
				document.getElementById("itemListOptionOutput2").value = "없음";
			} else if ($("input:radio[id='tbodyoption22']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput2").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput2").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput2").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption23']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput2").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput2").value = ipryuk
				document.getElementById("itemListOptionOutput2").value = ipryuk
			}
			$("#itemListAddEditShow2").hide();
		} else if (i > 8 && i <= 11) {//수정버튼을 호출한 tr인덱스가 10~12번줄
			$("#itemListNameInput3").val($("#newMakeItemName4").val());
			$("#itemListNameOutput3").val($("#newMakeItemName4").val());
			if ($("input:radio[id='tbodyoption31']:checked").length == 1) {
				document.getElementById("itemListOptionInput3").value = "없음";
				document.getElementById("itemListOptionOutput3").value = "없음";
			} else if ($("input:radio[id='tbodyoption32']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput3").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput3").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput3").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption33']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput3").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput3").value = ipryuk
				document.getElementById("itemListOptionOutput3").value = ipryuk
			}
			$("#itemListAddEditShow3").hide();
		} else if (i > 11 && i <= 14) {//수정버튼을 호출한 tr인덱스가 13~15번줄
			$("#itemListNameInput4").val($("#newMakeItemName5").val());
			$("#itemListNameOutput4").val($("#newMakeItemName5").val());
			if ($("input:radio[id='tbodyoption41']:checked").length == 1) {
				document.getElementById("itemListOptionInput4").value = "없음";
				document.getElementById("itemListOptionOutput4").value = "없음";
			} else if ($("input:radio[id='tbodyoption42']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput4").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput4").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput4").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption43']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput4").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput4").value = ipryuk
				document.getElementById("itemListOptionOutput4").value = ipryuk
			}
			$("#itemListAddEditShow4").hide();
		}
	}
	function ltemListAddEdit3() {
		var i = $("#itemListEditShow3").index();//tr의 index뽑아서 비교
		if (i <= 2) {//수정버튼을 호출한 tr인덱스가 1~3번줄
			$("#itemListNameInput0").val($("#newMakeItemName1").val());
			$("#itemListNameOutput0").val($("#newMakeItemName1").val());
			if ($("input:radio[id='tbodyoption01']:checked").length == 1) {
				document.getElementById("itemListOptionInput0").value = "없음";
				document.getElementById("itemListOptionOutput0").value = "없음";
			} else if ($("input:radio[id='tbodyoption02']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput0").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput0").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput0").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption03']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput0").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput0").value = ipryuk
				document.getElementById("itemListOptionOutput0").value = ipryuk
			}
			$("#itemListAddEditShow0").hide();
		} else if (i > 2 && i <= 5) {//수정버튼을 호출한 tr인덱스가 4~6번줄
			$("#itemListNameInput1").val($("#newMakeItemName2").val());
			$("#itemListNameOutput1").val($("#newMakeItemName2").val());
			if ($("input:radio[id='tbodyoption11']:checked").length == 1) {
				document.getElementById("itemListOptionInput1").value = "없음";
				document.getElementById("itemListOptionOutput1").value = "없음";
			} else if ($("input:radio[id='tbodyoption12']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput1").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput1").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput1").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption13']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput1").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput1").value = ipryuk
				document.getElementById("itemListOptionOutput1").value = ipryuk
			}
			$("#itemListAddEditShow1").hide();
		} else if (i > 5 && i <= 8) {//수정버튼을 호출한 tr인덱스가 7~9번줄
			$("#itemListNameInput2").val($("#newMakeItemName3").val());
			$("#itemListNameOutput2").val($("#newMakeItemName3").val());
			if ($("input:radio[id='tbodyoption21']:checked").length == 1) {
				document.getElementById("itemListOptionInput2").value = "없음";
				document.getElementById("itemListOptionOutput2").value = "없음";
			} else if ($("input:radio[id='tbodyoption22']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput2").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput2").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput2").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption23']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput2").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput2").value = ipryuk
				document.getElementById("itemListOptionOutput2").value = ipryuk
			}
			$("#itemListAddEditShow2").hide();
		} else if (i > 8 && i <= 11) {//수정버튼을 호출한 tr인덱스가 10~12번줄
			$("#itemListNameInput3").val($("#newMakeItemName4").val());
			$("#itemListNameOutput3").val($("#newMakeItemName4").val());
			if ($("input:radio[id='tbodyoption31']:checked").length == 1) {
				document.getElementById("itemListOptionInput3").value = "없음";
				document.getElementById("itemListOptionOutput3").value = "없음";
			} else if ($("input:radio[id='tbodyoption32']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput3").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput3").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput3").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption33']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput3").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput3").value = ipryuk
				document.getElementById("itemListOptionOutput3").value = ipryuk
			}
			$("#itemListAddEditShow3").hide();
		} else if (i > 11 && i <= 14) {//수정버튼을 호출한 tr인덱스가 13~15번줄
			$("#itemListNameInput4").val($("#newMakeItemName5").val());
			$("#itemListNameOutput4").val($("#newMakeItemName5").val());
			if ($("input:radio[id='tbodyoption41']:checked").length == 1) {
				document.getElementById("itemListOptionInput4").value = "없음";
				document.getElementById("itemListOptionOutput4").value = "없음";
			} else if ($("input:radio[id='tbodyoption42']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput4").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput4").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput4").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption43']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput4").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput4").value = ipryuk
				document.getElementById("itemListOptionOutput4").value = ipryuk
			}
			$("#itemListAddEditShow4").hide();
		}
	}
	function ltemListAddEdit4() {
		var i = $("#itemListEditShow4").index();//tr의 index뽑아서 비교
		if (i <= 2) {//수정버튼을 호출한 tr인덱스가 1~3번줄
			$("#itemListNameInput0").val($("#newMakeItemName1").val());
			$("#itemListNameOutput0").val($("#newMakeItemName1").val());
			if ($("input:radio[id='tbodyoption01']:checked").length == 1) {
				document.getElementById("itemListOptionInput0").value = "없음";
				document.getElementById("itemListOptionOutput0").value = "없음";
			} else if ($("input:radio[id='tbodyoption02']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput0").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput0").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput0").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption03']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput0").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput0").value = ipryuk
				document.getElementById("itemListOptionOutput0").value = ipryuk
			}
			$("#itemListAddEditShow0").hide();
		} else if (i > 2 && i <= 5) {//수정버튼을 호출한 tr인덱스가 4~6번줄
			$("#itemListNameInput1").val($("#newMakeItemName2").val());
			$("#itemListNameOutput1").val($("#newMakeItemName2").val());
			if ($("input:radio[id='tbodyoption11']:checked").length == 1) {
				document.getElementById("itemListOptionInput1").value = "없음";
				document.getElementById("itemListOptionOutput1").value = "없음";
			} else if ($("input:radio[id='tbodyoption12']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput1").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput1").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput1").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption03']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput1").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput1").value = ipryuk
				document.getElementById("itemListOptionOutput1").value = ipryuk
			}
			$("#itemListAddEditShow1").hide();
		} else if (i > 5 && i <= 8) {//수정버튼을 호출한 tr인덱스가 7~9번줄
			$("#itemListNameInput2").val($("#newMakeItemName3").val());
			$("#itemListNameOutput2").val($("#newMakeItemName3").val());
			if ($("input:radio[id='tbodyoption21']:checked").length == 1) {
				document.getElementById("itemListOptionInput2").value = "없음";
				document.getElementById("itemListOptionOutput2").value = "없음";
			} else if ($("input:radio[id='tbodyoption22']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput2").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput2").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput2").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption23']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput2").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput2").value = ipryuk
				document.getElementById("itemListOptionOutput2").value = ipryuk
			}
			$("#itemListAddEditShow2").hide();
		} else if (i > 8 && i <= 11) {//수정버튼을 호출한 tr인덱스가 10~12번줄
			$("#itemListNameInput3").val($("#newMakeItemName4").val());
			$("#itemListNameOutput3").val($("#newMakeItemName4").val());
			if ($("input:radio[id='tbodyoption31']:checked").length == 1) {
				document.getElementById("itemListOptionInput3").value = "없음";
				document.getElementById("itemListOptionOutput3").value = "없음";
			} else if ($("input:radio[id='tbodyoption32']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput3").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput3").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput3").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption33']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput3").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput3").value = ipryuk
				document.getElementById("itemListOptionOutput3").value = ipryuk
			}
			$("#itemListAddEditShow3").hide();
		} else if (i > 11 && i <= 14) {//수정버튼을 호출한 tr인덱스가 13~15번줄
			$("#itemListNameInput4").val($("#newMakeItemName5").val());
			$("#itemListNameOutput4").val($("#newMakeItemName5").val());
			if ($("input:radio[id='tbodyoption41']:checked").length == 1) {
				document.getElementById("itemListOptionInput4").value = "없음";
				document.getElementById("itemListOptionOutput4").value = "없음";
			} else if ($("input:radio[id='tbodyoption42']:checked").length == 1) {
				var select = "선택:";
				var change = $("#tbodyMultipleChoiceInput4").val();
				select = select.concat(change);
				document.getElementById("itemListOptionInput4").value = select
						.replace(/\n/gi, ",");
				document.getElementById("itemListOptionOutput4").value = select
						.replace(/\n/gi, ",");
			} else if ($("input:radio[id='tbodyoption43']:checked").length == 1) {
				var ipryuk = "입력:";
				var input = $("#tbodyJugwanSicInput4").val();
				ipryuk = ipryuk.concat(input);
				document.getElementById("itemListOptionInput4").value = ipryuk
				document.getElementById("itemListOptionOutput4").value = ipryuk
			}
			$("#itemListAddEditShow4").hide();
		}
	}
	//////////////////////////////모달 안에 아이템 리스트 한개씩 삭제하기 시작///////////////////////////////
	/*
	 * 이 부분도 펑션을 5개로 나누어 놓은 이유가 추가 삭제를 산발적으로 반복하다보면 tr이 한쌍이 남았는데 그게 3~4번인 경우도 있음.
	 애초에 tr이 삽입될때 delete edit 버튼안에 deleteshow의 아이디들이 다 다름. 그래서 그 버튼에서 호출하는 펑션도 다 다르게 설정했음.
	 index()는  해당 tr의 tbody안에서 행번호임.(0부터 시작.)
	 fist-child는 tr의 요소 번호. nth-child()는 괄호안의 번호를 넣으면 그게 요소번호임 ex nth-child(4) = forth-child랑 같음.
	 */
	function itemListAddDelete0() {
		var deleteConfirm = confirm("정말 삭제하시겠습니까?");
		if(deleteConfirm){
		var i = $("#itemListDeleteShow0").index();//tr의 index뽑아서 비교
		if (i <= 2) {//삭제버튼을 호출한 tr인덱스가 1~3번줄
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#giftConfigListTbody tr:first-child").remove();
		} else if (i > 2 && i <= 5) {//삭제버튼을 호출한 tr인덱스가 4~6번줄
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#giftConfigListTbody tr:nth-child(2)").remove();
		} else if (i > 5 && i <= 8) {//삭제버튼을 호출한 tr인덱스가 7~9번줄
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#giftConfigListTbody tr:nth-child(3)").remove();
		} else if (i > 8 && i <= 11) {//삭제버튼을 호출한 tr인덱스가 10~12번줄
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#giftConfigListTbody tr:nth-child(4)").remove();
		} else if (i > 11 && i <= 14) {//삭제버튼을 호출한 tr인덱스가 13~15번줄
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#giftConfigListTbody tr:nth-child(5)").remove();
		}
		}
	}
	function itemListAddDelete1() {
		var deleteConfirm = confirm("정말 삭제하시겠습니까?");
		if(deleteConfirm){
		var i = $("#itemListDeleteShow1").index();//tr의 index뽑아서 비교
		if (i <= 2) {//삭제버튼을 호출한 tr인덱스가 1~3번줄
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#giftConfigListTbody tr:first-child").remove();
		} else if (i > 2 && i <= 5) {//삭제버튼을 호출한 tr인덱스가 4~6번줄
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#giftConfigListTbody tr:nth-child(2)").remove();
		} else if (i > 5 && i <= 8) {//삭제버튼을 호출한 tr인덱스가 7~9번줄
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#giftConfigListTbody tr:nth-child(3)").remove();
		} else if (i > 8 && i <= 11) {//삭제버튼을 호출한 tr인덱스가 10~12번줄
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#giftConfigListTbody tr:nth-child(4)").remove();
		} else if (i > 11 && i <= 14) {//삭제버튼을 호출한 tr인덱스가 13~15번줄
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#giftConfigListTbody tr:nth-child(5)").remove();
		}
		}
	}
	function itemListAddDelete2() {
		var deleteConfirm = confirm("정말 삭제하시겠습니까?");
		if(deleteConfirm){
		var i = $("#itemListDeleteShow2").index();//tr의 index뽑아서 비교
		if (i <= 2) {//삭제버튼을 호출한 tr인덱스가 1~3번줄
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#giftConfigListTbody tr:first-child").remove();
		} else if (i > 2 && i <= 5) {//삭제버튼을 호출한 tr인덱스가 4~6번줄
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#giftConfigListTbody tr:nth-child(2)").remove();
		} else if (i > 5 && i <= 8) {//삭제버튼을 호출한 tr인덱스가 7~9번줄
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#giftConfigListTbody tr:nth-child(3)").remove();
		} else if (i > 8 && i <= 11) {//삭제버튼을 호출한 tr인덱스가 10~12번줄
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#giftConfigListTbody tr:nth-child(4)").remove();
		} else if (i > 11 && i <= 14) {//삭제버튼을 호출한 tr인덱스가 13~15번줄
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#giftConfigListTbody tr:nth-child(5)").remove();
		}
		}
	}
	function itemListAddDelete3() {
		var deleteConfirm = confirm("정말 삭제하시겠습니까?");
		if(deleteConfirm){
		var i = $("#itemListDeleteShow3").index();//tr의 index뽑아서 비교
		if (i <= 2) {//삭제버튼을 호출한 tr인덱스가 1~3번줄
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#giftConfigListTbody tr:first-child").remove();
		} else if (i > 2 && i <= 5) {//삭제버튼을 호출한 tr인덱스가 4~6번줄
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#giftConfigListTbody tr:nth-child(2)").remove();
		} else if (i > 5 && i <= 8) {//삭제버튼을 호출한 tr인덱스가 7~9번줄
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#giftConfigListTbody tr:nth-child(3)").remove();
		} else if (i > 8 && i <= 11) {//삭제버튼을 호출한 tr인덱스가 10~12번줄
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#giftConfigListTbody tr:nth-child(4)").remove();
		} else if (i > 11 && i <= 14) {//삭제버튼을 호출한 tr인덱스가 13~15번줄
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#giftConfigListTbody tr:nth-child(5)").remove();
		}
		}
	}
	function itemListAddDelete4() {
		var deleteConfirm = confirm("정말 삭제하시겠습니까?");
		if(deleteConfirm){
		var i = $("#itemListDeleteShow4").index();//tr의 index뽑아서 비교
		if (i <= 2) {//삭제버튼을 호출한 tr인덱스가 1~3번줄
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#itemListHeaderTbody tr:first-child").remove();
			$("#giftConfigListTbody tr:first-child").remove();
		} else if (i > 2 && i <= 5) {//삭제버튼을 호출한 tr인덱스가 4~6번줄
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#itemListHeaderTbody tr:nth-child(4)").remove();
			$("#giftConfigListTbody tr:nth-child(2)").remove();
		} else if (i > 5 && i <= 8) {//삭제버튼을 호출한 tr인덱스가 7~9번줄
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#itemListHeaderTbody tr:nth-child(7)").remove();
			$("#giftConfigListTbody tr:nth-child(3)").remove();
		} else if (i > 8 && i <= 11) {//삭제버튼을 호출한 tr인덱스가 10~12번줄
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#itemListHeaderTbody tr:nth-child(10)").remove();
			$("#giftConfigListTbody tr:nth-child(4)").remove();
		} else if (i > 11 && i <= 14) {//삭제버튼을 호출한 tr인덱스가 13~15번줄
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#itemListHeaderTbody tr:nth-child(13)").remove();
			$("#giftConfigListTbody tr:nth-child(5)").remove();
		}
		}
	}
	//////////////////////////////모달 안에 아이템 리스트 한개씩 삭제하기 끝///////////////////////////////
	//////////////////////////////아이템 추가할때 수정 확인 버튼 누르는거 5개/////////////////////////////
	/*
	 * 이것도 아이템 추가시 추가되는 div가 다 다르기때문에 라디오버튼도 구분해놓음. 그래서 펑션이 5개임.
	 */
	function itemListEditShow0() {
		$(function() {
			$("#itemAddShow").hide();
			$("#tbodyMultipleChoiceInput0").hide();
			$("#tbodyJugwanSicInput0").hide();
			$("#tbodyoption01").click(function() {
				if (($("#tbodyoption01").is(':checked'))) {
					$("#tbodyMultipleChoiceInput0").hide();
					$("#tbodyJugwanSicInput0").hide();
				} else if (($("#tbodyoption02").is(':checked'))) {
					$("#tbodyMultipleChoiceInput0").show();
					$("#tbodyJugwanSicInput0").hide();
				} else if (($("#tbodyoption03").is(':checked'))) {
					$("#tbodyJugwanSicInput0").show();
					$("#tbodyMultipleChoiceInput0").hide();
				}
			});
			$("#tbodyoption02").click(function() {
				if (($("#tbodyoption01").is(':checked'))) {
					$("#tbodyMultipleChoiceInput0").hide();
					$("#tbodyJugwanSicInput0").hide();
				} else if (($("#tbodyoption02").is(':checked'))) {
					$("#tbodyMultipleChoiceInput0").show();
					$("#tbodyJugwanSicInput0").hide();
				} else if (($("#tobodyoption03").is(':checked'))) {
					$("#tbodyJugwanSicInput0").show();
					$("#tbodyMultipleChoiceInput0").hide();
				}
			});
			$("#tbodyoption03").click(function() {
				if (($("#tbodyoption01").is(':checked'))) {
					$("#tbodyMultipleChoiceInput0").hide();
					$("#tbodyJugwanSicInput0").hide();
				} else if (($("#tbodyoption02").is(':checked'))) {
					$("#tbodyMultipleChoiceInput0").show();
					$("#tbodyJugwanSicInput0").hide();
				} else if (($("#tbodyoption03").is(':checked'))) {
					$("#tbodyJugwanSicInput0").show();
					$("#tbodyMultipleChoiceInput0").hide();
				}
			});
		});
		$("#itemListEditShow0").show();
		$("#itemListAddEditShow0").show();
		$("#itemListDeleteShow0").hide();
		$("#itemListEditShow1").hide();
		$("#itemListDeleteShow1").hide();
		$("#itemListEditShow2").hide();
		$("#itemListDeleteShow2").hide();
		$("#itemListEditShow3").hide();
		$("#itemListDeleteShow3").hide();
		$("#itemListEditShow4").hide();
		$("#itemListDeleteShow4").hide();
		$("#itemAdd").show();
	}
	function itemListDeleteShow0() {
		$("#itemListDeleteShow0").show();
		$("#itemListEditShow0").hide();
		$("#itemListEditShow1").hide();
		$("#itemListDeleteShow1").hide();
		$("#itemListEditShow2").hide();
		$("#itemListDeleteShow2").hide();
		$("#itemListEditShow3").hide();
		$("#itemListDeleteShow3").hide();
		$("#itemListEditShow4").hide();
		$("#itemListDeleteShow4").hide();
		$("#itemAddShow").hide();
		$("#itemAdd").show();
	}
	function itemListEditShow1() {
		$(function() {
			$("#itemAddShow").hide();
			$("#tbodyMultipleChoiceInput1").hide();
			$("#tbodyJugwanSicInput1").hide();
			$("#tbodyoption11").click(function() {
				if (($("#tbodyoption11").is(':checked'))) {
					$("#tbodyMultipleChoiceInput1").hide();
					$("#tbodyJugwanSicInput1").hide();
				} else if (($("#tbodyoption12").is(':checked'))) {
					$("#tbodyMultipleChoiceInput1").show();
					$("#tbodyJugwanSicInput1").hide();
				} else if (($("#tbodyoption13").is(':checked'))) {
					$("#tbodyJugwanSicInput1").show();
					$("#tbodyMultipleChoiceInput1").hide();
				}
			});
			$("#tbodyoption12").click(function() {
				if (($("#tbodyoption11").is(':checked'))) {
					$("#tbodyMultipleChoiceInput1").hide();
					$("#tbodyJugwanSicInput1").hide();
				} else if (($("#tbodyoption12").is(':checked'))) {
					$("#tbodyMultipleChoiceInput1").show();
					$("#tbodyJugwanSicInput1").hide();
				} else if (($("#tobodyoption13").is(':checked'))) {
					$("#tbodyJugwanSicInput1").show();
					$("#tbodyMultipleChoiceInput1").hide();
				}
			});
			$("#tbodyoption13").click(function() {
				if (($("#tbodyoption11").is(':checked'))) {
					$("#tbodyMultipleChoiceInput1").hide();
					$("#tbodyJugwanSicInput1").hide();
				} else if (($("#tbodyoption12").is(':checked'))) {
					$("#tbodyMultipleChoiceInput1").show();
					$("#tbodyJugwanSicInput1").hide();
				} else if (($("#tbodyoption13").is(':checked'))) {
					$("#tbodyJugwanSicInput1").show();
					$("#tbodyMultipleChoiceInput1").hide();
				}
			});
		});
		$("#itemListEditShow1").show();
		$("#itemListAddEditShow1").show();
		$("#itemListDeleteShow1").hide();
		$("#itemListEditShow0").hide();
		$("#itemListDeleteShow0").hide();
		$("#itemListEditShow2").hide();
		$("#itemListDeleteShow2").hide();
		$("#itemListEditShow3").hide();
		$("#itemListDeleteShow3").hide();
		$("#itemListEditShow4").hide();
		$("#itemListDeleteShow4").hide();
		$("#itemAdd").show();
	}
	function itemListDeleteShow1() {
		$("#itemListDeleteShow1").show();
		$("#itemListEditShow1").hide();
		$("#itemListEditShow0").hide();
		$("#itemListDeleteShow0").hide();
		$("#itemListEditShow2").hide();
		$("#itemListDeleteShow2").hide();
		$("#itemListEditShow3").hide();
		$("#itemListDeleteShow3").hide();
		$("#itemListEditShow4").hide();
		$("#itemListDeleteShow4").hide();
		$("#itemAddShow").hide();
		$("#itemAdd").show();
	}
	function itemListEditShow2() {
		$(function() {
			$("#itemAddShow").hide();
			$("#tbodyMultipleChoiceInput2").hide();
			$("#tbodyJugwanSicInput2").hide();
			$("#tbodyoption21").click(function() {
				if (($("#tbodyoption21").is(':checked'))) {
					$("#tbodyMultipleChoiceInput2").hide();
					$("#tbodyJugwanSicInput2").hide();
				} else if (($("#tbodyoption22").is(':checked'))) {
					$("#tbodyMultipleChoiceInput2").show();
					$("#tbodyJugwanSicInput2").hide();
				} else if (($("#tbodyoption23").is(':checked'))) {
					$("#tbodyJugwanSicInput2").show();
					$("#tbodyMultipleChoiceInput2").hide();
				}
			});
			$("#tbodyoption22").click(function() {
				if (($("#tbodyoption21").is(':checked'))) {
					$("#tbodyMultipleChoiceInput2").hide();
					$("#tbodyJugwanSicInput2").hide();
				} else if (($("#tbodyoption22").is(':checked'))) {
					$("#tbodyMultipleChoiceInput2").show();
					$("#tbodyJugwanSicInput2").hide();
				} else if (($("#tobodyoption23").is(':checked'))) {
					$("#tbodyJugwanSicInput2").show();
					$("#tbodyMultipleChoiceInput2").hide();
				}
			});
			$("#tbodyoption23").click(function() {
				if (($("#tbodyoption21").is(':checked'))) {
					$("#tbodyMultipleChoiceInput2").hide();
					$("#tbodyJugwanSicInput2").hide();
				} else if (($("#tbodyoption22").is(':checked'))) {
					$("#tbodyMultipleChoiceInput2").show();
					$("#tbodyJugwanSicInput2").hide();
				} else if (($("#tbodyoption23").is(':checked'))) {
					$("#tbodyJugwanSicInput2").show();
					$("#tbodyMultipleChoiceInput2").hide();
				}
			});
		});
		$("#itemListEditShow2").show();
		$("#itemListAddEditShow2").show();
		$("#itemListDeleteShow2").hide();
		$("#itemListEditShow0").hide();
		$("#itemListDeleteShow0").hide();
		$("#itemListEditShow1").hide();
		$("#itemListDeleteShow1").hide();
		$("#itemListEditShow3").hide();
		$("#itemListDeleteShow3").hide();
		$("#itemListEditShow4").hide();
		$("#itemListDeleteShow4").hide();
		$("#itemAdd").show();
	}
	function itemListDeleteShow2() {
		$("#itemListDeleteShow2").show();
		$("#itemListEditShow2").hide();
		$("#itemListEditShow0").hide();
		$("#itemListDeleteShow0").hide();
		$("#itemListEditShow1").hide();
		$("#itemListDeleteShow1").hide();
		$("#itemListEditShow3").hide();
		$("#itemListDeleteShow3").hide();
		$("#itemListEditShow4").hide();
		$("#itemListDeleteShow4").hide();
		$("#itemAddShow").hide();
		$("#itemAdd").show();
	}
	function itemListEditShow3() {
		$(function() {
			$("#itemAddShow").hide();
			$("#tbodyMultipleChoiceInput3").hide();
			$("#tbodyJugwanSicInput3").hide();
			$("#tbodyoption31").click(function() {
				if (($("#tbodyoption31").is(':checked'))) {
					$("#tbodyMultipleChoiceInput3").hide();
					$("#tbodyJugwanSicInput3").hide();
				} else if (($("#tbodyoption32").is(':checked'))) {
					$("#tbodyMultipleChoiceInput3").show();
					$("#tbodyJugwanSicInput3").hide();
				} else if (($("#tbodyoption33").is(':checked'))) {
					$("#tbodyJugwanSicInput3").show();
					$("#tbodyMultipleChoiceInput3").hide();
				}
			});
			$("#tbodyoption32").click(function() {
				if (($("#tbodyoption31").is(':checked'))) {
					$("#tbodyMultipleChoiceInput3").hide();
					$("#tbodyJugwanSicInput3").hide();
				} else if (($("#tbodyoption32").is(':checked'))) {
					$("#tbodyMultipleChoiceInput3").show();
					$("#tbodyJugwanSicInput3").hide();
				} else if (($("#tobodyoption33").is(':checked'))) {
					$("#tbodyJugwanSicInput3").show();
					$("#tbodyMultipleChoiceInput3").hide();
				}
			});
			$("#tbodyoption33").click(function() {
				if (($("#tbodyoption31").is(':checked'))) {
					$("#tbodyMultipleChoiceInput3").hide();
					$("#tbodyJugwanSicInput3").hide();
				} else if (($("#tbodyoption32").is(':checked'))) {
					$("#tbodyMultipleChoiceInput3").show();
					$("#tbodyJugwanSicInput3").hide();
				} else if (($("#tbodyoption33").is(':checked'))) {
					$("#tbodyJugwanSicInput3").show();
					$("#tbodyMultipleChoiceInput3").hide();
				}
			});
		});
		$("#itemListEditShow3").show();
		$("#itemListAddEditShow3").show();
		$("#itemListDeleteShow3").hide();
		$("#itemListEditShow0").hide();
		$("#itemListDeleteShow0").hide();
		$("#itemListEditShow1").hide();
		$("#itemListDeleteShow1").hide();
		$("#itemListEditShow2").hide();
		$("#itemListDeleteShow2").hide();
		$("#itemListEditShow4").hide();
		$("#itemListDeleteShow4").hide();
		$("#itemAdd").show();
	}
	function itemListDeleteShow3() {
		$("#itemListDeleteShow3").show();
		$("#itemListEditShow3").hide();
		$("#itemListEditShow1").hide();
		$("#itemListDeleteShow1").hide();
		$("#itemListEditShow2").hide();
		$("#itemListDeleteShow2").hide();
		$("#itemListEditShow0").hide();
		$("#itemListDeleteShow0").hide();
		$("#itemListEditShow4").hide();
		$("#itemListDeleteShow4").hide();
		$("#itemAddShow").hide();
		$("#itemAdd").show();
	}
	function itemListEditShow4() {
		$(function() {
			$("#itemAddShow").hide();
			$("#tbodyMultipleChoiceInput4").hide();
			$("#tbodyJugwanSicInput4").hide();
			$("#tbodyoption41").click(function() {
				if (($("#tbodyoption41").is(':checked'))) {
					$("#tbodyMultipleChoiceInput4").hide();
					$("#tbodyJugwanSicInput4").hide();
				} else if (($("#tbodyoption42").is(':checked'))) {
					$("#tbodyMultipleChoiceInput4").show();
					$("#tbodyJugwanSicInput4").hide();
				} else if (($("#tbodyoption43").is(':checked'))) {
					$("#tbodyJugwanSicInput4").show();
					$("#tbodyMultipleChoiceInput4").hide();
				}
			});
			$("#tbodyoption42").click(function() {
				if (($("#tbodyoption41").is(':checked'))) {
					$("#tbodyMultipleChoiceInput4").hide();
					$("#tbodyJugwanSicInput4").hide();
				} else if (($("#tbodyoption42").is(':checked'))) {
					$("#tbodyMultipleChoiceInput4").show();
					$("#tbodyJugwanSicInput4").hide();
				} else if (($("#tobodyoption43").is(':checked'))) {
					$("#tbodyJugwanSicInput4").show();
					$("#tbodyMultipleChoiceInput4").hide();
				}
			});
			$("#tbodyoption43").click(function() {
				if (($("#tbodyoption41").is(':checked'))) {
					$("#tbodyMultipleChoiceInput4").hide();
					$("#tbodyJugwanSicInput4").hide();
				} else if (($("#tbodyoption42").is(':checked'))) {
					$("#tbodyMultipleChoiceInput4").show();
					$("#tbodyJugwanSicInput4").hide();
				} else if (($("#tbodyoption43").is(':checked'))) {
					$("#tbodyJugwanSicInput4").show();
					$("#tbodyMultipleChoiceInput4").hide();
				}
			});
		});
		$("#itemListEditShow4").show();
		$("#itemListAddEditShow4").show();
		$("#itemListDeleteShow4").hide();
		$("#itemListEditShow1").hide();
		$("#itemListDeleteShow1").hide();
		$("#itemListEditShow2").hide();
		$("#itemListDeleteShow2").hide();
		$("#itemListEditShow3").hide();
		$("#itemListDeleteShow3").hide();
		$("#itemListEditShow0").hide();
		$("#itemListDeleteShow0").hide();
		$("#itemAdd").show();
	}
	function itemListDeleteShow4() {
		$("#itemListDeleteShow4").show();
		$("#itemListEditShow4").hide();
		$("#itemListEditShow1").hide();
		$("#itemListDeleteShow1").hide();
		$("#itemListEditShow2").hide();
		$("#itemListDeleteShow2").hide();
		$("#itemListEditShow3").hide();
		$("#itemListDeleteShow3").hide();
		$("#itemListEditShow0").hide();
		$("#itemListDeleteShow0").hide();
		$("#itemAddShow").hide();
		$("#itemAdd").show();
	}
	////////////////////////////////////아이템 수정 삭제 버튼 5개 끝//////////////////////////////////////
	////////////////////////////////////아이템 목록에서 수정하기 버튼에서 취소누르면 hide시켜줌/////////////
	function itemListAddEditShowHide() {
		$("#itemListEditShow").hide();
		$("#itemListEditShow0").hide();
		$("#itemListEditShow1").hide();
		$("#itemListEditShow2").hide();
		$("#itemListEditShow3").hide();
		$("#itemListEditShow4").hide();
	}
	/////////////////////////////////아이템 목록에 삭제하기 버튼에서 취소누르면 hide시켜줌//////////////////////////
	function itemListAddDeleteShowHide() {
		$("#itemListDeleteShow").hide();
		$("#itemListDeleteShow0").hide();
		$("#itemListDeleteShow1").hide();
		$("#itemListDeleteShow2").hide();
		$("#itemListDeleteShow3").hide();
		$("#itemListDeleteShow4").hide();
	}
	//////////////////////////////////모달 관련 끝/////////////////////////////////////////////////////

	///////////////////////////datepicker에 today 디폴트값으로 넣기//////////////////////
	////////////////////////결제종료일 7일 뒤 날짜 계산해서 넣어주는 코드.
	function paymentEndDate() {
		ReceiptEstimatedDate();
		var stDate = $("#datepicker").val();
		var split = stDate.split("-");
		var yy = Number(split[0]);
		var mm = Number(split[1]);
		var dd = Number(split[2]);
		if (mm <= 7) {//1~7월
			if (mm % 2 == 1) {//홀수달
				if (dd > 24) {//25일 ~
					dd = 7 - (31 - dd);
					mm = mm + 1;
				} else {
					dd = dd + 7;
				}
			} else {//짝수달
				if (mm == 2) {//2월인경우
					if (yy % 4 == 0) {//윤년인경우
						if (dd > 22) {
							dd = 7 - (29 - dd);
							mm = mm + 1;
						} else {
							dd = dd + 7;
						}
					} else {//일반 년도
						if (dd > 21) {
							dd = 7 - (28 - dd);
							mm = mm + 1;
						} else {
							dd = dd + 7;
						}
					}
				} else {//4,6월인경우
					if (dd > 24) {
						dd = 7 - (30 - dd);
						mm = mm + 1;
					} else {
						dd = dd + 7;
					}
				}
			}
		} else {//8~12월
			if (mm % 2 == 1) {//9,11월
				if (dd > 23) {
					dd = 8 - (31 - dd);
					mm = mm + 1;
				} else {
					dd = dd + 7;
				}
			} else {//8,10,12월 일 경우
				if (mm == 12) {//12월일경우
					if (dd > 24) {
						dd = 7 - (31 - dd);
						mm = 1;
					} else {
						dd = dd + 7;
					}
				} else {//8,10월일 경우
					if (dd > 24) {
						dd = 7 - (31 - dd);
						mm = mm + 1;
					} else {
						dd = dd + 7;
					}
				}//////////8,10월일경우 else 끝
			}//////////////8,10,12월일 경우 else 끝
		}//////////////////8~12월일 경우 else 끝
		var payEndDate = yy + "년" + mm + "월" + dd + "일";
		$("#prepayEndDate").html(payEndDate);
		$("#payEndDate").val($("#prepayEndDate").html());
	}
	///////////////위랑 비슷 다만 예상전달일을 결제종료일로부터 7일로 잡음. ///////////////////////////////
	///////////////이건근데 기간 꼭 안지키고 프로젝트 생성한 사람이 유동적으로 대처하면됨./////////////////////
	function ReceiptEstimatedDate() {
		var stDate = $("#datepicker").val();
		var split = stDate.split("-");
		var yy = Number(split[0]);
		var mm = Number(split[1]);
		var dd = Number(split[2]);
		if (mm <= 7) {//1~7월
			if (mm % 2 == 1) {//홀수달
				if (dd > 17) {//25일 ~
					dd = 14 - (31 - dd);
					mm = mm + 1;
				} else {
					dd = dd + 14;
				}
			} else {//짝수달
				if (mm == 2) {//2월인경우
					if (yy % 4 == 0) {//윤년인경우
						if (dd > 15) {
							dd = 14 - (29 - dd);
							mm = mm + 1;
						} else {
							dd = dd + 14;
						}
					} else {//일반 년도
						if (dd > 14) {
							dd = 14 - (28 - dd);
							mm = mm + 1;
						} else {
							dd = dd + 14;
						}
					}
				} else {//4,6월인경우
					if (dd > 17) {
						dd = 14 - (30 - dd);
						mm = mm + 1;
					} else {
						dd = dd + 14;
					}
				}
			}
		} else {//8~12월
			if (mm % 2 == 1) {//9,11월
				if (dd > 16) {
					dd = 15 - (31 - dd);
					mm = mm + 1;
				} else {
					dd = dd + 14;
				}
			} else {//8,10,12월 일 경우
				if (mm == 12) {//12월일경우
					if (dd > 17) {
						dd = 14 - (31 - dd);
						mm = 1;
					} else {
						dd = dd + 14;
					}
				} else {//8,10월일 경우
					if (dd > 17) {
						dd = 14 - (31 - dd);
						mm = mm + 1;
					} else {
						dd = dd + 14;
					}
				}//////////8,10월일경우 else 끝
			}//////////////8,10,12월일 경우 else 끝
		}//////////////////8~12월일 경우 else 끝
		var receiptEstimateDate = yy + "년" + mm + "월" + dd + "일";
		$("#prereceiptDate").html(receiptEstimateDate);
		$("#receiptDate").val($("#prereceiptDate").html());
	}
	///////////////=============================edit창 입력한것들 확인 눌렀을때  넘기는것 시작====================//////////////
	function goalMoneyRegistration() {
		if($("#goalMoneyInput").val()!=""){
		$("#pregoalMoneyOutput").html($("#goalMoneyInput").val());
		$("#goalMoneyOutput").val($("#pregoalMoneyOutput").html());
		$("#goalMoneyInputHide").hide();
		$("#goalMoneyEditHide").hide();
		$("#goalMoneyInputShow").show();
		$("#goalMoneyEditShow").show();
		$("#goalMoneyShow").hide();
		$("#goalMoney").show();
		changepro();
		}else{
			alert("목표금액을 입력해주세요.");
		}
	}
	function projectEndDateOutputShow() {
		if($("#datepicker").val()!=""){
		$("#preprojectEndDateOutput").html($("#datepicker").val());
		$("#projectEndDateOutput").val($("#preprojectEndDateOutput").html());
		paymentEndDate();
		$("#projectEndDateInputHide").hide();
		$("#projectEndDateEditHide").hide();
		$("#projectEndDateInputShow").show();
		$("#projectEndDateEditShow").show();
		$("#projectEndDateShow").hide();
		$("#projectEndDate").show();
		$("#moneyEstimatedDateShow").show();
		$("#moneyEstimatedDate").hide();
		changepro();
		}else{
			alert("프로젝트 마감일을 선택하세요.");
		}
	}

	//////////////////////////선물 추가////////////////////////////////////////////////
	var nonce = 0;
	function giftAdd() {
		var checkYesNo = 0;
		if($("#minDonationMoneyInput").val()!=""&&$("#giftTextAreaInput").val()!=""&&
				$("#deliveryDayInput").val()!=""){
			if($("#YesNoGroup0").length==1){//일단 객체가 존재하면, 존재하지 않으면 바꿔주면 안됨.
				if($("#YesNoGroup0").is(":checked")!=true){//체크가 
				}else if($("#YesNoGroup0").is(":checked")==true){
					if($("#itemQuantityOption0").val()>0){
						checkYesNo = 1;
					}else{
						checkYesNo = 0;
						alert("체크된 아이템의 수량을 확인해주세요.");
						return;
					}
				}
			}
			if($("#YesNoGroup1").length==1){
				if($("#YesNoGroup1").is(":checked")!=true){
				}else if($("#YesNoGroup1").is(":checked")==true){
					if($("#itemQuantityOption1").val()>0){
						checkYesNo = 1;
					}else{
						checkYesNo = 0;
						alert("체크된 아이템의 수량을 확인해주세요.");
						return;
					}
				}
			}
			if($("#YesNoGroup2").length==1){
				if($("#YesNoGroup2").is(":checked")!=true){
				}else if($("#YesNoGroup2").is(":checked")==true){
					if($("#itemQuantityOption2").val()>0){
						checkYesNo = 1;
					}else{
						checkYesNo = 0;
						alert("체크된 아이템의 수량을 확인해주세요.");
						return;
					}
				}
			}
			if($("#YesNoGroup3").length==1){
				if($("#YesNoGroup3").is(":checked")!=true){
				}else if($("#YesNoGroup3").is(":checked")==true){
					if($("#itemQuantityOption3").val()>0){
						checkYesNo = 1;
					}else{
						checkYesNo = 0;
						alert("체크된 아이템의 수량을 확인해주세요.");
						return;
					}
				}
			}
			if($("#YesNoGroup4").length==1){
				if($("#YesNoGroup4").is(":checked")!=true){
					checkYesNo = 0;
				}else if($("#YesNoGroup4").is(":checked")==true){
					if($("#itemQuantityOption4").val()>0){
						checkYesNo = 1;
					}else{
						checkYesNo = 0;
						alert("체크된 아이템의 수량을 확인해주세요.");
						return;
					}
				}
			}
			if($("#YesNoGroup0").length!=1&&$("#YesNoGroup1").length!=1&&$("#YesNoGroup2").length!=1
										  &&$("#YesNoGroup3").length!=1&&$("#YesNoGroup4").length!=1){
				checkYesNo = 0;
				alert("아이템을 1개이상 추가해주세요.");
			}//전부다 없으면, 즉 아이템이 하나라도 추가되지 않았으면 실행안되게.
			else{///////아이템이 일단 하나라도 있을때 위에 check 추가해서 넘어옴.
				if(checkYesNo==1){
		/////////////////////////////////아이템 포함 체크 여부에 따라 추가하기 눌렀을때 추가되는것 분류
		var giftTextAreaOutput = 'giftTextAreaOutput' + nonce;
		var minDonationMoneyOutput = 'minDonationMoneyOutput' + nonce;
		var deliveryDayOutput = 'deliveryDayOutput' + nonce;
		var limitedQuantityInput = 'limitedQuantityInput' + nonce;
		var giftUlList = 'giftUlList' + nonce;
		var choicePersonX = 'choicePersonX' + nonce;
		var remainQuantity = 'remainQuantity' + nonce;
		var giftInfo = $("#giftAddTable").html();
		giftInfo = giftInfo.replace(/minDonationMoneyOutput/gi,
				"minDonationMoneyOutput" + nonce);
		giftInfo = giftInfo.replace(/giftTextAreaOutput/gi,
				"giftTextAreaOutput" + nonce);
		giftInfo = giftInfo.replace(/deliveryDayOutput/gi, "deliveryDayOutput"
				+ nonce);
		giftInfo = giftInfo.replace(/limitedQuantityInput/gi,
				"limitedQuantityInput" + nonce);
		giftInfo = giftInfo.replace(/giftUlList/gi, "giftUlList" + nonce);
		giftInfo = giftInfo.replace(/choicePersonX/gi, "choicePersonX" + nonce);
		giftInfo = giftInfo.replace(/remainQuantity/gi, "remainQuantity"+ nonce);
		
		$("#giftAddOutputTable").append(giftInfo);
		if (limitedCheck.checked == true) {
			$('#' + remainQuantity).show();
			$('#' + choicePersonX).hide();
		} else {
			$('#' + remainQuantity).hide();
			$('#' + choicePersonX).show();
		}
		$("#giftConfiguration").hide();
		$("#giftAddButtonForm").show();
		if ($("#YesNoGroup0").length == 1 || $("#YesNoGroup1").length == 1
				|| $("#YesNoGroup2").length == 1
				|| $("#YesNoGroup3").length == 1
				|| $("#YesNoGroup4").length == 1) {
			if ($("#YesNoGroup0").length == 1) {
				if (YesNoGroup0.checked == true) {
					var a = $("#defaultGiftUlList").html();
					a = a.replace(/GiftUlListName/gi, "GiftUlListName0"+ nonce);
					a = a.replace(/GiftUlListQuantity/gi, "GiftUlListQuantity0"+ nonce);
					a = a.replace(/GiftUlListOption/gi,"GiftUlListOption0"+nonce);
					$('#' + giftUlList).append(a);
					document.getElementById("GiftUlListName0" + nonce).value = $("#itemListNameOutput0").val();
					document.getElementById("GiftUlListQuantity0" + nonce).value = $("#itemQuantityOption0").val();
					document.getElementById("GiftUlListOption0"+nonce).value = $("#itemListOptionOutput0").val();
				}
			}
			if ($("#YesNoGroup1").length == 1) {
				if (YesNoGroup1.checked == true) {
					var a = $("#defaultGiftUlList").html();
					a = a.replace(/GiftUlListName/gi, "GiftUlListName1"+ nonce);
					a = a.replace(/GiftUlListQuantity/gi, "GiftUlListQuantity1"+ nonce);
					a = a.replace(/GiftUlListOption/gi,"GiftUlListOption1"+nonce);
					$('#' + giftUlList).append(a);
					document.getElementById("GiftUlListName1" + nonce).value = $("#itemListNameOutput1").val();
					document.getElementById("GiftUlListQuantity1" + nonce).value = $("#itemQuantityOption1").val();
					document.getElementById("GiftUlListOption1"+nonce).value = $("#itemListOptionOutput1").val();
				}
			}
			if ($("#YesNoGroup2").length == 1) {
				if (YesNoGroup2.checked == true) {
					var a = $("#defaultGiftUlList").html();
					a = a.replace(/GiftUlListName/gi, "GiftUlListName2"+ nonce);
					a = a.replace(/GiftUlListQuantity/gi, "GiftUlListQuantity2"+ nonce);
					a = a.replace(/GiftUlListOption/gi,"GiftUlListOption2"+nonce);
					$('#' + giftUlList).append(a);
					document.getElementById("GiftUlListName2" + nonce).value = $("#itemListNameOutput2").val();
					document.getElementById("GiftUlListQuantity2" + nonce).value = $("#itemQuantityOption2").val();
					document.getElementById("GiftUlListOption2"+nonce).value = $("#itemListOptionOutput2").val();
				}
			}
			if ($("#YesNoGroup3").length == 1) {
				if (YesNoGroup3.checked == true) {
					var a = $("#defaultGiftUlList").html();
					a = a.replace(/GiftUlListName/gi, "GiftUlListName3"+ nonce);
					a = a.replace(/GiftUlListQuantity/gi, "GiftUlListQuantity3"+ nonce);
					a = a.replace(/GiftUlListOption/gi,"GiftUlListOption3"+nonce);
					$('#' + giftUlList).append(a);
					document.getElementById("GiftUlListName3" + nonce).value = $("#itemListNameOutput3").val();
					document.getElementById("GiftUlListQuantity3" + nonce).value = $("#itemQuantityOption3").val();
					document.getElementById("GiftUlListOption3"+nonce).value = $("#itemListOptionOutput3").val();
				}
			}
			if ($("#YesNoGroup4").length == 1) {
				if (YesNoGroup4.checked == true) {
					var a = $("#defaultGiftUlList").html();
					a = a.replace(/GiftUlListName/gi, "GiftUlListName4"+ nonce);
					a = a.replace(/GiftUlListQuantity/gi, "GiftUlListQuantity4"+ nonce);
					a = a.replace(/GiftUlListOption/gi,"GiftUlListOption4"+nonce);
					$('#' + giftUlList).append(a);
					document.getElementById("GiftUlListName4" + nonce).value = $("#itemListNameOutput4").val();
					document.getElementById("GiftUlListQuantity4" + nonce).value = $("#itemQuantityOption4").val();
					document.getElementById("GiftUlListOption4"+nonce).value = $("#itemListOptionOutput4").val();
				}
			}
		}
		//////////////////////////저장 후 입력했던것들 초기화///////////////////////////
		if ($("#itemQuantityOption0").length == 1) {
			document.getElementById("itemQuantityOption0").value = 0;
		}
		if ($("#itemQuantityOption1").length == 1) {
			document.getElementById("itemQuantityOption1").value = 0;
		}
		if ($("#itemQuantityOption2").length == 1) {
			document.getElementById("itemQuantityOption2").value = 0;
		}
		if ($("#itemQuantityOption3").length == 1) {
			document.getElementById("itemQuantityOption3").value = 0;
		}
		if ($("#itemQuantityOption4").length == 1) {
			document.getElementById("itemQuantityOption4").value = 0;
		}
		if($("#YesNoGroup0").length>0){
			$("input:checkbox[name='YesNoGroup0']").prop('checked',false);
		}
		if($("#YesNoGroup1").length>0){
			$("input:checkbox[name='YesNoGroup1']").prop('checked',false);
		}
		if($("#YesNoGroup2").length>0){
			$("input:checkbox[name='YesNoGroup2']").prop('checked',false);
		}
		if($("#YesNoGroup3").length>0){
			$("input:checkbox[name='YesNoGroup3']").prop('checked',false);
		}
		if($("#YesNoGroup4").length>0){
			$("input:checkbox[name='YesNoGroup4']").prop('checked',false);
		}
		$("input:checkbox[id='limitedCheck']").prop('checked', false);
		$("input:text[id='limitedQuantity']").prop('disabled', true);
		//////////////////////////저장 후 입력했던것들 초기화 끝///////////////////////////

		$('#' + minDonationMoneyOutput).val($("#minDonationMoneyInput").val());
		$('#' + giftTextAreaOutput).val($("#giftTextAreaInput").val());
		$('#' + deliveryDayOutput).val($("#deliveryDayInput").val());
		$('#' + limitedQuantityInput).val($("#limitedQuantity").val());
		$("#giftAddInfo").show();
		//////////////////////////저장 후 입력했던것들 초기화 시작///////////////////////////
		document.getElementById("minDonationMoneyInput").value = null;
		document.getElementById("giftTextAreaInput").value = null;
		document.getElementById("deliveryDayInput").value = null;
		document.getElementById("limitedQuantity").value = null;
		nonce++;
			}//checked==1일때, 즉 아이템이 하나라도  있으면서 그 아이템에 제대로 체크와 수량이 되있는 경우.
			else if(checkYesNo==0&&($("#YesNoGroup0").length==1||$("#YesNoGroup1").length==1||$("#YesNoGroup2").length==1
					  ||$("#YesNoGroup3").length==1||$("#YesNoGroup4").length==1)){//아이템이 있지만 checkYesNo상태가 0인것. 
				alert("만드신 아이템 중 한 개 이상 선택하셔서 구성해주세요.");
				checkYesNo = 0;
			}
		}//////일단 아이템만 있을때
	}else{//최소후원금액, 물품전달일, 환불교환정책 각각입력안됐을때
		if($("#minDonationMoneyInput").val()==""||$("#giftTextAreaInput").val()==""||
				$("#deliveryDayInput").val()==""){
			if($("#minDonationMoneyInput").val()==""){
				alert("최소후원금액을 입력해주세요");
			}else if($("#giftTextAreaInput").val()==""){
				alert("선물 설명을 입력해주세요.");
			}else if($("#deliveryDayInput").val()==""){
				alert("예상 전달일을 입력해주세요");
			}
		}//아래 else문 안에있는 if문 종료
	}/////////////////////최소후원금액, 예상전달일, 환불및교환정책 else문 종료
}/////////////////////////function 종료
	/////////////////////////선물 추가 끝/////////////////////////////////

	function refundAndExchangesAdd() {
		$("#refundAndExchangeOutputDefault").hide();
		document.getElementById("refundAndExchangeSpan").value = $(
				"#refundTextArea").val();
		$("#refundAndExchangesShow").hide();
		$("#refundAndExchanges").show();
		$("#refundAndExchangeOutput").show();
		changepro();
	}
	function refundAndExchangeOutputEdit() {
		$("#refundAndExchangeOutput").hide();
		$("#refundAndExchangesShow").show();
	}
	///////////////=============================edit창 입력한것들 디폴트input안으로 넘기는것 끝====================//////////////
	/////////////////////////////////////////////////////////////////
   function next_pagepro() {//페이지 하단 다음버튼
         changepro();
         $("#tab2").removeClass("active");
         $("#tab3").attr('class', 'active');
      
   }
   function pre_pagepro() {//페이지 하단 이전 버튼
         changepro();
         $("#tab2").removeClass("active");
         $("#tab1").attr('class', 'active');
      
   }
   ////////////////////////////////////////////////
   function changepro() {
      if ($("#goalMoneyOutput").val() == ""||$("#prjectEndDateOutput").val() == ""
         || $("#payEndDate").val() == ""|| $("#receiptDate").val() == ""
         || $("#refundAndExchangeSpan").val() == "") {
         $("#check_tab2").html(
               '<img id="check_tab2" src="../FTBC_Images/check1.png">');
      } else {
         $("#check_tab2").html(
               '<img id="check_tab2" src="../FTBC_Images/check.png">');

      }
   }
   
	function composition_check_count(){
		var composition_all_form = document.Project_Composition;
		if(composition_all_form.goalMoneyOutput.value==""){
			check = check+",목표 금액";
		}
		if(composition_all_form.projectEndDateOutput.value==""){
			check = check+",프로젝트 마감일";
		}
		if(composition_all_form.refundAndExchangeSpan.value==""){
			check = check+",환불 및 교환정책";
		}
		if(check!="check"){
			$("#check_tab1").html('<img id="check_tab1" src="../FTBC_Images/check1.png">');
		}else{
			$("#check_tab1").html('<img id="check_tab1" src="../FTBC_Images/check.png">');
		}
	}
	////////////////////////////////////////////////
</script>
</head>

<body>
	<!-- =====================================폼의 시작============================================ -->
	<form id="Project_Composition" name="Project_Composition"
		onSubmit="return false" class="create_form">
		<!-- 펀딩하기했을때 뿌려주는 화면에서 선물 포함 여부 -->
		<input id="gift_isinclude" name="gift_isinclude" value="1" type="hidden">
		<input id="goalMoneyOutput" name="goalMoneyOutput" type="hidden">
		<input id="projectEndDateOutput" name="projectEndDateOutput" type="hidden">
		<input id="payEndDate" name="payEndDate" type="hidden" >
		<input id="receiptDate" name="receiptDate" type="hidden" >
		<!-- ========================펀딩 및 선물 구성 프론트 시작 ======================-->
		<!-- =========================목표금액 디폴트 화면 시작=========================== -->
		<p>펀딩 목표 설정</p>
		<div id="fundGoalSet">
			<table>
				<tr>
					<td>
						<div id="goalMoney" onclick="goalMoneyShow()">
							<div class="row">
								<div class="col-xs-10">
									<label>&nbsp; 목표금액</label>
								</div>
							</div>
							<div class="row">
								<div id="goalMoneyInputHide" class="col-xs-10">
									<div>
										<i class="glyphicon glyphicon-hand-right"></i><label>&nbsp;
											목표 금액을 입력해주세요</label>
									</div>
								</div>
								<div id="goalMoneyInputShow" class="col-xs-10">
									<div>
										<i class="glyphicon glyphicon-hand-right"></i>
										<label id="pregoalMoneyOutput"></label>
										<label>&nbsp;원</label>
									</div>
								</div>
								<div id="goalMoneyEditHide" class="col-xs-2">
									<div>
										<i class="glyphicon glyphicon-edit"></i><label>&nbsp;
											입력하기</label>
									</div>
								</div>
								<div id="goalMoneyEditShow" class="col-xs-2">
									<div>
										<i class="glyphicon glyphicon-edit"></i><label>&nbsp;
											수정하기</label>
									</div>
								</div>
							</div>
						</div> <!-- ============================목표금액 디폴트 화면 끝=========================== -->
						<!-- ===============================목표금액 쇼폼 시작=================================== -->
						<div id="goalMoneyShow">
							<div class="row">
								<label id="goalMoneyShowMoney">&nbsp;목표금액</label>
							</div>
							<div class="row">
								<div id="goalMoneyGuideTalk" class="col-xs-7">이번 프로젝트를 통해
									모으고자 하는 펀딩 목표 금액이 얼마인가요? 마감일 자정까지 목표 금액을 100% 이상 달성하셔야만 모인 후원금이
									결제 됩니다. 막판에 후원을 취소하는 후원자들도 있는 점을 감안해 10% 이상 초과 달성을 목표로 하시는게
									안전합니다. (목표 금액은 제작비, 선물 배송비, 창작자의 인건비, 예비 비용 등을 고려하시기 바랍니다.)</div>
							</div>
							<div id="goalMoneyInputMoney" class="row">
								<input type="text" class="chundanwigubun" name="goalMoneyInput"
									id="goalMoneyInput"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
								<label>원</label>
							</div>
							<div id="commissionCalculation">
								<div class="row">
									<div class="col-xs-9">
										<div class="glyphicon glyphicon-question-sign"></div>
										&nbsp;&nbsp;<b>수수료를 제외하면 얼마를 받을 수 있나요?</b>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-10">
										<b>예시)</b> 100,000,000원의 금액을 모으는데 성공하실 경우 <b>대략 91,200,000
											원 정도</b>를 받게 됩니다. 총 모금액에서 대략적으로 아래와 같은 금액이 공제됩니다.
									</div>
								</div>
								<div class="row">
									<div class="col-xs-6">
										<table>
											<thead>
												<tr>
													<th>항목</th>
													<th>금액</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>결제대행 수수료(3% + VAT)</td>
													<td>3,300,000원</td>
												</tr>
												<tr>
													<td>플랫폼 수수료(5% + VAT)</td>
													<td>5,500,000원</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<th><b>공제액 합계</b><sup>1</sup></th>
													<th><b>8,800,000원</b><sup>2</sup></th>
												</tr>
											</tfoot>
										</table>
									</div>
									<div class="col-xs-6">
										<ol>
											<li>예상 공제액으로, 실제와는 약간의 차이가 있을 수 있습니다.</li>
											<li>목표 금액을 초과하더라도 수수료는 동일한 비율로 발생하며, 모든 수수료는 비용으로 처리하실 수
												있도록 세금계산서를 발행해드립니다.</li>
										</ol>
									</div>
								</div>
							</div>
							<div id="goalPriceButton">
								<button id="goalPriceCancelButton" onclick="goalMoneyShowHide()"
									type="button" class="btn btn-default btn-lg">
									<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
								</button>
								<button id="goalPriceConfirmButton"
									onclick="goalMoneyRegistration()" type="button"
									class="btn btn-default btn-lg">
									<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
								</button>
							</div>
						</div>
					</td>
				</tr>
				<!-- ===============================목표금액 쇼폼  끝=================================== -->
				<!-- ===============================프로젝트 마감일 디폴트 폼  시작=================================== -->
				<tr>
					<td>
						<div id="projectEndDate" onclick="projectEndDateShow()">
							<div class="row">
								<div class="col-xs-10">
									<label>&nbsp; 프로젝트 마감일</label>
								</div>
							</div>
							<div class="row">
								<div id="projectEndDateInputHide" class="col-xs-10">
									<div>
										<i class="glyphicon glyphicon-hand-right"></i><label>&nbsp;
											프로젝트 마감일을 입력해주세요</label>
									</div>
								</div>
								<div id="projectEndDateInputShow" class="col-xs-10">
									<div>
									<i class="glyphicon glyphicon-hand-right"></i>
										<label id="preprojectEndDateOutput"></label>
									</div>
								</div>
								<div id="projectEndDateEditHide" class="col-xs-2">
									<div>
										<i class="glyphicon glyphicon-edit"></i><label>&nbsp;
											입력하기</label>
									</div>
								</div>
								<div id="projectEndDateEditShow" class="col-xs-2">
									<div>
										<i class="glyphicon glyphicon-edit"></i><label>&nbsp;
											수정하기</label>
									</div>
								</div>
							</div>
						</div> <!-- ===============================프로젝트 마감일 디폴트 폼  끝=================================== -->
						<!-- ===================================프로젝트 마감일  쇼폼 시작=================================== -->
						<div id="projectEndDateShow">
							<div class="row">
								<label id="projectEndDateLabel">&nbsp; 프로젝트 마감일</label>
							</div>
							<div class="row">
								<div class="col-xs-7">펀딩이 끝나는 마감일을 정해주세요.</div>
							</div>
							<div id="endDateConfirmGuide">
								<div class="row">
									<div class="col-xs-6">
										<div>
											<b>마감일을 정할 때 주의할 점</b>
										</div>
									</div>
								</div>
								<div>펀딩 마감일은 오늘로부터 60일 이내의 날짜중에 고르실 수 있습니다. 이미 선물을 만드셨다면,
									선물 실행일 중에 마감일보다 이른 날짜가 있지는 않은지 꼭 확인해주세요.</div>
							</div>
							<div id="datepickerRow" class="row">
								<div class="cols-xs-8">
									<input type="text" class="chundanwigubun" id="datepicker"
										name="datepicker" onclick="paymentEndDate()" placeholder="날짜를 선택하세요.">
									<script>
										$("#datepicker").value = $(
												"#datepicker").datepicker({
											dateFormat : 'yy-mm-dd',
											minDate : 0,
											maxDate : 60
										});
									</script>
									<label>에 펀딩을 마감합니다.</label>
								</div>
							</div>
							<div id="projectEndDateButton">
								<button id="projectEndDateCancelButton"
									onclick="projectEndDateShowHide()" type="button"
									class="btn btn-default btn-lg">
									<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
								</button>
								<button id="projectEndDateConfirmButton"
									onclick="projectEndDateOutputShow()" type="button"
									class="btn btn-default btn-lg">
									<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
								</button>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- ===================================프로젝트 마감일  쇼폼 끝=================================== -->
		<!-- ===================================예상정산일 디폴트 폼 시작=================================== -->
		<p>예상 정산일</p>
		<div id="estimatedSettlementDate">
			<table>
				<tr>
					<td>
						<div id="moneyEstimatedDate">
							<div class="row">
								<div class="col-xs-10">
									<label>&nbsp; 예상 정산일</label>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-10">
									<div>
										<label>&nbsp; 마감일을 입력하시면 예상 정산일을 안내드립니다.</label>
									</div>
								</div>
							</div>
						</div> <!-- ===================================예상정산일 디폴트 폼 끝=================================== -->
						<!-- ==================================예상 정산일 쇼폼 시작 ====================================-->
						<div id="moneyEstimatedDateShow">
							<div class="row">
								<div class="col-xs-9">
									<ul>
										<li><b>&nbsp; 결제 종료일:</b>펀딩에 성공할 경우 마감일 다음날부터 7일간 결제가
											진행되어,<label id="prepayEndDate"></label>&nbsp;모든 후원자의 결제가 종료됩니다.</li>
										<li><b>&nbsp; 예상 정산일:</b>결제 종료일로부터 7일 이후인 
										<label id="prereceiptDate"></label>&nbsp;(공휴일인 경우 바로 다음 영업일)에 창작자님의
											계좌로 입금됩니다.</li>
									</ul>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<!-- ===================================예상 정산일 쇼폼 끝 ====================================-->
			</table>
		</div>
		<p>선물 구성</p>
		<!-- ===============================선물구성 추가하기 쇼폼 시작=================================== -->
		<div id="giftConfiguration">
			<table id="giftConfigurationTable">
				<tr>
					<td>
						<div id="giftConfigShow">
							<div class="row">
								<b><label>&nbsp;선물 추가하기</label></b>
							</div>
							<div class="row">
								<div class="col-xs-8">후원자 분들에게 드릴 선물 내용을 입력해주세요.</div>
							</div>
							<div>
								<hr>
							</div>
							<div class="row">
								<label>&nbsp;최소 후원금액</label>
							</div>
							<div class="row">
								<div class="col-xs-12">
									인기 금액대인 1만원대 선물부터 특별한 의미를 담은 10만원 이상 선물까지, 다양한 금액대로 구성하면 성공률이
									더욱 높아집니다. 배송이 필요한 선물의 경우 <b>배송비 포함</b>된 금액으로 작성해주세요.
								</div>
							</div>
							<div class="row">
								<div class="col-xs-10">
									<input id="minDonationMoneyInput" name="minDonationMoney"
										type="text" class="chundanwigubun"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">&nbsp;원
									이상 밀어주시는 분께 드리는 선물입니다.
								</div>
							</div>
							<hr>
							<div class="row">
								<label>&nbsp;선물에 포함된 아이템 </label>
							</div>
							<div class="row">
								<div class="col-xs-12">
									아이템은 <b>선물에 포함되는 구성 품목</b>을 말합니다. 이 금액대의 선물을 선택한 후원자에게 어떤 아이템들을
									얼마나 전달하실건가요?
								</div>
							</div>
							<table id="giftConfigList">
								<thead>
									<tr>
										<th style="width: 60px; border: 1px solid #c5c5c5;">포함</th>
										<th style="width: 400px; border: 1px solid #c5c5c5;">아이템</th>
										<th style="width: 400px; border: 1px solid #c5c5c5;">옵션</th>
										<th style="width: 100px; border: 1px solid #c5c5c5;">수량</th>
									</tr>
								</thead>
								<tbody id="giftConfigListTbody">
									<!-- ===============이 로우가 계속 생성되어야함. 시작 -->
									<tr id="removedTr">
										<td style="text-align: center"><input type="checkbox"
											id="noYesNoGroup" name="noYesNoGroup" disabled></td>
										<td colspan="2"><input style="width:100%; background:none; border:none; text-align:center" type="text" id="noitemListNameOutput" name="noitemListNameOutput" value="아이템을 만들어주세요." disabled></td>
										<td style="text-align: center;"> <input type="text" id="noitemQuantityOption"
											name="noitemQuantityOption" value="0" style="width:100%; background:none;border:none; text-align: center;" disabled></td>
									</tr>
									<!-- ===============이 로우가 계속 생성되어야함. 끝 -->
								</tbody>
							</table>
							<!-- ==============선물 아이템 관리하기 표현식 들어가야함=================== -->
							<div id="itemAdmin" class="row">
								<button type="button" data-toggle="modal" data-target="#itemAdminModal">
									<i class="glyphicon glyphicon-th-list"></i>&nbsp;아이템 만들기
								</button>
							</div>
							<!-- ==============선물 아이템 관리하기 모달 쇼폼 시작====================== -->
							<div class="modal fade" id="itemAdminModal" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content"
										style="right: 20%; width: 850px; height: auto;">
										<div class="modal-header">
											<h2>
												<b>아이템 관리하기</b>
											</h2>
										</div>
										<div class="modal-body">
											<div class="row">
												<label>아이템 만들기</label>
											</div>
											<!-- ========================================== -->
											<div id="itemAdd" onClick="itemAddShow()">
												<div class="row">
													<div id="itemAddRow1" class="col-xs-12">
														<h4>
															<label>아이템 추가하기</label>
														</h4>
													</div>
												</div>
												<div class="row">
													<div id="itemAddRow2" class="col-xs-12">
														<div>
															<label>선물 구성에 추가할 아이템을 만듭니다.</label>
														</div>
													</div>
												</div>
												<div class="row">
													<div id="itemAddRowInputButton">
														<button type="BUTTON" onclick="itemAddShow()">
															<i class="glyphicon glyphicon-plus-sign"></i>&nbsp;<b>추가하기</b>
														</button>
													</div>
												</div>
											</div>
											<!-- ========================================== -->
											<div id="itemAddShow">
												<div class="row">
													<label>아이템 이름</label>
												</div>
												<div class="row">
													<input id="newMakeItemName0" name="newMakeItemName0"
														type="text" class="ilbanText"
														placeholder="새로 만들 아이템의 이름을 입력하세요.">
												</div>
												<div class="row">
													<label><strong>옵션 조건</strong></label>
													<div>
														<label><input type="radio" id="option1"
															name="group" checked>&nbsp; 옵션이 필요없는 아이템입니다.</label>
													</div>
													<div id="multipleChoiceOption">
														<div>
															<label><input type="radio" id="option2"
																name="group">&nbsp; 객관식 옵션이 필요한 아이템입니다.(사이즈,색상
																등)</label>
														</div>
														<div>
															<textarea name="multipleChoiceInput"
																id="multipleChoiceInput"
																placeholder="옵션 항목을 입력해주세요.
옵션 항목은 줄바꿈으로 구분됩니다.
예시)블랙-230mm
화이트-240mm"
																rows="4"></textarea>
														</div>
														<div></div>
													</div>
													<div id="jugwansicOption">
														<div>
															<label><input type="radio" id="option3"
																name="group">&nbsp; 주관식 옵션이 필요한 아이템입니다.(각인,메시지
																등)</label>
														</div>
														<div>
															<textarea name="jugwanSicInput" id="jugwanSicInput"
																placeholder="후원자에게 안내할 메시지를 작성해 주세요.
예시) 사이즈, 메시지 순으로 작성해 주세요."
																rows="2"></textarea>
														</div>
													</div>
													<div id="itemAddButton">
														<button id="itemAddCancelButton"
															onclick="itemConfigShowHide()" type="button"
															class="btn btn-default btn-lg">
															<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
														</button>
														<button id="itemAddConfirmButton"
															onclick="itemAddConfirm()" type="button"
															class="btn btn-default btn-lg">
															<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
														</button>
													</div>
												</div>
											</div>
											<div id="itemList">
												<div class="row">
													<label>아이템 목록</label>
												</div>
												<div class="row" style="margin-left: 5px">아이템은 총 5개까지
													추가가 가능합니다.</div>
												<table id="itemListHeader">
													<thead>
														<tr>
															<th style="width: 300px; border: 1px solid #c5c5c5;">이름</th>
															<th style="width: 300px; border: 1px solid #c5c5c5;">옵션</th>
															<th style="width: 190px; border: 1px solid #c5c5c5;">편집</th>
														</tr>
													</thead>
													<tbody id="itemListHeaderTbody">
														<tr id=removedTr2>
															<td colspan="3"> <input style="width:100%;border:none;background-color:none;text-align:center" type="text" value="아이템을 추가해주세요."></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="modal-footer">
											<button id="modalFooterCloseButton" type="button"
												class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
<!-- 							<script>
							$("#itemAdminModal").dialog(
									{
									    autoOpen: false, 
									    modal: true, 
									    open: function() {
									        $('.ui-widget-overlay').addClass('custom-overlay');
									    }          
									});
							</script> -->
							<!-- ==============선물 아이템 관리하기 모달 쇼폼 끝====================== -->
							<br> <br>
							<hr>
							<div class="row">
								<label>선물 설명 </label>
							</div>
							<div class="row">
								<div class="col-xs-7">구성된 선물에 대해 추가적으로 알리고 싶은 내용을 적어주세요.</div>
							</div>
							<div class="row">
								<div class="col-xs-10">
									<textarea id="giftTextAreaInput"
										placeholder="예) 배송비 포함, 얼리버드,<선물 세트 A>등"></textarea>
								</div>
							</div>
							<hr>
							<div class="row">
								<label>예상 전달일</label>
							</div>
							<div class="row">
								<div class="col-xs-12">
									이 선물을 선택한 후원자들에게 선물을 배송 또는 공개하기로 약속하는 날입니다.<b>결제 종료일 이후의 날짜</b>인지
									확인해서 정해주세요.
								</div>
							</div>
							<div class="row">
								<div class="col-xs-10">
									<input type="text" class="ilbanText" id="deliveryDayInput"
										name="deliveryDayInput">
									<script>
										$("#deliveryDayInput").value = $("#deliveryDayInput").datepicker({
																								dateFormat : 'yy-mm-dd',
																								minDate : 8,
																								maxDate : 88
																								});
									</script>
								</div>
							</div>
							<hr>
							<div id="giftControl">
								<div class="row">
									<label>선물 설정</label>
								</div>
								<div class="row">
									<div class="col-xs-12">한정판 선물을 선택할 수 있는 인원을 제한해주세요. 배송이
										필요한 선물인 경우 후원자에게 주소지를 요청합니다.</div>
								</div>
								<div id="limitedAndDeliveryCheck" class="row">
									<div class="col-xs-5">
										<label><input id="limitedCheck" name="limitedCheck"
											type="checkbox" onClick="checkLimted()">선물을 <input
											type="text" id="limitedQuantity" name="limitedQuantity"
											class="chundanwigubun"
											onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
											disabled> &nbsp;개로 제한합니다.</label>
									</div>
								</div>
							</div>
							<div id="giftConfigButton">
								<button id="giftConfigCancelButton"
									onclick="giftConfigShowHide()" type="button"
									class="btn btn-default btn-lg">
									<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
								</button>
								<button id="giftConfigConfirmButton" onclick="giftAdd()"
									type="button" class="btn btn-default btn-lg">
									<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
								</button>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- ===============================선물구성 추가하기 쇼폼 끝=================================== -->
		<!-- ===============================선물구성 추가되는폼 시작====================================-->
		<div id="giftAddInfo">
			<Table id="giftAddOutputTable">

			</Table>
		</div>
		<!-- ===============================선물구성 추가되는폼 끝====================================-->
		<!-- ===============================선물구성 추가버튼 폼 시작================================== -->
		<div id="giftAddButtonForm">
			<table>
				<tr>
					<td>
						<div id="giftConfigAddBox" onclick="giftConfigShow()">
							<div class="row">
								<div id="giftAddRow1" class="col-xs-12">
									<h4>
										<label>&nbsp; 선물 추가하기</label>
									</h4>
								</div>
							</div>
							<div class="row">
								<div id="giftAddRow2" class="col-xs-12">
									<div>
										<label>선물을 만들기 전에 프로젝트 마감일을 설정해주세요.</label>
									</div>
									<div id="giftAddRowInputButton">
										<button type="BUTTON">
											<i class="glyphicon glyphicon-plus-sign"></i>&nbsp;<b>추가하기</b>
										</button>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<!-- ===============================선물구성 추가버튼 폼 끝================================== -->
			</table>
		</div>
		<p>펀딩 안내</p>
		<!-- ===================================환불 및 교환 정책 디폴트 폼 시작=============================== -->
		<div id="refundAndExchangePolicy">
			<table>
				<tr>
					<td>
						<div id="refundAndExchanges" onclick="refundAndExchangesShow()">
							<div class="row">
								<div class="col-xs-10">
									<label>&nbsp; 환불 및 교환 정책</label>
								</div>
							</div>
							<div id="refundAndExchangeOutputDefault" class="row">
								<div class="col-xs-10">
									<div>
										<i class="glyphicon glyphicon-hand-right"></i><label>&nbsp;환불
											및 교환 정책을 입력해주세요</label>
									</div>
								</div>
								<div class="col-xs-2">
									<div>
										<i class="glyphicon glyphicon-edit"></i><label>&nbsp;
											입력하기</label>
									</div>
								</div>
							</div>
							<div id="refundAndExchangeOutput" class="row">
								<div class="col-xs-10">
									<textarea id="refundAndExchangeSpan"
										name="refundAndExchangeSpan" style="white-space: pre;" readOnly></textarea>
								</div>
								<div class="col-xs-2">
									<div>
										<i class="glyphicon glyphicon-edit"></i><label
											style="padding-left: 0px;">&nbsp; 수정하기</label>
									</div>
								</div>
							</div>
						</div> <!-- ===================================환불 및 교환 정책 디폴트 끝================================== -->
						<!-- ===================================환불 및 교환 정책 쇼폼 시작================================== -->
						<div id="refundAndExchangesShow">
							<div class="row">
								<label>&nbsp;환불 및 교환 정책</label>
							</div>
							<div class="row">
								<div class="col-xs-12">펀딩 마감 후의 환불 및 교환 요청은 창작자가 약속하는 정책에
									따릅니다.</div>
							</div>
							<div class="row">
								<div class="col-xs-12">후원자의 단순 변심,제품의 파손 및 불량,창작자의 예기치 못한
									선물 실행 지연 등 다양한 상황을 고려하여 내용을 작성해 주세요.</div>
							</div>
							<div id="refundTextAreaRow" class="row">
								<div class="col-xs-12">
									<textarea id="refundTextArea" rows="20" cols="20" wrap="hard"> [ • 모든 프로젝트 공통 ]
- 프로젝트 마감일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.
- 예상 전달일로부터 [    ]일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 [ 수수료를 제한 / 수수료를 포함한 ] 후원금을 환불해 드립니다.
(플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%, 부가세 별도 )
- 선물 전달을 위한 배송지 및 서베이 답변은 [   마감일 이후 날짜를 입력해주세요.(ex 20XX. XX. XX)   ]에 일괄 취합할 예정입니다.
- 이후 배송지 변경이나 서베이 답변 변경을 원하실 때에는 '창작자에게 문의하기'로 개별 문의하셔야 합니다.

[ • 배송이 필요한 선물이 있는 경우 ]
- 파손 또는 불량품 수령 시 [   ]일 이내로 교환이 가능합니다.
- 교환 및 AS 문의는 '창작자에게 문의하기'로 신청해 주세요.
- 파손이나 불량품 교환시 발생하는 비용은 창작자가 부담합니다. 선물 확인을 위한 포장 훼손 외에 아이템의 가치가 훼손된 경우에는 교환 및 환불이 불가합니다.

[ - 파손이나 불량의 예시 또는 기준이 있을 경우 추가해 주세요. ]
- 후원자가 배송지를 잘못 기재하거나 창작자에게 사전 고지 없이 배송지를 수정하여 배송사고가 발생할 경우 
창작자는 [  최대   번까지 재발송 해 드립니다. 배송비 부담은 (  창작자 / 후원자  )에게 있습니다   /   책임을 지지 않습니다  ].

[ • 공연/행사 등 현장수령으로 이루어지는 선물의 경우 ]
- 행사 참가권은 타인에게 양도가 [  가능  /  불가능  ]합니다.
- 현장에서 수령해야 하는 선물을 수령하지 못하신 경우 환불은 [  가능   /  불가능  ]하며, 선물 배송을 위한 추가 배송비를 별도 요청드릴 수 있습니다.

[ • 디지털 콘텐츠로 이뤄진 선물의 경우 ]
- 전달된 파일에 심각한 결함이나 저작권상 문제가 있을 경우, 수수료 [  포함  /  제외  ]하여 환불 가능합니다.
- 전달된 파일은 타인에게 양도가 [  가능  /  불가능  ]합니다.]</textarea>
								</div>
							</div>
							<div id="refundAndExchangeButton">
								<button id="refundAndExchangeCancelButton"
									onclick="refundAndExchangesShowHide()" type="button"
									class="btn btn-default btn-lg">
									<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
								</button>
								<button id="refundAndExchangeConfirmButton"
									onclick="refundAndExchangesAdd()" type="button"
									class="btn btn-default btn-lg">
									<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
								</button>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- =================================폼의 끝========================================= -->
	</form>
	<!-- ======================하단 이전 다음 버튼 시작========================= -->
	<div class="row">
		<div id="bottomPreNextButton" class="col-xs-12">
			<a class="tab_menu" data-toggle="tab" href="#menu3">
				<button onClick="next_pagepro()" class="button button_next">
					다음<i class="glyphicon glyphicon-chevron-right"></i>
				</button>
			</a> <a class="tab_menu" data-toggle="tab" href="#menu1">
				<button onClick="pre_pagepro()" class="button button_pre">
					<i class="glyphicon glyphicon-chevron-left"></i>이전
				</button>
			</a>
		</div>
	</div>
	<!-- ======================하단 이전 다음 버튼 끝========================= -->
	<!-- --- -->
	<div id="defaultHide">
		<div id="defaultGiftUlList" class="giftUlListBorder">
			<div class="giftListBorder">
			<div class="row">
			   <div class="col-xs-1" style="text-align:right;padding-right:0px;margin-left:-50px">
			   <i class="glyphicon glyphicon-gift" ></i>
			</div>
			<div class="col-xs-2" style="text-align:left">
			<label><input type="text" class="ilbanText" id="GiftUlListName"
			   name="GiftUlListName" readOnly style="width:65%; margin-top:-5px;margin-left:5px"></label>
			<div>x&nbsp;<input type="text" class="ilbanText" id="GiftUlListQuantity"
			   name="GiftUlListQuantity" readOnly style="text-align:left;width:50px;margin-top:-5px;">
			</div>
			        <input type="hidden" id="GiftUlListOption" name="GiftUlListOption">
			</div>
			</div>
         </div>
		</div>
		<div>
			<table>
				<thead></thead>
				<tbody id="itemListEditShowView0">
					<tr id="itemListEditShow0">
						<td colspan="3"><div>
								<div id="itemListAddEditShow0">
									<div class="row">
										<label>아이템 이름</label>
									</div>
									<div>
										<input id="newMakeItemName1" name="newMakeItemName1"
											type="text" class="ilbanText"
											placeholder="새로 만들 아이템의 이름을 입력하세요.">
									</div>
									<div class="row">
										<label><strong>옵션 조건</strong></label>
										<div>
											<label><input type="radio" id="tbodyoption01"
												name="group">&nbsp; 옵션이 필요없는 아이템입니다.</label>
										</div>
										<div id="multipleChoiceOption0">
											<div>
												<label><input type="radio" id="tbodyoption02"
													name="group">&nbsp; 객관식 옵션이 필요한 아이템입니다.(사이즈,색상 등)</label>
											</div>
											<div>
												<textarea name="tbodyMultipleChoiceInput0"
													id="tbodyMultipleChoiceInput0"
													placeholder="옵션 항목을 입력해주세요.
옵션 항목은 줄바꿈으로 구분됩니다.
예시)블랙-230mm
화이트-240mm"
													rows="4" onChange="tbodyMultipleChoiceInput()"></textarea>
											</div>
										</div>
										<div id="jugwansicOption0">
											<div>
												<label><input type="radio" id="tbodyoption03"
													name="group">&nbsp; 주관식 옵션이 필요한 아이템입니다.(각인,메시지 등)</label>
											</div>
											<div>
												<textarea name="tbodyJugwanSicInput0"
													id="tbodyJugwanSicInput0"
													placeholder="후원자에게 안내할 메시지를 작성해 주세요.
예시) 사이즈, 메시지 순으로 작성해 주세요."
													rows="2" onChange="tbodyJugwanSicInput()"></textarea>
											</div>
										</div>
										<div id="itemAddButton">
											<button id="itemAddCancelButton"
												onclick="itemListAddEditShowHide()" type="button"
												class="btn btn-default btn-lg">
												<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
											</button>
											<button id="itemAddConfirmButton"
												onclick="ltemListAddEdit0()" type="button"
												class="btn btn-default btn-lg">
												<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
											</button>
										</div>
									</div>
								</div>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<table>
				<thead></thead>
				<tbody id="itemListDeleteShowView0">
					<tr id="itemListDeleteShow0">
						<td colspan="3">
							<div>
								<div id="itemListAddDeleteShow">
									<div class="row">
										<div>
											<i class="glyphicon glyphicon-trash"></i><b>아이템 삭제하기</b>
										</div>
									</div>
									<div id="deleteCheck" class="row">
										<div>아이템을 삭제하면 현재 구성 중인 선물 뿐만 아니라 다른 선물도 영향을 받습니다. 그래도
											삭제 하시겠습니까?</div>
									</div>
									<div id="deleteButton">
										<button id="deleteCancelButton"
											onclick="itemListAddDeleteShowHide()" type="button"
											class="btn btn-default btn-lg">
											<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
										</button>
										<button id="deleteConfirmButton"
											onclick="itemListAddDelete0()" type="button"
											class="btn btn-default btn-lg">
											<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;삭제하기
										</button>
									</div>
								</div>
							</div>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
		<div>
			<table>
				<thead></thead>
				<tbody id="itemListEditShowView1">
					<tr id="itemListEditShow1">
						<td colspan="3"><div>
								<div id="itemListAddEditShow1">
									<div class="row">
										<label>아이템 이름</label>
									</div>
									<div>
										<input id="newMakeItemName2" name="newMakeItemName2"
											type="text" class="ilbanText"
											placeholder="새로 만들 아이템의 이름을 입력하세요.">
									</div>
									<div class="row">
										<label><strong>옵션 조건</strong></label>
										<div>
											<label><input type="radio" id="tbodyoption11"
												name="group">&nbsp; 옵션이 필요없는 아이템입니다.</label>
										</div>
										<div id="multipleChoiceOption1">
											<div>
												<label><input type="radio" id="tbodyoption12"
													name="group">&nbsp; 객관식 옵션이 필요한 아이템입니다.(사이즈,색상 등)</label>
											</div>
											<div>
												<textarea name="tbodyMultipleChoiceInput1"
													id="tbodyMultipleChoiceInput1"
													placeholder="옵션 항목을 입력해주세요.
옵션 항목은 줄바꿈으로 구분됩니다.
예시)블랙-230mm
화이트-240mm"
													rows="4" onChange="tbodyMultipleChoiceInput()"></textarea>
											</div>
										</div>
										<div id="jugwansicOption1">
											<div>
												<label><input type="radio" id="tbodyoption13"
													name="group">&nbsp; 주관식 옵션이 필요한 아이템입니다.(각인,메시지 등)</label>
											</div>
											<div>
												<textarea name="tbodyJugwanSicInput1"
													id="tbodyJugwanSicInput1"
													placeholder="후원자에게 안내할 메시지를 작성해 주세요.
예시) 사이즈, 메시지 순으로 작성해 주세요."
													rows="2" onChange="tbodyJugwanSicInput()"></textarea>
											</div>
										</div>
										<div id="itemAddButton">
											<button id="itemAddCancelButton"
												onclick="itemListAddEditShowHide()" type="button"
												class="btn btn-default btn-lg">
												<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
											</button>
											<button id="itemAddConfirmButton"
												onclick="ltemListAddEdit1()" type="button"
												class="btn btn-default btn-lg">
												<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
											</button>
										</div>
									</div>
								</div>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<table>
				<thead></thead>
				<tbody id="itemListDeleteShowView1">
					<tr id="itemListDeleteShow1">
						<td colspan="3">
							<div>
								<div id="itemListAddDeleteShow">
									<div class="row">
										<div>
											<i class="glyphicon glyphicon-trash"></i><b>아이템 삭제하기</b>
										</div>
									</div>
									<div id="deleteCheck" class="row">
										<div>아이템을 삭제하면 현재 구성 중인 선물 뿐만 아니라 다른 선물도 영향을 받습니다. 그래도
											삭제 하시겠습니까?</div>
									</div>
									<div id="deleteButton">
										<button id="deleteCancelButton"
											onclick="itemListAddDeleteShowHide()" type="button"
											class="btn btn-default btn-lg">
											<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
										</button>
										<button id="deleteConfirmButton"
											onclick="itemListAddDelete1()" type="button"
											class="btn btn-default btn-lg">
											<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;삭제하기
										</button>
									</div>
								</div>
							</div>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
		<div>
			<table>
				<thead></thead>
				<tbody id="itemListEditShowView2">
					<tr id="itemListEditShow2">
						<td colspan="3"><div>
								<div id="itemListAddEditShow2">
									<div class="row">
										<label>아이템 이름</label>
									</div>
									<div>
										<input id="newMakeItemName3" name="newMakeItemName3"
											type="text" class="ilbanText"
											placeholder="새로 만들 아이템의 이름을 입력하세요.">
									</div>
									<div class="row">
										<label><strong>옵션 조건</strong></label>
										<div>
											<label><input type="radio" id="tbodyoption21"
												name="group">&nbsp; 옵션이 필요없는 아이템입니다.</label>
										</div>
										<div id="multipleChoiceOption2">
											<div>
												<label><input type="radio" id="tbodyoption22"
													name="group">&nbsp; 객관식 옵션이 필요한 아이템입니다.(사이즈,색상 등)</label>
											</div>
											<div>
												<textarea name="tbodyMultipleChoiceInput2"
													id="tbodyMultipleChoiceInput2"
													placeholder="옵션 항목을 입력해주세요.
옵션 항목은 줄바꿈으로 구분됩니다.
예시)블랙-230mm
화이트-240mm"
													rows="4" onChange="tbodyMultipleChoiceInput()"></textarea>
											</div>
										</div>
										<div id="jugwansicOption2">
											<div>
												<label><input type="radio" id="tbodyoption23"
													name="group">&nbsp; 주관식 옵션이 필요한 아이템입니다.(각인,메시지 등)</label>
											</div>
											<div>
												<textarea name="tbodyJugwanSicInput2"
													id="tbodyJugwanSicInput2"
													placeholder="후원자에게 안내할 메시지를 작성해 주세요.
예시) 사이즈, 메시지 순으로 작성해 주세요."
													rows="2" onChange="tbodyJugwanSicInput()"></textarea>
											</div>
										</div>
										<div id="itemAddButton">
											<button id="itemAddCancelButton"
												onclick="itemListAddEditShowHide()" type="button"
												class="btn btn-default btn-lg">
												<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
											</button>
											<button id="itemAddConfirmButton"
												onclick="ltemListAddEdit2()" type="button"
												class="btn btn-default btn-lg">
												<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
											</button>
										</div>
									</div>
								</div>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<table>
				<thead></thead>
				<tbody id="itemListDeleteShowView2">
					<tr id="itemListDeleteShow2">
						<td colspan="3">
							<div>
								<div id="itemListAddDeleteShow">
									<div class="row">
										<div>
											<i class="glyphicon glyphicon-trash"></i><b>아이템 삭제하기</b>
										</div>
									</div>
									<div id="deleteCheck" class="row">
										<div>아이템을 삭제하면 현재 구성 중인 선물 뿐만 아니라 다른 선물도 영향을 받습니다. 그래도
											삭제 하시겠습니까?</div>
									</div>
									<div id="deleteButton">
										<button id="deleteCancelButton"
											onclick="itemListAddDeleteShowHide()" type="button"
											class="btn btn-default btn-lg">
											<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
										</button>
										<button id="deleteConfirmButton"
											onclick="itemListAddDelete2()" type="button"
											class="btn btn-default btn-lg">
											<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;삭제하기
										</button>
									</div>
								</div>
							</div>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
		<div>
			<table>
				<thead></thead>
				<tbody id="itemListEditShowView3">
					<tr id="itemListEditShow3">
						<td colspan="3"><div>
								<div id="itemListAddEditShow3">
									<div class="row">
										<label>아이템 이름</label>
									</div>
									<div>
										<input id="newMakeItemName4" name="newMakeItemName4"
											type="text" class="ilbanText"
											placeholder="새로 만들 아이템의 이름을 입력하세요.">
									</div>
									<div class="row">
										<label><strong>옵션 조건</strong></label>
										<div>
											<label><input type="radio" id="tbodyoption31"
												name="group">&nbsp; 옵션이 필요없는 아이템입니다.</label>
										</div>
										<div id="multipleChoiceOption3">
											<div>
												<label><input type="radio" id="tbodyoption32"
													name="group">&nbsp; 객관식 옵션이 필요한 아이템입니다.(사이즈,색상 등)</label>
											</div>
											<div>
												<textarea name="tbodyMultipleChoiceInput3"
													id="tbodyMultipleChoiceInput3"
													placeholder="옵션 항목을 입력해주세요.
옵션 항목은 줄바꿈으로 구분됩니다.
예시)블랙-230mm
화이트-240mm"
													rows="4" onChange="tbodyMultipleChoiceInput()"></textarea>
											</div>
										</div>
										<div id="jugwansicOption3">
											<div>
												<label><input type="radio" id="tbodyoption33"
													name="group">&nbsp; 주관식 옵션이 필요한 아이템입니다.(각인,메시지 등)</label>
											</div>
											<div>
												<textarea name="tbodyJugwanSicInput3"
													id="tbodyJugwanSicInput3"
													placeholder="후원자에게 안내할 메시지를 작성해 주세요.
예시) 사이즈, 메시지 순으로 작성해 주세요."
													rows="2" onChange="tbodyJugwanSicInput()"></textarea>
											</div>
										</div>
										<div id="itemAddButton">
											<button id="itemAddCancelButton"
												onclick="itemListAddEditShowHide()" type="button"
												class="btn btn-default btn-lg">
												<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
											</button>
											<button id="itemAddConfirmButton"
												onclick="ltemListAddEdit3()" type="button"
												class="btn btn-default btn-lg">
												<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
											</button>
										</div>
									</div>
								</div>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<table>
				<thead></thead>
				<tbody id="itemListDeleteShowView3">
					<tr id="itemListDeleteShow3">
						<td colspan="3">
							<div>
								<div id="itemListAddDeleteShow">
									<div class="row">
										<div>
											<i class="glyphicon glyphicon-trash"></i><b>아이템 삭제하기</b>
										</div>
									</div>
									<div id="deleteCheck" class="row">
										<div>아이템을 삭제하면 현재 구성 중인 선물 뿐만 아니라 다른 선물도 영향을 받습니다. 그래도
											삭제 하시겠습니까?</div>
									</div>
									<div id="deleteButton">
										<button id="deleteCancelButton"
											onclick="itemListAddDeleteShowHide()" type="button"
											class="btn btn-default btn-lg">
											<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
										</button>
										<button id="deleteConfirmButton"
											onclick="itemListAddDelete3()" type="button"
											class="btn btn-default btn-lg">
											<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;삭제하기
										</button>
									</div>
								</div>
							</div>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
		<div>
			<table>
				<thead></thead>
				<tbody id="itemListEditShowView4">
					<tr id="itemListEditShow4">
						<td colspan="3"><div>
								<div id="itemListAddEditShow4">
									<div class="row">
										<label>아이템 이름</label>
									</div>
									<div>
										<input id="newMakeItemName5" name="newMakeItemName5"
											type="text" class="ilbanText"
											placeholder="새로 만들 아이템의 이름을 입력하세요.">
									</div>
									<div class="row">
										<label><strong>옵션 조건</strong></label>
										<div>
											<label><input type="radio" id="tbodyoption41"
												name="group">&nbsp; 옵션이 필요없는 아이템입니다.</label>
										</div>
										<div id="multipleChoiceOption4">
											<div>
												<label><input type="radio" id="tbodyoption42"
													name="group">&nbsp; 객관식 옵션이 필요한 아이템입니다.(사이즈,색상 등)</label>
											</div>
											<div>
												<textarea name="tbodyMultipleChoiceInput4"
													id="tbodyMultipleChoiceInput4"
													placeholder="옵션 항목을 입력해주세요.
옵션 항목은 줄바꿈으로 구분됩니다.
예시)블랙-230mm
화이트-240mm"
													rows="4" onChange="tbodyMultipleChoiceInput()"></textarea>
											</div>
										</div>
										<div id="jugwansicOption4">
											<div>
												<label><input type="radio" id="tbodyoption43"
													name="group">&nbsp; 주관식 옵션이 필요한 아이템입니다.(각인,메시지 등)</label>
											</div>
											<div>
												<textarea name="tbodyJugwanSicInput4"
													id="tbodyJugwanSicInput4"
													placeholder="후원자에게 안내할 메시지를 작성해 주세요.
예시) 사이즈, 메시지 순으로 작성해 주세요."
													rows="2" onChange="tbodyJugwanSicInput()"></textarea>
											</div>
										</div>
										<div id="itemAddButton">
											<button id="itemAddCancelButton"
												onclick="itemListAddEditShowHide()" type="button"
												class="btn btn-default btn-lg">
												<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
											</button>
											<button id="itemAddConfirmButton"
												onclick="ltemListAddEdit4()" type="button"
												class="btn btn-default btn-lg">
												<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;저장하기
											</button>
										</div>
									</div>
								</div>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<table>
				<thead></thead>
				<tbody id="itemListDeleteShowView4">
					<tr id="itemListDeleteShow4">
						<td colspan="3">
							<div>
								<div id="itemListAddDeleteShow">
									<div class="row">
										<div>
											<i class="glyphicon glyphicon-trash"></i><b>아이템 삭제하기</b>
										</div>
									</div>
									<div id="deleteCheck" class="row">
										<div>아이템을 삭제하면 현재 구성 중인 선물 뿐만 아니라 다른 선물도 영향을 받습니다. 그래도
											삭제 하시겠습니까?</div>
									</div>
									<div id="deleteButton">
										<button id="deleteCancelButton"
											onclick="itemListAddDeleteShowHide()" type="button"
											class="btn btn-default btn-lg">
											<i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;취소하기
										</button>
										<button id="deleteConfirmButton"
											onclick="itemListAddDelete4()" type="button"
											class="btn btn-default btn-lg">
											<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;삭제하기
										</button>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<table id="defaultHideListTable">
			<tbody id="defaultHideList">
				<tr>
					<td><input type="text" class="ilbanText" id="itemListNameInput" name="itemListNameInput" style="width:100%" readOnly></td>
					<td><input type="text" class="ilbanText" id="itemListOptionInput" name="itemListOptionInput" style="width:100%" readOnly></td>
					<td><button id="itemListEditButton" type="button"
							class="btn btn-default btn-lg">수정하기</button>
						<button id="itemListDeleteButton" type="button"
							class="btn btn-default btn-lg">삭제하기</button></td>
				</tr>
			</tbody>
		</table>
		<table>
			<tbody id="giftDefaultHideList">
				<tr>
					<td style="text-align: center"><input type="checkbox"
						id="YesNoGroup" name="YesNoGroup"></td>
					<td><input type="text" class="ilbanText"
						id="itemListNameOutput" name="itemListNameOutput" readOnly></td>
					<td><input type="text" class="ilbanText"
						id="itemListOptionOutput" name="itemListOptionOutput" readOnly></td>
					<td style="text-align: center"><i
						onclick="itemQuantityOption('minus')"
						class="fa fa-minus c_pointer"></i> <input type="text"
						class="chundanwigubun" id="itemQuantityOption"
						name="itemQuantityOption" value="0" placeholder="0"><i
						onclick="itemQuantityOption('plus')" class="fa fa-plus c_pointer"></i></td>
				</tr>
			</tbody>
			<tbody id="noItemDefaultList">
			</tbody>
		</table>

	</div>
	<div id="giftAddDefault">
		<table id="giftAddTable">
			<tbody>
				<tr>
					<td>
						<div id="giftInfo">
							<div class="row">
								<div class="col-xs-10">
								   &nbsp;<label><input type="text" class="chundanwigubun"
								      id="minDonationMoneyOutput" name="minDonationMoneyOutput" readOnly 
								      style="text-align:center;width:100px;display:inline-block; margin-left:-40px "></label>
							<label style="margin-left:-20px;">&nbsp;원 이상 밀어주시는 분께</label>
							   </div>
							</div>
							<div class="row">
							   <div class="col-xs-10">
							      <div>
							         <label >선물 설명 :&nbsp;&nbsp;</label><input type="text" class="ilbanText" id="giftTextAreaOutput"
							            name="giftTextAreaOutput" readOnly style="text-align:left;width:auto;">
							      </div>
							   </div>
							</div>
							<div id="giftUlList">
							</div>
							<div class="row">
							   <div class="col-xs-10">
							      <div>
							         <label>예상전달일 :&nbsp;&nbsp;</label><input type="text" class="ilbanText"
							            id="deliveryDayOutput" name="deliveryDayOutput" readOnly style="text-align:left;width:auto; ">
							      </div>
							   </div>
							</div>
							<hr>
							<div id="limitedAndDeliveryInput">
								<div class="row">
									<div id="choicePersonX" class="col-xs-2"
										style="margin-top: 5px;">
										<div>
											<i class="glyphicon glyphicon-asterisk"></i>&nbsp;선택한 사람이 없음
										</div>
									</div>
									<div id="remainQuantity" class="col-xs-8">
										<div>
											<input class="chundanwigubun" type="text"
												id="limitedQuantityInput" name="limitedQuantityInput" readOnly style="text-align:center;width:60px;"><label style="margin-left:-10px">개&nbsp;남음</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
