<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>

    <link type="text/css" rel="stylesheet" href="/css/style.css">
    <script src="/js/jquery-1.7.2.js"></script>
    <script>

        $(function () {
            $("button[name='deleteBtn']").click(function(){
                // let name = $(this).parent().parent().find("td:eq(0)").text();
                let id = $(this).attr("id");
                let that = $(this);
                $.ajax({
                    url : "/deleteCartById",
                    type : "post",
                    data : "id="+id,
                    dataType :"json",
                    success : function(result){
                        console.log("根据用户名删除响应成功："+ JSON.stringify(result))
                        if(result.flag){
                            alert("删除成功！！！")
                            that.parent().parent().remove();
                        }
                    },
                    error : function (err) {
                        console.log("根据用户名删除用户失败",err)
                    }
                })
            }),
            $("button[name='clearBtn']").click(function(){
                let trs = $("tr[name='carts']");
                $.ajax({
                    url : "/deleteCart",
                    type : "post",
                    //data : "name="+name,  //
                    dataType : "json",
                    success : function(result){

                        console.log("清空购物车响应成功："+ JSON.stringify(result))
                        if(result.flag){
                            alert("清空购物车成功！！！")

                            let array =[10,10];
                            $.each(trs,function (index,item){
                                item.remove();
                            })

                            // trs.each(function (index,item) {
                            //     $(this).remove();
                            // })
                        }
                    },

                    error : function (err) {
                        console.log("清空购物车失败",err)
                    }
                })
            })
        })

        window.onload = function() {

            //更新
            upm();
            ups();
            pros();
            //更新金额
            function upm() {
                var money = document.getElementsByName("money")
                var price = document.getElementById("b_price");
                var p = 0;
                for (var i = 0; i < money.length; i++) {
                    p = p + Number(money[i].innerHTML);
                }
                price.innerHTML = p
            }

            //更新商品数量
            function ups() {
                var count = document.getElementById("b_count");
                var nums = document.getElementsByClassName("nums");
                var s = 0;

                for (var i = 0; i < nums.length; i++) {
                    s = s + Number(nums[i].innerHTML);
                }

                count.innerHTML = s;
            }
            //获取商品的件数
            function pros() {
                project = document.getElementById("tb1").getElementsByTagName("tr");
                localStorage.setItem("商品数量", project.length - 1);
            }

        }
    </script>
</head>
<body>

<div id="header">
    <img class="logo_img" alt="" src="/img/log.jpg">
    <span class="wel_word">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;购物车</span>
    <div>
        <span>欢迎<span class="um_span">普通会员</span>光临宝藏商城</span>
        <a href="/cart">我的订单</a>
        <a href="/index">注销</a>&nbsp;&nbsp;
        <a href="/book">返回</a>
    </div>
</div>

<div id="main">

    <table id="tb1">
        <tr>
            <td>商品名称</td>
            <td>数量</td>
            <td>单价</td>
            <td>金额</td>
            <td>操作</td>
        </tr>
        <if cartList??>
            <#list cartList as cart>
                <tr name="carts">
                    <td>${cart.book.name}</td>
                    <td class="nums">${cart.num}</td>
                    <td name="money">${cart.book.price}</td>
                    <td>${cart.getTotal()}</td>
                    <td><button name="deleteBtn" id="${cart.id}">删除</button></td>
                </tr>
            </#list>
        </if>


    </table>

    <div class="cart_info">
        <span class="cart_span">购物车中共有<span id="b_count">4</span>件商品</span>
        <span class="cart_span">总金额<span id="b_price">90.00</span>元</span>
        <span class="cart_span"><button name="clearBtn">清空购物车</button></span>
        <span class="cart_span"><a href="#">去结账</a></span>
    </div>

</div>

<div id="bottom">
			<span>
				宝藏商城.Copyright &copy;2022
			</span>
</div>
</body>
</html>

