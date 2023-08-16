/*가입완료*/
$(document).ready(function() {
    $(".buttonS").click(function(event) {
        event.preventDefault(); // 기본 동작 중단

        // 입력값 확인
        var id = $("input[name='id']").val();
        var name = $("input[name='name']").val();
        var password = $("input[name='password']").val();
        var confirmPassword = $("input[name='confirmPassword']").val();

        if (id === "" || name === "" || password === "" || confirmPassword === "") {
            alert("빈 칸을 모두 입력하세요.");
            return;
        }

        if (password !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }

        // 중복 검사 결과 확인
        var result_checkId = $("#result_checkId").text();
        if (result_checkId !== "사용 가능한 아이디입니다.") {
            alert("아이디 중복 검사 후 가입 버튼을 눌러주세요.");
            return;
        }

        // 회원가입 데이터를 서버로 전송
        $.ajax({
            type: "POST",
            url: "join.do",
            data: $("form").serialize(),
            success: function(response) {
                // 회원가입 완료 후 알림 표시
                alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
                // 로그인 페이지로 이동
                window.location.href = "login.do"; // 로그인 페이지 경로로 수정하세요.
            },
            error: function(xhr, status, error) {
                alert("회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    });
		/*아이디 중복 검사*/
    $("#checkId").click(function() {
        let id = $("#id").val();
        
                if (id === "") {
            alert("아이디를 입력해주세요.");
            return;
        }
        
        $.ajax({
            type: 'post',
            url: "checkId.do", // 컨트롤러로 가는 mapping 입력
            data: { "id": id },
            dataType: "json",
            success: function(data) { 
                if (data.status === "N") {
                    result = "사용 가능한 아이디입니다.";
                    $("#result_checkId").html(result).css("color", "green");
                    $("#password").trigger("focus");
                } else {
                    result = "이미 사용중인 아이디입니다.";
                    $("#result_checkId").html(result).css("color", "red");
                    $("#id").val("").trigger("focus");
                }
            },
            error: function(error) {
                alert("error: " + error);
            }
        });
    });
});
