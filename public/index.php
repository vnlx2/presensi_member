<!DOCTYPE html>
<html>
<head>
	<title>VNL Member Attendance Form</title>
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
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
					<label for="phone_number" class="form-label">City</label>
					<select class="form-select" aria-label="Default select example">
						<option value="" selected>Open this select menu</option>
					</select>
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Email address</label>
					<input type="email" class="form-control" id="email"/>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
</body>
</html>
