<?php
namespace app\admin\model;
use think\Model;
use think\Validate;
use think\Session;

class Type extends model
{
	public function do_add($data, $id = '')
	{
		$type = new Type;
		if($id) {
			$map['type_id'] = $id;
			$res = $type->save($data, $map);
			$code = 1;
			$url = '/index.php/admin/type/index';
		} else {
			$type->data($data);
			$type->save();
			$res = $type->type_id;
			$code = 2;
			$url = '';
		}
		if($res) {
			return returnMsg($code, '新增成功！', $url);
		} else {
			return returnMsg(0, '新增失败！');
		}
	}

	public function get_type($id = '')
	{
		$type = new Type;
		if($id) {
			$map['type_id'] = $id;
			$data = $type->where($map)->find();
		} else {
			$map['seller_id'] = session('u_info')->seller_id;
			$data = $type->order('type_id asc')->where($map)->select();
		}
		return $data;
	}

	public function do_del($map)
	{
		$type = new Type;
		$res = $type->where($map)->delete();
		if($res) {
			return returnMsg(1, '删除成功');
		} else {
			return returnMsg(0, '删除失败');
		}
	}
}