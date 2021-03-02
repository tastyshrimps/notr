
<!DOCTYPE html>
<html lang="de">
  <head>
  <meta charset="utf-8"> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Notr</title>	
</head>

<?php #Datenbank
	# Einkommentieren, um PHP-Version herauszufinden:
	# phpinfo();
	
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
			<?php #Inhalt der Felder der vorherigen Seite
			$title = $_POST["title"];
			$text = $_POST["text"];
			$save = $_POST["to_save"];
			echo $title . $text . $save;
						# isset — Prüft, ob eine Variable deklariert ist und sich von null unterscheidet
			if($save = "1"){
				
				# Titel und Text speichern, IDs zurückbekommen
				$sql_title = "INSERT INTO notizen (title)
							VALUES ('".$_POST["title"]."')";
							
				$sql_text = "INSERT INTO text (section)
							VALUES ('".$_POST["text"]."')";	
								
				$db->query($sql_title);
				# https://stackoverflow.com/questions/43380996/php-insert-and-save-last-insert-id-into-a-variable/44866958#44866958
				$notizen_id = $db->lastInsertId();
				
				$db->query($sql_text);
				$text_id = $db->lastInsertId();				

				echo $notizen_id . " " . $text_id;
				
				# IDs in Zwischentabelle schreiben				
				$sql_notizen_text = "INSERT INTO notizen_text (ID_notizen, ID_text) VALUES ($notizen_id, $text_id)";				
				$db->query($sql_notizen_text);
				
				# Umleiten auf nächste Seite
				# Dies funktioniert nicht, weil nur action die Feldinhalte per Post übergeben kann, header aber nicht:
				#header("location:edit.php");
				# Problem bei action: Führt dieses PHP nicht aus
				$save = "0";
			}
		?>

	
	<!-- Beim Klick auf SAVE Seite wechseln -->
	<form method="post"> 
	

		
		<a href="index.php">BACK</a>
		<input type="submit" name="SAVE" value="SAVE"/>
		<button type="button">DELETE</button><br>	
        <input type="text" id="title" name="title" value="<?php echo $title;?>"><br>
		
		<!-- textarea hat kein value-Attribut, einfach direkt php rein -->
		<textarea name="text"><?php echo $text;?></textarea><br>
		<input type="hidden" name="to_save" id="to_save"/>		
        <!-- <input type="text" id="tags" name="tags"--><br>	
			
	

	
    </form>
<br><br>

<footer>
	  <p class="rechts">&copy; NOTR 2021</p>
	</footer>
</body>

 
</html>

