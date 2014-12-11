<?php
namespace Home\Controller;
use Think\Controller;
class HomePageController extends Controller {
    public function index(){
        $user = M('user');
        $course = M('course');
        $courseindex = M('courseindex');

        // 贡献排行榜
        $userfind = $user->order('experience desc')->limit(5)
                            ->field('username')->select();

        // 最热课程
        $courseindexfind = $courseindex->order('like_number desc')->limit(3)
                            ->select();
        $coursefind = $course
            ->where('cid='.$courseindexfind['cid'].' AND version='.$courseindexfind['version'])
            ->field('course_name, teacher, brief, picture')
            ->select();

        $this->assign('userlist', $userfind);
        $this->assign('courselist', $coursefind);
        $this->display();
    }
}
