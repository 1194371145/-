$(document).ready(function() {
	$('.yhqajax').submit(function() {
		$.ajax({
			url:$(this).attr('action'),
			type:$(this).attr('method'),
			data:$(this).serialize(),
			success: function(data) {
				if(data.code == 1) {
					if(data.url != '') {
						location=data.url;
					} else {
						alert(data.msg);
					}
				} else if(data.code == 2) {
					location.reload();
				} else {
					alert(data.msg);
				}
			},
			error:function(e) {
				alert('网络错误！');
			}
		});
		return false;
	});
});