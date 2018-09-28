<?php
namespace app\index\controller;
use think\Controller;
// use app\index\model\Cate as CateModel;
class Index extends Common
{
    //首页接口
    public function actionIndex(){

        //首页轮播接口
        $info['topbanner']=db('advertise')
        ->select();
        $where=['pid'=>0];
        //首页栏目接口
        $info['cate']=db('cate')
        ->field('id,catename,pic')
        ->where($where)
        ->limit(4)
        ->select();
        //首页公告接口
        $info['proclamation']=db('proclamation')
        ->order('addtime')
        ->select();
        //首页热点新闻接口
        $info['news']=db('news')
        ->order('addtime')
        ->limit(2)
        ->select();
        //首页插播轮播接口
        $info['adverbanner']=db('adverbanner')
        ->select();
        //首页商品接口
        $uid =input('post.sessid');
            $levels=db('user')->where(['id'=>$uid])->find();
            $levelid=$levels['levelid'];
        $info['goods']=db('goods')
        ->field('a.id,a.name,a.pic,c.mprice')
        ->alias('a')
        ->where(['c.mlevel_id'=>$levelid])
        ->join('prices c',"a.id=c.goods_id")
        ->order('sales_volume')
        ->limit(4)
        ->select();
        if($info){
            $code=0;
            $message = '首页展示成功';
        }else{
            $code=1;
            $message = '首页展示失败';
        }
        ReturnJson($code,$message,$info);
    }
    //搜索查询接口
        public function search(){
    if(request()->isPost()){
         $uid =input('post.sessid');
            $levels=db('user')->where(['id'=>$uid])->find();
            $levelid=$levels['levelid'];
         $keywords=input('keywords');//接受表单传递的参数
         $where=[
                'c.mlevel_id'=>$levelid,
                'name'=>['like','%'.$keywords.'%'],
                ];
                // 'levname','like','%'.$keywords.'%'
        $shop=db('goods')
        ->field('a.id,a.shop_num,a.name,a.pic,a.shop_num,c.mprice')
        ->alias('a')
        ->where($where)
        ->join('prices c',"a.id=c.goods_id")
        ->select();
        // print_r($where);die;
        if($shop){
            $code=0;
            $message='商品查找成功';
        }else{
            $code=1;
            $message='商品查找失败';
        }
        ReturnJson($code,$message,$shop);
        }
    }


}
