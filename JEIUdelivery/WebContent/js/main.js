document.addEventListener("DOMContentLoaded", function() {
    var modal = document.getElementById('myModal');
    var span = document.getElementsByClassName("close")[0];
    
    // 버튼에 이벤트 리스너 추가
    document.querySelectorAll('.abtn2').forEach(function(button) {
        button.onclick = function() {
            var indexNum = this.dataset.index; // 버튼에서 data-index 속성을 읽음
            
            // AJAX 요청
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'view.jsp?indexNum=' + indexNum, true);
            xhr.onload = function() {
                if (xhr.status === 200) {
                    document.getElementById('modal-body').innerHTML = xhr.responseText;
                    modal.style.display = "block";

                    // 모달이 로드된 후에 수정 버튼 이벤트 리스너 설정
                    var modifyBtn = document.getElementById('modifyBtn');
                    if (modifyBtn) {
                        modifyBtn.onclick = function() {
                            var indexNum = this.dataset.index; // 데이터 속성에서 인덱스 번호 읽기
                            window.location.href = "modify.jsp?indexNum=" + indexNum; // URL 설정
                        };
                    }
                } else {
                    alert('Content load failed.');
                }
            };
            xhr.send();
        };
    });

    // 모달 닫기 이벤트
    span.onclick = function() {
        modal.style.display = "none";
    };

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
});
