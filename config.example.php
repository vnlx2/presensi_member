<?php

const DB_HOST = "127.0.0.1";
const DB_PORT = 3306;
const DB_NAME = "attendances";
const DB_USER = "root";
const DB_PASS = "";

const PDO_PARAM = [
	"mysql:host=".DB_HOST.";dbname=".DB_NAME.";port=".DB_PORT,
	DB_USER,
	DB_PASS,
	[
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
	]
];
