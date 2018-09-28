<?php
namespace app\admin\validate;
use think\Validate;
class Deliverytime extends Validate
{

    protected $rule=[
        'time'=>'unique:Deliverytime|require|max:6',
    ];


    protected $message=[
        'catename.require'=>'栏目名称不得为空！',
        'catename.unique'=>'栏目名称不得重复！',
    ];




    

    




   

	












}
