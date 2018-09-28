<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;  
use app\admin\model\Excel as ExcelModel;
class Excel extends Controller
{
  //产品审核列表
     function downLoadExcle($id){//加入$id
         $data=db('order_goods')->alias('a')
         ->join('order p','p.id=a.order_id')
         ->join('user b','b.id=p.user_id')
        ->where('p.id',$id)//后期改成$id
        ->select();
        $datacount=db('order_goods')->alias('a')
         ->join('order p','p.id=a.order_id')
         ->join('user b','b.id=p.user_id')
        ->where('p.id',$id)->count();
        // print_r($datacount);die;
        $deliverytime=db('Deliverytime')->where('id',$data[0]['deliverytime_id'])->find();
            $table = '';
            $table .= "<table border='1' align='center' >
                    
                ";$first=1;
                $total=0;
            foreach ($data as $key=>$v) {
                $Excel=new ExcelModel();
        $post_times=$Excel->weekday($data[0]['post_time']);
                $firsr=$first++;
                    if($key==0 || $key%15==0){//头部
                $table .= "
                <tr>
                        <td align='center' colspan='6' class='top'>广西悦采农业股份有限公司</td>   
                </tr>
                <tr>
                        <td align='center' colspan='6' class='top'>配送单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NO:</td>   
                </tr>
                <tr>
                        <td style='text-align:center'  colspan='3' class='top'>客户： {$v['name']}</td>
                        <td align='center' colspan='2' class='top'>{$deliverytime['time']}</td>
                        <td align='center' colspan='1' class='top'>{$post_times}</td>  
                </tr>
                <tr>
                        <td align='center' class='top'>序号</td>
                        <td align='center' class='top'>品种</td>
                        <td align='center' class='top'>单位</td>
                        <td align='center' class='top'>数量</td>
                        <td align='center' class='top'>单价</td>
                        <td align='center' class='top'>金额</td>   
                </tr>";
                    }
                    
                  $v['numprice']=$v['goods_num']*$v['aprice'];
                  $total+=$v['numprice'];//这里是中间的数据
                $table .= "
                <tr>
                        <td align='center' class='name'>{$firsr}</td>
                        <td align='center' class='name'>{$v['goods_name']}</td>
                        <td align='center' class='name'>{$v['unit']}</td>
                        <td align='center' class='name'>{$v['goods_num']}</td>
                        <td align='center' class='name'>{$v['aprice']}</td>
                        <td align='center' class='name'>{$v['numprice']}</td>
                </tr>";
                if($key == 14 || ($key+1)%15 == 0|| $key+1== $datacount){//尾部
                    $post_timer=date('Y/m/s', $data[0]['post_time']);
                $Excel=new ExcelModel();
                $cateres=$Excel->number2chinese($v['order_total_price']);
                $table .= "
                <tr>
                        <td align='center' class='banner'>总价</td>
                        <td align='center' colspan='3' class='banner'>{$cateres}</td>
                        <td align='center' colspan='2' class='banner'>￥{$v['order_total_price']}</td>    
                </tr>
                <tr>
                        <td align='center' rowspan='2' colspan='1' class='banner'>日期</td>
                        <td align='center' rowspan='2' colspan='1' class='banner'>{$post_timer}</td>
                        <td colspan='2' rowspan='2' class='banner'>送货</td> 
                        <td colspan='2' rowspan='2' class='banner'>收货验货:</td>    
                </tr>
                <tr></tr>
                <tr>
                        <td align='center' colspan='6' class='banner'>提示:请妥善保管客户联，质量问题请拨打投诉电话:6826777</td>    
                </tr>
                <tr>
                        <td align='center' colspan='6' class='banner'>地址:鹿寨镇五里亭  订货咨询电话:6669191</td>    
                </tr>
                <tr>
                        <td align='center' colspan='6' class='banner'>------------------------------------------------------------------------</td>    
                </tr>";
                    }
            }
            $table .= "
            </table>";
    //通过header头控制输出excel表格
                header("Pragma: public");  
            header("Expires: 0");  
            header("Cache-Control:must-revalidate, post-check=0, pre-check=0");  
            header("Content-Type:application/force-download");  
            header("Content-Type:application/vnd.ms-execl");  
            header("Content-Type:application/octet-stream");  
            header("Content-Type:application/download");;  
            header('Content-Disposition:attachment;filename="入库明细表.xls"');  
            header("Content-Transfer-Encoding:binary");  
            echo $table;
    }
    /*测试内容*/
	//订单汇总列表
     function downExcle($page){//加入$id
              Vendor('PHPExcel.PHPExcel');
        Vendor('PHPExcel.PHPExcel.Writer.Excel2007');
        // 首先创建一个新的对象  PHPExcel object
        $objPHPExcel = new \PHPExcel();
         $objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);
        //设置每列的标题
        $objPHPExcel->setActiveSheetIndex(0)    
                            ->setCellValue('A1', '订单编号')  
                            ->setCellValue('B1', '用户名')  
                            ->setCellValue('C1', '产品一级分类')  
                            ->setCellValue('D1', '产品二级分类')  
                            ->setCellValue('E1', '产品名')
                            ->setCellValue('F1', '销售数量')  
                            ->setCellValue('G1', '单价')  
                            ->setCellValue('H1', '总价')  
                            ->setCellValue('I1', '配送时间')
                            ->setCellValue('J1', '日期')     
                            ;
        $data['user_id']=trim(input('post.user_id'));
            $data['goods_id']=trim(input('post.goods_id'));
            $data['deliverytime_id']=trim(input('post.deliverytime_id'));
            $data['begintime']=strtotime(input('post.begintime'));
            $data['endtime']=strtotime(input('post.endtime'));
          $where=[];  
         if($data['user_id']){
            $where['p.user_id']=$data['user_id'];
         }
         if($data['goods_id']){
            $where['a.goods_id']=$data['goods_id'];
         }
         if($data['deliverytime_id']){
            $where['p.deliverytime_id']=$data['deliverytime_id'];
         }
         if($data['begintime']&&$data['endtime']){
            $where['p.post_time']=array(array('gt',$data['begintime']),array('lt',$data['endtime']));
         }
       $lst=db('order_goods')->alias('a')
        ->field('c.name username,a.goods_id,a.goods_name,a.aprice,a.goods_num,a.order_id,p.id order_id,p.out_trade_no,p.out_trade_no,p.order_status,p.post_status,p.user_id,
            p.order_time,p.deliverytime_id,p.post_time,c.id')
        ->join('order p','p.id=a.order_id')
        ->join('user c','c.id=p.user_id')
        ->where($where)
        ->where('p.post_status=1')
        // ->select();
        ->paginate(['page'=> $page]);
        $link['goodesOrder']=array();
         foreach ($lst as $k => $v) {
                        $orderGoods1[$k]=$v;
                        $orderGoods1[$k]['numprice']=$v['goods_num']*$v['aprice'];
                        $goodsfind=db('goods')->where(['id'=>$v['goods_id']])->find();
                        // $orderGoods1[$k]['cate_id']=$goodsfind['cate_id'];
                        $goodsfinds=db('cate')->where(['id'=>$goodsfind['cate_id']])->find();
                        $pcatefind=db('cate')->where(['id'=>$goodsfinds['pid']])->find();
                        $orderGoods1[$k]['pcatename']=$pcatefind['catename'];
                         $orderGoods1[$k]['catename']=$goodsfinds['catename'];
                        $orderGoods1[$k]['out_trade_no']=$v['out_trade_no'];
                        $orderGoods1[$k]['post_time']=$v['post_time'];
                        $goodsfind=db('deliverytime')->where(['id'=>$v['deliverytime_id']])->find();
                         $orderGoods1[$k]['deliverytime']=$goodsfind['time'];
                         $link['goodesOrder']=$orderGoods1;
                }
        // print_r($link['goodesOrder']);die;
        //存取数据  这边是关键
       $order_total_price=0;
       $goods_num=0;
        foreach ($link['goodesOrder'] as $k => $v) {
            // $v['post_time']=date("Y-m-d H:i:s",$v['post_time']);
            $goods_num+=$v['goods_num'];
             $order_total_price+=$v['numprice'];
            $num = $k + 2;
            $first=0;
            $objPHPExcel->setActiveSheetIndex(0)
                ->setCellValue('A' . $num, $v['out_trade_no'])
                ->setCellValue('B' . $num, $v['username'])
                ->setCellValue('C' . $num, $v['pcatename'])
                ->setCellValue('D' . $num, $v['catename'])
                ->setCellValue('E' . $num, $v['goods_name'])
                ->setCellValue('F' . $num, $v['goods_num'])
                ->setCellValue('G' . $num, $v['aprice'])
                ->setCellValue('H' . $num, $v['numprice'])
                ->setCellValue('I' . $num, $v['deliverytime'])
                ->setCellValue('J' . $num, date("Y-m-d H:i:s",time()));
        }
        $Excel=new ExcelModel();
        // $cateres=$Excel->number2chinese($v['order_total_price']);
        // print_r($cateres);die;
        $anum=$num+1;
        $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . $anum,"总价")
        ->setCellValue('F' . $anum,$goods_num)
        ->setCellValue('H' . $anum,"￥". $order_total_price);
        //设置工作表标题
        $objPHPExcel->getActiveSheet()->setTitle('我的文档');
        //设置列的宽度
        $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(24);
        $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
        $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(14);
        $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(14);
        $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(14);
        $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(14);
        $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(14);
        $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(24);
        // $objPHPExcel->setActiveSheetIndex(0)->getStyle('A:E')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getDefaultStyle()->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getDefaultStyle()->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $objPHPExcel->setActiveSheetIndex(0);
        $objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment;filename=悦采采购.xlsx");//设置文件标题
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }
    

        //账单数据列表
     function zhangdownExcle($page){//加入$id
              Vendor('PHPExcel.PHPExcel');
        Vendor('PHPExcel.PHPExcel.Writer.Excel2007');
        // 首先创建一个新的对象  PHPExcel object
        $objPHPExcel = new \PHPExcel();
         $objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);
        //设置每列的标题
        $objPHPExcel->setActiveSheetIndex(0)    
                            ->setCellValue('A1', '订单编号')  
                            ->setCellValue('B1', '用户名')
                            ->setCellValue('C1', '城镇') 
                            ->setCellValue('D1', '产品一级分类')  
                            ->setCellValue('E1', '产品二级分类')  
                            ->setCellValue('F1', '产品名')
                            ->setCellValue('G1', '销售数量')  
                            ->setCellValue('H1', '单价')  
                            ->setCellValue('I1', '总价')  
                            ->setCellValue('J1', '配送时间')
                            ->setCellValue('K1', '日期')     
                            ;
        $data['user_id']=trim(input('post.user_id'));
            $data['city']=trim(input('post.city'));
            $data['goods_id']=trim(input('post.goods_id'));
            $data['deliverytime_id']=trim(input('post.deliverytime_id'));
            $data['begintime']=strtotime(input('post.begintime'));
            $data['endtime']=strtotime(input('post.endtime'));
          $where=[];  
         if($data['user_id']){
            $where['p.user_id']=$data['user_id'];
         }
         if($data['goods_id']){
            $where['a.goods_id']=$data['goods_id'];
         }
         if($data['city']){
            $where['c.city']=$data['city'];
         }
         if($data['deliverytime_id']){
            $where['p.deliverytime_id']=$data['deliverytime_id'];
         }
         if($data['begintime']&&$data['endtime']){
            $where['p.post_time']=array(array('gt',$data['begintime']),array('lt',$data['endtime']));
         }
        $lst=db('order_goods')->alias('a')
        ->field('a.goods_id,a.goods_name,a.aprice,a.goods_num,a.order_id,p.id order_id,p.out_trade_no,p.out_trade_no,p.order_status,p.post_status,p.user_id,
            p.order_time,p.deliverytime_id,p.post_time,c.id,c.name username,c.city city')
        ->join('order p','p.id=a.order_id')
        ->join('user c','c.id=p.user_id')
        ->where($where)
        // ->where(['c.city'=>'11'])
        ->where('p.post_status=1')
        // ->select();
        ->paginate(['page'=> $page]);
        // print_r($lst);die;
        foreach ($lst as $k => $v) {
                        $orderGoods1[$k]=$v;
                        $orderGoods1[$k]['numprice']=$v['goods_num']*$v['aprice'];
                        $goodsfind=db('goods')->where(['id'=>$v['goods_id']])->find();
                        // $orderGoods1[$k]['cate_id']=$goodsfind['cate_id'];
                        $goodsfinds=db('cate')->where(['id'=>$goodsfind['cate_id']])->find();
                        $pcatefind=db('cate')->where(['id'=>$goodsfinds['pid']])->find();
                        $orderGoods1[$k]['pcatename']=$pcatefind['catename'];
                         $orderGoods1[$k]['catename']=$goodsfinds['catename'];
                        $orderGoods1[$k]['out_trade_no']=$v['out_trade_no'];
                        $orderGoods1[$k]['post_time']=$v['post_time'];
                        $goodsfind=db('deliverytime')->where(['id'=>$v['deliverytime_id']])->find();
                         $orderGoods1[$k]['deliverytime']=$goodsfind['time'];
                         $link['goodesOrder']=$orderGoods1;
                }
        // print_r($link['goodesOrder']);die;
        //存取数据  这边是关键
       $order_total_price=0;
       $goods_num=0;
        foreach ($link['goodesOrder'] as $k => $v) {
            // $v['post_time']=date("Y-m-d H:i:s",$v['post_time']);
            $goods_num+=$v['goods_num'];
             $order_total_price+=$v['numprice'];
            $num = $k + 2;
            $first=0;
            $objPHPExcel->setActiveSheetIndex(0)
                ->setCellValue('A' . $num, $v['out_trade_no'])
                ->setCellValue('B' . $num, $v['username'])
                ->setCellValue('C' . $num, $v['city'])
                ->setCellValue('D' . $num, $v['pcatename'])
                ->setCellValue('E' . $num, $v['catename'])
                ->setCellValue('F' . $num, $v['goods_name'])
                ->setCellValue('G' . $num, $v['goods_num'])
                ->setCellValue('H' . $num, $v['aprice'])
                ->setCellValue('I' . $num, $v['numprice'])
                ->setCellValue('J' . $num, $v['deliverytime'])
                ->setCellValue('K' . $num, date("Y-m-d H:i:s",time()));
        }
        $Excel=new ExcelModel();
        // $cateres=$Excel->number2chinese($v['order_total_price']);
        // print_r($cateres);die;
        $anum=$num+1;
        $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . $anum,"总价")
        ->setCellValue('G' . $anum,$goods_num)
        ->setCellValue('I' . $anum,"￥". $order_total_price);
        //设置工作表标题
        $objPHPExcel->getActiveSheet()->setTitle('我的文档');
        //设置列的宽度
        $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(24);
        $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
        $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
        $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(14);
        $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(14);
        $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(14);
        $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(14);
        $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(14);
        $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(24);
        // $objPHPExcel->setActiveSheetIndex(0)->getStyle('A:E')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getDefaultStyle()->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getDefaultStyle()->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $objPHPExcel->setActiveSheetIndex(0);
        $objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment;filename=悦采采购.xlsx");//设置文件标题
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }  
// echo toChineseNumber(1234567890);//壹拾贰亿叁仟肆佰伍拾陆万柒仟捌佰玖拾圆
}
?>