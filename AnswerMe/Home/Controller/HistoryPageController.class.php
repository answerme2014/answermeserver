<?php
/*
 * 创建人：杨柳
 * 创建时间：2014-12-9
 * 功能：用户编辑历史页面中显示最近的作业、编辑历史
 */
namespace Home\Controller;
use Think\Controller;
class HistoryPageController extends Controller {
    public function index(){
        $this->display();
    }

    public function findhistory() {
    	$flag = I('post.flag');
    	//从session中取得uid
	    $uid = session('uid');

	    $course = M('course');

    	if ($flag == 1) {
    		//课程历史
	        $homework = M('homework');
	        $homeworkindex = M('homeworkindex');
	        $edithw = M('edithw');
	        $contain = M('contain');
	    	$edithwfind = $edithw->where('uid='.$uid)
	    		->order('edit_time desc')
	    		->field('hid, version')
	    		->select();

	    	$hwfind = array();
	        for ($i=0; $i < sizeof($edithwfind); $i++) {
	            $hwfind[$i] = $homework->where($edithwfind[$i])
	            	->field('hid, version, title, update_time')
	            	->find();
	            $homeworkindexfind = $homeworkindex->where('hid='.$edithwfind[$i]['hid'])
	            	->field('like_number')
	            	->find();
	            $containfind = $contain->where('hid='.$edithwfind[$i]['hid'])
	            	->field('cid')
	            	->find();
	            $coursefind = $course->where('cid='.$containfind['cid'])
	            	->field('course_name')
	            	->find();
	            $hwfind[$i]['like_number'] = $homeworkindexfind['like_number'];
	            $hwfind[$i]['course_name'] = $coursefind['course_name'];
	    	}

	    	if (sizeof($hwfind) == 0) {
	    		$dataReturn['status'] = 0;
	    		$dataReturn['msg'] = "没有查询到数据";
	    	} else {
	    		$dataReturn['status'] = 1;
	    		$dataReturn['homeworks'] = $hwfind;
	    	}
    	} else if ($flag == 2) {
    		$editcourse = M('editcourse');
    		$courseindex = M('courseindex');
    		$editcoursefind = $editcourse->where()
    			->order('edit_time desc')
    			->field('cid, version')
    			->select();

    		$coursefind = array();
    		for ($i=0; $i < sizeof($editcoursefind); $i++) { 
    			$coursefind[$i] = $course->where($editcoursefind[$i])
    				->field('cid, version, course_name, update_time')
    				->find();
    			$courseindexfind = $courseindex->where('cid='.$editcoursefind[$i]['cid'])
    				->field('like_number')
    				->find();
    			$coursefind[$i]['like_number'] = $courseindexfind['like_number'];
    		}

    		if (sizeof($coursefind) == 0) {
	    		$dataReturn['status'] = 0;
	    		$dataReturn['msg'] = "没有查询到数据";
	    	} else {
	    		$dataReturn['status'] = 1;
	    		$dataReturn['courses'] = $coursefind;
	    	}
    	}
    	
    	$this->ajaxReturn($dataReturn, 'json');
    }
}