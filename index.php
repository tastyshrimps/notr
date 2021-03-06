<?php include('structure/header.php'); ?>



<div class="container">
  <div class="row">
    <div class="col-auto" style="padding-bottom:10px;">
		<form method="get" action="result.php"> 
        <input class="form-control" type="text" id="search" name="search" placeholder="Bitte Suchtext eingeben">
    </div>
    <div class="col-auto">
		<button class="btn btn-danger" type="submit"><img src="img/search.png" width=22px></button>		
    	 </form>
    </div>
    <div class="col-auto">
		<form method="post" action="create.php" >
		<button class="btn btn-danger" type="submit" name = "Create" >&#10010;</button>
		<input type="hidden" name="to_save" id="to_save" value="0"/>
		 </form>
    </div>
  </div>
</div>
   
<br>
<div class="container ">
 
<?php
   $sql = "SELECT * FROM notizen";  

   foreach ($db->query($sql) as $row) 
    {
      echo'<div class="row">';

	  	  echo'<div class="col-auto">';
           echo' <input class="form-control shadow-none" type="text" placeholder="'.$row['title'].'" readonly >';
        echo'</div>';
        echo'<div class="col-auto">'; 		
		echo '<form method="post" action="edit.php?id='.$row['ID'].'" >';
			echo '<button class="btn btn-danger" type="submit"><img src="img/edit.png" width=22px></img></button>';
			echo '<input type="hidden" name="to_save" id="to_save" value="0"/>';
			echo '<input type="hidden" name="ID" value="'.$row['ID'].'"/>';
		echo '</form>';	
		   
		echo'</div>';

      
  		echo'</div>';
      echo'<div class="spacing"></div>';
	
    }
?>

</div>

<?php include('structure/footer.php'); ?>