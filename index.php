
<?php include('structure/header.php'); ?>



<div class="container">
  <div class="row">
    <div class="col-auto" style="padding-bottom:10px;">
		<form method="get" action="result.php"> 
        <input class="form-control" type="text" id="search" name="search" placeholder="Bitte Suchtext eingeben">
    </div>
    <div class="col-auto">
		<button class="btn btn-danger" type="submit">Search</button>		
        <!--<a href="notr_create?title=<?php $_GET['search'];?>"><button>Create</button></a>-->
    	 </form>
    </div>
    <div class="col-auto">
		<form method="post" action="create.php" >
		<button class="btn btn-danger" type="submit">Create</button>
		<input type="hidden" name="to_save" id="to_save" value="0"/>
		 </form>
    </div>
  </div>
</div>
   
<br>
<div class="container">
 
<?php
    $sql = "SELECT * FROM notizen";
    foreach ($db->query($sql) as $row) 
    {
      echo'<div class="row">';

	  	  echo'<div class="col-auto">';
           echo' <input class="form-control" type="text" placeholder="'.$row['title'].'" aria-label="readonly input example" readonly>';
        echo'</div>';
        echo'<div class="col-auto">'; 
		
		echo '<form method="post" action="edit.php?id='.$row['ID'].'" >';
			echo '<button class="btn btn-danger" type="submit">Edit</button>';
			echo '<input type="hidden" name="to_save" id="to_save" value="0"/>';
		echo '</form>';	
		   
		echo'</div>';

      
  		echo'</div>';
      echo'<br>';
	
    }
?>

</div>

<?php include('structure/footer.php'); ?>




