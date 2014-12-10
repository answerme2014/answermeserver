<?php
/*
 * 创建人：杨柳
 * 创建时间：2014-12-10
 * 功能：用户主页，显示用户需要完成的作业
 */
namespace Home\Controller;
use Think\Controller;
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
        	$homeworkindexfind = $homeworkindex->join('contain ON homeworkindex.hid = contain.hid')
        		->where('cid='.$takefind['cid'].' AND order='.$takefind[$i]['HW_now'])
        		->field('hid, version')
        		->find();
        	$homeworkfind[$i] = $homework->where($homeworkindexfind)
        		->field('hid, hversion as version, title, due_time, content')
        		->find();
        	$coursefind = $courseindex->join('course ON courseindex.cid = course.cid AND courseindex.version = course.version')
        		->where('cid='.$takefind['cid'])
        		->field('cid, version, course_name')
        		->find();
        	$homeworkfind[$i]['cid'] = $coursefind['cid'];
        	$homeworkfind[$i]['cversion'] = $coursefind['version'];
        	$homeworkfind[$i]['course_name'] = $coursefind['course_name'];
        }
        
        $this->assign('homeworks', $homeworkfind);
        $this->display();
    }
}