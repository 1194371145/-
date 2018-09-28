<?php
namespace app\admin\model;
use think\Model;
class Cate extends Model
{
    protected static function init()
    {
        Cate::event('before_insert',function($Cate){
          if($_FILES['thumb']['tmp_name']){
                $file = request()->file('thumb');
                $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                if($info){
                    $thumb=str_replace('\\','/',DS .'public' . DS . 'uploads'.'/'.$info->getSaveName());
                    // $thumb='/wx_shop/' . 'public' . DS . 'uploads'.'/'.$info->getSaveName();
                    $thumb = substr($thumb,1);
                    $Cate['pic']=$thumb;
                }
            }
      });


        Cate::event('before_update',function($Cate){
           if(!isset($_FILES['thumb']['tmp_name'])){      
            }else{
                       if($_FILES['thumb']['tmp_name']){
                $arts=Cate::find($Cate->id);
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
                    $Cate['pic']=$thumb;
                }

            }

            }
         
      });

        Cate::event('before_delete',function($Cate){
          
                $arts=Cate::find($Cate->id);
                $thumbpath=$_SERVER['DOCUMENT_ROOT'].$arts['pic'];
                if(file_exists($thumbpath)){
                    @unlink($thumbpath);
                }
        });


    }




    public function catetree(){
        $cateres=$this->order('id')->select();
        return $this->sort($cateres);
    }

    public function sort($data,$pid=0,$level=0){
        static $arr=array();
        foreach ($data as $k => $v) {
            if($v['pid']==$pid){
                $v['level']=$level;
                $arr[]=$v;
                $this->sort($data,$v['id'],$level+1);
            }
        }
        return $arr;
    }

    public function getchilrenid($cateid){
        $cateres=$this->select();
        return $this->_getchilrenid($cateres,$cateid);
    }//查询子类

    public function _getchilrenid($cateres,$cateid){
        static $arr=array();
        foreach ($cateres as $k => $v) {
            if($v['pid'] == $cateid){
                $arr[]=$v['id'];
                $this->_getchilrenid($cateres,$v['id']);
            }
        }

        return $arr;
    }



    //
    public function catetrees($where){
        $cateres=$this->where($where)
        ->order('id')
        ->select();
        // print_r($cateres);die;
        return $this->sort($cateres);
    }
}
