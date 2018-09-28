<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;  
error_reporting(E_ALL^E_NOTICE^E_WARNING);
class User extends Controller
{
	//用户审核列表
	public function checklst($page){
        $user = db('user')
            ->field('id,tel,password,checktime,checktype')
            ->order('id')
            ->paginate(['page'=> $page]);
        if($user){
        	ReturnJson(0,'用户审核获取成功',$user);
        }
        ReturnJson(1,'用户审核获取失败');
    }
        //用户审核查询
    public function checkfind($page){
        if(request()->isPost()){
            $page = input('page');
            $keywords = input('keywords');//接受表单传递的参数
            // if(!is_numeric($keywords)){//如果输入不是数字格式的处理
            //     ReturnJson(2,'请输入正确的数字');
            // }
        $user = db('user')
            ->field('id,tel,password,checktime,checktype')
            ->where('tel','like','%'.$keywords.'%')
            ->paginate(['page'=> $page]);
        if($user){
            ReturnJson(0,'用户查找成功',$user);
        }else{
           ReturnJson(1,'用户查找失败');
        }
        }
    }
    //用户审核通过
    public function checkadd($id){//接受表单传递的参数id
        // $level=db('level')->select();//添加表单中的级别传递
        if(request()->isPost()){
            $data=input('post.');
            $user=db('user')
            ->field('id,checktype')
            ->where(['id'=>$id])
            ->find();
            if($user['checktype']==1){//用户已经被管理员拒绝审批
               ReturnJson(1,'该用户已经被审批，请不要重复操作');
            }
            $data['checktype']=1;//修改审核类型
            $data['checktime']=time();//审核时间
            // print_r($data);die;( [id] => 4 [name] => 报错吧 [levelid] => 1 [city] => 北京省郑州市南充县 [checktype] => 1 [checktime] => 1531903197 )
             $validate = \think\Loader::validate('User');
            if(!$validate->scene('check')->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
            $user=db('user')
              ->where(['id'=>$id])
              ->data($data)
              ->update();
              if($user){
              ReturnJson(0,'用户审核成功');
              }else{
                ReturnJson(3,'用户审核不成功');
              }
        }
    }
     //用户审核拒绝
    public function checkreject($id){//接受表单传递的参数id
            $user=db('user')
            ->field('id,checktype')
            ->where(['id'=>$id])
            ->find();
            if($user['checktype']==2){//用户已经被管理员拒绝审批
               ReturnJson(1,'该用户已经被拒绝审批，请不要重复操作');
            }else{
            $userres=db('user')
            ->where(['id'=>$id])
            ->update(['checktype'=>'2']);
            if($userres){
                ReturnJson(0,'拒绝用户审核');
            }else{
                ReturnJson(2,'拒绝用户审核失败');
            }
            }
    }
    //用户列表
    public function lst($page){
         $m=date("Y-m-01");
        $mtime=strtotime($m);
        $user['spend']=Db::query("SELECT c.userId,sum(c.total_price) total_price,d.name FROM
(
SELECT a.user_id userId  ,a.order_total_price total_price ,b.order_id
FROM wx_order a
LEFT JOIN wx_order_goods b ON b.order_id=a.id WHERE a.post_status=1 and post_time>'$mtime'

)c JOIN wx_user d ON d.id=c.userId  GROUP BY c.userId ");
        $user['user']=db('user')
        ->field('a.id,a.name,a.tel,a.password,a.checktime,a.city,a.levelid,c.levname')
        ->alias('a')
        ->where(['checktype'=>1])
        ->join('level c',"a.levelid=c.id")
        ->order('a.id DESC')
        ->paginate(['page'=> $page]);
        foreach ($user as $k => $v) {
            $user[$k]=$v;
        }
        // print_r($user);die;
        if($user){
           ReturnJson(0,'用户列表获取成功',$user);
        }else{
           ReturnJson(1,'用户列表获取失败');
        }
        }
        
        //         $user['spend']=Db::query("SELECT c.userId,sum(c.total_price) total_price,d.name FROM
// (
// SELECT a.user_id userId  ,a.order_total_price total_price ,b.order_id
// FROM wx_order a
// LEFT JOIN wx_order_goods b ON b.order_id=a.id WHERE a.post_status=1
//  -- and post_time>'$mtime'

// )c JOIN wx_user d ON d.id=c.userId  GROUP BY c.userId ");
        //用户列表关键字查询
        public function search($page){
    if(request()->isPost()){
       $m=date("Y-m-01");
        $mtime=strtotime($m);//月季时间

         $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'a.name|a.tel|a.city'=>['like','%'.$keywords.'%'],
                'checktype'=>1
                ];
        $user['user']=db('user')
        ->alias('a')
        ->field('a.id,a.name,a.tel,a.password,a.checktime,a.city,a.levelid,c.levname')
        ->where($where)
        ->JOIN('level c',"a.levelid=c.id")
        ->order('a.id')
        ->paginate(['page'=> $page]);
        $order=array();
        // ->select();
        // print_r($user['user']);die;
        foreach ($user['user'] as $k => $v) {//遍历用户列表
        $spends=db('order')
        ->where(['user_id'=>$v['id'],'post_status'=>1])->select();
        // print_r($spends);die;
        $totalPrice=0.00;
        if($spends){//如果当前用户有消费额
          foreach ($spends as $key => $vv) {
            // echo $vv['order_total_price'];die;
                $totalPrice = $vv['order_total_price']+$totalPrice;
            }
        }else{//如果当前用户没有消费额
            $totalPrice=0;
        }
        // echo $totalPrice;die;
         $orders[$k]=$v;
         $orders[$k]['spend']=$totalPrice;
         $order['order']=$orders;
         //  $link['goodesOrder']
         $order['count']=db('user')
        ->alias('a')
        ->field('a.id,a.name,a.tel,a.password,a.checktime,a.city,a.levelid,c.levname')
        ->where($where)
        ->JOIN('level c',"a.levelid=c.id")
        ->order('a.id')
        ->count();
         // print_r($order);die;
        }
        // print_r($order);die;
        if($user){
            $code=0;
            $message='用户查找成功';
        }else{
            $code=1;
            $message='用户查找失败';
        }
         ReturnJson($code,$message,$order);
        }
    }

    //用户删除
    public function del($id){
         $user=db('user')
         ->delete($id);
        if($user){
           ReturnJson(0,'用户删除成功');
        }else{
           ReturnJson(1,'用户删除失败');
        }
        }
        //用户列表添加
        public function add(){//接受表单传递的参数id
        // $level=db('level')->select();//添加表单中的级别传递
        if(request()->isPost()){
            $data=input('post.');
             $validate = \think\Loader::validate('User');
            if(!$validate->scene('add')->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
            $data['password']=md5(md5(input('post.password')));
            $data['checktype']=1;//修改审核类型
            $data['addtime']=time();//添加时间
            $data['checktime']=time();//审核时间
            // print_r($data);die;
            $user=db('user')
              ->data($data)
              ->insert();
              if($user){
                ReturnJson(0,'添加成功');
              }else{
                ReturnJson(1,'添加失败');
              }
        }
    }
        //用户修改
        public function edit($id){//接受表单传递的参数id
        $user[level]=db('level')->select();
            $userres=db('user')
            ->field('name,password,tel,city')
            ->where(['id'=>$id])
            ->find();
            // $users=db('user')//该表为传递给json的数据
            // ->field('name,tel,city')
            // ->where(['id'=>$id])
            // ->find();
        if(request()->isPost()){
            $data=input('post.');
            if(!$data['password']){//如果没有传递密码时，密码为$userres查询出来的密码
            $data['password']=$userres['password'];
        }else{
            $validate = \think\Loader::validate('User');
            if(!$validate->scene('edit')->check($data)){
                $message=$validate->getError();
                ReturnJson(1,$message);
            }
            $data['password']=md5(md5(input('post.password')));
        }
             
            $user['user']=db('user')
              ->where(['id'=>$id])
              ->data($data)
              ->update();
              if($user){
               ReturnJson(0,'用户修改成功');
              }else{
                ReturnJson(1,'用户修改失败');
              }
        }
    }
    


//简单的增删改
//用户等级添加
    public function leveladd(){
         if(request()->isPost()){
            $data=input('post.');
             $validate = \think\Loader::validate('level');
            if(!$validate->check($data)){
                $message=$validate->getError();
                return json_encode(['code'=>2,'$message'=>$message]);
            }
            $user=db('level')
              ->data($data)
              ->insert();
              if($user){
                $code=0;
            $message='用户添加通过';
              }else{
                $code=1;
            $message='用户添加不成功';
              }
        }
         ReturnJson($code,$message);
        }
//用户等级修改        
        public function leveledit($id){
         if(request()->isPost()){
            $data=input('post.');
             $validate = \think\Loader::validate('level');
            if(!$validate->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
            $user=db('level')->where('id', $id)->update(['levname' =>$data['levname']]);
              if($user){
                $code=0;
            $message='修改级别通过';
              }else{
                $code=1;
            $message='修改级别失败';
              }
        }
        // $level=db('level')->select();
         ReturnJson($code,$message);
        }
        //用户等级删除        
        public function leveldel($id){
            $user=db('level')->delete($id);
              if($user){
                $code=0;
            $message='删除级别通过';
              }else{
                $code=1;
            $message='删除级别失败';
              }
        ReturnJson($code,$message);
        }
//用户级别查询
        public function levsearch($page){
    if(request()->isPost()){
         $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'levname'=>['like','%'.$keywords.'%'],
                ];
                // 'levname','like','%'.$keywords.'%'
        $user=db('level')->where($where)->paginate(['page'=> $page]);
        // print_r($where);die;
        if($user){
            $code=0;
            $message='级别查找成功';
        }else{
            $code=1;
            $message='级别查找失败';
        }
         ReturnJson($code,$message,$user);
        }
    }
     //用户级别列表
    public function levlst(){
        $user=db('level')->select();
        if($user){
            $code=0;
            $message='用户级别获取成功';
        }else{
            $code=1;
            $message='用户级别获取失败';
        }
         ReturnJson($code,$message,$user);
        }
        //用户反馈查询
        public function opsearch($page){
    if(request()->isPost()){
         $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'a.content|a.addtime|c.name'=>['like','%'.$keywords.'%'],
                ];
        $user=db('opinion')
        ->field('a.id,a.content,a.addtime,a.optel,c.name')
        ->alias('a')
        ->where($where)
        ->join('user c',"a.user_id=c.id")
        ->order('a.id')
        ->paginate(['page'=> $page]);
        if($user){
            $code=0;
            $message='用户反馈查找成功';
        }else{
            $code=1;
            $message='用户反馈查找失败';
        }
         ReturnJson($code,$message,$user);
        }
    }
     //用户反馈列表
    public function oplst($page){
       $user=db('opinion')
        ->field('a.id,a.content,a.addtime,c.name,c.tel')
        ->alias('a')
        ->join('user c',"a.user_id=c.id")
        ->order('a.id')
        ->paginate(['page'=> $page]);
        // print_r($user);die;
        if($user){
            $code=0;
            $message='用户反馈获取成功';
        }else{
            $code=1;
            $message='用户反馈获取失败';
        }
         ReturnJson($code,$message,$user);
        }




        
}
?>