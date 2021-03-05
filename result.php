
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
		<form method="get" action="create.php">
		<button class="btn btn-danger" type="submit">Create</button>
		 </form>
    </div>
  </div>
</div>	

<br>
<div class="container">
<?php	
		$sql ="";
		$sql = "
				SELECT * 
				FROM notizen a 
				LEFT JOIN notizen_text b 	ON a.ID=b.ID_notizen  
				LEFT JOIN text c 			ON c.ID=b.ID_text
				LEFT JOIN notizen_tags d 	ON a.ID=d.ID_notizen  
				LEFT JOIN tags e 			ON e.ID=d.ID_tags
				";		
		
		$suchstring = $_GET['search'];
		
		$tags = array();
		$tags = explode( " ", $suchstring );
		
		for ($i =0; $i<sizeof($tags); $i++) {
			#echo $tags[$i];
			#echo "<br>";
			
			if (strpos($tags[$i], '#') === 0) {

				if ($i>0){
					$sql = 	$sql." OR ";
				}
				else{
					$sql = 	$sql." WHERE ";
				}

				$sql = 	$sql.
						"
						e.name LIKE '%".$tags[$i]."'
						";	
			}

			else{
				
				if ($i>0){
					$sql = 	$sql." OR ";
				}
				else{
					$sql = 	$sql." WHERE ";
				}	
						
				$sql = 	$sql."
						c.section LIKE '%".$tags[$i]."%'
						";

				$sql = 	$sql."		
						OR a.title LIKE '%".$tags[$i]."%'
						";
						
				
			}
		}
		
		
	#echo $sql;
	echo '<h3>Search Results for "'.$_GET['search'].'":</h3><br>';
	
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
			echo '<input type="hidden" name="ID" value="'.$row['ID_notizen'].'"/>';
		echo '</form>';	
		   
		echo'</div>';

      
  		echo'</div>';
      echo'<div class="spacing"></div>';
		
		
    }

?>

</div>

<?php include('structure/footer.php'); ?>

