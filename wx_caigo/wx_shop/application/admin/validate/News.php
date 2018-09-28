<?php
namespace app\admin\validate;
use think\Validate;
class News extends Validate
{

    protected $rule=[
        'title'=>'unique:proclamation|require',
    ];


    protected $message=[
        'title.require'=>'公告名称不得为空！',
        'title.unique'=>'公告名称不得重复！',
    ];





    

    




   

	












}
