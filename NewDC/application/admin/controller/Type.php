<?php
namespace app\admin\controller;
use app\common\controller\AdminBase;
use think\Loader;

class Type extends AdminBase
{
	public function _initialize()
	{
		$this->type = Loader::model('type');
	}

	public function index()
	{
		$data = $this->type->get_type();
		$this->assign('nav', adminNavActive('flgl', 'fllb'));
		$this->assign('list', $data);
		return $this->fetch();
	}

	public function add()
	{
		if(input('id')) {
			$data = $this->type->get_type(input('id'));
			$this->assign('data', $data);
		}
		$this->assign('nav', adminNavActive('flgl', 'xzfl'));
		return $this->fetch();
	}

	public function doAdd()
	{
		$data['type_name'] = input('type_name');
		$data['seller_id'] = session('u_info')->seller_id;
		if(input('id')) {
			$res = $this->type->do_add($data, input('id'));
		} else {
			$res = $this->type->do_add($data);
		}
		return $res;
	}

	public function doDel()
	{
		$map['type_id'] = input('id');
		$res = $this->type->do_del($map);
		return $res;
	}
}