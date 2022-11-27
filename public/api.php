<?php

require __DIR__."/../helpers.php";

date_default_timezone_set("UTC");

function err_msg(int $code, string $msg): array
{
	return [
		"code"  => $code,
		"error" => $msg
	];
}

if (!isset($_GET["action"]) || !is_string($_GET["action"])) {
	$code = 400;
	$msg = err_msg($code, "Missing \"action\" string parameter");
	goto out;
}

const SOCIAL_MEDIA = [
	"facebook_id",
	"twitter_username",
	"discord_username",
	"github_username",
];

function submit_attendance(): array
{
	if ($_SERVER["REQUEST_METHOD"] !== "POST")
		return [405, err_msg(405, "Method not allowed!")];

	$j = json_decode(file_get_contents("php://input"), true);
	if (!is_array($j))
		return [400, err_msg(400, "Invalid input request")];

	if (!isset($j["full_name"]) || !is_string($j["full_name"]))
		return [400, err_msg(400, "Missing \"full_name\" string argument!")];

	if (!isset($j["city"]) || !is_integer($j["city"]))
		return [400, err_msg(400, "Missing \"city\" integer argument!")];

	if (!isset($j["phone_number"]) || !is_string($j["phone_number"]))
		return [400, err_msg(400, "Missing \"phone_number\" string argument!")];

	if (!isset($j["email"]) || !is_string($j["email"]))
		return [400, err_msg(400, "Missing \"email\" string argument!")];

	$social_media_is_filled = false;
	foreach (SOCIAL_MEDIA as $sc) {
		if (!isset($j[$sc]))
			continue;

		if (!is_string($j[$sc]))
			return [400, err_msg(400, "Argument \"{$sc}\" has to be a string")];

		$social_media_is_filled = true;
	}

	if (!$social_media_is_filled)
		return [400, err_msg(400, "Social media accounts must be filled at least one")];

	try {
		$pdo = pdo();
		$st = $pdo->prepare(<<<SQL
			INSERT INTO `attendances`
			(
				`city_id`,
				`full_name`,
				`phone_number`,
				`email`,
				`facebook_id`,
				`twitter_username`,
				`discord_username`,
				`github_username`,
				`created_at`
			) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);
		SQL);
		$st->execute([
			$j["city"],
			$j["full_name"],
			$j["phone_number"],
			$j["email"],
			$j["facebook_id"],
			$j["twitter_username"],
			$j["discord_username"],
			$j["github_username"],
			date("Y-m-d H:i:s")
		]);
		return [200, err_msg(200, "Success!")];
	} catch (PDOException $e) {
		return [500, err_msg(500, "Database error: ".$e->__toString())];
	}
}

switch ($_GET["action"]) {
case "submit_attendance":
	[$code, $msg] = submit_attendance();
	break;

default:
	$code = 400;
	$msg = err_msg($code, "Invalid action {$_GET["action"]}");
	break;
}


out:
http_response_code($code);
header("Content-Type: application/json");
echo json_encode($msg, JSON_PRETTY_PRINT);
