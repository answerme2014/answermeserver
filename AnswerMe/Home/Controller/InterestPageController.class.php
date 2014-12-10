<?php
/*
 * 创建人：杨柳
 * 创建时间：2014-12-8
 * 功能：“选择感兴趣的课程”页面的渲染和关注课程功能
 */
namespace Home\Controller;
use Think\Controller;
header("Content-type:text/html;charset=utf-8");
class InterestPageController extends Controller {
    /**
     * 页面渲染
     */
    public function index(){
    	//从session中取得uid
        $uid = session('uid');

        $user = M('user');
    	$userfind = $user->where('uid='.$uid)->field('profession')->find();
    	$course = M('course');
        $con['profession'] = $userfind['profession'];
    	$coursefind = $course->where($con)
    		->distinct(true)
    		->field('cid')
    		->limit(8)
    		->select();

        $coursefind2 = array();
    	$courseindex = M('courseindex');
    	for ($i=0; $i < sizeof($coursefind); $i++) {
            $con2['cid'] = $coursefind[$i]['cid'];
    		$courseindexfind = $courseindex->where($con2)
    			->field('version')
    			->find();

            $con2['version'] = $courseindexfind['version'];
    		$coursefind2[$i] = $course->where($con2)
    			->field('cid, version, picture, course_name')
    			->find();
    	}

    	$this->assign('courses', $coursefind2);
        $this->display();
    }

    /**
     * 关注选择的课程
     */
    public function complete() {
        //获取前端传来的信息
        $courselist = I('post.courselist');

        //从session中取得uid
        $uid = session('uid');

        for ($i=0; $i < sizeof($courselist); $i++) { 
            //实例化Take模型类
            $take = M('take');

            $data['uid'] = $uid;
            $data['cid'] = $courselist[$i];
            $data['HW_now'] = 1;

            if (!$take->add($data)) {
                $dataReturn['status'] = 0;
                $dataReturn['msg'] = "创建数据库失败";
                $this->ajaxReturn($dataReturn, 'json');
            }
        }

        $dataReturn['status'] = 1;
        $this->ajaxReturn($dataReturn, 'json');
    }
}