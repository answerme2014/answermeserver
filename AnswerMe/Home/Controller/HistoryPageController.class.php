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
        //从session中取得uid
        $uid = session('uid');

        $course = M('course');
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

    	$this->assign('homeworks', $hwfind);
        $this->display();
    }
}