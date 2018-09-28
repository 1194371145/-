<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;  
use app\index\model\Cate as CateModel;
class Order extends Controller
{
//139行;订单汇总模块
     //订单审核查询
        public function search($page){
    if(request()->isPost()){
            $data['user_id']=trim(input('post.user_id'));
            $data['order_status']=input('post.order_status');
            $data['deliverytime_id']=trim(input('post.deliverytime_id'));
          $where=[];  
         if($data['user_id']){
            $where['user_id']=$data['user_id'];
         }
         if($data['order_status']!=null){
            $where['order_status']=$data['order_status'];
         }
         if($data['deliverytime_id']){
            $where['deliverytime_id']=$data['deliverytime_id'];
         }
         // print_r($where);die;
          $goodsOrder = array();
        $user=db('order')->field('a.*,b.name')
        ->alias('a')
        ->join('user b ','b.id= a.user_id')
        ->where($where)
        ->order("order_time desc")
        // ->select();
        ->paginate(['page'=> $page]);
        // print_r($user);die;
        foreach ($user as $key => $v) {
            $goodsInfo['order_id']= $v['id'];
            $goodsInfo['name']= $v['name'];
            $goodsInfo['order_total_price'] = $v['order_total_price'];
            $goodsInfo['order_status']= $v['order_status'];
            $goodsInfo['user_id']= $v['user_id'];
            $goodsInfo['deliverytime_id']= $v['deliverytime_id'];
            $goodsInfo['order_time']= $v['order_time'];
            $orderGoods=db('order_goods')->where('order_id',$goodsInfo['order_id'])->select();
            $goodsInfo['order_goods']=$orderGoods;
            $goodsOrder[]=$goodsInfo;
            }
            // $goodsOrder['redlight']=0;//小红点默认不显示
             $link['goodsOrder']=$goodsOrder;
           $link['redlight']=(count($user)>0) ?'1' : '0';
        // print_r($link);die;
        if($user){
            $code=0;
            $message='审核查找成功';
        }else{
            $code=1;
            $message='审核查找失败';
        }
        }
        $link['deliverytime']=db('deliverytime')->select();
        $link['count']=db('order')
        ->where($where)->count();
        $link['order_status']=['未通过','已通过','已拒绝'];
        ReturnJson($code,$message,$link);
    }
    //订单审核列表
    public function statuslst($page){
            $goodsOrder = array();
            $user=db('order')
            ->order("order_time desc")->where('order_status!=1')
            ->paginate(['page'=> $page]);
            foreach ($user as $key => $v) {
            $goodsInfo['order_id']= $v['id'];
            $goodsInfo['order_total_price'] = $v['order_total_price'];
            $goodsInfo['order_status']= $v['order_status'];
             $goodsInfo['user_id']= $v['user_id'];
            $goodsInfo['deliverytime_id']= $v['deliverytime_id'];
            $goodsInfo['order_time']= $v['order_time'];
            $orderGoods=db('order_goods')->where('order_id',$goodsInfo['order_id'])->select();
            $goodsInfo['order_goods']=$orderGoods;
            $goodsOrder[]=$goodsInfo;
            }
            // $goodsOrder['redlight']=0;//小红点默认不显示
           $goodsOrder['redlight']=(count($user)>0) ?'1' : '0';
            // if (empty($user)) echo '$a 为空' . "";
            // foreach ($goodsOrder as $key => $v) {
            //     if($key==0){
            //      $goodsOrder['redlight']=1;//为1是有小红点
            // }
            // }
            
        if($user){
            $code=0;
            $message='订单审核列表获取成功';
        }else{
            $code=1;
            $message='订单管理列表获取失败';
        }
        ReturnJson($code,$message,$goodsOrder);
        }
       //产品审核通过
        public function checkadd($id){//接受表单传递的参数id
        if(request()->isPost()){
            $data['order_status']=1;//修改审核类型
            // $data['checktime']=time();//审核时间
            
            $user=db('order')
              ->where(['id'=>$id])
              ->data($data)
              ->update();
              if($user){
                $code=0;
            $message='审核通过';
              }else{
                $code=1;
            $message='审核不成功或者本订单已审核';
              }
        }
        ReturnJson($code,$message);
    }
    //产品审核拒绝
        public function checkreject($id){//接受表单传递的参数id
           $user=db('order')
            ->field('id,order_status')
            ->where(['id'=>$id])
            ->find();
            // print_r($user);die;
            if($user['order_status']==2){//订单已经被管理员拒绝审批
                $code=1;
                $message='该订单已经被拒绝审批，请不要重复操作';
            }else{
            $userres=db('order')
            ->where(['id'=>$id])
            ->update(['order_status'=>'2']);
            if($userres){
                $code=0;
                $message='该订单拒绝审批成功';
            }else{
                $code=2;
                $message='该操作执行失败';
            }
            }
         ReturnJson($code,$message);
    }
   

//订单汇总
//用户名查询
        public function usersearch(){
    if(request()->isPost()){
         $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'name'=>['like','%'.$keywords.'%'],
                ];
                // 'levname','like','%'.$keywords.'%'
        $user=db('user')
        ->field('id,name')
        ->where($where)
        ->select();
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
    public function goodsearch(){
         $cateid=input('cate_id');//接受表单传递的参数
                // 'levname','like','%'.$keywords.'%'
        $where=['cate_id'=>$cateid];
        $user=db('goods')
        ->field('id,name')
        ->where($where)
        ->select();
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
        //配送时间审核查询
        public function orderlst(){
        //$goodsOrder = array();
        $order=db('order')
        ->where('post_status',1)
        ->select();
        $orderGoods=db('order_goods')->select();
              foreach ($order as $kk => $vv) {
                foreach ($orderGoods as $k => $v) {
                    if($v['order_id']==$vv['id']){
                        $orderGoods1[$k]=$v;
                        $orderGoods1[$k]['numprice']=$v['goods_num']*$v['aprice'];
                        $goodsfind=db('goods')->where(['id'=>$v['goods_id']])->find();
                        // $orderGoods1[$k]['cate_id']=$goodsfind['cate_id'];
                        $goodsfinds=db('cate')->where(['id'=>$goodsfind['cate_id']])->find();
                        $pcatefind=db('cate')->where(['id'=>$goodsfinds['pid']])->find();
                        $orderGoods1[$k]['pcatename']=$pcatefind['catename'];
                         $orderGoods1[$k]['catename']=$goodsfinds['catename'];
                        $orderGoods1[$k]['out_trade_no']=$vv['out_trade_no'];
                        $orderGoods1[$k]['post_time']=$vv['post_time'];
                        // $orderGoods1[$k]['user_id']=$vv['user_id'];
                        $goodsfind=db('user')->where(['id'=>$vv['user_id']])->find();
                         $orderGoods1[$k]['user']=$goodsfind['name'];
                        // $orderGoods1[$k]['deliverytime_id']=$vv['deliverytime_id'];
                        $goodsfind=db('deliverytime')->where(['id'=>$vv['deliverytime_id']])->find();
                         $orderGoods1[$k]['deliverytime']=$goodsfind['time'];
                         // print_r($orderGoods1);die;
                    }
                }              
            }
            $link['orderGoods1']=$orderGoods1;    
        if($order){
            $code=0;
            $message='订单管理列表获取成功';
        }else{
            $code=1;
            $message='订单管理列表获取失败';
        }
          ReturnJson($code,$message,$link);
    }

    //订单统计
        public function count(){
            $link=array();
            //上个月起始时间
             $mo=date('Y-m-01 00:00:00',strtotime('-1 month'));
            $month=strtotime($mo);
            //这个月
            $lst=Db::query("SELECT tempB.days,SUM(goods_num)goodsNum ,tempB.COUNT
FROM wx_order_goods wx
JOIN (
SELECT DATE_FORMAT(tempA.post,'%Y%m%d') days,id,COUNT(id) COUNT FROM
 (
         SELECT id,out_trade_no,user_id,order_total_price,FROM_UNIXTIME(post_time) post FROM wx_order WHERE DATE_FORMAT(FROM_UNIXTIME(post_time),'%Y%m')=DATE_FORMAT(CURDATE(),'%Y%m')
 )
 tempA GROUP BY days
)tempB on tempB.id=wx.order_id GROUP BY tempB.days");
            $link['nowmonth']=$lst;
            if($link){
                $code=0;
                $message="获取本月订单数据成功";
            }else{
              $code=1;
                $message="获取本月订单数据失败";  
            }
            
            ReturnJson($code,$message,$link);
        }
//订单汇总查询
        public function ordersearch($page){
    if(request()->isPost()){
            $data['user_id']=trim(input('post.user_id'));
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
         if($data['deliverytime_id']){
            $where['p.deliverytime_id']=$data['deliverytime_id'];
         }
         if($data['begintime']&&$data['endtime']){
            $where['p.post_time']=array(array('gt',$data['begintime']),array('lt',$data['endtime']));
         }
        $lst=db('order_goods')
        ->alias('a')
        ->join('order p','p.id=a.order_id')
        ->where($where)
        ->where('p.post_status=1')
        ->paginate(['page'=> $page]);
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
                        // $orderGoods1[$k]['user_id']=$vv['user_id'];
                        $goodsfind=db('user')->where(['id'=>$v['user_id']])->find();
                         $orderGoods1[$k]['user']=$goodsfind['name'];
                        // $orderGoods1[$k]['deliverytime_id']=$vv['deliverytime_id'];
                        $goodsfind=db('deliverytime')->where(['id'=>$v['deliverytime_id']])->find();
                         $orderGoods1[$k]['deliverytime']=$goodsfind['time'];
                         $link['goodesOrder']=$orderGoods1;
                         // print_r($orderGoods1);die;
                }
        if($lst){
            $code=0;
            $message='配送时间查找成功';
        }else{
            $code=1;
            $message='配送时间查找失败';
        }
        }
        $link['deliverytime']=db('deliverytime')->select();
        // $link['user']=db('user')->field('id,name')->select();
        $link['count']=db('order_goods')
        ->alias('a')
        ->join('order p','p.id=a.order_id')
        ->where($where)
        ->where('p.post_status=1')->count();
        $cate=new CateModel();
        $link['cateres']=$cate->catetree();
        $link['goods']=db('goods')->field('id,name,cate_id')->select();
        $link['order_status']=['未通过','已通过','已拒绝'];
         ReturnJson($code,$message,$link);
    }




    //test
     public function test($page){
    if(request()->isPost()){
            $data['user_id']=trim(input('post.user_id'));
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
         if($data['deliverytime_id']){
            $where['p.deliverytime_id']=$data['deliverytime_id'];
         }
         if($data['begintime']&&$data['endtime']){
            $where['p.post_time']=array(array('gt',$data['begintime']),array('lt',$data['endtime']));
         }
       $lst=db('order_goods')->alias('a')
        ->field('c.name username,a.goods_id,a.goods_name,a.aprice,a.goods_num,a.order_id,p.id order_id,p.out_trade_no,p.out_trade_no,p.order_status,p.post_status,p.user_id,
            p.order_time,p.deliverytime_id,p.post_time,c.id')
        ->join('order p','p.id=a.order_id')
        ->join('user c','c.id=p.user_id')
        ->where($where)
        ->where('p.post_status=1')
        // ->select();
        ->paginate(['page'=> $page]);
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
        // ->paginate(['page'=> $page]);
    print_r($link);die;
         ReturnJson($code,$message,$link);
    }
}

        
}
?>