<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
    	border :
    	border: border-width border-style border-color | initial | inherit
    	1) border-width : medium | thick | thin | length | initial | inherit
    	2) border-style : dashed | dotted | double | groove | hidden | inset 
    					| none | outset | ridge | solid | initial | inherit
		3) border-color : 
     -->
	<style type="text/css">
		a:link { color: black; }
		a:visited { color: black; }
		a:hover { color: gray; }
		a:active { color: gray; }
		a {
			text-decoration: none;
		}
		/*  */
		#layout1 {
		}		
		/*  */
		#subCat{
			margin-top:20px;
			text-align:center;
		}
		#btn_subCat{
			background-color:white;
			border: 1px solid rgb(239,239,239);
		}
/* 		#pj_title{
			background-color:green;
		} */
		#writers{
			margin-top:10px;
			padding:1px 50px 1px 50px;
		}
		#top_profile {
			height: 490px;
		}
		#top_profile_img {
			width: 90%;
			height: 100%;
		    padding: 0 0 0 36px;
			max-height: 478.5px;
			position: static;
		}
		#top{
			margin-top: 20px;
		}
		#topInfo{
			height: 487.5px;
		}
		/* 모인금액, 남은시간의 div태그 */
		#topInfo_div {
			max-height: 88px;
			margin-bottom: 20px;
		}
		/* 후원자의 div태그 */
		#topInfo_div2 {
			max-height: 88px;
			margin-bottom: 50px;
		}
    	/* 라벨_모인금액, 남은시간, 후원자 */
    	#topInfo_label {
    		font-size: 15px;
    	}
    	/* 
    	라벨_1)모인 금액 : 7,612,777, 2)남은시간 : 28
    		3)후원자 : 386
    	*/
    	#topInfo_label2 {
    		font-size: 30px;
    	}
    	/* 라벨_원, 일, 명 */
    	#topInfo_label3 {
    		font-size: 15px;
    	}
    	/* 퍼센트 : 1087%*/
    	#topInfo_label4 {
    		font-size: 18px;
    	}
    	/* 박스_펀딩 진행중 */
    	#topInfo_fundBox {
    		width: 370px;
    		border: 2px solid rgb(239,239,239);
    		background-color: rgb(250,250,250);
    		padding: 5px 10px 15px 10px;
    		max-height: 88px;
    	}
    	/* 라벨_펀딩 진행중 */
    	#topInfo_fundBox_label {}
    	/* 라벨_펀딩 진행중_상세내용 */
    	#topInfo_fundBox_label2 {}
    	/* 프로젝트 밀어주기 버튼 */
    	#fundProject {
    		font-size: 15.4px;
    		font-weight: 700;
    		line-height: 15.4px;
    		text-decoration: none solid rgb(255, 255, 255);
    		text-align: center;
    		word-spacing: 0px;
    		background-color: #FA6462;
    		color: #FFFFFF;
    		height: 52.15px;
    		width: 277.5px;
    		margin: 20px 4px 0 0;
    		padding: 18px 31px 18px 31px;
    		min-height: 15.4px;
    		cursor: pointer;
    		border: none;
			box-sizing: border-box;
			box-shadow: rgba(0,0,0,0) 0px 0px 0px 1px inset, rgba(0,0,0,0.1) 0px 0px 0px 0px inset;
			border-top-left-radius: 4px;
			border-top-right-radius: 4px;
			border-bottom-left-radius: 4px;
			border-bottom-right-radius: 4px;
    	}
		#middle {
			border: 3px solid rgb(239,239,239);
			height: 45px;
			line-height: 45px;
			vertical-align: middle;
			margin-top: 30px;
		}
		#middle_tabs {
			font-size: 13px;
			margin: 0 0 0 25px;
		}
		#bottom {
			padding: 15px 1px 1px 20px;
			background-color: rgb(246,245,245);
		}
		#bottom_creatorCard {
			max-width: 360px;
			max-height: 414px;
			padding: 21px 21px 21px 21px;
			background-color: white;
			border: 2px solid rgb(233,232,232);
			font-size: 14px;
			line-height: 23.8px;
		}
		#bottom_rewardsLabel {
			font-size: 14px;
			line-height: 21px;
			text-decoration: none solid rgba(0,0,0,0.7);
			word-spacing: 0px;
			margin-top: 20px;
		}

		#bottom_rewardCards {
			font-size: 14px;
			line-height: 23.8px;
			text-decoration: none solid rgba(0,0,0,0.87);
			word-spacing: 0px;
			background-color: silver;
			height: 312px;
			max-width: 360px;
			margin-top: 10px;
			padding: 21px 21px 21px 21px;
			border: 2px solid rgb(233,232,232);
			cursor: pointer;
		}
		#bottom_rewardCards_rewardHeader {
			font-weight: 700;
			text-decoration: none solid rgb(117, 117, 117);
			line-height: 23.8px;
			height: 23px;
			max-width: 318px;
			margin: 0 0 7px 0;
			color: #757575;
		}
		#bottom_rewardCards_amounts {
			word-spacing: 0px;
			height: auto;
			width: auto;
			margin-right: 40%;
		}
		#bottom_rewardCards_rewardLabel {
			text-decoration: none solid rgb(250, 100, 98);
			word-spacing: 0px;
			background-color: #FEEFEE;
			background-position: 0% 0%;
			color: #FA6462;
			height: auto;
			width: auto;
			border: 0.5px solid #FA6462;
			padding: 6px 6px 6px 6px;
		}
		#bottom_rewardCards_money {
			font-size: 24.5px;
			line-height: 42.87px;
			text-decoration: none solid rgb(0,0,0);
			word-spacing: 0px;
			height: 42.4px;
			max-width: 318px;
			margin-top: 15px;
		}
		#bottom_rewardCards_description {
			text-decoration: none solid rgb(0,0,0);
			word-spacing: 0px;
			height: 23.3333px;
			max-width: 318px;
		}
		#bottom_rewardCards_itemList {
			margin: 15px 0 15px 0;
			max-width: 340px;
		}
		#bottom_rewardCards_deliveryDate {
			font-size: 13.3px;
			line-height: 23.8px;
			text-decoration: none solid rgb(117, 117, 117);
			word-spacing: 0px;
			color: #757575;
			height: 23.3333px;
			max-width: 318px;
			margin: 10px 0 3px 0;
		}
		#refundExchangePolicyText {
			white-space: pre-line;
		}
		#newPost {
			font-size: 15.4px;
			font-weight: 700;
			line-height: 23.8px;
			text-decoration: none solid rgb(117,117,117);
			color: #757575;
			padding: 17px 21px 17px 21px;
		}
		#btn_save {
			width: 30%;
		}
		#storyReple {
			margin-top: 15px;
			padding: 30px 30px 0 30px;
			cursor: pointer;
		}
		#storyContent {
			font-size: 17px;
			line-height: 30.6px;
			margin: 21px 0 21px 0;
		}
		#postSummary {
			border-top: 1px solid #EFEFEF;
			padding: 14px 21px 14px 0;
		}
		#backCommunityHeader {
			height: 48.875px;
			padding: 0 0 14px 0;
		}
		#backCommunity {
			font-size: 13.3px;
			font-weight: 700;
			line-height: 13.3px;
			text-decoration: none solid rgba(0, 0, 0, 0.6);
			text-align: center;
			word-spacing: 0px;
			background-color: #E7E7E7;
			height: 34.875px;
			width: 163.55px;
			margin: 0 3px 0 0;
			padding: 11px 16px 11px 16px;
			min-height: 13.3px;
			display: inline-block;
			border: none;
			cursor: pointer;
		}
		#repleDetail {
			font-size: 14px;
			font-weight: 700;
			text-decoration: none solid rgba(0,0,0,0.8);
			padding: 0 0 0 0;
		}
		#postTitle {
			line-height: 48px;		
			text-align: center;
			height: 48px;
		}
		#postBody {
			padding: 14px 14px 14px 14px;
		    border-top: 1px solid #EFEFEF;
		}
		#postCategory {
			font-size: 12.6px;
			text-decoration: none solid rgb(255,255,255);
			background-color: #000000;
			color: #FFFFFF;
			width: 110px;
			height: 28.8px;
			padding: 3px 8px 3px 8px;
		}
		#postWriter {
			margin: 20px 20px 20px 20px;
		}
		#detailContent {
			font-size : 17px;
			line-height: 30.6px;
			margin: 11px 25px 11px 25px;
			overflow: hidden auto;
		}
		#commentAmount {
			font-size: 14px;
			line-height: 23.8px;
			text-decoration: none solid rgb(117,117,117);
			color: #757575;
			height: 37.2px;
			width: 632px;
			padding: 7px 25px 7px 25px;
		}
		#loadMoreComment {
			text-decoration: none solid rgba(0, 0, 0, 0.87);
			height: 52.2px;
			border-top: 1px solid #EFEFEF;
			padding: 14px 25px 14px 25px;
			cursor: pointer;
	    	margin: 0 20px 0 20px;
		}	
		#comments {
			text-decoration: none solid rgba(0,0,0,0.87);
			border-top: 1px solid #EFEFEF;
			padding: 18px 25px 18px 25px;
			display: flex;
			height: 85.2px;
			min-height: 50px;
		    margin: 0 20px 0 20px;
		}
		#inputCommnet {
			border-top: 1px solid #EFEFEF;
			padding: 18px 25px 18px 25px;
		    margin: 0 20px 0 20px;
		}
		/* 모달 CSS */
		#modal-dialog {
			font-size: 14px;
			font-weight: 700px;
			text-align: left;
			padding: 31px 31px 31px 31px;
		}
		#modal-header {
			font-size: 18.2px;
			font-weight: 700;
			line-height: 23.3997px;
			text-decoration: none solid rgb(255,255,255);
			text-align: center;
			background-color: #FA6462;
			color: #FFFFFF;
			border-bottom: 1px solid #FA6466;
			padding: 18px 21px 18px 21px;
		}
		.modal-to {
			line-height: 19.6px;
			text-decoration: none solid rgb(128, 128, 128);
			text-align: left;
			color: #808080;
			cursor: default;
			margin-right: 10px;
		}
		#modal-from {
			text-decoration: none solid rgba(0,0,0,0.87);
			text-align: left;
			border: 1px solid rgb(229, 229, 229);
			margin: 0 0 0 2px;
			padding: 8px 12px 8px 12px;		
		}
		#modal-types {
			text-decoration: none solid rgba(0,0,0,0.87);
			text-align: left;
			white-space: pre;
			border: 1px solid rgb(229, 229, 229);
			padding: 7px 7px 7px 7px;
			position: relative;
			clear: both;
		}
		#footer-cancle {
			line-height: 14px;
			text-align: center;
			background-color: #E0E1E2;
			width: 113px;
			padding: 11px 21px 11px 21px;
			cursor: pointer;
		}
		#footer-submit {
			line-height: 14px;
			text-align: center;
			background-color: #FA6462;
			color: #FFFFFF;
			width: 100px;
			padding: 11px 21px 11px 21px;
			cursor: pointer;
		}
		/* 부트스트랩 모달을 사용하면 오른쪽 패딩을 먹는 것을 제거 */
		body:not(.modal-open){
		  padding-right: 0px !important;
		}
		/* ==========클래스 CSS=========== */
		.Divider {
			height: 1px;
			width: 100%;
			border-top: 1px solid #EFEFEF;
			margin: 14px 0 14px 0;
		}
		.bottom_btn {
			text-align: center;
			background-color: #E7E7E7;
			font-size: 14px;
			font-weight: 700;
			line-height: 14px;
			height: 43px;
			width: 100%;
			max-width: 318px;
			margin: 0 4px 0 0;
			padding: 14px 21px 14px 21px;
			min-height: 14px;
			cursor: pointer;
			box-sizing: border-box;
			box-shadow: rgba(0,0,0,0) 0px 0px 0px 1px inset, rgba(0,0,0,0.1) 0px 0px 0px 0px inset;
			border-top-left-radius: 4px;
			border-top-right-radius: 4px;
			border-bottom-left-radius: 4px;
			border-bottom-right-radius: 4px;
			border: none;
		}
		.bottom_storyCard {
			line-height: 23.8px;
			text-decoration: none solid rgba(0,0,0,0.87);
			word-spacing: 0px;
			background-color: #FFFFFF;
			background-position: 0% 0%;
			max-width: 750px;
			display: block;
			margin-right: 20px;
			border: 2px solid rgb(233,232,232);
			padding: 30px 30px 30px 30px;
		}

		
		
</style>