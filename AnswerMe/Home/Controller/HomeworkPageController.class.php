<?php
/*
 * 创建人：杨柳
 * 创建时间：2014-12-10
 * 功能：显示指定作业的内容
 */
namespace Home\Controller;
use Think\Controller;
class HomeworkPageController extends Controller {
    public function index($hid, $version){
    	$homework = M('homework');
    	$homeworkindex = M('homeworkindex');

    	$homeworkfind = $homework->where('hid='.$hid.' AND version='.$version)
    		->find();
    	$homeworkfind2 = $homework->where('hid='.$hid)
    		->field('hid, version, title, editor, update_time')
    		->select();
    	$homeworkindexfind = $homeworkindex->where('hid='.$hid)
    		->field('like_number, order')
    		->find();
    	$homeworkfind['like_number'] = $homeworkindexfind['like_number'];
        $homeworkfind['order'] = $homeworkindexfind['order'];

    	$data['homework'] = $homeworkfind;
    	$data['historyversion'] = $homeworkfind2;
    	$this->assign($data);
        $this->display();
    }
}