<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;  
use app\admin\model\Excel as ExcelModel;
class Excel extends Controller
{
  //产品审核列表
     function downLoadExcle($id){//加入$id
        Vendor('PHPExcel.PHPExcel');
        Vendor('PHPExcel.PHPExcel.Writer.Excel2007');
        // 首先创建一个新的对象  PHPExcel object
        $objPHPExcel = new \PHPExcel();
         $objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);
         $data=db('order_goods')->alias('a')
         ->join('order p','p.id=a.order_id')
         // ->join('deliverytime b','b.id=p.deliverytime')
        ->where('p.id',$id)//后期改成$id
        ->select();
        // print_r($data);die;
        $deliverytime=db('Deliverytime')->where('id',$data[0]['deliverytime_id'])->find();
        $Excel=new ExcelModel();
        $post_times=$Excel->weekday($data[0]['post_time']);//时间转换为星期
        //设置每列的标题
        $objPHPExcel->setActiveSheetIndex(0)  
                            ->setCellValue('A1', '广西悦采农业股份有限公司')  
                            ;
        $objPHPExcel->getActiveSheet()->mergeCells('A1:F1');//合并单元格
        $objPHPExcel->setActiveSheetIndex(0)  
                            ->setCellValue('A2', '配送单                             NO:')
                            ;
        $objPHPExcel->getActiveSheet()->mergeCells('A2:F2');//合并单元格
        $objPHPExcel->setActiveSheetIndex(0)  
                            ->setCellValue('A3', '客户')  
                            ->setCellValue('D3', $deliverytime['time'])
                            ->setCellValue('F3', $post_times)  
                            ;
        $objPHPExcel->getActiveSheet()->mergeCells('A3:c3');//合并单元格
        $objPHPExcel->getActiveSheet()->mergeCells('D3:E3');//合并单元格
        $objPHPExcel->setActiveSheetIndex(0)  
                            ->setCellValue('A4', '序号')  
                            ->setCellValue('B4', '品种')  
                            ->setCellValue('C4', '单位')  
                            ->setCellValue('D4', '数量')  
                            ->setCellValue('E4', '单价')  
                            ->setCellValue('F4', '金额')  
                            ;
       
        $first=1;
        foreach ($data as $k => $v) {
                        $v['numprice']=$v['goods_num']*$v['aprice'];
                        //  print_r($data);die;
            $num = $k + 5;           
            $objPHPExcel->setActiveSheetIndex(0)
                ->setCellValue('A' . $num, $first++)
                ->setCellValue('B' . $num, $v['goods_name'])
                ->setCellValue('C' . $num, $v['unit'])
                ->setCellValue('D' . $num, $v['goods_num'])
                ->setCellValue('E' . $num, $v['aprice'])
                ->setCellValue('F' . $num, $v['numprice']);
        }
        $Excel=new ExcelModel();
        $cateres=$Excel->number2chinese($v['order_total_price']);
        // print_r($cateres);die;
        $anum=$num+1;
        $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . $anum,"总价")
        ->setCellValue('B' . $anum,$cateres)
        ->setCellValue('E' . $anum,"￥". $v['order_total_price']);
        //尾部
        // $data[0]['post_time']
        $anum1=$anum+1;
        $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . $anum1,"日期")
        ->setCellValue('B' . $anum1,date('Y/m/s', $data[0]['post_time']))
        ->setCellValue('C' . $anum1,"送货:")
        ->setCellValue('E' . $anum1,"收货验货:");
         $objPHPExcel->getActiveSheet()->mergeCells('C'.$anum1.':'.'D'.$anum1);//合并单元格
         $objPHPExcel->getActiveSheet()->mergeCells('E'.$anum1.':'.'F'.$anum1);
         $anum2=$anum+2;
        $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . $anum2,"提示:请妥善保管客户联，质量问题请拨打投诉电话:6826777");
         $objPHPExcel->getActiveSheet()->mergeCells('A'.$anum2.':'.'F'.$anum2);
         $anum3=$anum+3;
        $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . $anum3,"地址:鹿寨镇五里亭  订货咨询电话:6669191");
         $objPHPExcel->getActiveSheet()->mergeCells('A'.$anum3.':'.'F'.$anum3);//合并单元格
        //设置工作表标题
        $objPHPExcel->getActiveSheet()->setTitle('悦悦采购');
        //设置列的宽度
        $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(24);
        $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(10);
        $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(10);
        $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(13);
        $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(14);
        // $objPHPExcel->setActiveSheetIndex(0)->getStyle('A:E')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getDefaultStyle()->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getDefaultStyle()->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $objPHPExcel->getActiveSheet()->getStyle('C' . $anum1)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $objPHPExcel->getActiveSheet()->getStyle('E' . $anum1)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        // $objPHPExcel->getActiveSheet()->mergeCells('B5:E5');
         $objPHPExcel->getActiveSheet()->mergeCells('B'.$anum.':'.'D'.$anum);
        $objPHPExcel->getActiveSheet()->mergeCells('E'.$anum.':'.'F'.$anum);
        // $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
        // Set active sheet index to the first sheet, so Excel opens this as the first sheet
        $objPHPExcel->setActiveSheetIndex(0);
        $objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment;filename=悦采采购.xlsx");//设置文件标题
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
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