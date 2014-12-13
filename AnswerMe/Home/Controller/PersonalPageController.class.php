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
        		->find();
            if ($homeworkindexfind) {
                $homeworkfind[$i] = $homework->where($homeworkindexfind)
                    ->field('hid, version, title, due_time, content')
                    ->find();
                $homeworkfind[$i]['order'] = $takefind[$i]['HW_now'];
            } else {
                $homeworkfind[$i]['hid'] = 0;
            }
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

    public function complete() {
    	$cid = I('post.cid');

    	//从session中取得uid
        $uid = session('uid');

        $take = M('take');
        $homework = M('homework');
        $homeworkindex = M('homeworkindex');
        $takefind = $take->where('uid='.$uid.' AND cid='.$cid)
        	->field('HW_now')
        	->find();
        $nextorder = $takefind['HW_now'] + 1;
        //获取下一次作业
        $homeworkindexfind = $homeworkindex->table('homeworkindex H')
            ->join('contain C on H.hid = C.hid')
            ->where("C.cid=".$cid." AND H.order=".$nextorder)
            ->field('C.hid, H.version')
            ->find();
        if ($homeworkindexfind) {
        	//当前作业不是最后一次作业
        	//修改take表中属性HW_now
        	$data['HW_now'] = $nextorder;
        	$take->where('uid='.$uid.' AND cid='.$cid)->save($data);

        	$homeworkfind = $homework->where($homeworkindexfind)
        		->field('hid, version, title, due_time, content')
        		->find();
        	if ($homeworkfind) {
        		$dataReturn['status'] = 1;
        	} else {
        		$dataReturn['status'] = 0;
				$dataReturn['msg'] = "操作不成功";
        	}
        } else {
        	//当前作业为最后一次作业
        	//修改take表中属性HW_now
        	$data['HW_now'] = 0;
        	$take->where('uid='.$uid.' AND cid='.$cid)->save($data);

        	$dataReturn['status'] = 2;
			$dataReturn['msg'] = "你已完成该课程所有作业";
        }

        $this->ajaxReturn($dataReturn, 'json');
    }
}