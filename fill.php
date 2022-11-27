<?php

require __DIR__."/helpers.php";

$provinces = json_decode(file_get_contents(__DIR__."/public/assets/regions.json"), true);

$pdo = pdo();
$st = $pdo->prepare("INSERT INTO provinces (name) VALUES (?)");
$st2 = $pdo->prepare("INSERT INTO cities (id, province_id, name) VALUES (?, ?, ?)");

foreach ($provinces["results"] as $province) {
	if ($province["text"] === "Province")
		continue;

	$st->execute([$province["text"]]);
	$province_id = $pdo->lastInsertId();

	foreach ($province["children"] as $city)
		$st2->execute([$city["id"], $province_id, $city["text"]]);
}

