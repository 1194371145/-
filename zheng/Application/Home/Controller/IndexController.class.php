<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    // public function index(){
    //     $this->display();
    // }
    public function tuijian(){
        $this->display();
    }
    // public function verify(){
    //       // ob_end_clean();
    //     //配置
    //     $cfg = array(
    //             'fontSize'  =>  15.1,              // 验证码字体大小(px)
    //             'useCurve'  =>  false,            // 是否画混淆曲线
    //             'useNoise'  =>  false, 
    //                        // 是否添加杂点
    //             'length'    =>  4,               // 验证码位数
    //             'imageH'=>35,
    //             'imageW'=>100,
    //             'fontttf'   =>  '4.ttf',              // 验证码字体，不设置随机获取
    //         );
    //     $verify = new \Think\Verify($cfg);
    //     $verify -> entry();
// }
    public function index(){
        $model=D('Book');
        if(IS_POST){            
                   if(!$data=$model->create()){
                $this->error($model->getError());
            }else{
            $data['addtime']=time();
            $data['type']=1;
            // dump($data);die;
            $result=$model->add($data);
            $this->success('推荐图书成功',U('tuijian'));} 
                
            // $result=$model->add($data);
        }
        $this->display();
    }
  //   public function tuijian(){
  //   	if(IS_POST){
		// 	$model=D('Book');
		// 	if(!$data=$model->create()){
  //               $this->error($model->getError());
  //           }else{
		// 	$data['addtime']=time();
  //           $data['type']=1;
		// 	// dump($data);die;
		// 	$result=$model->add($data);}
		// }
        
  //       $this->display();
  //   }
    // public function verify(){
    //     $Verify = new \Think\Verify();
    //     $Verify->length=4;
    //     $Verify->entry();
    // }
    
// checklogin
}