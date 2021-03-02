
<!DOCTYPE html>
<html lang="de">
  <head>
  <meta charset="utf-8"> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Notr</title>	
</head>

<?php
	# Auskommentieren, um PHP-Version herauszufinden
	#phpinfo();
	
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

<body>
	<a href="index.php">
		<img src="img/logo.png" alt="Logo" style="max-width: 200px"></img>
	</a>
	<br>
	
	<!-- Beim Klick auf SAVE Seite wechseln -->
	<!-- action = "edit.php" funktioniert nicht weil dann php nicht ausgeführt wird-->
	<form  method="post" action = "edit.php" > 
		
		<!-- Buttons und Felder -->
		<a href="index.php">BACK</a>
		<input  type="submit" name="SAVE" value="SAVE"/><br>
        <input type="text" id="title" name="title"><br>
		<textarea name="text" ></textarea><br>
		<input type="hidden" name="to_save" id="to_save" value="1"/>
        <!-- <input type="text" id="tags" name="tags"--><br>	


			
					

	
    </form>
<br><br>

<footer>
	  <p class="rechts">&copy; NOTR 2021</p>
	</footer>
</body>

 
</html>

