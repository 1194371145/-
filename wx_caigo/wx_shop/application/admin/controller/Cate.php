<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\Cate as CateModel;
use app\admin\model\Goods as GoodsModel;
class Cate extends Controller
{
    protected $beforeActionList = [
        'delsoncate'  =>  ['only'=>'del'],//执行删除操作的前置操作
    ];
    //产品分类结构
   
    public function catelst(){
        $cate=new CateModel();
        $cateres=$cate->catetree();
        if($cateres){
            $code=0;
            $message='产品分类列表获取成功';
        }else{
            $code=1;
            $message='产品分类列表获取失败';
        }
            ReturnJson($code,$message,$cateres);
        }
        //添加二级分类
    public function add(){
             if(request()->isPost()){
                $data=input('post.');
                $validate = \think\Loader::validate('Cate');
            if(!$validate->scene('add')->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
            $cate=new CateModel();
            if($cate->save($data)){
                ReturnJson(0,'添加成功');
            }else{
                ReturnJson(1,'添加失败');
            }
    }
        }
        //产品分类关键字查询
        public function catepage($page){
        $cate=new CateModel();
        $cateres=$cate->catetrees($page);
        if($cateres){
            $code=0;
            $message='产品分类列表获取成功';
        }else{
            $code=1;
            $message='产品分类列表获取失败';
        }
            ReturnJson($code,$message,$cateres);
        }
        public function search(){
    if(request()->isPost()){
         $keywords=input('keywords');//接受表单传递的参数
          $where=[ 
                'catename'=>['like','%'.$keywords.'%'],
                ];
         $cate=new CateModel();
        $cateres=$cate->catetrees($where);
        
        // $cate=db('cate')
        // ->field('id,catename')
        // ->alias('a')
        // ->where($where)
        // ->order('id')
        // ->paginate(['page'=> $page]);
        if($cateres){
            $code=0;
            $message='产品分类展示成功';
        }else{
            $code=1;
            $message='产品分类展示失败';
        }
         ReturnJson($code,$message,$cateres);
        }
    }
    //产品一级分类修改
        public function edit($id){//接受表单传递的参数id
        if(request()->isPost()){
            $data=input('post.');
            
            // print_r($_FILES['thumb']['tmp_name']);die;
            $validate = \think\Loader::validate('Cate');
            if(!$validate->scene('cateedit')->check($data)){
                $message=$validate->getError();
                return json_encode(['code'=>2,'$message'=>$message]);
            }
              if(CateModel::update(input('post.'))){
                $code=0;
            $message='产品分类修改成功';
              }else{
                $code=1;
            $message='产品分类修改不成功';
              }
        }
         ReturnJson($code,$message);
    }
    //删除分类(还未完成)
    public function del(){
         if(CateModel::destroy(input('id'))){
            $code=0;
            $message='删除分类成功';
        }else{
            $code=1;
            $message='删除分类失败';
        }
         ReturnJson($code,$message);
        }
    public function delsoncate(){//删除的前置操作
        $cateid=input('id'); //要删除的当前栏目的id
        $cate=new CateModel();
        $sonids=$cate->getchilrenid($cateid);
        $allcateid=$sonids;
        $allcateid[]=$cateid;
        foreach ($allcateid as $k=>$v) {
            $article=new GoodsModel;
            $article->where(array('cate_id'=>$v))->delete();
        }
        if($sonids){
        db('cate')->delete($sonids);
        }
    }
    public function parcate(){
        $cateres=db('cate')->field('id,catename,pid')->where(['pid'=>0])->select();
         if($cateres){
            $code=0;
            $message='热点查找成功';
        }else{
            $code=1;
            $message='热点查找失败';
        }
         ReturnJson($code,$message,$cateres);
    }

    public function pcate($id){//删除的前置操作
    $cateres=db('cate')->field('id,catename,pid')->where(['pid'=>$id])->select();
         if($cateres){
            $code=0;
            $message='热点查找成功';
        }else{
            $code=1;
            $message='热点查找失败';
        }
         ReturnJson($code,$message,$cateres);
    }

        
}
?>