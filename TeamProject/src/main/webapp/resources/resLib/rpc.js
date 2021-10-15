let reserv = {
    totalCount: 0, 
    rprice: 0,
    
    //가격계산
    reCalc: function(){
        this.totalCount = 0;
        this.rprice = 0;
        document.querySelectorAll(".rperson").forEach(function (item) {
            if(item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true){
                var count = parseInt(item.getAttribute('value'));
                this.totalCount += count;
                var cprice = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
                this.rprice += count * cprice;
            }
        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
    },
    //화면 업데이트
    updateUI: function () {
        document.querySelector('#sum_rperson').textContent = '인원수: ' + this.totalCount.formatNumber() + '명';
        document.querySelector('#rprice').textContent = '합계금액: ' + this.rprice.formatNumber() + '원';
    },
    
}

// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function(){
    if(this==0) return 0;
    let regex = /(^[+-]?\d+)(\d{3})/;
    let nstr = (this + '');
    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
    return nstr;
};