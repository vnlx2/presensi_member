<!DOCTYPE html>
<html>
<head>
	<title>VNL Member Attendance Form</title>
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/select2.min.css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/sweetalert2.min.css"/>
</head>
<body>
	<div class="container p-5">
		<h1 class="text-center">VNL Member Attendance Form</h1>
		<h3 class="text-center">3rd and 4th Dec 2022 (VNL Booth Senayan Park)</h3>
		<div>
			<form method="POST" action="javascript:void(0);" id="attendance_form">
				<div class="mb-3">
					<label for="full_name" class="form-label">Full Name <span class="text-danger">*</span></label>
					<input type="text" name="full_name" class="form-control" id="full_name" required/>
				</div>
				<div class="mb-3">
					<label for="city" class="form-label">City  <span class="text-danger">*</span></label>
					<select id="city" name="city" class="form-control" required></select>
				</div>
				<div class="mb-3">
					<label for="phone_number" class="form-label">Phone Number  <span class="text-danger">*</span></label>
					<input type="text" name="phone_number" class="form-control" id="phone_number" required/>
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Email address  <span class="text-danger">*</span></label>
					<input type="email" name="email" class="form-control" id="email" required/>
				</div>
				<div class="border container p-3 border-3 border-dark rounded-3">
					<h4>Social Media Accounts</h4>
					<p class="text-danger">Must be filled at least one!</p>
					<div class="mb-3">
						<label for="facebook_id" class="form-label">Facebook ID / Username</label>
						<input type="text" name="facebook_id" class="form-control" id="facebook_id"/>
					</div>
					<div class="mb-3">
						<label for="twitter_username" class="form-label">Twitter Username</label>
						<input type="text" name="twitter_username" class="form-control" id="twitter_username" placeholder="@username"/>
					</div>
					<div class="mb-3">
						<label for="discord_username" class="form-label">Discord Username</label>
						<input type="text" name="discord_username" class="form-control" id="discord_username" placeholder="username#1234"/>
					</div>
					<div class="mb-3">
						<label for="github_username" class="form-label">GitHub Username</label>
						<input type="text" name="github_username" class="form-control" id="github_username" placeholder="@username"/>
					</div>
				</div>
				<button type="submit" class="btn btn-primary mt-3">Submit</button>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="assets/js/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/select2.full.min.js"></script>
	<script type="text/javascript" src="assets/js/sweetalert2.all.min.js"></script>
	<script type="text/javascript">
		function load_select2_city(data)
		{
			$("#city").select2({
				data: data.results
			});
		}

		$.ajax({
			url: "assets/regions.json",
			dataType: "json",
			success: load_select2_city
		});

		function form_err(msg, title = null)
		{
			Swal.fire({
				title: (title ? title : "Invalid Input"),
				text: msg,
				icon: "error"
			});
		}

		function form_ok(callback)
		{
			Swal.fire({
				title: "Submission Success!",
				text: "Thank you for your attendance, your data has been saved!",
				icon: "success"
			}).then(callback);
		}

		function validate_form(j)
		{
			if (!j.full_name.match(/^[a-z\.\'\ ]+$/i)) {
				form_err("The full name must match with /^[a-z\\.\\'\\ ]+$/i regex pattern!");
				return false;
			}

			if (!j.phone_number.match(/^((\+?62)|(0))\d+$/i)) {
				form_err("The phone number must match with /^((\\+?62)|(0))\\d+$/i regex pattern!");
				return false;
			}

			const social_media = [
				"facebook_id",
				"twitter_username",
				"discord_username",
				"github_username",
			];
			let social_media_is_filled = false;
			let i;

			for (i in social_media) {
				if (j[social_media[i]] !== null) {
					social_media_is_filled = true;
					break;
				}
			}

			if (!social_media_is_filled) {
				form_err("Social media accounts must be filled at least one");
				return false;
			}

			return true;
		}

		let form = $("#attendance_form");
		form.submit(function () {
			let data = form.serializeArray();
			let json = {};
			let i;

			for (i in data) {
				let key = data[i].name;
				let val = data[i].value;

				val = val.trim();
				if (key === "city")
					val = parseInt(val);

				if (val === "")
					val = null;

				json[key] = val;
			}

			console.log(json);
			if (!validate_form(json))
				return;

			$.post({
				url: "api.php?action=submit_attendance",
				data: JSON.stringify(json),
				success: function () {
					form_ok(function () {
						window.location = "";
					});
				},
				error: function (res) {
					let j = res.responseJSON;

					if ("error" in j)
						form_err(j.error, "Bad Request");
					else
						form_err("Unknown error!", "Server Error");
				}
			});
		});
	</script>
</body>
</html>
