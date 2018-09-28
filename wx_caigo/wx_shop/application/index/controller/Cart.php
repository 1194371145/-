<?php
namespace app\index\controller;
use think\Controller;
use think\Session;
class Cart extends Common
{
    //加入购物车接口
    public function addToCart(){
            $uid = input('post.sessid');
            $levels=db('user')->where(['id'=>$uid])->find();
            $levelid=$levels['levelid'];
            // $goodsNum =input('post.num');
            $goodsId = input('post.goodsId');
            // $delive_id = input('post.delive_id');
            if($uid){
                $goodsInfo = db('goods')
                ->alias('a')
                ->where(['c.mlevel_id'=>$levelid])
                ->join('prices c',"a.id=c.goods_id")
                ->find($goodsId);
                if($goodsInfo){
                // if($goodsInfo['shop_num'] >$goodsNum){
                    //先判断当前商品是否已经被加入购物车，如果没有，写入一条新的数据，如果已经存在，则只增加商品购买数量即可
                    $goodsCart = db('cart')->where(array('uid'=>$uid, 'goods_id'=>$goodsId))->find();
                    // print_r($goodsCart);die;
                    if($goodsCart){
                        //记录已经存在，只需增加商品数量即可
                         db('cart')->where(array('uid'=>$uid, 'goods_id'=>$goodsId))->setInc('goods_num');
                         return json(['code'=>0, 'msg'=>'加入购物车成功']);
                    }else{
                        //未加入购物车则写入整条记录
                        $data['uid'] = $uid;
                        $data['goods_name'] = $goodsInfo['name'];
                        $data['price'] = $goodsInfo['mprice'];
                        $data['pic'] = $goodsInfo['pic'];
                        $data['unit'] = $goodsInfo['unit'];
                        $data['goods_num'] =1;
                        // $data['goods_num'] = $goodsNum;
                        $data['goods_id'] = $goodsId;
                        db('cart')->insert($data);
                        ReturnJson(0,'加入购物车成功');
                    }
                }else{
                    ReturnJson(1,'该商品不存在');
                }
            }else{
                ReturnJson(2,'请重新登录');
            }
    }
        //购物车列表
            public function Cartlist(){  
            $uid = input('post.sessid');
                $lst['lst']=db('cart')
                ->where(['uid'=>$uid])
                ->select();
                foreach ($lst['lst'] as $k => $v) {
                    $lst['lst'][$k]=$v;
                    $goodsfind=db('goods')->where(['id'=>$v['goods_id']])->find();
                    $lst['lst'][$k]['kuchun']=$goodsfind['shop_num'];
                }
                // print_r($lst);die;
                $lst['deliverytime']=db('deliverytime')
                ->select();
                // print_r($lst);die;
        if($lst){
                $code=0;
                $message = '购物车列表获取成功';
        }else{
                $code=1;
                $message = '购物车列表获取失败';
        }
        ReturnJson($code,$message,$lst);
            }
            //购物车删除
            public function del($id){
                $lst=db('cart')
                ->delete($id);
                // print_r($lst);die;
        if($lst){
                $code=0;
                $message = '商品删除成功';
        }else{
                $code=1;
                $message = '商品删除失败';
        }
       ReturnJson($code,$message,$lst);
            }
            //购物车批量删除
            public function alldel(){
                $array = input('post.id');
                // $array="13,14";//'1-1-21,2-1-22,3-3--23,4-2-24',
                // $array= $_POST["id"];
                $select = explode(",",$array);
        // $select = implode(",",$array);
        // print_r($select);die;
                $lst=db('cart')
                ->delete($select);
                // print_r($lst);die;
        if($lst){
                $code=0;
                $message = '商品删除成功';
        }else{
                $code=1;
                $message = '商品删除失败';
        }
        ReturnJson($code,$message);
            }
           


}
