<?php
//声明命名空间
namespace Admin\Model;
//引入父类模型
use Think\Model;
//声明模型并且继承父类模型
class DocModel extends Model{
 public function saveDate($post,$file){
          // dump($file);die;
          if(!$file['error']){
            $cfg=array(
                'rootPath'      =>  WORKING_PATH.UPLOAD_ROOT_PATH, 

                );
            $upload=new \Think\Upload($cfg);
            // 开始上传
            $info=$upload->uploadOne($file);
            dump($info);die;
            if($info){
                $post['filepath']=UPLOAD_ROOT_PATH.$info['savePath'].$info['savename'];
                $post['filename']=$info['name'];//文件的原始名
                 $post['hasfile']=1;
            }
          }
          $post['addtime']=time();
          
          return $result=$this->add($post);
 }
 public function updateDate($post,$file){}
}