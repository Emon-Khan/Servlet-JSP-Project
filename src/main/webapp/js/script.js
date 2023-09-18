$(document).ready(function() {
	let editStatus = false;
	$("#edit_profile_button").click(function() {
		if (editStatus == false) {
			$("#profile-details").hide();
			$("#profile-edit").show();
			editStatus = true;
			$(this).text("Back");
		} else {
			$("#profile-details").show();
			$("#profile-edit").hide();
			editStatus = false;
			$(this).text("Edit");
		}

	})
});

$(document).ready(function(e) {
	$("#add-post-form").on("submit", function(event) {

		event.preventDefault();
		console.log("You have clicked on the post button");
		let form = new FormData(this);
		$.ajax({
			url: "AddPostServlet",
			type: 'POST',
			data: form,
			success: function(data, textStatus, jqXHR) {
				console.log(data);
			},
			error: function(jqXHR, textStatus, errorThrown) {

			},
			processData: false,
			contentType: false
		})
	})
})