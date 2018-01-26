<?php
namespace app\admin\controller;
use app\common\controller\AdminBase;
use think\Loader;
use think\Request;
use think\Validate;

class Dish extends AdminBase
{
	protected $rule = [
		'doAdd' =>[
			'type_id|菜品分类' => 'require',
			'dish_name|菜品名称' => 'require',
			'dish_price|菜品价格' => 'require|number'
		]
	];

	public function _initialize()
	{
		$this->type = Loader::model('Type');
		$this->dish = Loader::model('Dish');
	}

	public function index()
	{
		$data = $this->type->get_type();
		$this->assign('nav', adminNavActive('cpgl', 'cplb'));
		$this->assign('list', $data);
		return $this->fetch();
	}

	public function add()
	{
		if(input('id')) {
			$map['dish_id'] = input('id');
			$this->assign('data', $this->dish->get_dish_by_id($map));
		}
		$data = $this->type->get_type();
		$this->assign('list', $data);
		$this->assign('nav', adminNavActive('cpgl', 'xzcp'));
		return $this->fetch();
	}

	public function doAdd()
	{
		// return 123;
		if(checkDishName(input('dish_name'))) {
			echo "<script>parent.callback('菜品名称已存在!',false)</script>";
			return;
		}
	    $file = request()->file('dish_img');
	    if($file == NULL) {
	    	echo "<script>parent.callback('请选择图片',false)</script>";
	    	return;
	    }

	    $type = $file->getinfo()['type'];

	    $suf = substr($type, 6);

	    if($suf!="gif"&&$suf!="GIF"&&$suf!="jpg"&&$suf!="JPG"&&$suf!="png"&&$suf!="PNG"&&$suf!="jpeg"&&$suf!="JPEG") {
			echo "<script>parent.callback('图片必须为gif,jpg,png格式',false)</script>";
			return;
		}
	   
	    $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads' . DS .'dish');
	     // var_dump(ROOT_PATH . 'public' . DS . 'uploads' . DS .'dish');die();
		if($info){
			$data['type_id'] = input('type_id');
			if($data['type_id'] == 0) {
				echo "<script>parent.callback('请选择菜品分类',false)</script>";
		        return;
			}
			makeThumb($info->getSaveName(), ROOT_PATH . 'public' . DS . 'uploads' . DS .'dish');
		    $data['dish_img'] = $info->getSaveName();
		    $data['dish_name'] = input('dish_name');
		    $data['dish_price'] = input('dish_price');
		    $validate = new Validate($this->rule[__FUNCTION__]);
		    if(!$validate->check($data)) {
		        echo "<script>parent.callback('".$validate->getError()."',false)</script>";
		        return;
		    }
		    $res = $this->dish->add_dish($data);
			if($res == 1) {
			    echo "<script>parent.callback('新增成功',true)</script>"; 
			    return;
			} else {
			    echo "<script>parent.callback('新增失败',false)</script>"; 
			    return;
			}
		        
		}else{
		    // 上传失败获取错误信息
		    // return returnMsg('0', $file->getError());
		    echo "<script>parent.callback('图片上传失败',false)</script>"; 
		    return;
		}
	}

	public function doEdit()
	{
		$map['dish_id'] = input('id');
		// if(checkDishName(input('dish_name'))) {
		// 	echo "<script>parent.callback('菜品名称已存在!',false)</script>";
		// 	return;
		// }
	    $file = request()->file('dish_img');

	    if($file == NULL) {
	    	$data['dish_img'] = $this->dish->get_dish_by_id($map)->dish_img;
	    } else {
	    	$type = $file->getinfo()['type'];
		    $suf = substr($type, 6);
		    if($suf!="gif"&&$suf!="GIF"&&$suf!="jpg"&&$suf!="JPG"&&$suf!="png"&&$suf!="PNG"&&$suf!="jpeg"&&$suf!="JPEG") {
				echo "<script>parent.callback('图片必须为gif,jpg,png格式',false)</script>";
				return;
			}
		    $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads' . DS .'dish');
			if($info){
				makeThumb($info->getSaveName(), ROOT_PATH . 'public' . DS . 'uploads' . DS .'dish');
			    $data['dish_img'] = $info->getSaveName();
			}else{
			    // 上传失败获取错误信息
			    // return returnMsg('0', $file->getError());
			    echo "<script>parent.callback('图片上传失败',false)</script>"; 
			    return;
			}
	    }
	    $data['type_id'] = input('type_id');
		if($data['type_id'] == 0) {
			echo "<script>parent.callback('请选择菜品分类',false)</script>";
			return;
		}
	    $data['dish_name'] = input('dish_name');
		$data['dish_price'] = input('dish_price');

		$validate = new Validate($this->rule['doAdd']);
		if(!$validate->check($data)) {
			echo "<script>parent.callback('".$validate->getError()."',false)</script>";
			return;
		}
		// var_dump($data);die();
		$res = $this->dish->do_edit($data, $map);
		if($res == 1) {
			echo "<script>parent.callback('修改成功',true)</script>"; 
			return;
		} else {
			echo "<script>parent.callback('修改失败',false)</script>"; 
			return;
		}
	    
	}

	public function details()
	{
		$map['type_id'] = input('id');
		$data = $this->dish->get_dish_by_type($map);
		$this->assign('list', $data);
		$this->assign('nav', adminNavActive('cpgl', 'cplb'));
		return $this->fetch();
	}

	public function doDel()
	{
		$map['dish_id'] = input('id');
		$res = $this->dish->do_del($map);
		return $res;
	}

	public function changeStatus()
	{
		$map['dish_id'] = input('id');
		$res = $this->dish->change_status($map);
		return $res;
	}
}