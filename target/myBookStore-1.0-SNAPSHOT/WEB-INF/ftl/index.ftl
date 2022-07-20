<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>商城首页</title>
		<link type="text/css" rel="stylesheet" href="/css/style.css">
		<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
		<script type="text/javascript">

			var switchPage=function(page){

				$("#page").val(page);

				$("#switchPageForm").submit();
			}


			$(function() {

				$("button[name='addBtn']").click(function(){
					let bookId = $(this).attr("id");
					let that = $(this);
					$.ajax({
						url : "/addCart",
						type : "post",
						data : "bookId="+bookId,
						dataType :"json",
						success : function(result){
							console.log("添加购物车成功："+ JSON.stringify(result))
							if(result.flag){
								alert("添加购物车成功！！！")
							}
						},
						error : function (err) {
							console.log("添加购物车失败！",JSON.stringify(err))
							// alert("请登录！")
						}
					})
				})


				//修改右上角登录成功的信息
				if ("1" == localStorage.getItem("登录状态")) {
					$("#state").text("欢迎光临");
					$("#state").attr("href", "");
					$("#state2").text("退出登录");
					$("#state2").attr("href", "/logout");
					$("#state2").click(function() {
						localStorage.setItem("登录状态", 0)
					});

					var sptimes = 0
					//加入购物车按钮
					var add = $(".add");
					add.click(function() {
						//所有sp2
						var a = $(this).parent().parent().find(".sp2");

						//设置xxx加入购物车
						sptimes++
						localStorage.setItem("书本", a[0].innerHTML + "," + sptimes + "," + a[2].innerHTML + "," + sptimes * a[2].innerHTML);
						var last = $("#last");
						last.html(a[0].innerHTML);

						//库存减减
						var store = $(this).parent().parent().find(".book_amount").find(".sp2");

						store[0].innerHTML = parseInt(store[0].innerHTML) - 1;

						//销量加加
						var sales = $(this).parent().parent().find(".book_sales").find(".sp2");

						sales[0].innerHTML = parseInt(sales[0].innerHTML) + 1;

					});

				} else {
					$("#state").text("请登录");

					$(".add").click(function() {

						alert("请登录再添加购物车");
					});

				}

				//查看购物车的信息
				if ($("#poject").text(localStorage.getItem("商品数量")) == null) {
					$("#poject").text(3);
				} else {
					$("#poject").text(localStorage.getItem("商品数量"));
				}

				//查询按钮****************
				$("#quary").click(function() {
					var min = $("#min").val();
					var max = $("#max").val();
					var bookall = $(".book_price");
					var f = bookall.find(".sp2");
					//重置
					for (i = 0; i < bookall.length; i++) {
						f[i].style.backgroundColor = "";

					}
					//显示高亮
					for (i = 0; i < bookall.length; i++) {
						if (min < f[i].innerHTML && max > f[i].innerHTML) {
							f[i].style.backgroundColor = "#FFFF88";
							//var prices = f[i].style.backgroundColor = "#FFFF88";
							//var prices=f[i].css{"backgroundColor" ,"#FFFF88" };
						}
					}
				});
			});
		</script>
	</head>

	<body>

		<div id="header">
			<img class="logo_img" alt="" src="/img/log.jpg">
			<span class="wel_word">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宝藏商城</span>
			<div>
				<a href="/login" id="state">登录</a> |
				<a href="/register" id="state2">注册</a> &nbsp;&nbsp;
				<a href="/cart">购物车</a>

			</div>
		</div>
		<div id="main">
			<div id="book">
				<div class="book_cond">
					<form action="/book" method="post">
						价格：<input id="minPrice" type="text" name="minPrice" value="<#if minPrice??>${minPrice}</#if>"> 元 -
						<input id="maxPrice" type="text" name="maxPrice" value="<#if maxPrice??>${maxPrice}</#if>"> 元
						<input id="quary" type="submit" value="查询" />
					</form>
				</div>
				<div style="text-align: center">
					您的购物车中有<span id="poject">3</span>件商品
					<div>
						您刚刚将<span style="color: red" id="last">软件测试方法和技术</span>加入到了购物车中
					</div>
				</div>

				<if bookList??>
					<#list bookList as book>
						<div class="b_list">
							<div class="img_div">
								<img class="book_img" alt="" src="/img/${book.img}" />
							</div>
							<div class="book_info">
								<div class="book_name">
									<span class="sp1">书名:</span>
									<span class="sp2">${book.name}</span>
								</div>
								<div class="book_author">
									<span class="sp1">作者:</span>
									<span class="sp2">${book.author}</span>
								</div>
								<div class="book_price">
									<span class="sp1">价格:</span>
									<span class="sp2">${book.price}</span>
								</div>
								<div class="book_sales">
									<span class="sp1">销量:</span>
									<span class="sp2">${book.sales}</span>
								</div>
								<div class="book_amount">
									<span class="sp1">库存:</span>
									<span class="sp2">${book.inventory}</span>
								</div>
								<div class="book_add">
									<button name="addBtn" id="${book.id}" class="add" >加入购物车</button>
								</div>
							</div>
						</div>
					</#list>
				</if>
			</div>
			<div id="page_nav">
				<form action="/book" method="post" id="switchPageForm">
					<a href="#" onclick="switchPage(1)">首页</a>

					<#if page gt 1 >
						<a href="#" onclick="switchPage(${page-1})">上一页</a>
						<a href="#" onclick="switchPage(${page-1})">${page-1}</a>
					</#if>
					<a href="#" style="color: red" >${page}</a>
					<#if page lt pagenum >
						<a href="#" onclick="switchPage(${page+1})">${page+1}</a>
						<a href="#" onclick="switchPage(${page+1})">下一页</a>
					</#if>
					<a href="#" onclick="switchPage(${pagenum})">末页</a>

					共${pagenum}页，${total}条记录 到第<input style="width: 20px" value="" name="page" id="page" />页
					<input type="hidden" name="minPrice" value="<#if minPrice??>${minPrice}</#if>">
					<input type="hidden" name="maxPrice" value="<#if maxPrice??>${maxPrice}</#if>">
					<input type="submit" value="确定">
				</form>
			</div>

		</div>

		<div id="bottom">
			<span>
				宝藏商城.Copyright &copy;2022
			</span>
		</div>
	</body>
</html>
