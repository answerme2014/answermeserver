<?php
namespace Home\Controller;
use Think\Controller;
class EditPageController extends Controller {
    public function index($hid,$version){
    	//assign data
    	$data = array();
    	//DB
    	$homework = M('homework');
    	$contain = M('contain');
    	$course = M('course');
    	$courseIndex = M('courseindex');
    	
    	//get courseName
    	$cid = $contain->where("hid=".$hid)->find();
    	$cid = $cid['cid'];
    	$courseVersion = $courseIndex->where('cid='.$cid)->getField('version');
    	$courseName = $course->where('cid='.$cid.' AND version='.$courseVersion)->getField('course_name');
    	$data['courseName']=$courseName;
    	
    	//get courses homeworks
    	$hids = $contain->where('cid='.$cid)->getField('hid',true);
    	$homeworkTitles=array();
        for($i=0;$i<count($hids);$i++){
        	$homworkIndex = M('homeworkindex');
        	$homworkVersion = $homworkIndex->where('hid='.$hids[$i])->getField('version');
        	$homeworkTitles[$i] = $homework->where('hid='.$hids[$i].' AND version='.$homworkVersion)->getField('title,hid');
        }
        $data['titles']=$homeworkTitles;
       	
       	//get homework content
       	$data['content']=$homework->where('hid='.$hid.' AND version='.$version)->getField('content');
        //dump($data);
        $this->assign('courseName',$courseName);
        $this->display();

    }
    public function getContent(){
    	$hid=  $_POST['hid'];
    	$version = $_POST['version'];
    	$data=array();
    	$homework = M('homework');
    	$data['content']=$homework->where('hid='.$hid.' AND version='.$version)->getField('content');
  		$this->ajaxReturn($data,'json');
    }
}