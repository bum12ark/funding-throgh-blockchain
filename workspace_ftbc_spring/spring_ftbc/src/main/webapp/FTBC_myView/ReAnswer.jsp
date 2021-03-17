<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="remessage_modal" role="dialog">
		<div id="modal-dialog" class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div id="modal-header" class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<label id="retitle">카테고리 </label>
				</div>
				<div id="modal-body" class="modal-body">
					<div>
						<label class="modal-to">받는 사람 : </label>
						<!-- #DB -->
						<label id="remodal-from">[test1234]님</label>
					</div>
					<div class="Divider"></div>
					<!-- #form태그 -->
					<form id="remessage_form">
					<input type="hidden" id="rems_code" name="ms_code">
					<input type="hidden" id="rproject_code" name="PROJECT_CODE">
					<input type="hidden" id="resend_mem" name="send_mem" value="<%=session.getAttribute("mem_email")%>">
					<input type="hidden" id="Smem_email" name="mem_email">
					<input type="hidden" id="requestion1" name="modal-types_select">
						<div>
							<!-- #DB -->
							<label id="qustion_sel">문의유형 : </label>
							<label id="requestion">카테고리 </label>
							<label class="modal-to">&nbsp;&nbsp;&nbsp;제목 : </label>
							<input type="text" style="width:200px;border-radius:5px;background-color: #ffffff;" name="MS_TITLE">
						</div>
						<div class="Divider"></div>
						<div>
							<textarea id="remodal-contents" class="form-control"  
								oninput="javascript:test(this)" name="modal-contents" rows="8"
								style="width: 100%;"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button id="footer-cancle" type="button" class="btn btn-default" data-dismiss="modal">
						<i class="fa fa-ban" style="margin-right: 5px"></i>닫기
					</button>
					<button id="footer-submit" type="button" class="btn btn-default" onClick="messegeSend()" 
					 data-dismiss="modal">
						<i class="fa fa-envelope" style="margin-right: 5px"></i>답변
					</button>
				</div>
			</div>
		</div>
	</div>