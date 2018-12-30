// ターボリンクス設定するか。
$(document).on('turbolinks:load', function() {
	$(function(){
		$(".modal-open").click(function(){
			// モーダル内の情報を初期化
			$(".title-area").empty();
			$(".author-area").empty();
			$(".quote-area").empty();
			$(".comment-area").empty();
			$(".item-image-area").empty();
			$(".rakuten-link").empty();
			// モーダルに表示したい情報を定義
			var title = $(this).attr("data-title");
			var author = $(this).attr("data-author");
			var quote = $(this).attr("data-quote");
			var comment = $(this).attr("data-comment");
			var image = $(this).attr("data-image");
			var url = $(this).attr("data-url");
			console.log();
			$(".title-area").append(title);
			$(".author-area").append(author);
			$(".quote-area").append(quote);
			$(".comment-area").append(comment);
			$(".item-image-area").append(`<img src="${image}">`);
			$(".rakuten-link").append(`<a href="${url}">商品詳細</a>`);
			// bodyの最後に背景エリアのHTMLを追加
			$("body").append('<div id = "modal-bg"></div>');
			// 画面中央を計算する関数を呼び出し
			modalResize();
			// モーダルと背景をゆっくり表示""
			$("#modal-main,#modal-bg").fadeIn("slow");
			// 画面のどこかをクリックしたらモーダルを閉じる。背景のHTMLを削除
			$("#modal-main,#modal-bg").click(function(){
				$("#modal-main,#modal-bg").fadeOut("slow",function(){
					$('#modal-bg').remove();
				});
			});

		// ウィンドウサイズが変わったらmodalResizeを実行
		$(window).resize(modalResize);
		// modalResize関数を定義
			function modalResize(){
				// ウィンドウのサイズを測り、変数に代入
				var w = $(window).width();
				var h = $(window).height();
				// モーダルのサイズを測り、変数に代入
				var cw = $("#modal-main").outerWidth();
				var ch = $("#modal-main").outerHeight();
				// モーダルのCSSに位置情報を追加
				$("#modal-main").css({
					"left": ((w - cw) / 2) + "px",
					"top": ((h - ch) / 2) + "px"
				});
			}
		});
	});
 });