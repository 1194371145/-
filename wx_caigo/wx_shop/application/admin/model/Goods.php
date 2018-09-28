<?php
namespace app\admin\model;
use think\Model;
class Goods extends Model
{
    protected $field=true;
    protected static function init()
    {
         Goods::event('before_insert',function($Goods){
           if($_FILES['thumb']['tmp_name']){
                $file = request()->file('thumb');
                $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                if($info){
                    $thumb=str_replace('\\','/',DS .'public' . DS . 'uploads'.'/'.$info->getSaveName());
                    // $thumb='/wx_shop/' . 'public' . DS . 'uploads'.'/'.$info->getSaveName();
                    $thumb = substr($thumb,1);
                    // print_r($Goods);die;
                    $Goods['pic']=$thumb;
                    // print_r($Goods['pic']);die;
                }
            }
      });
        Goods::afterInsert(function($Goods){    
            //接受表单数据
            $goodsData=input('post.');
            // print_r($goodsData);die;
            // 批量写入会员价格
            $mpriceArr=$Goods->mp;
            $goodsId=$Goods->id;
            if($mpriceArr){
                foreach ($mpriceArr as $k => $v) {
                    if(trim($v) == ''){
                        continue;
                    }else{
                        db('prices')->insert(['mlevel_id'=>$k,'mprice'=>$v,'goods_id'=>$goodsId]);
                    }
                }
            }
        });

    Goods::event('before_update',function($Goods){
         if(!isset($_FILES['thumb']['tmp_name'])){      
            }else{
          if($_FILES['thumb']['tmp_name']){
                $arts=Goods::find($Goods->id);
                // print_r($arts);die;
                $thumbpath=$_SERVER['DOCUMENT_ROOT'].$arts['pic'];
                if(file_exists($thumbpath)){
                    @unlink($thumbpath);
                }
                $file = request()->file('thumb');
                $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                if($info){
                    $thumb=str_replace('\\','/',DS .'public' . DS . 'uploads'.'/'.$info->getSaveName());
                    // $thumb='/wx_shop/' . 'public' . DS . 'uploads'.'/'.$info->getSaveName();
                    $thumb = substr($thumb,1);
                    $Goods['pic']=$thumb;
                }

            }
        }
      });
        Goods::beforeUpdate(function ($Goods) {
            // 商品id
            $goodsId=$Goods->id;
            // 新增商品属性
            $goodsData=input('post.');
            // 处理会员价格
            $mpriceArr=$Goods->mp;
            // print_r($mpriceArr);die;
            $mp=db('prices');
            // 删除原有会员价格
            $mp->where('goods_id','=',$goodsId)->delete();
            // 批量写入会员价格
            if($mpriceArr){
                foreach ($mpriceArr as $k => $v) {
                    if(trim($v) == ''){
                        continue;
                    }else{
                        $mp->insert(['mlevel_id'=>$k,'mprice'=>$v,'goods_id'=>$goodsId]);
                    }
                }
            }
        });
        Goods::beforeDelete(function($Goods){
            $arts=Goods::find($Goods->id);
                $thumbpath=$_SERVER['DOCUMENT_ROOT'].$arts['pic'];
                if(file_exists($thumbpath)){
                    @unlink($thumbpath);
                }
                //
            $goodsId=$Goods->id;
            // 删除关联的会员价格
            db('prices')->where('goods_id','=',$goodsId)->delete();
        });

    }


}