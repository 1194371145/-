<?php
namespace app\admin\model;
use think\Model;
use think\Validate;
use think\Session;

class User extends Model
{
	protected $rule = [
		'do_login' =>[
			'user_name|用户名' => 'require',
			'user_pwd|密码' => 'require'
		]
	];
	public function do_login($data)
	{
		$user = new User;
		$validate = new Validate($this->rule[__FUNCTION__]);
		if(!$validate->check($data)) {
    		return returnMsg(0,$validate->getError());
    	}
    	$data['user_pwd'] = md5($data['user_pwd']);
    	$res = $user->where($data)->find();
    	if($res) {
    		if($res->user_status == 0) {
    			return returnMsg(0, '当前用户被禁用！请联系管理员');
    		}
    		Session::set('u_id',$res->user_id);
    		Session::set('u_info',$res);
    		return returnMsg(1, '登录成功！', '/index.php/admin');
    	} else {
    		return returnMsg(0, '用户名或密码错误，登录失败！(如您已注册,则可能在审核状态，或审核失败。)');
    	}
	}

	public function get_user()
	{
		$user = new User;
		$map['seller_id'] = session('u_info')->seller_id;
		$data = $user->where($map)->select();
		return $data;
	}

	public function do_del($map)
	{
		$user = new User;
		$res = $user->where($map)->delete();
		if($res) {
			return returnMsg(1, '删除成功');
		} else {
			return returnMsg(0, '删除失败');
		}
	}

	public function do_change($map)
	{
		$user = new User;
		$status = $user->where($map)->value('user_status');
		if($status == 1) {
			$data['user_status'] = 0;
			$sta = 0;
		} else {
			$data['user_status'] = 1;
			$sta = 1;
		}
		$res = $user->save($data, $map);
		if($res) {
			return returnMsg(1, '成功', $sta);
		} else {
			return returnMsg(0, '失败');
		}
	}
	
	public function do_add($data)
	{
		$user = new User;
		$data['user_pwd'] = md5($data['user_pwd']);
		$user->data($data);
		$user->save();
		if($user->user_id) {
			return returnMsg(1, '新增成功!', '/index.php/admin/person/index');
		} else {
			return returnMsg(0, '新增失败!');
		}
	}
}