<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<script type="text/javascript">
		function changeModalTypes(selectedItem) {
			if(!(selectedItem.value=='문의유형')) {
				$("#modal-contents").removeAttr('disabled');
			}
		}
		function test(target) {
			var text = target.value;
			if(text == '') {
				$('#footer-submit').attr('disabled', 'disabled');			
			} else {
				$('#footer-submit').removeAttr('disabled');
			}
		}
		function inquirySend() {
			// 취소나 
		}

	</script>
	<!-- Modal -->
	<div class="modal fade" id="creatorInquiry" role="dialog">
		<div id="modal-dialog" class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div id="modal-header" class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					창작자에게 문의하기
				</div>
				<div id="modal-body" class="modal-body">
					<div>
						<label class="modal-to">받는 사람</label>
						<!-- #DB -->
						<label id="modal-from">[test1234]님</label>
					</div>
					<div class="Divider"></div>
					<!-- #form태그 -->
					<form id="message_form">
					<input type="hidden" id="PROJECT_CODE" name="PROJECT_CODE">
					<input type="hidden" id="send_mem" name="send_mem" value="<%=session.getAttribute("mem_email")%>">
					<input type="hidden" id="modal-types_select" name="modal-types_select">
						<div>
							<label class="modal-to">문의 내용</label>
							<!-- #DB -->
							<select id="modal-types" onchange="changeModalTypes(this)" name="">
								<option disabled="disabled" selected="selected" value="문의유형">문의유형</option>
								<option value="선물/후원">선물/후원</option>
								<option value="프로젝트">프로젝트</option>
								<option value="수령자 정보">수령자 정보</option>
								<option value="교환/환불">교환/환불</option>
								<option value="배송">배송</option>
								<option value="기타">기타</option>
							</select>
							<label class="modal-to">&nbsp;&nbsp;&nbsp;제목 : </label>
							<input type="text" style="width:200px;border-radius:5px;background-color: #FFFFFF;" name="MS_TITLE">
						</div>
						<div class="Divider"></div>
						<div>
							<textarea id="modal-contents" class="form-control" disabled 
								oninput="javascript:test(this)" name="modal-contents"
								placeholder="프로젝트 진행자에게 문의하고 싶은 내용을 적어주세요." rows="8"
								style="width: 100%;"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button id="footer-cancle" type="button" class="btn btn-default" data-dismiss="modal">
						<i class="fa fa-ban" style="margin-right: 5px"></i>취소하기
					</button>
					<button id="footer-submit" type="button" class="btn btn-default" onClick="messegeSend()" 
					disabled data-dismiss="modal">
						<i class="fa fa-envelope" style="margin-right: 5px"></i>보내기
					</button>
				</div>
			</div>
		</div>
	</div>
