/**************************************
 * 
 * @param url : 화면에 띄울 페이지의 url
 * @param popupwidth : 팝업창 가로
 * @param popupheight : 팝업창 세로
 * @param popupname : 팝업창 이름
 * @returns
 **************************************/
function cmm_window_popup(url,popupwidth,popupheight,popupname) {
	Top = (window.screen.height=popupheight)/3;
	Left = (window.screen.width-popupwidth)/2;
	if(Top<0) Top = 0;
	if(Left<0) Left = 0;
	options = "location=no, fullscreen=no, status=no";
	options += ", left="+Left+", top="+Top;
	options += ", width="+popupwidth+", height="+popupheight;
	popupname = window.open(url, popupname, options);
}