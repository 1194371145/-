<?php
namespace app\admin\model;
use think\Model;
class Excel extends Model
{
  /**
 * 根据时间戳返回星期几
 * @param string $time 时间戳
 * @return 星期几
 */
    public  function weekday($time)//时间戳转换为星期几
          {
            if(is_numeric($time))
            {
              $weekday = array('星期日','星期一','星期二','星期三','星期四','星期五','星期六');
              return $weekday[date('w', $time)];
            }
            return false;
          }
    public  function number2chinese($num){
            // if(!is_numeric($num)) return '含有非数字非小数点字符！';
            $char    = array('零','壹','贰','叁','肆','伍','陆','柒','捌','玖');
            $unit    = array('','拾','佰','仟','','萬','億','兆');
            //整数部分
            $mode = true;
            $str = strrev(intval($num));
            for($i = 0,$c = strlen($str);$i < $c;$i++) {
                $out[$i] = $char[$str[$i]];
                if($mode){
                    $out[$i] .= $str[$i] != '0'? $unit[$i%4] : '';
                        if($i>1 and $str[$i]+$str[$i-1] == 0){
                        $out[$i] = '';
                    }
                        if($i%4 == 0){
                        $out[$i] .= $unit[4+floor($i/4)];
                    }
                }
            }
            $retval = trim(join('',array_reverse($out)),'零');
            return $retval;
         }
           function toChineseNumber($money){
  $money = round($money,2);
  $cnynums = array("零","壹","贰","叁","肆","伍","陆","柒","捌","玖"); 
  $cnyunits = array("圆","角","分");
  $cnygrees = array("拾","佰","仟","万","拾","佰","仟","亿"); 
  list($int,$dec) = explode(".",$money,2);
  $dec = array_filter(array($dec[1],$dec[0])); 
  $ret = array_merge($dec,array(implode("",cnyMapUnit(str_split($int),$cnygrees)),"")); 
  $ret = implode("",array_reverse(cnyMapUnit($ret,$cnyunits))); 
  return str_replace(array_keys($cnynums),$cnynums,$ret); 
}
function cnyMapUnit($list,$units) { 
  $ul=count($units); 
  $xs=array(); 
  foreach (array_reverse($list) as $x) { 
    $l=count($xs); 
    if ($x!="0" || !($l%4)) 
      $n=($x=='0'?'':$x).($units[($l-1)%$ul]); 
    else $n=is_numeric($xs[0][0])?$x:''; 
 array_unshift($xs,$n); 
 } 
 return $xs; 
 }
}
