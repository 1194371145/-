<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\Cate as CateModel;
use app\admin\model\Goods as GoodsModel;
class Goods extends Controller
{
     //添加商品
    public function add(){
             if(request()->isPost()){
                $data=input('post.');
                $data['mp'] = json_decode($data['mp'],true);
                // foreach($mp as $key=>$val) {echo $key."=".$val."<br/>";}
                // print_r($data);die;
                $data['addtime']=time();
                // dump($data);die;
                $validate = \think\Loader::validate('Goods');
            if(!$validate->scene('add')->check($data)){
                $message=$validate->getError();
               ReturnJson(2,$message);
            }
        $Goods=new GoodsModel();
        $add=$Goods->save($data);
         if($add){
            $code=0;
            $message='商品添加成功';
        }else{
            $code=1;
            $message='商品添加失败';
        }
    }
        $cate=new CateModel();
        $cateres=$cate->catetree();
        // $mlRes=db('level')->field('id,levname')->select();//商品分类数据
         ReturnJson($code,$message);
        }
        //修改商品(未完成)
    public function edit(){
             if(request()->isPost()){
                $data=input('post.');
                $data['mp'] = json_decode($data['mp'],true);
                $validate = \think\Loader::validate('Goods');
            if(!$validate->scene('edit')->check($data)){
                $message=$validate->getError();
                ReturnJson(2,$message);
            }
        $Goods=new GoodsModel();
        $add=$Goods->update($data);
         if($add){
            $code=0;
            $message='商品修改成功';
        }else{
            $code=1;
            $message='商品添加失败';
        }
    }
    // 商品id
        $goodsId=input('id');
        $cate=new CateModel();
        $cateres=$cate->catetree();
        $mlRes=db('level')->field('id,levname')->select();//商品分类数据
        ReturnJson($code,$message);
        }
        //删除商品
        public function del($id){
        $del=model('goods')->destroy($id);
        if($del){
            $code=0;
            $message='删除商品成功';
        }else{
            $code=1;
            $message='删除订单成功';
        }
        ReturnJson($code,$message);
    }

    //商品列表
    public function producelst($page){
        if(request()->isPost()){
             $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'name|mfrs|catename'=>['like','%'.$keywords.'%']
                ];
        $shop=db('goods')->field('a.*,c.id cateid,c.catename catename,c.pid catepid,c.pic catepic')
        // ->field('a.id,a.name,a.shop_num,a.detail,a.mfrs,a.shelf,a.hot_selling,a.sales_volume,a.nuit,c.catename')
        ->alias('a')
        ->join('cate c',"a.cate_id=c.id")
         ->where($where)
        ->order('a.id DESC')
        ->paginate(['page'=> $page]);
        // print_r($shop);die;
        $cate=new CateModel();
        $cateres=$cate->catetree();
        // print_r($shop);die;
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
}
?>