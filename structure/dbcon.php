<?php
	
	$servername = "localhost";
	$username = "root";
	$password = "";
	$database = "notr";
	$charset = "utf8";

	try 
	{
		$db = new PDO("mysql:host=$servername;dbname=$database;charset=$charset", $username, $password);
		$db -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		//echo "Verbindung hergestellt";
	} 
	catch (PDOException $e) 
	{
		echo "Verbindung fehlgeschlagen";
		//echo ": " . $e->getMessage();
	}
?>