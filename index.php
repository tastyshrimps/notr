
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
    <h1>NOTR - Note Repository</h1>
    <form> 
        <input type="text" id="search" name="search"><br>
        <button type="submit">Search</button>
        <button type="reset">Create</button>
     </form>
<br><br>

<?php
    $sql = "SELECT * FROM notizen";
    foreach ($db->query($sql) as $row) 
    {
         echo $row['title']."<button>Edit</button><button>Delete</button><br />";   
    }
?>

<footer>
	  <p class="rechts">&copy; NOTR GmbH</p>
	</footer>
</body>

 
</html>

