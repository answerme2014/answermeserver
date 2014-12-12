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
    	$homeworkData=array();
        for($i=0;$i<count($hids);$i++){
            $hw=array();
        	$homworkIndex = M('homeworkindex');
        	$homworkVersion = $homworkIndex->where('hid='.$hids[$i])->getField('version');
        	$hw['hid'] = $hids[$i];
            $hw['version'] = $homworkVersion;
            $hw['title'] = $homework->where('hid='.$hids[$i].' AND version='.$homworkVersion)->getField('title');
            $homeworkData[$i] =$hw;
        }
        $data['homeworks']=$homeworkData;
        $data['hid']=$hid;
        $data['version']=$version;
        $data['cid']=$cid;
       	//get homework content
        $this->assign('data',$data);
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
    public function setContent(){
        $status=1;
        $hid=  $_POST['hid'];
        $content = $_POST['content'];
        $version=$_POST['version'];
        $homework = M('homework');
        $homeworkIndex = M('homeworkindex');
        $homeworkData=$homework->where('hid='.$hid.' AND version='.$version)->find();
        if(!$homeworkData)
            $status=-1;
        $homeworkData['content']=$content;
        $latestVersion=$homeworkIndex->where('hid='.$hid)->getField('version');
        $homeworkData['version']=(string)(intval($latestVersion)+1);
        //change index
        if(!$homeworkIndex->where('hid='.$hid)->setInc('version'))
            $status=-2;
        //write back to DB
        if(!$homework->add($homeworkData))
            $status=-3;
        $data['status']=$status;
        $data['hid']=$hid;
        $data['version']=$homeworkData['version'];
        $this->ajaxReturn($data,'json');
    }
    public function createNew(){
        //$cid=$_GET['cid'];
        $cid=$_POST['cid'];
        $status=1;
        $homeworkIndex=M('homeworkindex');
        $homework=M('homework');
        $contain=M('contain');
        //get a new hid
        $hid=$homeworkIndex->where("hid=(select max(hid) from `homeworkindex`)")->getField('hid');
        $hid=(string)(intval($hid)+1);
        $order=$homeworkIndex->where()->getField('hid');
        
        //change DB
        $i['hid']=$hid;
        $i['version']=0;
        $i['like_number']=0;
        $i['order']=9;
        if(!$homeworkIndex->add($i))
            $status=-2;

        $c['hid']=$hid;
        $c['cid']=$cid;
        if(!$contain->add($c))
            $status=-1;

        $newHomework['hid']=$hid;
        $newHomework['version']=0;
        $newHomework['title']="新的作业";
        $newHomework['editor']="KL";
        $newHomework['update_time']="2014-12-02 00:00:00";
        $newHomework['due_time']="2014-12-02 00:00:00";
        $newHomework['content']="";
        if(!$homework->add($newHomework))
            $status=-3;
        $data["version"]='0';
        $data['hid']=$hid;
        $data['status']=$status;
        $this->ajaxReturn($data,'json');
    }
}