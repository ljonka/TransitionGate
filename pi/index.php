<?php

$aid = $_GET["aid"];

$db = new SQLite3("android-door.db");

$result = $db->query("
		SELECT * 
		FROM ids 
		WHERE aid = '".$db->escapeString($aid)."'"
	);
if($result->numColumns >= 1){
	shell_exec("sudo /bin/opendoor");
}
