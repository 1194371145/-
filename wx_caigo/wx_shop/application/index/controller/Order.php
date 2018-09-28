<?php
namespace app\index\controller;
use think\Controller;
use think\Db;  
use think\Session;
class Order extends Common
{
           //生成订单
    public function flow3(){
        
        $uid =input('post.sessid');
        $array=input('post.sid');
        // $array= $_POST["sid"];//id-goods_num-goods_id//购物车id-商品数量-商品id
        // $array="13-3-16,14-2-17";//'1-1-21,2-1-22,3-3--23,4-2-24',//id-goods_num-goods_id
        $cartInfo = explode(",",$array);
        /*test数组转换为字符串
        // $arr = array('Hello','[1] => world','I','love','Shanghai!');
        // $link = implode(" ",$arr);//Hello World! I love Shanghai!
            print_r($select);die;*/
        // $cartInfo = array('1-1-21','2-1-22','3-3--23','4-2-24');//需要的数据
        $cartIds = array();
        $totalPrice = 0;
        $goodsOrder = array();
        foreach ($cartInfo as $key => $value) {//id-goods_num-goods_id
            // $cartIds[] = $link[0];
            $link = explode('-',$value);
            // print_r($link);die;//[( [0] => 1 [1] => 1 [2] => 21 )]
            $goodsInfo = db('goods')->find($link[2]);// $goodsInfo = $mGoods->find($link[2]);// print_r($goodsInfo);die;
            $goodsInfo['goods_num'] = $link[1];
            $goodsInfo['cart_id'] = $link[0];
            $cartlst = db('cart')->find($link[0]);
            // print_r($cartInfo);die;
            $goodsInfo['price'] =$cartlst['price'];
            // $goodsOrder[]=$cartInfo;
            $goodsOrder[]=$goodsInfo;
            $totalPrice += $link[1]*$goodsInfo['price'];
        }
        // print_r($goodsOrder);die;
        //处理订单基本信息表
        $orderData['order_total_price'] = $totalPrice;
        $orderData['out_trade_no'] = time().rand(111111,999999);
        $orderData['user_id'] = $uid;//下单用户id
        $orderData['deliverytime_id'] = input('post.deliverytime_id');
        $orderData['order_time'] = time();//下单时间
        $orderData['order_status'] =0;//0待审核状态
        $orderId = db('order')->insertGetId($orderData);
        // print_r($orderId);die;
        if($goodsOrder){
            foreach ($goodsOrder as $key => $value) {
                $orderGoods['goods_id'] = $value['id'];
                $orderGoods['goods_num'] = $value['goods_num'];
                $orderGoods['aprice'] = $value['price'];
                $orderGoods['goods_name'] =$value['name'];
                $orderGoods['pic']=$value['pic'];
                $orderGoods['unit']=$value['unit'];
                $orderGoods['order_id'] =$orderId;
                $orgoods=db('order_goods')->insert($orderGoods);//添加商品订单表
                // if($orgoods){
                 db('goods')->where('id',$value['id'])->setInc('sales_volume', $value['goods_num']);//
                 db('goods')->where('id',$value['id'])->setDec('shop_num', $value['goods_num']);
                db('cart')->delete($value['cart_id']);//删除购车车
                $code=0;
                $message='生成订单成功';
                // // }else{
                //  return json(['code'=>2, 'msg'=>'添加订单商品表失败']);
                // }
            }
        }
        ReturnJson($code,$message);
    }
     //订单列表
     public function flow4(){
        $uid =input('post.sessid');
        $goodsOrder = array();
        $order=db('order')->where(['user_id'=>$uid,
            'order_status'=>0])
        ->order('order_time desc')->select();
        // print_r($order);die;
        $orderres=array();
        foreach ($order as $key => $value) {//[([0] =>Array([id]=>67)[1]=>Array([id]=>68)]
            // $orderres['id'] = $value['id'];
            $orderres['order_total_price'] = $value['order_total_price'];
            $orderres['deliverytime_id'] = $value['deliverytime_id'];
            $deliverytim=db('deliverytime')->field('time')->where(['id'=>$orderres['deliverytime_id']])->find();
            // print_r($deliverytim);die;
            $orderres['deliverytim']=$deliverytim['time'];
            $orderres['order_id'] = $value['id'];
            $order_goods=db('order_goods')->where(['order_id'=>$value['id']])->select();
            // print_r($order_goods);die;
            $orderres['goods']=$order_goods; 
            $goodsOrder[]=$orderres;
             $info['noworder'] =$goodsOrder;
        }
// 
       // print_r($goodsOrder);die;
        // if(!$info['goods']){
        //     // $info['goods'] = array();
        // }
        //查询消费额
        $m=date("Y-m-01");
        $mtime=strtotime($m);
        $totalPrice = 0;
        $nPrice = 0;
        $where=['user_id'=>$uid,'post_status'=>1];
         $weekprices=db('order')->where($where)->where('order_time','>=',$mtime)->select();//查询当前月的数据
         $numprices=db('order')->where($where)->select();//历史消费额
         foreach ($weekprices as $k => $v){
            $totalPrice+= $v['order_total_price'];
         }
         foreach ($numprices as $k => $v){
            $nPrice+= $v['order_total_price'];
         }
         $info['month'] = $totalPrice;//获取月销售额
         $info['nPrice'] = $nPrice;//获取历史消费额
         $nowtime=date("Y-m-d");
        $now=strtotime($nowtime);
        //
         $goodsOrder1 = array();
        $order=db('order')->where(['user_id'=>$uid,
            'order_status'=>1])->where('order_time','>',$now)
        ->order('order_time desc')->select();
        $orderres=array();
        foreach ($order as $key => $value) {//[([0] =>Array([id]=>67)[1]=>Array([id]=>68)]
            // $orderres['id'] = $value['id'];
            $orderres['order_total_price'] = $value['order_total_price'];
            $orderres['deliverytime_id'] = $value['deliverytime_id'];
            $deliverytim=db('deliverytime')->field('time')->where(['id'=>$orderres['deliverytime_id']])->find();
            // print_r($deliverytim);die;
            $orderres['deliverytim']=$deliverytim['time'];
            $orderres['order_id'] = $value['id'];
            $order_goods=db('order_goods')->where(['order_id'=>$value['id']])->select();
            // print_r($order_goods);die;
            $orderres['goods']=$order_goods; 
            $goodsOrder1[]=$orderres;
             $info['passorder'] =$goodsOrder1;
        }
        // 
//          $info['passorder']=Db::query("SELECT a.goods_name,a.goods_id,a.aprice,a.goods_num,a.order_id,pic,unit,b.*
// FROM wx_order_goods a 
// LEFT JOIN wx_order b ON a.order_id=b.id WHERE user_id='$uid' and order_status=1 and order_time>'$now'  ORDER BY order_time desc");//已完成订单
         ReturnJson(0,'订单列表查询成功',$info);
     }

     //订单撤销
     public function orderdel(){
        $data['order_id'] = input('post.id');
         $link['order']=db('order')->where(['id'=>$data['order_id']])->select();
        $link['order_goods']=db('order_goods')->where(['order_id'=>$data['order_id']])->select();
        // print_r($link['order_goods']);die;
        if(request()->isPost()) {
            foreach ($link['order_goods'] as $key => $value) {
                db('goods')->where('id',$value['goods_id'])->setInc('shop_num', $value['goods_num']);//
                 db('goods')->where('id',$value['goods_id'])->setDec('sales_volume', $value['goods_num']); 
            }
        $orgoods=db('order_goods')->where(['order_id'=>$data['order_id']])->delete();
        if($orgoods){
            db('order')->where('id',$data['order_id'])->delete();
            $code=0;
           $message="订单撤销成功"; //撤销订单，订单删除成功
        }else{
           $code=1;
           $message="删除失败"; 
        }
    }
    ReturnJson($code,$message,$link);
     }
     //订单撤销添加
     public function orderadd(){
        $uid =input('post.sessid');
            $levels=db('user')->where(['id'=>$uid])->find();
            $levelid=$levels['levelid'];
        $goods_id= input('post.goods_id');
        $orderid = input('post.order_id');
        $goodsCart = db('order_goods')->where(['order_id'=>$orderid, 'goods_id'=>$goods_id])->find();
        //print_r($goods_id);die;
                    if($goodsCart){
                        // echo '1';die;
                        //记录已经存在，只需增加商品数量即可
                         db('order_goods')->where(array('order_id'=>$orderid, 'goods_id'=>$goods_id))->setInc('goods_num',1);
                          db('goods')->where('id',$goods_id)->setDec('shop_num', 1);//
                 db('goods')->where('id',$goods_id)->setInc('sales_volume', 1); 
                 $totalPrice=0;
                  $order_prices=db('order_goods')->where(['order_id'=>$orderid])->select();
        foreach ($order_prices as $key => $v) {
            $totalPrice += $v['goods_num']*$v['aprice'];
        }
        // print_r($totalPrice);die;
        $goodsCart = db('order')->update(['order_total_price' =>$totalPrice,'id'=>$orderid]);
                         return json(['code'=>0, 'msg'=>'加入订单成功']);
                    }else{
                        //echo $goods_id;die;
                         $goodslst=db('goods')
                         ->alias('a')
                ->field('a.*,c.id pid,c.mprice,c.mlevel_id,c.goods_id')
                ->where(['a.id'=>$goods_id,'c.mlevel_id'=>$levelid])
                //->where(['c.mlevel_id'=>$levelid])
                ->join('prices c',"a.id=c.goods_id")
                ->find();
                if($goodslst){
                    $data['goods_id'] =$goodslst['id'];
                        $data['goods_name'] =$goodslst['name'];
                        $data['aprice'] =$goodslst['mprice'];
                        $data['goods_num'] =1;
                        $data['order_id'] =$orderid;
                        $data['pic'] =$goodslst['pic'];
                        $data['unit'] =$goodslst['unit'];
                        //print_r($data);die;
                        db('order_goods')->insert($data);
                        db('goods')->where('id',$goods_id)->setDec('shop_num', 1);//
                        db('goods')->where('id',$goods_id)->setInc('sales_volume', 1);
                        $totalPrice=0;
                  $order_prices=db('order_goods')->where(['order_id'=>$orderid])->select();
        foreach ($order_prices as $key => $v) {
            $totalPrice += $v['goods_num']*$v['aprice'];
        } 
                        $code=0;
                        $message="加入本订单成功";
                }else{
                        $code=3;
                        $message="加入本订单失败";
                }
                       
        }
        ReturnJson($code,$message);
     }
     //订单中商品删除
     public function orderadel(){
        $array=input('post.sid');
        // $array= $_POST["sid"];//goods_num-order_goods_id//购物车id-商品数量-商品id
        // $array="1-76";//数量-订单商品id
        $cartInfo = explode("-",$array);
        $find=db('order_goods')->where(['id'=>$cartInfo[1]])->find();
        $orderid=$find['order_id'];
        // print_r($orderid);die;
         if($cartInfo[0]>$find['goods_num']){
            $code=1;
            $message="超出删除范围，请不要恶意操作";
         }elseif($cartInfo[0]==$find['goods_num']){//如果数量相同则直接操作
            $del=db('order_goods')->where(['id'=>$cartInfo[1]])->delete();
            if($del){
                db('goods')->where('id',$find['goods_id'])->setInc('shop_num', $cartInfo[0]);
                db('goods')->where('id',$find['goods_id'])->setDec('sales_volume', $cartInfo[0]);
        $totalPrice=0;
        $order_prices=db('order_goods')->where(['order_id'=>$orderid])->select();
        foreach ($order_prices as $key => $v) {
            $totalPrice += $v['goods_num']*$v['aprice'];
        }
        $goodsCart = db('order')->update(['order_total_price' =>$totalPrice,'id'=>$orderid]);
                 $code=0;
                $message="删除成功";
            }else{
                $code=2;
                $message="删除失败";
            }
            }else{//
              $del=db('order_goods')->where(['id'=>$cartInfo[1]])->setDec('goods_num',$cartInfo[0]);
              db('goods')->where('id',$find['goods_id'])->setInc('shop_num', $cartInfo[0]);
                db('goods')->where('id',$find['goods_id'])->setDec('sales_volume', $cartInfo[0]);
        $totalPrice=0;
        $order_prices=db('order_goods')->where(['order_id'=>$orderid])->select();
        foreach ($order_prices as $key => $v) {
            $totalPrice += $v['goods_num']*$v['aprice'];
        }
        $goodsCart = db('order')->update(['order_total_price' =>$totalPrice,'id'=>$orderid]);
                 $code=0;
                $message="该商品删除成功";
            }
        ReturnJson($code,$message);
     }
      //配送时间修改
     public function orderdetime(){
        if(request()->isPost()){
        $deliverytime= input('post.deliverytime');
        $orderid = input('post.order_id');
        db('order')->update(['deliverytime_id'=>$deliverytime,'id'=>$orderid]);
        $code=0;
        $message="修改配送时间成功";
        }
        $link['deliverytime']=db('deliverytime')->select();
        // print_r($link);die;
        ReturnJson($code,$message,$link);
     }
     //撤销订单列表
     public function dellst(){
       $orderid=input('post.order_id');//68，92
       $order_goods=db('order_goods')->where(['order_id'=>$orderid])->select();
       $order=db('order')->where(['id'=>$orderid])->find();
       foreach ($order_goods as $k => $v) {
            $order_goods[$k]=$v;
            $order_goods[$k]['out_trade_no']=$order['out_trade_no'];
            $order_goods[$k]['user_id']=$order['user_id'];
            $order_goods[$k]['order_total_price']=$order['order_total_price'];
            $order_goods[$k]['order_time']=$order['order_time'];
            $deliverytime_id=db('deliverytime')->where(['id'=>$order['deliverytime_id']])->find();
            // print_r($deliverytime_id);die;
            $order_goods[$k]['deliverytime']=$deliverytime_id['time'];
            $link['order_goods']=$order_goods;
       }
       $link['deliverytime']=db('deliverytime')->select();
       if($order){
        $code=0;
        $message="获取成功";
       }else{
        $code=1;
        $message="获取失败";
       }
       // print_r($order_goods);die;
       //已完成订单
       ReturnJson($code,$message,$link);
        
     }

     //订单撤销修改
     public function orderdedit(){
        $uid =input('post.sessid');
        $levels=db('user')->where(['id'=>$uid])->find();
        $levelid=$levels['levelid'];
        $order_id=input('post.order_id');
        $ordergs_id= input('post.ordergs_id');
        $num = input('post.num');
        $totalPrice=0;
        $goodsCart = db('order_goods')->where(['id'=>$ordergs_id])->find();
        if($num < $goodsCart['goods_num']){//传递数量少于订单数量
        $gooodsnum=$goodsCart['goods_num']-$num;
        $goods = db('goods')->where(['id'=>$goodsCart['goods_id']])->setInc('shop_num',$gooodsnum);
        $goods = db('goods')->where(['id'=>$goodsCart['goods_id']])->setDec('sales_volume',$gooodsnum);
        }elseif ($num == $goodsCart['goods_num']) {
        }else{//传递数量大于订单数量
         $gooodsnum=$num-$goodsCart['goods_num'];
         $goods = db('goods')->where(['id'=>$goodsCart['goods_id']])->setInc('sales_volume',$gooodsnum);
        $goods = db('goods')->where(['id'=>$goodsCart['goods_id']])->setDec('shop_num',$gooodsnum);
        }
        // print_r($goodsCart);die;
        $goodsCart = db('order_goods')->update(['goods_num' =>$num,'id'=>$ordergs_id]);
        $order=db('order')->where(['id'=>$order_id])->find();
        $order_prices=db('order_goods')->where(['order_id'=>$order_id])->select();
        foreach ($order_prices as $key => $v) {
            $totalPrice += $v['goods_num']*$v['aprice'];
        }   
        $goodsCart = db('order')->update(['order_total_price' =>$totalPrice,'id'=>$order_id]);
        // print_r($order_prices);die;
         if($goodsCart){
        $code=0;
        $message="修改成功";
       }else{
        $code=1;
        $message="修改失败";
       }
        ReturnJson($code,$message);
     }
     public function orderresadd(){//测试生成订单优化方案
        $uid =input('post.sessid');
        $array=input('post.sid');
        // $array= $_POST["sid"];//id-goods_num-goods_id//购物车id-商品数量-商品id
        // $array="13-3-16,14-2-17";//'1-1-21,2-1-22,3-3--23,4-2-24',//id-goods_num-goods_id
        $cartInfo = explode(",",$array);
        /*test数组转换为字符串
        // $arr = array('Hello','[1] => world','I','love','Shanghai!');
        // $link = implode(" ",$arr);//Hello World! I love Shanghai!
            print_r($select);die;*/
        // $cartInfo = array('1-1-21','2-1-22','3-3--23','4-2-24');//需要的数据
        $cartIds = array();
        $totalPrice = 0;
        $goodsOrder = array();
        foreach ($cartInfo as $key => $value) {//id-goods_num-goods_id
            // $cartIds[] = $link[0];
            $link = explode('-',$value);
            // print_r($link);die;//[( [0] => 1 [1] => 1 [2] => 21 )]
            $goodsInfo = db('goods')->find($link[2]);// $goodsInfo = $mGoods->find($link[2]);// print_r($goodsInfo);die;
            $goodsInfo['goods_num'] = $link[1];
            $goodsInfo['cart_id'] = $link[0];
            $cartlst = db('cart')->find($link[0]);
            // print_r($cartInfo);die;
            $goodsInfo['price'] =$cartlst['price'];
            // $goodsOrder[]=$cartInfo;
            $goodsOrder[]=$goodsInfo;
            $totalPrice += $link[1]*$goodsInfo['price'];
        }
        $common=new \array_column\Column;
        $goodsOrder=$common->array_columns($goodsOrder,'id,name,price,goods_num,pic,unit');
        $array=array();
        foreach ($goodsOrder as $key => $ves) {
            $b=array();
            $b['goods_id']=$ves['id'];
            $b['goods_name']=$ves['name'];
            $b['aprice']=$ves['price'];
            $b['goods_num']=$ves['goods_num'];
            $b['pic']=$ves['pic'];
            $b['unit']=$ves['unit'];
            $ves=$b;
            $array[]=$ves;
        }print_r($array);die;
        ReturnJson($code,$message);
    }


}
