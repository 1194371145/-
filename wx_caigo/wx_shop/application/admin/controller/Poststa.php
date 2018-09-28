<?php
namespace app\admin\controller;
use think\Controller;
class Poststa extends Controller
{
   
       //发货状态通过
        public function checkadd($id){//接受表单传递的参数id
        if(request()->isPost()){
            $data['post_status']=1;//确定发货
            $data['post_time']=time();//发货时间
            
            $user=db('order')
              ->where(['id'=>$id])
              ->data($data)
              ->update();
              if($user){
                $code=0;
            $message='发货通过';
              }else{
                $code=1;
            $message='发货不成功或者已发货';
              }
        }
         ReturnJson($code,$message);
    }
    //发货状态拒绝
        public function checkreject($id){//接受表单传递的参数id
           $user=db('order')
            ->field('id,post_status')
            ->where(['id'=>$id])
            ->find();
            // print_r($user);die;
            if($user['post_status']==0){//发货状态已经被管理员拒绝审批
                $code=1;
                $message='该订单未发货，请不要重复操作';
            }else{
            $userres=db('order')
            ->where(['id'=>$id])
            ->update(['post_status'=>0]);
            if($userres){
                $code=0;
                $message='该发货状态已撤销';
            }else{
                $code=2;
                $message='该操作执行失败';
            }
            }
         ReturnJson($code,$message);
    }
     //发货状态列表
    public function statuslst($page){
            $goodsOrder = array();
            $user=db('order')
            ->where('order_status',1)
            ->order("post_time desc")//根据发货时间排序
            ->paginate(['page'=> $page]);
            // print_r($user);die;
            foreach ($user as $key => $v) {
            $goodsInfo['order_id']= $v['id'];
            $goodsInfo['order_total_price'] = $v['order_total_price'];
            $goodsInfo['order_status']= $v['order_status'];
            $goodsInfo['deliverytime_id']= $v['deliverytime_id'];
            $goodsInfo['order_time']= $v['order_time'];
            $goodsInfo['post_time']= $v['post_time'];
            $orderGoods=db('order_goods')->where('order_id',$goodsInfo['order_id'])->select();
            $goodsInfo['order_goods']=$orderGoods;
            $goodsOrder[]=$goodsInfo;
            }
        if($user){
            $code=0;
            $message='发货状态管理列表获取成功';
        }else{
            $code=1;
            $message='发货状态管理列表获取失败';
        }
         ReturnJson($code,$message,$goodsOrder);
        }
    //配送发货查询
        public function search($page){
    if(request()->isPost()){
            $data['user_id']=trim(input('post.user_id'));
            $data['post_status']=trim(input('post.post_status'));
            $data['deliverytime_id']=trim(input('post.deliverytime_id'));
          $where=[];
         if($data['user_id']){
            $where['user_id']=$data['user_id'];
         }
         if($data['post_status']!=null){
            $where['post_status']=$data['post_status'];
         }
         if($data['deliverytime_id']){
            $where['deliverytime_id']=$data['deliverytime_id'];
         }
          $goodsOrder = array();
        $user=db('order')
        ->field('a.*,b.name')
        ->alias('a')
        ->join('user b ','b.id= a.user_id')
        ->where($where)
        ->where('order_status',1)
        ->order("post_time desc")
        ->paginate(['page'=> $page]);
        // ->select();
        foreach ($user as $key => $v) {
            $goodsInfo['name']= $v['name'];
            $goodsInfo['order_id']= $v['id'];
            $goodsInfo['order_total_price'] = $v['order_total_price'];
            $goodsInfo['order_status']= $v['post_status'];
            $goodsInfo['deliverytime_id']= $v['deliverytime_id'];
            $goodsInfo['order_time']= $v['order_time'];
            $goodsInfo['post_time']= $v['post_time'];
            $orderGoods=db('order_goods')->where('order_id',$goodsInfo['order_id'])->select();
            $goodsInfo['order_goods']=$orderGoods;
           
            $goodsOrder[]=$goodsInfo;
             $link['goodsInfo']=$goodsOrder;
            }
        if($user){
            $code=0;
            $message='配送时间查找成功';
        }else{
            $code=1;
            $message='配送时间查找失败';
        }
        }
        $link['deliverytime']=db('deliverytime')->select();
        $link['count']=db('order')
        ->where($where)->where('order_status',1)->count();
        // $link['user']=db('user')->field('id,name')->select();
        $link['post_status']=['未发货','已发货'];
         ReturnJson($code,$message,$link);
    }
    //配送查询条件
        public function tiaojian(){
            $link['deliverytime']=db('deliverytime')->select();
        $link['user']=db('user')->field('id,name')->select();
        $link['post_status']=['未发货','已发货'];
        ReturnJson(0,'获取成功',$link);
        }

        
}
?>