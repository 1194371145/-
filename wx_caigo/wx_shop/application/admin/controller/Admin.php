<?php
namespace app\admin\controller;
use app\admin\model\Admin as AdminModel;
use think\Db; 
use think\Controller;
class Admin extends Controller
{

    public function lst($page)
    {
       $auth=new Auth();
        $admin=new AdminModel();
        $adminres=$admin->paginate(['page'=> $page]);
        foreach ($adminres as $k => $v) {
            $_groupTitle=$auth->getGroups($v['id']);//当前管理员id
            // dump($_groupTitle);die;
            $groupTitle=$_groupTitle[0]['title'];
            $v['groupTitle']=$groupTitle;
        }
        // print_r($adminres);die;
        ReturnJson(0,'获取成功',$adminres);
       // return json_encode(['data'=>$adminres]);
	}
    public function lstlevel(){
       $auth=new Auth();
       $adminres=db('auth_group')->select();
        // print_r($adminres);die;
        ReturnJson(0,'获取成功',$adminres);
       // return json_encode(['data'=>$adminres]);
    }
    //管理员级别查询
        public function search($page){
    if(request()->isPost()){
         $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'name|tel|title'=>['like','%'.$keywords.'%']
                ];
        $auth=new Auth();           
 //        select * from wx_auth_group_access a 
 // JOIN wx_auth_group AS c ON c.id=a.group_id
 // JOIN wx_admin AS b ON b.id=a.uid
        // $admin=new AdminModel();
        $adminres=db('auth_group_access')
        ->alias('a')
        ->join('auth_group c',"c.id=a.group_id")
        ->join('admin b',"b.id=a.uid")
        ->where($where)
        ->paginate(['page'=> $page]);
        // foreach ($adminres as $k => $v) {
        //     $_groupTitle=$auth->getGroups($v['id']);//当前管理员id
        //     // dump($_groupTitle);die;
        //     $groupTitle=$_groupTitle[0]['title'];
        //     $v['groupTitle']=$groupTitle;
        // }
        // print_r($where);die;
        if($adminres){
            $code=0;
            $message='管理员查找成功';
        }else{
            $code=1;
            $message='管理员查找失败';
        }
        ReturnJson($code,$message,$adminres);
        }
    }

	public function add()
    {
        if(request()->isPost()){
            $data=input('post.');
            $validate = \think\Loader::validate('Admin');
            if(!$validate->scene('add')->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
            $admin=new AdminModel();
            if($admin->addadmin($data)){
                 $code=0;
            $message='管理员添加成功';
            }else{
                $code=1;
            $message='管理员添加失败';
            }
        }
        // $authGroupRes=db('auth_group')->select();
        ReturnJson($code,$message);
        return view();
	}

	public function edit($id)
    {
        $admins=db('admin')->find($id);
        if(request()->isPost()){
            $data=input('post.');
            $validate = \think\Loader::validate('Admin');
            if(!$validate->scene('edit')->check($data)){
                $message=$validate->getError();
                return json_encode(['code'=>4,'$message'=>$message]);
            }
            $admin=new AdminModel();
            $savenum=$admin->saveadmin($data,$admins);
            if($savenum == '2'){
                $code=1;
            $message='管理员不得为空';
            }
            if($savenum !== false){
                 $code=0;
            $message='管理员修改成功';
            }else{
                 $code=2;
            $message='管理员修改失败';
            }
        }
        if(!$admins){
            $code=3;
            $message='管理员不存在';
        }
        $adminres['admins']=$admins;
        $adminres['authGroupAccess']=db('auth_group_access')->where(array('uid'=>$id))->find();
        $adminres['authGroupRes']=db('auth_group')->select();
        ReturnJson($code,$message);
        // $this->assign('authGroupRes',$authGroupRes);
        // $this->assign('admin',$admins);
        // $this->assign('groupId',$authGroupAccess['group_id']);
        // return view();
	}

    public function del($id){
        $admin=new AdminModel();
        $delnum=$admin->deladmin($id);
        if($delnum == '1'){
            $code=0;
            $message='删除管理员成功';

        }else{
            $code=1;
            $message='删除管理员失败';
        }
        ReturnJson($code,$message);
    }

//登录注册
public function islogin(){//登录接口
        if(request()->isPost()){
            $user=new AdminModel();
            $data=input('post.');//接受表单传递的参数zzzz
         $validate = \think\Loader::validate('Admin');
            if(!$validate->scene('log')->check($data)){
                $message=$validate->getError();
               ReturnJson(2,$message);
            }
            $userres=$user->login($data);
            //登录成功的提示信息
            if($userres==1){
                $status = 1;
                $message = '用户不存在';
            }
            if($userres==2){
                 $datatel=input('post.name');//接受表单传递的参数
        $admin=db('auth_group_access')->field('a.uid,b.*')
        ->alias('a')
        ->join('admin p','p.id=a.uid')
        ->join('auth_group b','b.id=a.group_id')
        // ->where($where)
        ->where('name',$datatel)->find();
        $str=db('auth_rule')->where('id','IN',$admin['rules'])->select();
        // $str=explode(",",$admin['rules']);
        // select * from wx_auth_rule where id in(1,2,3,4,5)
        // print_r($admin);die;
                $status = 0;
                $message = '登录成功';
                ReturnJson($status,$message,$str);
            }
            if($userres==3) {
                $status =3;
                $message = '登录失败,密码错误';
            }
            ReturnJson($status,$message);
        }
    }

    public function logout(){
        session(null);
        ReturnJson(0,'账号退出成功');
    }













}
