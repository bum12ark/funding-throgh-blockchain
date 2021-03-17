<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="message_modal" role="dialog">
		<div id="modal-dialog" class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div id="modal-header" class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<label id="title">카테고리 </label>
				</div>
				<div id="modal-body" class="modal-body">
					<div>
						<label class="modal-to">보낸 사람 : </label>
						<!-- #DB -->
						<label id="modal-from">[test1234]님</label>
					</div>
					<div class="Divider"></div>
					<!-- #form태그 -->
					<form id="message_form">
						<div>
							<!-- #DB -->
							<label id="qustion_sel">문의유형 : </label>
							<label id="question">카테고리 </label>
						</div>
						<div class="Divider"></div>
						<div>
							<textarea id="modal-contents" class="form-control" disabled 
								oninput="javascript:test(this)" name="modal-contents" rows="8"
								style="width: 100%;"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button id="footer-cancle" type="button" class="btn btn-default" data-dismiss="modal">
						<i class="fa fa-ban" style="margin-right: 5px"></i>닫기
					</button>
					<button id="footer-submit" type="button" class="btn btn-default" onClick="reAnswer()" 
					 data-dismiss="modal">
						<i class="fa fa-envelope" style="margin-right: 5px"></i>답변
					</button>
				</div>
			</div>
		</div>
	</div>