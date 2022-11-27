<!DOCTYPE html>
<html>
<head>
	<title>VNL Member Attendance Form</title>
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/select2.min.css"/>
</head>
<body>
	<div class="container p-5">
		<h1 class="text-center">VNL Member Attendance Form</h1>
		<div>
			<form method="POST" action="javascript:void(0);" id="attendance_form">
				<div class="mb-3">
					<label for="full_name" class="form-label">Full Name <span class="text-danger">*</span></label>
					<input type="text" name="full_name" class="form-control" id="full_name"/>
				</div>
				<div class="mb-3">
					<label for="city" class="form-label">City  <span class="text-danger">*</span></label>
					<select id="city" name="city" class="form-control"></select>
				</div>
				<div class="mb-3">
					<label for="phone_number" class="form-label">Phone Number  <span class="text-danger">*</span></label>
					<input type="text" name="phone_number" class="form-control" id="phone_number"/>
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Email address  <span class="text-danger">*</span></label>
					<input type="email" name="email" class="form-control" id="email"/>
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

		let form = $("#attendance_form");
		form.submit(function () {
			let data = form.serializeArray();
			let json = {};
			let i;

			for (i in data) {
				let key = data[i].name;
				let val = data[i].value;

				if (key === "city")
					val = parseInt(val);

				json[key] = val;
			}

			$.post({
				url: "api.php?action=submit_attendance",
				data: JSON.stringify(json),
				success: function () {
					alert("success!");
				}
			});
		});
	</script>
</body>
</html>
