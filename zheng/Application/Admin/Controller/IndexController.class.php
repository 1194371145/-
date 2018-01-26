<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends CommonController {
    
    public function index(){
    	$book=D('book');
         if(IS_POST){
            $keywords=I('keywords');
            $where['name']=array('like',"%".$keywords."%");
            $where['type']=1;
            $list=$book->where($where)->order('addtime desc')->select();
         $this->assign('list',$list);// 赋值数据集
        $this->display();
        }
        $count      = $book->where('type=1')->count();// 查询满足要求的总记录数
         $Page       = new \Think\Page($count,3);// 实例化分页类 传入总记录数和每页显示的记录数(3)
         $show       = $Page->show();// 分页显示输出
         $list = $book->where('type=1')->order('addtime desc')->limit($Page->firstRow.','.$Page->listRows)->select();
         $this->assign('list',$list);// 赋值数据集
$this->assign('page',$show);// 赋值分页输出
 $this->assign('count',$count);
        $this->display();
    }
 public function edit(){
        $book=D('book');
        if(!IS_POST){//如果没有点击提交
           $cater=$book->find(I('id'));
        }else{
            $date['id']=I('id');
            $date['name']=I('name');
            $date['shuhao']=I('shuhao');
            $date['zuoze']=I('zuoze');
            $date['shubanshe']=I('shubanshe');
            $date['tuijianren']=I('tuijianren');
            $date['tel']=I('tel');
            // dump($date);die;
            if($book->create($date)){
                if($book->save()){
            $this->success('修改信息成功',U('index'));
            }else{
                $this->error('修改信息失败');
            }
            }else{
                $this->error($book->getError());
            }
            return;
        }
        $this->assign('cater',$cater);
        $this->display();
    }
    public function del(){
         $book=D('book');
        if($book->delete(I('id'))){
            $this->success('删除信息成功',U('index'));
           }else{
             $this->error('删除信息失败');
           }
    }
    public function excel(){

		$this->display();
    }
   
  public function download(){
        Vendor('PHPExcel.PHPExcel');
        Vendor('PHPExcel.PHPExcel.Writer.Excel2007');
        // 首先创建一个新的对象  PHPExcel object
        $objPHPExcel = new \PHPExcel();
         $objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);
        // 位置aaa  *为下文代码位置提供锚
             $objPHPExcel->setActiveSheetIndex(0)  
                            // ->setCellValue('A1', '序号')  
                            ->setCellValue('B1', '书本')  
                            ->setCellValue('C1', '书号')  
                            ->setCellValue('D1', '作者')  
                            ->setCellValue('E1', '出版社')  
                            ->setCellValue('F1', '推荐人')  
                            ->setCellValue('G1', '联系方式')  
                            ->setCellValue('H1', '添加时间')
                            ->setCellValue('I1', '该人信息')
                            // ->setCellValue('J1', '推荐次数')
                            ;

            $startTime=I('get.startTime');
            $endTime=I('get.endTime');
            $agent=I('get.agent');
            $model=I('get.model');
            $istrue=I('get.istrue')==0?0:1;  
                if ($startTime!=''&&$endTime!='') {
                $str=$startTime.",".$endTime;
                $where['time']=array('between',$str);
                }
            if ($agent!='') {
                $where['agent']=$agent;
                }
            if ($model!='') {
                $where['model']=$model;
                }
            if ($istrue==1) {
                $where['istrue']=$istrue;
                }
            $data=M('book')->where($where)->order('type,addtime desc')->select();
            if ($data)  
            {  
                $count=1;  
                foreach($data as $v)
                {  
                    $count+=1;  
                    // $l1="A"."$count";  
                    $l2="B"."$count";  
                    $l3="C"."$count";  
                    $l4="D"."$count";  
                    $l5="E"."$count";  
                    $l6="F"."$count";  
                    $l7="G"."$count";  
                    $l8="H"."$count";  
                    $l9="I"."$count";  
                    // $l10="J"."$count"
                    ;  
                      
                      if($v['type']==1){
                        $cass="学生";
                      }else{
                         $cass="老师";
                      }
                      $time =$v['addtime'];
                        $nowtime = date('Y-m-d H:i:s',$time);

                    $objPHPExcel->setActiveSheetIndex(0)              
                                // ->setCellValue($l1, $v['id'])  
                                ->setCellValue($l2, $v['name'])  
                                 ->setCellValue($l3, $v['shuhao'])  
                                ->setCellValue($l4,$v['zuoze'])  
                                 ->setCellValue($l5, $v['chubanshe'])  
                                ->setCellValue($l6, $v['tuijianren'])  
                                 ->setCellValue($l7, $v['tel'])  
                                ->setCellValue($l8, $nowtime)  
                                 ->setCellValue($l9, $cass)   
                                // ->setCellValue($l10, $v['num'])
                                ;
                }  
            }          

        //得到当前活动的表,注意下文教程中会经常用到$objActSheet
        $objActSheet = $objPHPExcel->getActiveSheet();
        // 获得当前活动单元格
         $objActSheet->getDefaultStyle()->getFont()->setName("微软雅黑")->setSize('14');//设置默认字体以及大小
        // $objActSheet->getStyle("A1")->getFont()->setSize(20)->setBold(True);
// $objPHPExcel->getActiveSheet()->getRowDimension('1')->setSize(20)->setBold(True);

// 所有单元格默认高度
$objPHPExcel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(15);
// 第一行的默认高度
$objPHPExcel->getActiveSheet()->getRowDimension('1')->setRowHeight(30);
// 设置宽width
// Set column widths
// $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(13);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(13);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(13);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(17);
// $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
        // 位置bbb  *为下文代码位置提供锚
        // 给当前活动的表设置名称
        $objActSheet->setTitle('list');
        // 生成2007excel格式的xlsx文件
         header("Content-Type: application/force-download");

                header("Content-Type: application/octet-stream");

                header("Content-Type: application/download");

                header("Content-Disposition:inline;filename='图书馆学生推荐.xlsx");

                header("Content-Transfer-Encoding: binary");

                header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

                header("Pragma: no-cache");

                $objWriter->save('php://output');

                exit;
        }

}