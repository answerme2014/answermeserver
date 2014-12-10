<?php
namespace Home\Controller;
use Think\Controller;
class CoursePageController extends Controller {
    public function index(){
    	$this->display();
    }
    //return ajax request to render CoursePage
    public function getCourseData(){
    	$cid=$_POST["cid"];
    	//$cid = 12345;
    	//query index
    	$courseIndex = M('courseindex');
    	$index = $courseIndex->where('cid='.(string)$cid)->find();
    	$course=M('course');
    	//form retuern data array
    	$data=$course->where('cid='.(string)$cid.' AND version='.$index['version'])->find();
    	$data['like_number']=$index['like_number'];
    	$data['taken_number']=$index['taken_number'];
    	//dump($data);
    	$this->ajaxReturn($data);
    }
}