<?php
namespace Admin\Controller;
use Think\Controller;
class TeacherController extends CommonController {
    public function add(){
        $book=D('book');
        if(IS_POST){
            $model=D('Book');
            if(!$data=$model->create()){
                $this->error($model->getError());
            }else{
            $data['addtime']=time();
            $data['type']=2;
            // $data['num']=1;
            // dump($data);die;
            $result=$model->add($data);
             if($result){
                $this->success('添加信息成功',U('index'));
             }
        }
        }
        $this->display();
    }
    public function index(){
    	$book=D('book');
        if(IS_POST){
            $keywords=I('keywords');
            $where['name']=array('like',"%".$keywords."%");
            $list=$book->where($where)->order('addtime desc')->select();
         $this->assign('list',$list);// 赋值数据集
        $this->display();
        }
        $count      = $book->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page($count,3);// 实例化分页类 传入总记录数和每页显示的记录数(3)
         $show       = $Page->show();// 分页显示输出
         $list = $book->order('addtime desc')->limit($Page->firstRow.','.$Page->listRows)->select();
         $this->assign('count',$count);
         $this->assign('list',$list);// 赋值数据集
$this->assign('page',$show);// 赋值分页输出
        $this->display();
    }
 public function edit(){
        $book=D('book');
        if(!IS_POST){//如果没有点击提交
           $cater=$book->find(I('id'));
        }else{
            $date['id']=I('id');
            $date['name']=I('name');
            $date['shuhao']=I('shuhao');
            $date['zuoze']=I('zuoze');
            $date['shubanshe']=I('shubanshe');
            $date['tuijianren']=I('tuijianren');
            $date['tel']=I('tel');
            // dump($date);die;
            if($book->create($date)){
                if($book->save()){
            $this->success('修改信息成功',U('index'));
            }else{
                $this->error('修改信息失败');
            }
            }else{
                $this->error($book->getError());
            }
            return;
        }
        $this->assign('cater',$cater);
        $this->display();
    }
    public function del(){
         $book=D('book');
        if($book->delete(I('id'))){
            $this->success('删除信息成功',U('index'));
           }else{
             $this->error('删除信息失败');
           }
    }
    public function excel(){

		$this->display();
    }
   
  

}