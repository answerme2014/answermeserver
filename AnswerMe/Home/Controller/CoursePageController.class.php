<?php
namespace Home\Controller;
use Think\Controller;
class CoursePageController extends Controller {
    public function index($cid){
        $this->display();
    }
    /**获取课程数据
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
        //if the user logged
        if(isset($_SESSION['uid'])){
            $uid = $_SESSION['uid'];
            $take = M('take');
            $follow = $take->where('uid='.$uid.' AND cid='.$cid)->find();
            if($follow == null)
                $data['is_follow']=0;
            else
                $data['is_follow']=1;
        }
        $this->ajaxReturn($data,'json');
    }
    /**获取作业数据
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
            $order = $homeworkIndex->where('hid='.$hids[$i])->getField('order');
            $homework = M('homework')->where('hid='.$hids[$i].' AND version='.$version)->find();
            $data[$i]=$homework;
            $data[$i]['order']=$order;
        }
        //dump($data);
        $this->ajaxReturn($data,'json');
    }
     /**点赞/取消点赞
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
     /**关注/取消关注课程
     * Request : {cid,follow}
     * Reply : status = 1/0 for success/failed
     */
    public function followCourse() {
        //$cid = $_GET['cid'];
        //$follow = $_GET['follow'];
        $status = 1;
        $cid = $_POST['cid'];
        $follow = $_POST['follow'];
        $data=array();
        //get uid
        $uid = $_SESSION['uid'];
        $take = M('take');
        $courseIndex = M('courseindex');
        if($follow=='1'){
            //add data in 'take' table
            $followData['uid'] = $uid;
            $followData['cid'] = $cid;
            $followData['HW_now'] = 0;
            if(!$take->add($followData))
                $status = 0;
            //change courseIndex
            if(!$courseIndex->where('cid='.$cid)->setInc('taken_number'))
                $status = 0;
        }
        else{
            //delete data
            if(!$take->where('uid='.$uid.' AND cid='.$cid)->delete())
                $status=0;
            //change courseIndex
            if(!$courseIndex->where('cid='.$cid)->setDec('taken_number'))
                $status = 0;
        }
        $data['status']=$status;
        $this->ajaxReturn($data,'json');
    }
    /**修改课程信息
     * Request : {cid,teacher,course_place,course_time}
     * Reply : failed: {status!=1}
     *         succeed:{json array for a SINGLE course data} 
     */
    public function changeCourseInfo() {
        // $cid = $_GET['cid'];
        // $teacher = $_GET['teacher'];
        // $coursePlace = $_GET['course_place'];
        // $courseTime = $_GET['course_time'];
        //succeed or failed flag
        $status=1;
        //get params
        $cid = $_POST['cid'];
        $teacher = $_POST['teacher'];
        $coursePlace = $_POST['course_place'];
        $courseTime = $_POST['course_time'];
        //get newest ver.
        $courseIndex= M('courseindex');
        $version=$courseIndex->where('cid='.$cid)->find();
        if(!$version)
            $status=0;
        $version = $version['version'];
        $course = M('course');
        //get coursedata
        $courseData = $course->where('cid='.$cid.' AND version='.$version)->find();
        if(!$courseData)
            $status=-1;
        //change coursedata
        $courseData['teacher'] = $teacher; 
        $courseData['course_place'] = $coursePlace;
        $courseData['course_time'] =$courseTime;
        $courseData['version'] =  (string)(intval($courseData['version'])+1);
        //change index
        if(!$courseIndex->where('cid='.$cid)->setInc('version'))
            $status=-2;
        //dump($courseData);
        //write back to DB
        if(!$course->add($courseData))
            $status=-3;
        //from json array
        $data=array();
        if($status==1)
            $data=$courseData;
        else
            //$data=$courseData;
            $data['status']=$status;
        $this->ajaxReturn($data,'json');
    }
}