window.onload = function(){
	new WOW().init();
}

// 제출 버튼 -> 평균 그래프 보기 버튼 -> 정책 보기 버튼 이동
        // 100은 top위치에서 100만큼 위로 조정, 50은 0.05초
        function fnMove(move) {
        	
            var offset = $("#section2" + move).offset();
            $('html, body').animate({ scrollTop: offset.top - 100 }, 50);
        }

        function fnMove2(move2) {
            var offset = $("#section3" + move2).offset();
            $('html, body').animate({ scrollTop: offset.top - 100 }, 50);
        }
        
        function fnMove3(move3) {
            var offset = $("#section4" + move3).offset();
            $('html, body').animate({ scrollTop: offset.top - 100 }, 50);
        }
