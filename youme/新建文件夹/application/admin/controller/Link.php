<?php
namespace app\admin\controller;
use think\Controller;
class Link extends Base
{
    public function lst()
    {
        $linkres=\think\Db::name('link')->order('id')->paginate(3);
        $this->assign('linkres',$linkres);
        return $this->fetch();
    }
    public function add(){
    	if(request()->isPost()){
    		$data=[
    		'title'=>input('title'),
    		'url'=>input('url'),
    		'desc'=>input('desc'),
    		];
    		$validate = \think\Loader::validate('link');
    		if($validate->check($data)){
    		   $db=\think\Db::name('link')->insert($data);
    		if($db){
    			return $this->success('添加链接成功','lst');
    		}else{
                return $this->error('添加链接失败');
    		   }
    		}else {
    			return $this->error($validate->getError());
    		}
    			return;
    	}
        return $this->fetch();
    }
    public function del(){
        $id=input('id');
        if(db('link')->delete($id))
            {
                return $this->success('删除链接成功','lst');
            }else{
                return $this->success('删除链接失败');
            }
    }
    public function edit()
    {
        if(request()->isPost()){
            // dump(input('post.'));die;
            $validate = \think\Loader::validate('link');
            // $validate->scene('edit', ['title', 'url']);
            //表示验证edit场景该场景定义只需要验证titl和url字段
            if($validate->scene('edit')->check(input('post.'))){
            if($db=\think\Db::name('link')->update(input('post.'))){
return $this->success('修改链接成功','lst');
}else{
    return $this->success('修改链接失败');
} 
}else{
    return $this->error($validate->getError());
}
            return;
        }
        $id=input('id');
        $links=db('link')->where('id',$id)->find();
        $this->assign('links',$links);
            return $this->view->fetch();
    }
}
