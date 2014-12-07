<?php
/*
 * 创建人：杨柳
 * 创建时间：2014-12-7
 * 功能：所有页面的登陆、注册和登出
 */
namespace Home\Controller;
use Think\Controller;
class MainNavigationController extends Controller {
	/**
	 * 登陆
	 */
	public function login() {
		//获取前端传来的信息
		$username = I('post.username');
		$password = I('post.password');

		//实例化User模型类
		$user = M('User');

		if ($userfind = $user->where("username = '$username'")->field('uid, password, experience')->find()) {
			if (md5($password) == $userfind['password']) {
				$dataReturn['status'] = 1;
				$dataReturn['username'] = $username;
				$dataReturn['experience'] = $userfind['experience'];

				//设置session的值
				session('uid', $userfind['uid']);
			} else {
				$dataReturn['status'] = 0;
				$dataReturn['msg'] = '密码错误';
			}
		} else {
			$dataReturn['status'] = 0;
			$dataReturn['msg'] = "没有这个用户！";
		}

		$this->ajaxReturn($dataReturn, 'json');
	}

	/**
	 * 登出
	 */
	public function logout() {
		//销毁session
		session(null);
		session('[destroy]');

		$dataReturn['status'] = 1;
		$this->ajaxReturn($dataReturn, 'json');
	}

	/**
	 * 注册
	 */
	public function register() {
		//获取前端传来的信息
		$username = I('post.username');

		//实例化User模型类
		$user = M('User');

		if ($userfind = $user->where("username = '$username'")->find()) {
			$dataReturn['status'] = 0;
			$dataReturn['msg'] = "用户名已存在";
		} else {
			//继续获取前端传来的信息
			$data['username'] = $username;
			$data['password'] = md5(I('post.password'));
			$data['email'] = I('post.email');
			$data['experience'] = 0;
			$data['college'] = I('post.school');
			$data['school'] = I('post.college');
			$data['profession'] = I('post.profession');
			$data['entry_year'] = I('post.year');

			if ($user->create()){
				$result = $user->add($data);
				//设置session的值
				session('uid', $result);

				$dataReturn['uid'] = $result;
				$dataReturn['username'] = $username;
				$dataReturn['status'] = 1;
			} else {
				$dataReturn['status'] = 0;
				$dataReturn['msg'] = '数据库建表失败!';
			}
		}

		$this->ajaxReturn($dataReturn, 'json');
	}

}