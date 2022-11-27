<!DOCTYPE html>
<html>
<head>
	<title>VNL Member Attendance Form</title>
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/select2.min.css"/>
</head>
<body>
	<div class="container">
		<h1 class="text-center">VNL Member Attendance Form</h1>
		<div>
			<form>
				<div class="mb-3">
					<label for="full_name" class="form-label">Full Name</label>
					<input type="text" class="form-control" id="full_name"/>
				</div>
				<div class="mb-3">
					<label for="phone_number" class="form-label">Phone Number</label>
					<input type="text" class="form-control" id="phone_number"/>
				</div>
				<div class="mb-3">
					<label for="city" class="form-label">City</label>
					<select id="city" class="form-control"></select>
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Email address</label>
					<input type="email" class="form-control" id="email"/>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
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
	</script>
</body>
</html>
