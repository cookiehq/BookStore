<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>

    <script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        // 页面加载完成之后
        $(function() {

            // 给注册按钮添加事件
            $("#sub_btn").click(function() {

                // 获取用户名
                var usernameValue = $("#username").val();
                // 验证用户名是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
                var usernameReg = /^\w{5,15}$/;
                // 验证用户信息
                if (!usernameReg.test(usernameValue)) {
                    // 提示用户
                    alert("用户名不合法！");
                    return false;
                }

                // 获取密码
                var passwordValue = $("#password").val();
                // 验证密码是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
                var passwordReg = /^\w{5,15}$/;
                // 验证用户信息
                if (!passwordReg.test(passwordValue)) {
                    // 提示用户
                    alert("密码不合法！");
                    return false;
                }


                localStorage.setItem("登录状态", "1")
                // 阻止表单提交
                return true;


            });

        });
    </script>

    <link type="text/css" rel="stylesheet" href="/css/style.css">
</head>
<body>
<div id="login_header">
    <img class="logo_img" alt="" src="/img/log.jpg">
</div>

<div class="login_banner">

    <div id="l_content">
        <span class="login_word">用户注册</span>
    </div>

    <div id="content">
        <div class="login_form">
            <div class="login_box">
                <div class="tit">
                    <h1>会员</h1>

                </div>
                <div class="msg_cont">
                    <b></b>
                    <span style="color: #ff0114">${error!''}</span>
                </div>
                <div class="form">
                    <form action="/doRegister" method="post">
                        <label>用户名称：</label>
                        <input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="username" id="username" value="<#if user??>${user.username}</#if>"/>
                        <br />
                        <label>用户密码：</label>
                        <input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password" value="<#if user??>${user.password}</#if>"/>
                        <br />
                        <label>用户邮箱：</label>
                        <input class="itxt" type="email" placeholder="请输入邮箱" autocomplete="off" tabindex="1" name="email" id="email" value="<#if user??>${user.email}</#if>"/>
                        <br />
                        <label>用户手机号：</label>
                        <input class="itxt" type="text" placeholder="请输入手机号" autocomplete="off" tabindex="1" name="phone" id="phone" value="<#if user??>${user.phone}</#if>"/>
                        <br />
                        <label>用户地址：</label>
                        <input class="itxt" type="text" placeholder="请输入地址" autocomplete="off" tabindex="1" name="address" id="address" value="<#if user??>${user.address}</#if>"/>
                        <br />
                        <br />
                        <input type="submit" value="注册" id="sub_btn" />
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<div id="bottom">
			<span>
				宝藏商城.Copyright &copy;2022
			</span>
</div>
</body>
</html>

