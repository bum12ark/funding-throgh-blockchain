<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 만들기 </title>
<!--=============================================================================================
	프로젝트 올리기 -스토리텔링 탭
	날짜:2019-09-12
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Project_StoryTelling.css?1">
</head>
<body>	
<script type="text/javascript">
		//스토리 입력하기 
		function enterStory() {
			$("#st_story1").hide();
			$("#st_story2").show();
			
		}
		//스토리 입력 취소
		function storyCancel() {
			$("#st_story2").hide();
			$("#st_story1").show();
			var story2_txt =  $('#summernote').summernote('code');
			console.log("story2_txt" + story2_txt); 
			if(story2_txt != "<p><br></p>"){
				$("#story_content").html(story2_txt);
			}else{
				story_change();
			}
		}
		//스토리 저장
		function storySave() {
			var story2_txt =  $('#summernote').summernote('code');
			console.log("story2_txt" + story2_txt); 
			if(story2_txt != "<p><br></p>"){
				$("#st_story1").html(story2_txt);
				story_change();
				storyCancel();
			}
			else{
				alert("스토리를 입력해 주세요");
			}

		}
		$(document).ready(function() {
			$("#st_story2").hide();
		});
		function story_change(){
			var story2_txt =  $('#summernote').summernote('code');
			if(story2_txt == "<p><br></p>"){
				$("#check_tab3").html('<img id="check_tab3" src="../FTBC_Images/check1.png">');
			} else{
				$("#check_tab3").html('<img id="check_tab3" src="../FTBC_Images/check.png">');
				
			}
		}
		function story_check_count(){
			var story2_txt =  $('#summernote').summernote('code');
			if(story2_txt == "<p><br></p>"){
				check = check+",스토리텔링";
			}
			else{
				$("#check_tab3").html('<img id="check_tab3" src="../FTBC_Images/check.png">');
			}
		}
		   function next_pageStory() {//페이지 하단 다음버튼
		         changepro();
		         $("#tab3").removeClass("active");
		         $("#tab4").attr('class', 'active');
		      
		   }
		   function pre_pageStory() {//페이지 하단 이전 버튼
		         changepro();
		         $("#tab3").removeClass("active");
		         $("#tab2").attr('class', 'active');
		      
		   }
</script>
<div>
	<p>프로젝트 스토리</p>
	<div id="st_story1" onclick="enterStory()">
		<div class="row">
			<div class="col-sm-10">
				<label>&nbsp; 프로젝트 스토리</label>
			</div>
		</div>
		<div class="row" id="story_content">
			<div class="col-sm-10">
				<img src="../FTBC_Images/finger.png"></img><label>&nbsp; 프로젝트	스토리를 입력해주세요</label>
			</div>
			<div class="col-sm-2">
				<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 입력하기</label>
			</div>
		</div>
	</div>
	<!--end of st_story1  -->

	<div id="st_story2">
		<div class="row">
			<div class="col-sm-10">
				<label id="story2_title">프로젝트 스토리</label>
				<p id="story2_guide">
					<a id="story2_guide_a">[프로젝트 스토리는 어떻게 작성해야 하나요?]</a>를 읽어보시고 스토리텔링에 필요한 요소들을 확인하여
					작성해주세요.
				</p>
			</div>
		</div>
		<div class="row">
			<div id="editor">
				<form id="f_summer" method="post" class="create_form" onSubmit="return false">
					<textarea id="summernote" name="editordata"></textarea>
				</form>
				<script>
					$('#summernote').summernote({
						placeholder : 'Hello bootstrap 4',
						tabsize : 2,
						height : 400,
						lang : 'ko-KR' // default: 'en-US'
					});
				</script>
			</div>
			<!-- end of editor  -->
		</div>
		<div class="row">
			<input id="story_cancel" type="button" onClick="storyCancel()"	value="취소하기">
			<input id="story_save" type="button" onClick="storySave()" value="저장하기">
		</div>
	</div>
	<!--end of st_story2  -->
	<div class="row">
		<div id="bottomPreNextButton" class="col-xs-12">
			<a class="tab_menu" data-toggle="tab" href="#menu4">
				<button onClick="next_pageStory()" class="button button_next">
					다음<i class="glyphicon glyphicon-chevron-right"></i>
				</button>
			</a> <a class="tab_menu" data-toggle="tab" href="#menu2">
				<button onClick="pre_pageStory()" class="button button_pre">
					<i class="glyphicon glyphicon-chevron-left"></i>이전
				</button>
			</a>
		</div>
	</div>
</div>
</body>
</html>