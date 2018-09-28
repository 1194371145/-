<?php
namespace app\admin\validate;
use think\Validate;
class Goods extends Validate
{

    protected $rule=[
        'name'=>'unique:goods|require',
        'unit'=>'require|max:6',
        'shop_num'=>'require|number',
        'mfrs'=>'require',
    ];


    protected $message=[
        'name.require'=>'栏目名称不得为空！',
        'name.unique'=>'栏目名称不得重复！',
        'unit.require'=>'单位名称不得为空！',
        'unit.max'=>'单位名称不得过大',
        'shop_num.require'=>'产品数量不得为空',
        'shop_num.number'=>'产品数量必须是数字',
        'mfrs.require'=>'单位名称不得为空！',
    ];

    protected $scene=[
        'add'=>['name','unit','shop_num','mfrs'],
        'edit'=>['name','unit','shop_num','mfrs'],
    ];





    

    




   

    












}
