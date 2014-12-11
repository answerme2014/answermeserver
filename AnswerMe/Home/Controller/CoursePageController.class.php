<?php
namespace Home\Controller;
use Think\Controller;
class CoursePageController extends Controller {
    public function index($cid){
        $this->display();
    }
    /**
     * Request: courseId
     * Reply: json array for a SINGLE course data
     */
    public function getCourseData(){
        //$cid =$_GET["cid"];
        $cid=$_POST["cid"];
        //query index
        $courseIndex = M('courseindex');
        $index = $courseIndex->where('cid='.$cid)->find();
        $course=M('course');
        //form retuern data array
        $data=$course->where('cid='.$cid.' AND version='.$index['version'])->find();
        $data['like_number']=$index['like_number'];
        $data['taken_number']=$index['taken_number'];
        //dump($data);
        $this->ajaxReturn($data,'json');
    }
    /**
     * Request: courseId
     * Reply: json array for MUTIPLE homeworks data
     */
    public function getHomeworkData(){
        $cid =$_GET["cid"];
        //$cid=$_POST["cid"];
        //query all hids
        $contain = M('contain');
        $hids = $contain->where('cid='.$cid)->getField('hid',true);
        //query each homework
        $data=array();
        for($i=0;$i<count($hids);$i++){
            $homeworkIndex = M('homeworkindex');
            $version = $homeworkIndex->where('hid='.$hids[$i])->getField('version');
            $homework = M('homework')->where('hid='.$hids[$i].' AND version='.$version)->find();
            $data[$i]=$homework;
        }
        //dump($data);
        $this->ajaxReturn($data,'json');
    }
     /**
     * Request: {courseId,good}
     * Reply: status = 1/0 for success/failed
     */
     public function likeCourse(){
        //$cid = $_GET['cid'];
        //$good = $_GET['good'];
        $cid = $_POST['cid'];
        $good = $_POST['good'];
        $data = array();
        $courseIndex = M('courseindex');
        if($good=='1'){
            if(!$courseIndex->where('cid='.$cid)->setInc('like_number'))
                $data['status']=0;
            else
                $data['status']=1;
        }
        else{  
            if(!$courseIndex->where('cid='.$cid)->setDec('like_number'))
                $data['status']=0;
            else
                $data['status']=1;
        }
        $this->ajaxReturn($data,'json');
     }
     /**
     * Request : {cid,follow}
     * Reply : status = 1/0 for success/failed
     */
    public function followCourse() {
        //$cid = $_GET['cid'];
        //$follow = $_GET['follow'];
        $cid = $_POST['cid'];
        $follow = $_POST['follow'];
        $data=array();
        //get uid
        $uid = $_SESSION['uid'];
        $take = M('take');
        if($follow=='1'){
            $followData['uid'] = $uid;
            $followData['cid'] = $cid;
            $followData['HW_now'] = 1;
            if(!$take->add($followData))
                $data['status']=0;
            else
                $data['status']=1;
        }
        else{
            if(!$take->where('uid='.$uid.' AND cid='.$cid)->delete())
                $data['status']=0;
            else
                $data['status']=1;
        }
        $this->ajaxReturn($data,'json');
    }
    /**
     * Request : {cid,teacher,course_place,course_time}
     * Reply : failed: {status:0}
     *         succeed:{json array for a SINGLE course data} 
     */
    public function changeCourseInfo() {
        $cid = $_POST['cid'];
        $teacher = $_POST['teacher'];
        $coursePlace = $_POST['course_place'];
        $courseTime = $_POST['course_time'];
        $data = array();
        $version = M('courseindex')->where('cid='.$cid)->find();
        dump($version);
        
    }
}