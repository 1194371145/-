<?php
namespace app\index\controller;
use think\Controller;
// use app\index\model\Shop as ShopModel;
class Shop extends Common
{
    //商品详情接口
    public function getshopdetail($id){
        $uid =input('post.sessid');
            $levels=db('user')->where(['id'=>$uid])->find();
            $levelid=$levels['levelid'];
        // $where = ['id' => $id,];,pic1,pic2,pic3,pic4,pic5
        $shop=db('goods')
        ->field('a.id,a.name,a.pic,a.shop_num,a.mfrs candi,a.detail,a.mfrs,c.mprice')
        ->alias('a')
        ->where(['c.mlevel_id'=>$levelid,'a.id' => $id])
        ->join('prices c',"a.id=c.goods_id")
        ->find();
        if($shop){
            $code=0;
            $message = '商品获取成功';
        }else{
            $code=1;
            $message = '商品获取失败';
        }
       ReturnJson($code,$message,$shop);
    }

    public function getshoplist($cate_id){//点击栏目后的商品展示
        $uid =input('post.sessid');
            $levels=db('user')->where(['id'=>$uid])->find();
            $levelid=$levels['levelid'];
        $shop=db('goods')
        ->field('a.id,a.name,a.pic,a.shop_num,a.mfrs candi,a.detail,a.mfrs,c.mprice')
        ->alias('a')
        ->where(['c.mlevel_id'=>$levelid,'a.cate_id' => $cate_id])
        ->join('prices c',"a.id=c.goods_id")
        ->order('sales_volume')
        ->select();
        if($shop){
            $code=0;
            $message = '商品获取成功';
        }else{
            $code=1;
            $message = '商品获取失败';
        }
       ReturnJson($code,$message,$shop);
    }


    }
