<?php
namespace app\admin\controller;
use think\Controller;
class Prices extends Controller
{
//     1、首先查找出需要展示的商品的价格等级信息（根据商品ID排序查询）
// 2、查找出所需要展示的商品信息
// new 新数组1
// foreach（商品）{
//     foreach（价格等级信息）{
//         new 新数组2
//         if（找到价格等级信息里商品ID等于上面那个商品ID的数据）{
//             push进新数组2
//         }
//     }
//     将新数组2push进入新数组1[$key]下
// }
//价格列表
    public function lst(){
         $prices=db('prices')->order('goods_id')->order('mlevel_id')->select();
        $new_array = [];
        $shop=db('goods')->field('id,name')->order('id')->select();
        $array=[];
        foreach($shop as $k=> $v){
            $new_array2 = [];
            foreach ($prices as $key => $vv) {
                if($vv['goods_id']==$v['id']){
                    array_push($new_array2,$vv['mprice']);
                }
            }
            $new_array[]=$v;
            $arrayName=array_merge(end($new_array),$new_array2);
            asort($arrayName);
            $array[]=$arrayName;
            // echo '-------------------';
             // print_r($array);
        }
        print_r($array);die;
        $level=db('level')
        ->order('id')
        ->select();
        // $info['shop']=$shop;
        $info['price']=$array;
        $info['level']=$level;
        if($info){
            $code=0;
            $message = '商品获取成功';
        }else{
            $code=1;
            $message = '商品获取失败';
        }
        ReturnJson($code,$message,$info);
        }
    //价格列表
    // public function lst(){
    //      $prices=db('prices')
    //     ->order('mlevel_id')
    //     ->select();
    //     // print_r($prices);die;
    //     $new_array = [];
    //     foreach($prices as $vv){
    //         $new_array[$vv['goods_id']][] = $vv;
    //     }
    //     $shop=db('goods')->field('id,')
    //     ->order('id')
    //     ->select();
    //     $level=db('level')
    //     ->order('id')
    //     ->select();
    //     $info['shop']=$shop;
    //     $info['price']=$new_array;
    //     $info['level']=$level;
    //     if($info){
    //         $code=0;
    //         $message = '商品获取成功';
    //     }else{
    //         $code=1;
    //         $message = '商品获取失败';
    //     }
    //     ReturnJson($code,$message,$info);
    //     }
        public function pricess($id){
            $prices=db('prices')->alias('a')->join('level c','a.mlevel_id = c.id')
        ->order('mlevel_id')->where('goods_id',$id)
        ->select();
        $new_array = [];
        foreach($prices as $vv){
            $new_array[$vv['goods_id']][] = $vv;
        }
        $info['price']=$new_array;
        ReturnJson(0,'查询成功',$info);
        }


        public function search(){
            $keywords=input('keywords');//接受表单传递的参数
         $where=[ 
                'name'=>['like','%'.$keywords.'%']
                ];
                $goods=db('goods')->where($where)
        ->select();
        $array = [];
        foreach ($goods as $k => $v) {
            // echo $v['id'];
           $prices[$v['id']]=db('prices')->where(['goods_id'=>$v['id']])
        ->order('mlevel_id ')
        ->select();
        // print_r($prices);die;
        $new_array[] = [];
        foreach($prices as $vs){
            foreach ($vs as $key => $vv) {
                $new_array[$vv['goods_id']][] = $vv;
            }
            
        }
        // print_r($prices);die;
        //   $orderGoods1[$k]=$v;
        $array['prices'] = $prices; 
        }
        // print_r($array);die;
         $shop=db('goods')->field('id,name')
        ->order('id')
        ->select();
        $level=db('level')
        ->order('id')
        ->select();
        // print_r($new_array);die;
        $info['shop']=$shop;
        $info['price']=$new_array;
        $info['level']=$level;
        // print_r($info);die;
        if($info){
            $code='';
            $message = '商品获取成功';
        }else{
            $message = '商品获取失败';
        }
        ReturnJson($code,$message,$info);
        }
}
?>