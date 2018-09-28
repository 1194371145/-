<?php
namespace app\admin\model;
use think\Model;
class Advertise extends Model
{
    
	protected static function init()
    {
      	Advertise::event('before_insert',function($advertise){
          if($_FILES['thumb']['tmp_name']){
                $file = request()->file('thumb');
                $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                if($info){
                   // $img=str_replace('\\','/',DS .'public' . DS . 'uploads'.'/'.$info->getSaveName());
                   // /wx_shop/public\uploads/20180810\0c961970399f1155411f11ee43a24187.jpg
                    // $thumb=DS . 'public' . DS . 'uploads'.'/'.$info->getSaveName();
                    $thumb=str_replace('\\','/',DS .'public' . DS . 'uploads'.'/'.$info->getSaveName());
                    // \public\uploads\20180813\198a1342953863c0cfdc6de1061c34af.jpg
                    // /bick/public\uploads/20161220\6699a8def9d773d6392f537614a75d85.jpg
                    // /public/uploads/20180813/c7bd05220a9ab8d61cc2ce00cd8f4760.jpg
                    $thumb = substr($thumb,1);
                    $advertise['thumb']=$thumb;
                }
            }
      });


      	Advertise::event('before_update',function($Advertise){
          if($_FILES['thumb']['tmp_name']){
          		$arts=Advertise::find($Advertise->id);
          		$thumbpath=$_SERVER['DOCUMENT_ROOT'].$arts['thumb'];
                if(file_exists($thumbpath)){
                	@unlink($thumbpath);
                }
                $file = request()->file('thumb');
                $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                if($info){
                    // $thumb=ROOT_PATH . 'public' . DS . 'uploads'.'/'.$info->getExtension();
                    $thumb=str_replace('\\','/',DS .'public' . DS . 'uploads'.'/'.$info->getSaveName());
                    $thumb = substr($thumb,1);
                    $Advertise['thumb']=$thumb;
                }

            }
      });

      	Advertise::event('before_delete',function($Advertise){
          
          		$arts=Advertise::find($Advertise->id);
          		$thumbpath=$_SERVER['DOCUMENT_ROOT'].$arts['thumb'];
                if(file_exists($thumbpath)){
                	@unlink($thumbpath);
                }
        });


    }
    






}
