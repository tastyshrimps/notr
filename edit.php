<?php include('structure/header.php'); ?>
	<br>
	<?php 
		#Inhalt der Felder der vorherigen Seite
		$save = "0";
		$title = $_POST["title"];
		$text = $_POST["text"];
		$save = $_POST["to_save"];
		echo "Titel " . $title . " Text ". $text . " Save " . $save;
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

			echo "NotizID " . $notizen_id . " TextID " . $text_id;
			
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

<?php include('structure/footer.php'); ?>

