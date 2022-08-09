<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Sign In Modal -->
<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
    <div class="modal_header">
        <h3>Sign In</h3>
    </div>
    <form action="/login" method="post">
        <div class="sign-in-wrapper">
            <!-- <a href="#0" class="social_bt facebook">Login with Facebook</a>
            <a href="#0" class="social_bt google">Login with Google</a>
            <div class="divider"><span>Or</span></div> -->
            <div class="form-group">
                <label>email</label>
                <input type="email" class="form-control" name="email" id="login-email">
                <i class="icon_mail_alt"></i>
            </div>
            <div class="form-group">
                <label>password</label>
                <input type="password" class="form-control" name="password" id="login-pw">
                <i class="icon_lock_alt"></i>
            </div>
            <div class="clearfix add_bottom_15">
                <div class="checkboxes float-start">
                    <label class="container_check">Remember me
                        <input type="checkbox" name="autoLogin">
                        <span class="checkmark"></span>
                    </label>
                </div>
                <div class="float-end"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
            </div>
            <div class="text-center">
                <input type="button" value="Log In" class="btn_1 full-width mb_5" id="login-btn">
                Don’t have an email? <a href="/register">Sign up</a>
            </div>
            <div id="forgot_pw">
                <div class="form-group">
                    <label>Please confirm login email below</label>
                    <input type="email" class="form-control" name="email_forgot" id="email_forgot">
                    <i class="icon_mail_alt"></i>
                </div>
                <p>You will receive an email containing a link allowing you to reset your password to a new preferred
                    one.</p>
                <div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
            </div>
        </div>
    </form>
    <!--form -->
</div>
<!-- /Sign In Modal -->



<script>
    
    // 로그인시 로직 처리
    function login() {
        
        const loginBtn = document.getElementById('login-btn');
        loginBtn.onclick = e => {

            e.preventDefault();

            const inputData = {
                email: document.getElementById('login-email'),
                password: document.getElementById('login-pw')
            };
    
            const reqObj = {
                method: 'POST',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify(inputData)
            };
    
            fetch('/login', reqObj)
                .then(res => res.json())
                .then(flag => {
                    if(flag === 'SUCCESS') {
                        
                        location.href = "/";
    
                    } else if (flag === 'NO_PW') {
                        alert('일치하지 않는 비밀번호입니다.');
                    } else {
                        alert('존재하지 않는 이메일입니다.');
                    }
                });
        };
    }

    
    // 메인 실행부
    (function () {

        login();

    }) ();

</script>