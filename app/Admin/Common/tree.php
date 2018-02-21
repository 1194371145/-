<?php
#递归方法实现无限极分类
function getTree($list,$pid=0,$level=0) {
	static $tree = array();
	foreach($list as $row) {
		if($row['pid']==$pid) {//查询pid对应的部门
			$row['level'] = $level;
			$tree[] = $row;
			getTree($list, $row['id'], $level + 1);
		}
	}
	return $tree;
}