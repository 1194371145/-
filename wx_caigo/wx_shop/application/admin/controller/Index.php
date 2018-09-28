<?php
namespace app\admin\controller;

 class Index
 {
 	
 	function index($id,$count){
        for ($i=0;$i<$count;$i++){
 		    $id=$id+$id;
        }
        echo $id;

 		 	}
 }
  ?>