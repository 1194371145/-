<?php
namespace app\admin\validate;
use think\Validate;
class Level extends Validate
{

    protected $rule=[
        'levname'=>'unique:level|require',
    ];


    protected $message=[
        'levname.require'=>'栏目名称不得为空！',
        'levname.unique'=>'栏目名称不得重复！',
    ];






    

    




   

	












}
