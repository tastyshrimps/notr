<?php include('structure/header.php'); ?>
	
	
	<!-- Beim Klick auf SAVE Seite wechseln -->
	<!-- action = "edit.php" funktioniert nicht weil dann php nicht ausgeführt wird-->


	<div class="container">
		<div class="row">
			<div class="col-auto">			
				<form style="display: inline" action="index.php" method="get">
					<button class="btn btn-danger">BACK</button>
				</form>		
			</div>	
			<div class="col-auto">
				<form style="display: inline" action = "edit.php" method = "post"> 	
					<input class="btn btn-danger" type="submit" name="SAVE" value="SAVE"/>
			</div>
		</div>
		<div class="row">
			<div class="col-auto">
				<input class="form-control" type="text" id="title" name="title" placeholder="Titel der Notiz">
			</div>
		</div>		
		<div class="row">
			<div class="col-7-sm"> <!-- Reihe = 12 Spalten, davon 7; sm = small -->
				<textarea class="form-control" rows="14" name="text" placeholder="Geben Sie hier Ihre Notiz ein"></textarea>			
			</div>
		</div>
		<div class="spacing2"> </div>
		<div class="row">
			<div class="col-7-sm">
				<input class="form-control"type="text" id="tags" name="tags" placeholder="Tags eingeben mit # (Beispiel #Tag #Tag2)">
			</div>	
		</div>	
	</div>		       
		<input type="hidden" name="to_save" id="to_save" value="1"/>      
    </form>


<?php include('structure/footer.php'); ?>

