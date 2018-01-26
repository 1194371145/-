<?php
use think\Db;
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
function returnMsg($code, $msg, $url = '', $data = array()) 
{
    return json(array(
        'code' => $code,
        'msg' => $msg,
        'url' => $url,
        'data' => $data
    ));
}

function isphone($mobilephone)
{
	$g = "/^1[34578]\d{9}$/"; 
    if (preg_match($g, $mobilephone)) {
        return true;
    } else {
        return false;
    }
}

//生成缩略图
function makeThumb($img, $path)
{
    $image = \think\Image::open($path.'/'.$img);
    $image->thumb(250, 250)->save($path.'/'.substr($img, 0, 8).'/thumb'.substr($img, 9, 36));
}

//导航栏 active
function sysNavActive($nav1 = '', $nav2 = '')
{
    $nav['shgl'] = '';
    $nav['shlb'] = '';
    $nav['rygl'] = '';
    $nav['rylb'] = '';
    $nav['tjry'] = '';
    if($nav1) {
        $nav[$nav1] = 'active';
        $nav[$nav2] = 'active';
    }
    return $nav;
}

//导航栏 active
function adminNavActive($nav1 = '', $nav2 = '')
{
    $nav['dpsz'] = '';
    $nav['flgl'] = '';
    $nav['fllb'] = '';
    $nav['xzfl'] = '';
    $nav['cpgl'] = '';
    $nav['cplb'] = '';
    $nav['xzcp'] = '';
    $nav['ddgl'] = '';
    $nav['rygl'] = '';
    $nav['rylb'] = '';
    $nav['tjry'] = '';
    $nav['ewm'] = '';
    $nav['skm'] = '';
    $nav['wxskm'] = '';
    $nav['zfbskm'] = '';
    if($nav1) {
        $nav[$nav1] = 'active';
    }
    if($nav2) {
        $nav[$nav2] = 'active';
    }
    return $nav;
}

//检查菜品名称是否存在
function checkDishName($dish_name)
{
    $map['dish_name'] = $dish_name;
    $res = Db::table('__DISH__')->where($map)->find();
    if(count($res))  {
        return 1;
    } else {
        return 0;
    }
}


function getDish($type_id)
{
    $map['type_id'] = $type_id;
    $data = Db::table('__DISH__')->where($map)->select();
    return $data;
}

/**
 * 获取随机字符
 * @param $len 需要的长度
 * @param type 为1 则大小写字母都可以  为0则为数字
 * @return string 返回获取到的随机字符串
 *
 */
function getRandomStr($len = 10, $type = '1')
{
    $str = null;
    if ($type == '1') {
        $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
    } else {
        $strPol = "0123456789";
    }
    $max = strlen($strPol) - 1;
    for ($i = 0; $i < $len; $i++) {
        $str .= $strPol[rand(0, $max)];
    }
    return $str;
}


//传入订单号 获取订单的总价
function getOrderTotalPrice($order_num)
{
    $map['order_num'] = $order_num;
    $data = Db::table('__DET__')->where($map)->select();
    $total = 0;
    foreach ($data as $k => $v) {
        $total += $v['det_dish_price'] * $v['det_dish_num'];
    }
    return $total;
}