<?php
namespace Admin\Controller;
use Think\Controller;
class ArticleController extends Controller {
    public function lst(){
         $article=D('ArticleView');
         $count      = $article->count();// 查询满足要求的总记录数
         $Page       = new \Think\Page($count,3);// 实例化分页类 传入总记录数和每页显示的记录数(3)
         $show       = $Page->show();// 分页显示输出
         $list = $article->order('id ')->limit($Page->firstRow.','.$Page->listRows)->select();
         $this->assign('list',$list);// 赋值数据集
$this->assign('page',$show);// 赋值分页输出
         // $cateres=$cate->order('id ')->select();
         
         // $this->assign('cateres',$cateres);
        $this->display();
    }
     public function add(){
        $article=D('article');
        if(IS_POST){
              $date['title']=I('title');
            $date['content']=I('content');
            $date['desc']=I('desc');
            $date['cateid']=I('cateid');
            $date['time']=time();//添加时间
            if($_FILES['pic']['tmp_name']!=''){
                  $upload = new \Think\Upload();// 实例化上传类
    $upload->maxSize   =     3145728 ;// 设置附件上传大小
    $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
    $upload->rootPath  =     './'; // 设置附件上传根目录
    $upload->savePath  =     './Public/Uploads/'; // 设置附件上传（子）目录
    // 上传文件 
     $info   =   $upload->uploadOne($_FILES['pic']);
    if(!$info) {// 上传错误提示错误信息
        $this->error($upload->getError());
    }else{// 上传成功 获取上传文件信息
          $date['pic']=$info['savepath'].$info['savename'];
    }

            }else{}
            if($article->create($date)){
                if($article->add()){
            $this->success('添加文章成功',U('lst'));
            }else{
                $this->error('添加文章失败');
            }
            }else{
                $this->error($article->getError());
            }

            // if($cate->add($date)){
            // $this->success('添加文章成功',U('lst'));
            // }else{
            //     $this->error('添加失败');
            // }

        }
        $cateres=D('cate')->select();
        // dump($cate);die;
            $this->assign('cateres',$cateres);
        $this->display();
    }
    public function edit(){
       $article=D('article');
        if(IS_POST){
              $date['title']=I('title');
            $date['content']=I('content');
            $date['desc']=I('desc');
            $date['cateid']=I('cateid');
            // $date['time']=time();//添加时间
            if($_FILES['pic']['tmp_name']!=''){
                  $upload = new \Think\Upload();// 实例化上传类
    $upload->maxSize   =     3145728 ;// 设置附件上传大小
    $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
    $upload->rootPath  =     './'; // 设置附件上传根目录
    $upload->savePath  =     './Public/Uploads/'; // 设置附件上传（子）目录
    // 上传文件 
     $info   =   $upload->uploadOne($_FILES['pic']);
    if(!$info) {// 上传错误提示错误信息
        $this->error($upload->getError());
    }else{// 上传成功 获取上传文件信息
          $date['pic']=$info['savepath'].$info['savename'];
    }

            }else{}
            if($article->create($date)){
                if($article->save()){
            $this->success('修改文章成功',U('lst'));
            }else{
                $this->error('修改文章失败');
            }
            }else{
                $this->error($article->getError());
            }

            // if($cate->add($date)){
            // $this->success('添加文章成功',U('lst'));
            // }else{
            //     $this->error('添加失败');
            // }

        }
        
        // dump($cate);die;
           
        $cateres=D('cate')->select();
        $articler=$article->find(I('id'));
        $this->assign('cateres',$cateres);
        $this->assign('articler',$articler);
        $this->display();
    }
    public function del(){
         $cate=D('article');
        if($cate->delete(I('id'))){
            $this->success('删除文章成功',U('lst'));
           }else{
             $this->error('删除文章失败');
           }
    }
    public function sort(){
        // dump($_POST);die;
        $article=D('article');
        foreach ($_POST as $id => $sort) {
            // UPDATE  `blog`.`blog_cate` SET  `sort` =  '5' WHERE  `blog_cate`.`id` =5;
            // $cate->where(array('id'=>$id))->setField('sort',$sort);
            $article->where('id='.$id)->setField('sort',$sort);
        }
        // dump($_POST);die;
        $this->success('排序成功',U('lst'));
    }
    

}
