<?php
namespace Admin\Controller;
use Think\Controller;
class LinkController extends Controller {
    public function lst(){
         $link=D('link');
         $count      = $link->count();// 查询满足要求的总记录数
         $Page       = new \Think\Page($count,3);// 实例化分页类 传入总记录数和每页显示的记录数(3)
         $show       = $Page->show();// 分页显示输出
         $list = $link->order('sort ')->limit($Page->firstRow.','.$Page->listRows)->select();
         $this->assign('list',$list);// 赋值数据集
$this->assign('page',$show);// 赋值分页输出
         // $cateres=$cate->order('id ')->select();
         
         // $this->assign('cateres',$cateres);
        $this->display();
    }
     public function add(){
        $link=D('link');
        if(IS_POST){ 
              $date['title']=I('title');
            $date['url']=I('url');
            
            $date['desc']=I('desc');
            if($link->create($date)){
                if($link->add()){
            $this->success('添加栏目成功',U('lst'));
            }else{
                $this->error('添加失败');
            }
            }else{
                $this->error($link->getError());
            }

            // if($cate->add($date)){
            // $this->success('添加栏目成功',U('lst'));
            // }else{
            //     $this->error('添加失败');
            // }
        }
        $this->display();
    }
    public function edit(){
        $link=D('link');
        if(!IS_POST){//如果没有点击提交
           $cater=$link->find(I('id'));
        }else{
            $date['id']=I('id');
            $date['title']=I('title');
            $date['url']=I('url');
            $date['desc']=I('desc');
            if($link->create($date)){
                if($link->save()){
            $this->success('修改栏目成功',U('lst'));
            }else{
                $this->error('修改栏目失败');
            }
            }else{
                $this->error($link->getError());
            }
           
        }
        $this->assign('cater',$cater);
        $this->display();
    }
    public function del(){
         $cate=D('link');
        if($cate->delete(I('id'))){
            $this->success('删除栏目成功',U('lst'));
           }else{
             $this->error('删除栏目失败');
           }
    }
    public function sort(){
        // dump($_POST);die;
        $link=D('link');
        foreach ($_POST as $id => $sort) {
            // UPDATE  `blog`.`blog_cate` SET  `sort` =  '5' WHERE  `blog_cate`.`id` =5;
            // $cate->where(array('id'=>$id))->setField('sort',$sort);
            $link->where('id='.$id)->setField('sort',$sort);
        }
        // dump($_POST);die;
        $this->success('排序成功',U('lst'));
    }
    

}
