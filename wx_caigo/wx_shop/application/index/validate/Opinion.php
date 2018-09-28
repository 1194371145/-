<?php
namespace app\index\validate;
use think\Validate;
class Opinion extends Validate
{
    protected $rule=[
        'content'=>'require|min:6',
        ['optel','require|length:11|/^1[34578]\d{9}$/','手机号码必填|手机号码必须为11位，请检查。|您输入的手机号码有问题，请检查。'],
    ];


    protected $message=[
        'content.require'=>'反馈内容不得为空！',
        'content.min'=>'反馈内容不得少于6位！',
    ];

    protected $scene=[
        'add'=>['optel','content'],
    ];





    

    




   

	












}
