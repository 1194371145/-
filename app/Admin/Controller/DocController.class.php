<?php
//声明命名空间
namespace Admin\Controller;
//引入父类
use Think\Controller;
//声明并继承父类
class DocController extends CommonController{

	//index方法
	public function add(){
		//展示模版
		if(IS_POST){
			$post=I('post.');
			$model=D('Doc');
			$result=$model->saveDate($post,$_FILES['file']);
		}
		
		$this -> display();
	}

	//home方法
	public function showlist(){
		//展示模版
		$model=M('Doc');
		$data=$model->select();
		// show_bug($data);
		$this->assign('data',$data);
		$this -> display();
	}
	// download方法
	public function download(){
		$id=I('get.id');
		$data=M('Doc')->find($id);
			$file = WORKING_PATH.$data['filepath'];
			// 下面输出文件
	 header("Content-type: application/octet-stream");
	 header('Content-Disposition: attachment; filename="' . basename($file) . '"');
	 header("Content-Length: ". filesize($file));
	 readfile($file);

	}
	public function showContent(){
		$id=I('get.id');
		$data=M('Doc')->find($id);
		echo "您的公文内容".htmlspecialchars_decode($data['content']);
	}
	public function edit(){
		if(IS_POST){
			$post=I('post.');
			$model=D('Doc');
			$result=$model->updateDate($post,$_FILES['file']);
			if($result){
				$this->success('修改成功',U('showlist'),3);
			}else{
				$this->error('修改失败');
			}
		}else{
		$id=I('get.id');
		$data=M('Doc')->find($id);
		$this->assign('data',$data);
        $this->display();
        }
	}
}

