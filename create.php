
<!DOCTYPE html>
<html lang="de">
  <head>
  <meta charset="utf-8"> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Notr</title>	
</head>

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


<body>
	<a href="index.php"><img src="img/logo.png" alt="Logo" style="max-width: 200px"></img></a>
	<br>
	
	<form method="get"> 
		<a href="index.php">BACK</a>    
		<a href="edit.php">SAVE</a>  
		<br>
        <input type="text" id="title" name="title">
		<br>
		<textarea name="text" >Lorem ipsum...</textarea>
		<br>
        <input type="text" id="tags" name="tags">
		<br>		
    </form>
	 

	 </form>
	
<?php
$sql = "INSERT INTO notizen (title)
VALUES ('Testtitel5')";

if ($db->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $db->error;
}

$db->close();
?>
	

	
	 

<br><br>



<footer>
	  <p class="rechts">&copy; NOTR 2021</p>
	</footer>
</body>

 
</html>

