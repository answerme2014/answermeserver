<?php
/*
 * 创建人：杨柳
 * 创建时间：2014-12-9
 * 功能：搜索页面中搜索课程、搜索作业、点赞、课程关注
 */
namespace Home\Controller;
use Think\Controller;
class SearchPageController extends Controller {
    public function index(){
        $this->display();
    }

    /**
     * 搜索课程
     */
    public function searchcourse() {
    	$keyword = I('post.keyword');

    	$course = M('course');
    	$condition['course_name'] = array('like', '%'.$keyword.'%');
    	$coursefind = $course->where($condition)
    		->distinct(true)
    		->field('cid')
    		->select();

    	$coursefind2= array();
    	$courseindex = M('courseindex');
    	for ($i=0; $i < sizeof($coursefind); $i++) {
            $con2['cid'] = $coursefind[$i]['cid'];
    		$courseindexfind = $courseindex->where($con2)
    			->field('version, like_number, taken_number')
    			->find();

            $con2['version'] = $courseindexfind['version'];
    		$coursefind2[$i] = $course->where($con2)
    			->find();
    		$coursefind2[$i]['like_number'] = $courseindexfind['like_number'];
    		$coursefind2[$i]['taken_number'] = $courseindexfind['taken_number'];
    	}

    	if (sizeof($coursefind2) == 0) {
    		$dataReturn['status'] = 0;
    		$dataReturn['msg'] = "没有查询到数据";
    	} else {
    		$dataReturn['status'] = 1;
    		$dataReturn['courses'] = $coursefind2;
    	}

    	$this->ajaxReturn($dataReturn, 'json');
    }

    /**
     * 搜索作业
     */
    public function searchhw() {
    	$keyword = I('post.keyword');

    	$homework = M('homework');
    	$condition['title'] = array('like', '%'.$keyword.'%');
    	$hwfind = $homework->where($condition)
    		->distinct(true)
    		->field('hid')
    		->select();

    	$hwfind2= array();
    	$hwindex = M('homeworkindex');
    	for ($i=0; $i < sizeof($hwfind); $i++) {
            $con2['hid'] = $hwfind[$i]['hid'];
    		$hwindexfind = $hwindex->where($con2)
    			->field('version, like_number')
    			->find();

            $con2['version'] = $hwindexfind['version'];
    		$hwfind2[$i] = $homework->where($con2)
    			->find();
    		$hwfind2[$i]['like_number'] = $hwindexfind['like_number'];
    	}

    	if (sizeof($hwfind2) == 0) {
    		$dataReturn['status'] = 0;
    		$dataReturn['msg'] = "没有查询到数据";
    	} else {
    		$dataReturn['status'] = 1;
    		$dataReturn['homeworks'] = $hwfind2;
    	}

    	$this->ajaxReturn($dataReturn, 'json');
    }

    /**
     * 课程、作业点赞、取消点赞
     */
    public function like() {
    	$flag1 = I('post.flag1');
    	$flag2 = I('post.flag2');

    	//判断是课程点赞还是作业点赞
    	if ($flag1 == 1) {
    		$cid = I(post.cid);
    		$courseindex = M('courseindex');
   			//判断是点赞还是取消点赞
   			if ($flag2 == 1) {
   				$courseindex->where('cid='.$cid)->setInc('like_number');
   				$dataReturn['status'] = 1;
   			} else if ($flag2 == 2) {
   				$courseindex->where('cid='.$cid)->setDec('like_number');
   				$dataReturn['status'] = 1;
   			} else {
	    		$dataReturn['status'] = 0;
	    		$dataReturn['msg'] = "操作失败";
    		}
    	} else if ($flag1 == 2) {
    		$hid = I(post.hid);
    		$homeworkindex = M('homeworkindex');
    		//判断是点赞还是取消点赞
    		if ($flag2 == 1) {
   				$homeworkindex->where('hid='.$hid)->setInc('like_number');
   				$dataReturn['status'] = 1;
   			} else if ($flag2 == 2) {
   				$homeworkindex->where('hid='.$hid)->setDec('like_number');
   				$dataReturn['status'] = 1;
   			} else {
	    		$dataReturn['status'] = 0;
	    		$dataReturn['msg'] = "操作失败";
    		}
    	} else {
    		$dataReturn['status'] = 0;
    		$dataReturn['msg'] = "操作失败";
    	}

    	$this->ajaxReturn(dataReturn, 'json');
    }

    /**
     * 课程关注
     */
    public function follow() {
    	//获取前端传来的信息
    	$flag = I('post.flag');
        $cid = I('post.cid');

        //从session中取得uid
        $uid = session('uid');
 
        //实例化Take模型类
        $take = M('take');

        if ($flag == 1) {
        	//关注
        	$data['uid'] = $uid;
	        $data['cid'] = $cid;
	        $data['HW_now'] = 1;

	        if (!$take->add($data)) {
	            $dataReturn['status'] = 0;
	            $dataReturn['msg'] = "创建数据库失败";
	        } else {
	        	$dataReturn['status'] = 1;
	        }
        } else if ($flag == 0) {
        	//取消关注
        	$takedelete = $take->where('cid='.$cid.' AND uid='.$uid)
        		->delete();

        	if ($takedelete) {
        		$dataReturn['status'] = 1;
        	} else {
        		$dataReturn['status'] = 0;
        		$dataReturn['msg'] = "数据库操作失败";
        	}
        	
        }

        $this->ajaxReturn($dataReturn, 'json');
    }
}