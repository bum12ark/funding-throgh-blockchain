function replaceText(el,text){
	if(el!=null){
        //기존 노드에 들어있는 값은 초기화
        clearText(el);
        //새로운 텍스트 노드를 추가
        var newNode = document.createTextNode(text);//12
        el.appendChild(newNode);
    }
}
//파라미터로 넘어온 태그에 값을 지운다
function clearText(el){
    if(el!=null){
        if(el.childNodes){//0만 false
            for(var i = 0; i<el.childNodes.length;i++){
                var childNode = el.childNodes[i];
                el.removeChild(childNode);
            }
        }
    }
}
//텍스트노드의 값을 읽어오는 메소드
//@param-노드 주소번지
function getText(el){//el => $('#id')
    var text="";
    if(el!=null){//태그가 존재하지 않으면 
        if(el.childNodes){//태그안에 여러개 노드가 있으면 컬렉션으로 담기
            for(var i=0;i<el.childNodes.length;i++){
                //여러개 노드중 한개 - 700000
                var childNode = el.childNodes[i];
                //너 텍스트 노드냐?
                if(childNode.nodeValue!=null){//700000!=null
                    text = text+childNode.nodeValue;
                }
            }
        }
    }
    return text;
}