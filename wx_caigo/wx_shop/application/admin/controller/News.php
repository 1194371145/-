<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\News as NewsModel;
class News extends Controller
{
//热点添加
    public function add(){
         if(request()->isPost()){
            $data=input('post.');
             $validate = \think\Loader::validate('News');
            if(!$validate->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
            $data['addtime']=time();
            $data['updtime']=time();
            $News=new NewsModel;
            $user=$News
              ->save($data);
            // $user=db('News')
            //   ->data($data)
            //   ->insert();
              if($user){
                $code=0;
            $message='热点添加通过';
              }else{
                $code=1;
            $message='热点添加不成功';
              }
        }
         ReturnJson($code,$message);
        }
//热点等级修改        
        public function edit($id){
         if(request()->isPost()){
            $data=input('post.');
             $validate = \think\Loader::validate('News');
            if(!$validate->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
            $data['updtime']=time();
            // $user=db('News')->where('id', $id)->update($data);
            $News=new NewsModel;
            $user=$News
              ->update($data);
              if($user){
                $code=0;
            $message='修改热点通过';
              }else{
                $code=1;
            $message='修改热点失败';
              }
        }
         ReturnJson($code,$message);
        }
        //热点等级删除        
        public function del($id){
            $user=NewsModel::destroy(input('id'));
              if($user){
                $code=0;
            $message='删除热点通过';
              }else{
                $code=1;
            $message='删除热点失败';
              }
         ReturnJson($code,$message);
        }
         //热点级别列表
    public function lst($page){
        $user=db('News')
        ->field('id,title,content,updtime,thumb')
        ->paginate(['page'=> $page]);
        if($user){
            $code=0;
            $message='热点获取成功';
        }else{
            $code=1;
            $message='热点获取失败';
        }
         ReturnJson($code,$message,$user);
        }
         //热点级别查询
        public function search($page){
    if(request()->isPost()){
         $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'title|content|updtime'=>['like','%'.$keywords.'%'],
                ];
                // 'levname','like','%'.$keywords.'%'
        $user=db('News')
        ->field('id,title,content,updtime,thumb')
        ->where($where)
        ->order('addtime')
        ->paginate(['page'=> $page]);
        // print_r($where);die;
        if($user){
            $code=0;
            $message='热点查找成功';
        }else{
            $code=1;
            $message='热点查找失败';
        }
         ReturnJson($code,$message,$user);
        }
    }
}
?>