<?php
namespace app\common\controller;
use \think\Controller;

class AdminBase extends Controller
{
	public function __construct()
	{
		parent::__construct();
	    $this->checkSession();
	}

	protected function checkSession()
	{
		if(session('u_id') == NULL) {
			$this->redirect('/index.php/admin/login');
		}
	}
}