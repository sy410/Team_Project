// 인원수 가격계산
// 증감 버튼클릭

// 기능 버튼들과 수량 변경에 반응하는 이벤트 리스너들 추가 
// -> 실제 동작 기능은 객체리터널로 가격계산 메서드를 만들어서 구현 
//이벤트 리스너 등록
document.addEventListener('DOMContentLoaded', function(){
    // 수량변경 - 이벤트 델리게이션으로 이벤트 종류 구분해 처리
    document.querySelectorAll('.updown').forEach(
        function(item, idx){
            //수량 입력 필드 값 변경
            item.querySelector('input').addEventListener('keyup', function(){
                reserv.changeRPNum(idx+1);
            });
            //수량 증가 화살표 클릭
            item.children[1].addEventListener('click', function(){
                reserv.changeRPNum(idx+1);
            });
            //수량 감소 화살표 클릭
            item.children[2].addEventListener('click', function(){
                reserv.changeRPNum(idx+1);
            });
        }
    );
    //앵커 # 대체해 스크롤 탑 차단
    document.querySelectorAll('a[href="#"]').forEach(function(item){
        item.setAttribute('href','javascript:void(0)');
    });
});



