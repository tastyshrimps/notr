<?php include('structure/header.php');
	
	# INSERT (Inhalt der Felder der vorherigen Seite CREATE.php)
	if($_POST["to_save"] == "1"){
		$title = $_POST["title"];
		$text = $_POST["text"];
		
		# Titel und Text speichern, IDs zurückbekommen
		
		$sql_title = "INSERT INTO notizen (title)
					VALUES ('".$_POST["title"]."')";
		$db->query($sql_title);
		$notizen_id = $db->lastInsertId();
					
		$sql_text = "INSERT INTO text (section)
					VALUES ('".$_POST["text"]."')";	
		$db->query($sql_text);
		$text_id = $db->lastInsertId();				
		
		# IDs in Zwischentabelle schreiben				
		$sql_notizen_text = "INSERT INTO notizen_text (ID_notizen, ID_text) VALUES ($notizen_id, $text_id)";				
		$db->query($sql_notizen_text);
		
		# Umleiten auf nächste Seite
		# Dies funktioniert nicht, weil nur action die Feldinhalte per Post übergeben kann, header aber nicht:
		# header("location:edit.php");
		# Problem bei action: Führt dieses PHP nicht aus
		
		
		# Jedes Wort im Feld tags in Tags inserten und in Notizen-Tags inserten, wenn es noch nicht existiert
		
		# Für jedes Wort in tags
		# Text in Tags [$_POST['tags']]
			# Exisitert noch nicht
				# lege an, gebe id zurück
			# Existiert schon
				# gebe id zurück
				
			# Lege notizen - tags an	
			
		function insertTags($db, $sql, $parameters){
			$q = $db->prepare($sql);
			$q->execute($parameters);
		}

        $tagtext = $_POST['tags'];
        $tags = array();
		$tags = explode(" ", $tagtext );
		echo "Tagarray Test <br>" . $tags[0] . "@@" . $tags[1] . "@@" . sizeof($tags);

		for ($i = 0; $i<sizeof($tags); $i++){
		# ignore: Ignoriert Fehler. UK auf name, also kein insert (und kein Fehler) bei Doppeleintrag
			# Unique Key über name verhindert Doppeleinträge
			insertTags($db, "
				INSERT IGNORE INTO TAGS (NAME) 
				VALUES (REPLACE(?, '#', ''))", [$tags[$i]]);
			
			# Unique Key über ID_tags, ID_notizen verhindert Doppeleinträge
			insertTags ($db, "
				insert ignore into notizen_tags (ID_tags, ID_notizen) values ((SELECT ID FROM TAGS ORDER BY ID DESC limit 1), (SELECT ID FROM NOTIZEN ORDER BY ID DESC limit 1))", []);
		}		
	}
	
	# SELECT (Inhalt zur ID)
	else{
		# SELECT values for given ID
		
		# BEREITS INJECTION-PROOF: https://stackoverflow.com/questions/11928136/return-one-value-from-database-with-mysql-php-pdo/11928442
		function getSingleValue($db, $sql, $parameters){
			$q = $db->prepare($sql);
			$q->execute($parameters);
			return $q->fetchColumn();
		}
		
		$notizen_id =  $_POST["ID"]; 
		
		$title = getSingleValue($db, "SELECT TITLE FROM notizen WHERE ID =?", [$_POST["ID"]]);
				
		$text = getSingleValue($db, "
		SELECT SECTION 
		FROM NOTIZEN A 
		JOIN NOTIZEN_TEXT B ON A.ID = B.ID_NOTIZEN
		JOIN TEXT C ON B.ID_TEXT = C.ID
		WHERE A.ID =?", [$_POST["ID"]]);
		
		$tags = getSingleValue($db, "
		SELECT group_concat('#', C.NAME SEPARATOR ' ') FROM NOTIZEN A JOIN NOTIZEN_TAGS B ON A.ID = B.ID_NOTIZEN JOIN TAGS C ON B.ID_TAGS = C.ID WHERE A.ID = ?", [$_POST["ID"]]); 
		
	}

	# UPDATE
	if(isset($_POST['SAVE'])){
		function updateData($db, $sql, $parameters){
			$q = $db->prepare($sql);
			$q->execute($parameters);
		}
		
		# Notizen
		updateData($db, "
		UPDATE notizen 
		SET title = '".$_POST["title"]."' 
		WHERE ID =?", [$_POST['notizen_id']]);
		
		# Text
		updateData($db, "
		UPDATE text 
		SET SECTION = '".$_POST["text"]."' 
		WHERE ID = (SELECT C.ID
		FROM NOTIZEN A 
		JOIN NOTIZEN_TEXT B ON A.ID = B.ID_NOTIZEN
		JOIN TEXT C ON B.ID_TEXT = C.ID
		WHERE A.ID =?)", [$_POST['notizen_id']]);	

		# Tags
		function updateTags($db, $sql, $parameters){
			$q = $db->prepare($sql);
			$q->execute($parameters);
		}
        $tagtext = $_POST['tags'];
        $tags = array();
		$tags = explode(" ", $tagtext );

		for ($i = 0; $i<sizeof($tags); $i++){
		# ignore: Ignoriert Fehler. UK auf name, also kein insert (und kein Fehler) bei Doppeleintrag
			# Unique Key über name verhindert Doppeleinträge
					echo "Tag  Test <br>" . $tags[$i];
			updateTags($db, "
				INSERT IGNORE INTO TAGS (NAME) 
				VALUES (REPLACE(?, '#', ''))", [$tags[$i]]);
			
			# Unique Key über ID_tags, ID_notizen verhindert Doppeleinträge
			updateTags ($db, "
				insert ignore into notizen_tags (ID_tags, ID_notizen) values ((SELECT ID FROM TAGS ORDER BY ID DESC limit 1), ?)", [$_POST['notizen_id']]);
		}	
		
		# Weiterleitung
		#header("location:index.php");			
	
	}	
	
	# LÖSCHEN
	function dropSingleValue($db, $sql, $parameters){
		$q = $db->prepare($sql);
		$q->execute($parameters);
	}
	
	if(isset($_POST['DELETE'])){
		
		# Text löschen
		dropSingleValue($db, "
		DELETE FROM text 
		WHERE ID = (SELECT C.ID	
					FROM NOTIZEN A
					JOIN NOTIZEN_TEXT B ON A.ID = B.ID_NOTIZEN
					JOIN TEXT C ON B.ID_TEXT = C.ID
					WHERE A.ID =?)", [$_POST['notizen_id']]);
		# Tags löschen
		dropSingleValue($db, "
		DELETE FROM TAGS
		WHERE ID = (SELECT  C.ID
					FROM NOTIZEN A
					JOIN NOTIZEN_TAGS B ON A.ID = B.ID_NOTIZEN
					JOIN TAGS C ON B.ID_NOTIZEN = C.ID
					WHERE A.ID =?)", [$_POST['notizen_id']]);
		
		# Notiz löschen
		dropSingleValue($db, "DELETE FROM notizen WHERE ID =?", [$_POST['notizen_id']]);
		header("location:index.php");
		

	}
?>

<!-- Buttons -->
<div class="container">
	<div class="row">
		<div class="col-auto">			
			<form style="display: inline" action="index.php" method="get">
				<button class="btn btn-danger">BACK</button>
			</form>		
		</div>	
		<div class="col-auto">
			<form style="display: inline" action = "" method = "post"> 	
				<input class="btn btn-danger" type="submit" name="SAVE" value="SAVE"/>
		</div>
		<div class="col-auto">
		<input type="submit" class="btn btn-danger" name = "DELETE" value="DELETE" />	
		</div>		
	</div>
	<br>
<!-- Buttons Ende -->
<!-- Titel -->
	<div class="row">
		<div class="col-auto">
		<input class="form-control" type="text" id="title" name="title" value="<?php echo $title;?>">
		</div>
	</div>
<!-- Titel Ende-->
<!-- Textfeld -->
	<div class="row">
		<div class="col-7-sm"> <!-- Reihe = 12 Spalten, davon 7; sm = small -->
			<textarea class="form-control" rows="14" name="text"><?php echo $text;?></textarea>			
		</div>
		<div class="spacing"> </div>
	</div>
	<div class="spacing2"> </div>
<!-- Textfeld Ende -->
<!-- Tags-Feld -->
	<div class="row">
		<div class="col-7-sm">
			<input class="form-control"type="text" id="tags" name="tags" value="<?php echo $tags;?>">
		</div>
	</div>
<!-- Tags-feld Ende -->

</div>

	<!-- textarea hat kein value-Attribut -->
		<input type="hidden" name="to_save" id="to_save"/>	
		<input type="hidden" name="notizen_id" id="notizen_id" value="<?php echo $notizen_id;?>"/>
</form>

<?php include('structure/footer.php'); ?>

