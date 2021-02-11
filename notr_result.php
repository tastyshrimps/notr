
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
	<img src="img/logo.png" alt="Logo" style="max-width: 200px"></img>
    
    <form> 
        <input type="text" id="search" name="search"><br>
        <a href="notr_result.php"><button>Search</button></a>
		
        <a href="notr_create?title=<?php $_GET['search'];?>"><button>Create</button></a>
     </form>
<br><br>

<?php		
	$sql = "SELECT * 
			FROM notizen a 
			JOIN notizen_text b 	ON a.ID=b.ID_notizen  
			JOIN text c 			ON c.ID=b.ID_text
			WHERE c.section LIKE '%".$_GET['search']."%'";
			
    foreach ($db->query($sql) as $row) 
    {
        echo $row['title'].'<a href="notr_edit?id='.$row['ID'].'"><button>Edit</button></a>
		<a href="notr_delete?id='.$row['ID'].'"><button>Delete</button></a><br />'; 

		
		
    }
?>

<footer>
	  <p class="rechts">&copy; NOTR 2021</p>
	</footer>
</body>

 
</html>

