<?php
namespace app\index\controller;
use \think\Controller;
use \think\loader;
use \think\Session;

class Comment extends Controller
{
	public function _initialize()
	{
		$this->comment = Loader::model('Comment');
	}

	public function index()
	{
		return $this->fetch();
	}

	public function makeComment()
	{
		$data['comment_service_score'] = input('service');
		$data['comment_taste_score'] = input('taste');
		$data['comment_content'] = input('content');
		$data['comment_add_time'] = date("Y-m-d H:i:s");
		// var_dump($data['comment_taste_score']);die();
		$res = $this->comment->make_comment($data);
		return $res;
	}
}