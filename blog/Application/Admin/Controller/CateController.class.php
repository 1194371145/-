<?php
namespace Admin\Controller;
use Think\Controller;
class CateController extends Controller {
    public function lst(){
         $cate=D('cate');
         $cateres=$cate->order('sort ')->select();
         // dump($cateres);die;
         $this->assign('cateres',$cateres);
        $this->display();
    }
     public function add(){
        $cate=D('cate');
        if(IS_POST){ 
            $date['catename']=I('catename');
            if($cate->create($date)){
                if($cate->add()){
            $this->success('添加栏目成功',U('lst'));
            }else{
                $this->error('添加失败');
            }
            }else{
                $this->error($cate->getError());
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
        $cate=D('cate');
        if(!IS_POST){//如果没有点击提交
           $cater=$cate->find(I('id'));
        }else{
            $date['id']=I('id');
            $date['catename']=I('catename');
            // dump($date);die;
            if($cate->create($date)){
                if($cate->save()){
            $this->success('修改栏目成功',U('lst'));
            }else{
                $this->error('修改栏目失败');
            }
            }else{
                $this->error($cate->getError());
            }
            return;
        }
        $this->assign('cater',$cater);
        $this->display();
    }
    public function del(){
         $cate=D('cate');
        if($cate->delete(I('id'))){
            $this->success('删除栏目成功',U('lst'));
           }else{
             $this->error('删除栏目失败');
           }
    }
    public function sort(){
        // dump($_POST);die;
        $cate=D('cate');
        foreach ($_POST as $id => $sort) {
            // UPDATE  `blog`.`blog_cate` SET  `sort` =  '5' WHERE  `blog_cate`.`id` =5;
            // $cate->where(array('id'=>$id))->setField('sort',$sort);
            $cate->where('id='.$id)->setField('sort',$sort);
        }
        // dump($_POST);die;
        $this->success('排序成功',U('lst'));
    }
    public function showContent(){
        $id=I('get.id');
        $data=M('Cate')->find($id);
        echo $data['content'];
    }

}
