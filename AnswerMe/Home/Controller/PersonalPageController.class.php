<?php
/*
 * 创建人：杨柳
 * 创建时间：2014-12-10
 * 功能：用户主页，显示用户需要完成的作业
 */
namespace Home\Controller;
use Think\Controller;
header("Content-type:text/html;charset=utf-8");
class PersonalPageController extends Controller {
    public function index(){
    	//从session中取得uid
        $uid = session('uid');

        $take = M('take');
        $homework = M('homework');
        $homeworkindex = M('homeworkindex');
        $courseindex = M('courseindex');
        $takefind = $take->where('uid='.$uid)
        	->field('cid, HW_now')
        	->select();
        $homeworkfind = array();
        for ($i=0; $i < sizeof($takefind); $i++) { 
        	$homeworkindexfind = $homeworkindex->table('homeworkindex H')
        		->join('contain C on H.hid = C.hid')
        		->where("C.cid=".$takefind[$i]['cid']." AND H.order=".$takefind[$i]['HW_now'])
        		->field('C.hid, H.version')
        		->select();
        	$homeworkfind[$i] = $homework->where($homeworkindexfind)
        		->field('hid, version, title, due_time, content')
        		->find();
        	$coursefind = $courseindex->table('courseindex CI')
        		->join('course C on CI.cid = C.cid AND CI.version = C.version')
        		->where('C.cid='.$takefind[$i]['cid'])
        		->field('C.cid, .C.version, C.course_name')
        		->find();
        	$homeworkfind[$i]['cid'] = $coursefind['cid'];
        	$homeworkfind[$i]['cversion'] = $coursefind['version'];
        	$homeworkfind[$i]['course_name'] = $coursefind['course_name'];
        }
        
        $this->assign('homeworks', $homeworkfind);
        $this->display();
    }
}