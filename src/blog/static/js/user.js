function handle_reg() {
	var name = $("#uname").val();
	var email = $("#uemail").val();
	var real_name = $("#real_name").val();
	var passw = $("#passw").val();
	var passw2 = $("#passw2").val();
	$.post("/reg", { uname: name, rname: real_name, uemail: email, passw:passw, passw2:passw2 })
		.done(function( data ) {
			if (data=="ok") {
				alert( "reg success" );
			}
		})
		.fail(function(jqXHR, err){
			alert( "reg " +  err +" : " + jqXHR.responseText );
		});
}