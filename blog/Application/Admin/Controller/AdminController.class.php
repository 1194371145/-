<?php
namespace Admin\Controller;
use Think\Controller;
class AdminController extends Controller {
    public function lst(){
         $admin=D('admin');
         $count      = $admin->count();// 查询满足要求的总记录数
         $Page       = new \Think\Page($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(3)
         $show       = $Page->show();// 分页显示输出
         $list = $admin->order('id ')->limit($Page->firstRow.','.$Page->listRows)->select();
         $this->assign('list',$list);// 赋值数据集
$this->assign('page',$show);// 赋值分页输出
         // $cateres=$cate->order('id ')->select();
         
         // $this->assign('cateres',$cateres);
        $this->display();
    }
     public function add(){
        $admin=D('admin');
        if(IS_POST){ 
            $date['username']=I('username');
            $date['password']=md5(I('password'));
            
            if($admin->create($date)){
                if($admin->add()){
            $this->success('添加管理员成功',U('lst'));
            }else{
                $this->error('添加失败');
            }
            }else{
                $this->error($admin->getError());
            }

            // if($admin->add($date)){
            // $this->success('添加管理员成功',U('lst'));
            // }else{
            //     $this->error('添加失败');
            // }
        }
        $this->display();
    }
    public function edit(){
        $admin=D('admin');
        if(!IS_POST){//如果没有点击提交
           $adminr=$admin->find(I('id'));
        }else{
            $date['id']=I('id');
            $date['username']=I('username');
            $admins=$admin->find($date['id']);
            $password=$admins['password'];
            // dump($admins);die;
            if(I('password')){
             $date['password']=md5(I('password'));
            }else{
             $date['password']=$password;
            }
            // dump($date);die;
            if($admin->create($date)){
                if($admin->save()){
            $this->success('修改管理员成功',U('lst'));
            }else{
                $this->error('修改管理员失败');
            }
            }else{
                $this->error($admin->getError());
            }
            // return;
        }
        $this->assign('adminr',$adminr);
        $this->display();
    }
    public function del(){
         $admin=D('admin');
         $id=I('id');
         if($id==1){
            $this->error('本管理不可删除');
         }else{
        if($admin->delete(I('id'))){
            $this->success('删除管理员成功',U('lst'));
           }else{
             $this->error('删除管理员失败');
           }}
    }
   public function login(){
        $admin=D('admin');
        if(IS_POST){
            if($admin->create($_POST,4)){
              // $password=I($data['password']);
              // var_dump($password);die;
               if($admin->checklogin()){//login方法正确，就执行成功，否则失败
               
                $this->success('登录成功',U('Index/index'));
        //       // $this->redirect('Index/index');
              }else{
                $this->error('check错误');
              }
               }else{
                $this->error('创建错误');
               }
            
        }else{
            // $this->error($admin->getError());
        }
        
         $this->display();
    }

}
