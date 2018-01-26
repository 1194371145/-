<?php
namespace app\index\model;
use think\Model;
use think\Validate;
use think\Session;

class Comment extends model
{
	public function make_comment($data)
	{
		// var_dump($data);die();
		$data['seller_id'] = session('shopid');
		$comment = new Comment;
		$comment->data($data);
		$comment->save();
		if($comment->comment_id) {
			return returnMsg(0, '成功！');
		} else {
			return returnMsg(0, '失败！');
		}
	}

	public function get_comment()
	{
		$comment = new Comment;
		$map['seller_id'] = session('shopid');
		$data = $comment->where($map)->order('comment_id desc')->select();
		return $data;
	}
}