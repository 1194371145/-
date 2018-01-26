<?php
namespace Admin\Model;
use Think\Model\ViewModel;
class ArticleViewModel extends ViewModel {
    public $viewFields = array(
     'Article'=>array('id','title','pic' ,'_type'=>"LEFT"),
    // '_type'=>"LEFT"可以忽略
     'Cate'=>array('catename', '_on'=>'Article.cateid=cate.id'),
   );
}
