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

        $coursefindresult = array();
        for ($i = 0; $i < count($courseindexfind); $i++) {
            $condition['cid'] = $courseindexfind[$i]['cid'];
            $condition['version'] = $courseindexfind[$i]['version'];
            $tmp = $course
                ->where($condition)
                ->find();
            $coursefindresult[$i] = $tmp;
            $coursefindresult[$i]['like_number'] = $courseindexfind[$i]['like_number'];
            $coursefindresult[$i]['taken_number'] = $courseindexfind[$i]['taken_number'];
        }

        $this->assign('userlist', $userfind);
        $this->assign('courselist', $coursefindresult);
        $this->display();
    }
}
