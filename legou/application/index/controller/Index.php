<?php
namespace app\index\controller;
use \think\Controller;
class Index extends Controller{
    
    /*
    *首页
    */ 
    public function index(){
        // echo '1';die;

        // $check = $this->is_login();

      
            // $this->success('/total_view.html');  
            $this->redirect('/total_view.html');          
        
        	   	
    }
       
}
