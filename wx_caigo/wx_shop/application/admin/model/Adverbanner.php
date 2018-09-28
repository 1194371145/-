<?php
namespace app\admin\model;
use think\Model;
class Adverbanner extends Model
{
    
	protected static function init()
    {
      	Adverbanner::event('before_insert',function($Adverbanner){
          if($_FILES['thumb']['tmp_name']){
                $file = request()->file('thumb');
                $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                if($info){
                    $thumb=str_replace('\\','/',DS .'public' . DS . 'uploads'.'/'.$info->getSaveName());
                    // $thumb='/wx_shop/' . 'public' . DS . 'uploads'.'/'.$info->getSaveName();
                    $thumb = substr($thumb,1);
                    $Adverbanner['thumb']=$thumb;
                }
            }
      });


      	Adverbanner::event('before_update',function($Adverbanner){
          if($_FILES['thumb']['tmp_name']){
          		$arts=Adverbanner::find($Adverbanner->id);
          		$thumbpath=$_SERVER['DOCUMENT_ROOT'].$arts['thumb'];
                if(file_exists($thumbpath)){
                	@unlink($thumbpath);
                }
                $file = request()->file('thumb');
                $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                if($info){
                    $thumb=str_replace('\\','/',DS .'public' . DS . 'uploads'.'/'.$info->getSaveName());
                    // $thumb='/wx_shop/' . 'public' . DS . 'uploads'.'/'.$info->getSaveName();
                    $thumb = substr($thumb,1);
                    $Adverbanner['thumb']=$thumb;
                }

            }
      });

      	Adverbanner::event('before_delete',function($Adverbanner){
          
          		$arts=Adverbanner::find($Adverbanner->id);
          		$thumbpath=$_SERVER['DOCUMENT_ROOT'].$arts['thumb'];
                if(file_exists($thumbpath)){
                	@unlink($thumbpath);
                }
        });


    }
    






}
