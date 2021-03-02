<?php include('structure/header.php'); ?>
	<br>
	
	<!-- Beim Klick auf SAVE Seite wechseln -->
	<!-- action = "edit.php" funktioniert nicht weil dann php nicht ausgeführt wird-->
	<form style="display: inline" action="index.php" method="get">
		<button>BACK</button>
	</form>
	<form style="display: inline" method="post" action = "edit.php" > 
		
		<!-- Buttons und Felder -->
		<input  type="submit" name="SAVE" value="SAVE"/><br>
        <input type="text" id="title" name="title"><br>
		<textarea name="text" ></textarea><br>
		<input type="hidden" name="to_save" id="to_save" value="1"/>
        <!-- <input type="text" id="tags" name="tags"--><br>	


			
					

	
    </form>
<br><br>

<?php include('structure/footer.php'); ?>

