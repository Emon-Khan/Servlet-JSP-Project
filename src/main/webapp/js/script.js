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