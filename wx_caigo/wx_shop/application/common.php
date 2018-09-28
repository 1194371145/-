<?php
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
function ReturnJson($Code = null, $Msg = null, $Data = null)
{
	$Result['Code'] 	= $Code ? $Code : 0; 
	$Result['Msg'] 		= $Msg  ? $Msg 	: "请求成功";
    if($Data !== null) $Result['Data'] = $Data ? $Data : "";
	if(($Result = json_encode($Result)) === false){
		switch(json_last_error()){
			case JSON_ERROR_NONE: exit('JSON_ERROR_NONE');
			case JSON_ERROR_DEPTH: exit('JSON_ERROR_DEPTH');
			case JSON_ERROR_STATE_MISMATCH: exit('JSON_ERROR_STATE_MISMATCH');
			case JSON_ERROR_CTRL_CHAR: exit('JSON_ERROR_CTRL_CHAR');
			case JSON_ERROR_SYNTAX: exit('JSON_ERROR_SYNTAX');
			case JSON_ERROR_UTF8: exit('JSON_ERROR_UTF8');
			case JSON_ERROR_RECURSION: exit('JSON_ERROR_RECURSION');
			case JSON_ERROR_INF_OR_NAN: exit('JSON_ERROR_INF_OR_NAN');
			case JSON_ERROR_UNSUPPORTED_TYPE: exit('JSON_ERROR_UNSUPPORTED_TYPE');
			case JSON_ERROR_INVALID_PROPERTY_NAME: exit('JSON_ERROR_INVALID_PROPERTY_NAME');
			case JSON_ERROR_UTF16: exit('JSON_ERROR_UTF16');
			default: exit('JSON_ERROR_UNKNOWN');
		}
	}
    // 返回JSON数据格式到客户端 包含状态信息
    header('Content-Type:application/json; charset=utf-8');
    //跨域请求
    header('Access-Control-Allow-Origin:*');
    exit($Result);
}