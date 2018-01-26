<?php
$fname = $_FILES['MyFile']['name'];
$do = copy($_FILES['MyFile']['tmp_name'],$fname);
if ($do)
{
    echo"导入数据成功<br>";
} else {
    echo "";
}
?>
    <form ENCTYPE="multipart/form-data" ACTION="<?php echo"".$PHP_SELF.""; ?>" METHOD="POST">
        导入CVS数据 <input NAME="MyFile" TYPE="file"> <input VALUE="提交" TYPE="submit">

    </form>
<?
error_reporting(0);
//导入CSV格式的文件
$connect=mysql_connect("localhost","a0530093319","123456") or die("could not connect to database");
mysql_select_db("a0530093319",$connect) or die (mysql_error());
$fname = $_FILES['MyFile']['name'];
$handle=fopen("$fname","r");
while($data=fgetcsv($handle,10000,","))
{
    $q="insert into test (code,name,date) values ('$data[0]','$data[1]','$data[2]')";
    mysql_query($q) or die (mysql_error());

}
fclose($handle);
?>

    用php将数据库导出成excel，测试完全成功
    PHP代码 www.devdao.com
<?php
$DB_Server = "localhost";
$DB_Username = "root";
$DB_Password = "";
$DB_DBName = "ishop";
$DB_TBLName = "oi_mall_payment";

$savename = date("YmjHis");
$Connect = @mysql_connect($DB_Server, $DB_Username, $DB_Password) or die("Couldn't connect.");
mysql_query("Set Names 'gbk'");
$file_type = "vnd.ms-excel";
$file_ending = "xls";
header("Content-Type: application/$file_type;charset=big5");
header("Content-Disposition: attachment; filename=".$savename.".$file_ending");
//header("Pragma: no-cache");

$now_date = date("Y-m-j H:i:s");
$title = "数据库名:$DB_DBName,数据表:$DB_TBLName,备份日期:$now_date";

$sql = "Select * from $DB_TBLName";
$ALT_Db = @mysql_select_db($DB_DBName, $Connect) or die("Couldn't select database");
$result = @mysql_query($sql,$Connect) or die(mysql_error());

echo("$title\n");
$sep = "\t";
for ($i = 0; $i < mysql_num_fields($result); $i++) {
    echo mysql_field_name($result,$i) . "\t";
}
print("\n");
$i = 0;
while($row = mysql_fetch_row($result)) {
    $schema_insert = "";
    for($j=0; $j<mysql_num_fields($result);$j++) {
        if(!isset($row[$j]))
            $schema_insert .= "NULL".$sep;
        elseif ($row[$j] != "")
            $schema_insert .= "$row[$j]".$sep;
        else
            $schema_insert .= "".$sep;
    }
    $schema_insert = str_replace($sep."$", "", $schema_insert);
    $schema_insert .= "\t";
    print(trim($schema_insert));
    print "\n";
    $i++;
}
return (true);
?>