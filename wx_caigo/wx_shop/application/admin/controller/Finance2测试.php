<?php
/*
1.SELECT a.user_id userId ,a.id oid ,a.order_total_price total_price ,b.order_id,b.goods_num goodnum
FROM wx_order a
LEFT JOIN wx_order_goods b ON b.order_id=a.id WHERE a.post_status=1,a.post_time>1533052800

 */
namespace app\admin\controller;
use think\Controller;
use think\Db;  
use app\index\model\Cate as CateModel;
class Finance extends Controller
{
//账单数据WHERE a.post_status=1
    //订单统计
        public function count(){
            //上个月起始时间
             $mo=date('Y-m-01 00:00:00',strtotime('-1 month'));
            $month=strtotime($mo);
            //这个月起始时间
        $m=date("Y-m-01");
        $mtime=strtotime($m);  $link['statistics']=array();
        // print_r($lastmonth);die;
            $count=db('order')->field('count(*) ordcount')->group('user_id')->select();
            $lst=Db::query("SELECT c.userId, sum(c.goodnum) sum,sum(c.total_price) total_price,d.name FROM
(
SELECT a.user_id userId ,a.id oid ,a.order_total_price total_price ,b.order_id,b.goods_num goodnum
FROM wx_order a
LEFT JOIN wx_order_goods b ON b.order_id=a.id WHERE a.post_status=1
 -- and post_time>'$mtime'
)c JOIN wx_user d ON d.id=c.userId  GROUP BY c.userId ");
            // print_r($lst);die;
            // select count(*) from wx_order GROUP BY user_id ;
            $orderGoods1=array();
            foreach ($lst as $kalue => $v) {
                foreach ($count as $k => $vv) {
                    $orderGoods1[$kalue]=$v; 
                    $orderGoods1[$kalue]['ordcount']=$vv['ordcount'];
                    $link['statistics']=$orderGoods1;
                     
                }
                
               // print_r($orderGoods1);die;
            }
            $link['lastmonth']=array();
            //上个月统计信息
            $lastmonth=Db::query("SELECT c.userId, sum(c.goodnum) sum,sum(c.total_price) total_price,d.name FROM
(
SELECT a.user_id userId ,a.id oid ,a.order_total_price total_price ,b.order_id,b.goods_num goodnum
FROM wx_order a
LEFT JOIN wx_order_goods b ON b.order_id=a.id WHERE a.post_status=1
 -- and post_time BETWEEN '$month' AND '$mtime'
)c JOIN wx_user d ON d.id=c.userId  GROUP BY c.userId ");
            // print_r($lst);die;
            // select count(*) from wx_order GROUP BY user_id ;
            foreach ($lastmonth as $kalue => $v) {
                foreach ($count as $k => $vv) {
                       $orderGoods1[$kalue]=$v; 
                    $orderGoods1[$kalue]['ordcount']=$vv['ordcount'];
                    $link['lastmonth']=$orderGoods1;
                }
            }
            // print_r($link);die;
            if($link){
                $code=0;
                $message="获取上月订单数据成功";
            }else{
              $code=1;
                $message="获取上月订单数据失败";  
            }
            return json_encode(['code'=>$code,'data'=>$link,'$message'=>$message]);
        }


        //账单数据查询
        public function ordersearch($page){
    if(request()->isPost()){
            $data['user_id']=trim(input('post.user_id'));
            $data['city']=trim(input('post.city'));
            $data['goods_id']=trim(input('post.goods_id'));
            $data['deliverytime_id']=trim(input('post.deliverytime_id'));
            $data['begintime']=strtotime(input('post.begintime'));
            $data['endtime']=strtotime(input('post.endtime'));
          $where=[];  
         if($data['user_id']){
            $where['p.user_id']=$data['user_id'];
         }
         if($data['goods_id']){
            $where['a.goods_id']=$data['goods_id'];
         }
         if($data['city']){
            $where['c.city']=$data['city'];
         }
         if($data['deliverytime_id']){
            $where['p.deliverytime_id']=$data['deliverytime_id'];
         }
         if($data['begintime']&&$data['endtime']){
            $where['p.post_time']=array(array('gt',$data['begintime']),array('lt',$data['endtime']));
         }
        $lst=db('order_goods')->alias('a')
        ->field('a.goods_id,a.goods_name,a.aprice,a.goods_num,a.order_id,p.id order_id,p.out_trade_no,p.out_trade_no,p.order_status,p.post_status,p.user_id,
            p.order_time,p.deliverytime_id,p.post_time,c.id,c.name username,c.city city')
        ->join('order p','p.id=a.order_id')
        ->join('user c','c.id=p.user_id')
        ->where($where)
        // ->where(['c.city'=>'11'])
        ->where('p.post_status=1')
        // ->select();
        ->paginate(['page'=> $page]);
        // print_r($lst);die;
        foreach ($lst as $k => $v) {
                        $orderGoods1[$k]=$v;
                        $orderGoods1[$k]['numprice']=$v['goods_num']*$v['aprice'];
                        $goodsfind=db('goods')->where(['id'=>$v['goods_id']])->find();
                        // $orderGoods1[$k]['cate_id']=$goodsfind['cate_id'];
                        $goodsfinds=db('cate')->where(['id'=>$goodsfind['cate_id']])->find();
                        $pcatefind=db('cate')->where(['id'=>$goodsfinds['pid']])->find();
                        $orderGoods1[$k]['pcatename']=$pcatefind['catename'];
                         $orderGoods1[$k]['catename']=$goodsfinds['catename'];
                        $orderGoods1[$k]['out_trade_no']=$v['out_trade_no'];
                        $orderGoods1[$k]['post_time']=$v['post_time'];
                        $goodsfind=db('deliverytime')->where(['id'=>$v['deliverytime_id']])->find();
                         $orderGoods1[$k]['deliverytime']=$goodsfind['time'];
                         $link['goodesOrder']=$orderGoods1;
                }
                // print_r($link['goodesOrder']);die;
        if($lst){
            $code=0;
            $message='配送时间查找成功';
        }else{
            $code=1;
            $message='配送时间查找失败';
        }
        }
        $link['deliverytime']=db('deliverytime')->select();
        $link['count']=db('order_goods')
        ->alias('a')
        ->join('order p','p.id=a.order_id')
        ->join('user c','c.id=p.user_id')
        ->where($where)
        ->where('p.post_status=1')->count();
        // $link['user']=db('user')->field('id,name')->select();
        // $cate=new CateModel();
        // $link['cateres']=$cate->catetree();
        // $link['goods']=db('goods')->field('id,name,cate_id')->select();
        $link['order_status']=['未通过','已通过','已拒绝'];
         ReturnJson($code,$message,$link);
    }

        
}
?>