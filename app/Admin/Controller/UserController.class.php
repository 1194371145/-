<?php
namespace Admin\Controller;
//引入父类
use Think\Controller;
//声明并继承父类
class UserController extends CommonController{

	//index方法
	public function add(){
		//展示模版
		if(IS_POST){
			$model=M('User');
			$data=$model->create();
			$data['addtime']=time();
			// dump($data);
			$result=$model->add($data);
		}else{
		$data=M('Dept')->field('id,name')->select();
		$this->assign('data',$data);
		$this -> display();
		}
	}
//edit编辑处理
	 public function edit(){
	 	if(IS_POST){
	 		$model=M('User');
	 		$data=$model->create();
	 		$result=$model->save();
	 		if($result!==false){
	 			$this->success('修改成功',U('showList'),10);
	 		}
	 			else{
	 				$this->error('修改失败',U('edit'),10);
	 			}
	 	}else{
	 	$id=I('get.id');
	 	$model=M('Dept');
	 	$data=M('Dept')->find($id);
	 	$info=M('User')->find($id);
	 	// var_dump($info);
	 	// var_dump($data);
	 	$this->assign('data',$data);
	 	$this->assign('info',$info);
	 	$this->display();
	 }
	 }
	//home方法
	public function showlist(){
		//展示模版
		$model=M('User');
		// 分页第1步:查询总记录数
		$count=$model->count();
		// 分页第2步:实例化分页类，传递参数
		$page=new \Think\Page($count,1);
		$page->setConfig('prev','上一页');
		$page->setConfig('next','下一页');
		$page->setConfig('last','末页');
		$page->setConfig('first','首页');
		    $page->lastSuffix   = false;
		 // 分页栏每页显示的页数(每页显示的页码数)总记录数小于该页数的话无法显示首页末页
            $page->rollPage   = 4;
		// 分页第4步:使用show方法产生url
		$show=$page->show();
		// var_dump($show);
		//分页第5步:使用limit查询数据
		$data=$model->limit($page->firstRow,$page->listRows)->select();
		//分页第6步:传递给模板
		$this->assign('count',$count);
		$this->assign('show',$show);
		$this->assign('data',$data);
		$this -> display();
	}
	public function charts(){
		//展示模版
		//select t2.name as deptname,count(*) as count from sp_user as t1,sp_dept as t2 where t1.dept_id = t2.id group by deptname;
		$model = M();
		//连贯操作
		$data = $model -> field('t2.name as deptname,count(*) as count') -> table('sp_user as t1,sp_dept as t2') -> where('t1.dept_id = t2.id') -> group('deptname') -> select();
		//如果当前使用的php版本是5.6之后的版本，则可以直接将data二维数组assign，不需要任何处理；但是当前的php是5.3，所以需要进行字符串拼接
		$str = '[';
		//循环遍历字符串
		foreach ($data as $key => $value) {
			$str .= "['" . $value['deptname'] . "'," . $value['count'] . "],";
		}
		//去除最后的逗号
		$str = rtrim($str,',') . ']';
		//[['总裁办',1],['程序部',2],['管理部',2],['财务部',1],['运营部',1]]
		//传递给模版
		$this -> assign('str',$str);
		//展示模版
		$this -> display();
	}
	public function del(){
		//接收参数
		$id = I('get.id');
		//模型实例化
		$model = M('User');
		//删除
		$result = $model -> delete($id);
		//判断结果
		if($result){
			//删除成功
			$this -> success('删除成功！');
		}else{
			//删除失败
			$this -> error('删除失败！');
		}
	}

}

