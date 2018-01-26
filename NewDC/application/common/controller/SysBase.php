<?php
namespace app\common\controller;
use \think\Controller;

class SysBase extends Controller
{
	public function __construct()
	{
		parent::__construct();
	    $this->checkSession();
	}

	protected function checkSession()
	{
		if(session('sys_id') == NULL) {
			$this->redirect('/index.php/sys/login');
		}
	}
}