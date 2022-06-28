<?php
require_once('../config.php');
Class Specialties extends DBConnection {
	private $settings;
	public function __construct(){
		global $_settings;
		$this->settings = $_settings;

		parent::__construct();
	}
	public function __destruct(){
		parent::__destruct();
	}
	public function save_users(){
		extract($_POST);
		$data = '';
		$chk = $this->conn->query("SELECT * FROM `specialties` where name ='{$name}' ".($id>0? " and id!= '{$id}' " : ""))->num_rows;
		if($chk > 0){
			return 3;
			exit;
		}
		foreach($_POST as $k => $v){
			
				if(!empty($data)) $data .=" , ";
				$data .= " {$k} = '{$v}' ";
			
		}
		
		if(empty($id)){
			$qry = $this->conn->query("INSERT INTO specialties set {$data}");
			if($qry){
				$this->settings->set_flashdata('success','Specialty Details successfully saved.');
				return 1;
			}else{
				return 2;
			}

		}else{
			$qry = $this->conn->query("UPDATE specialties set $data where id = {$id}");
			if($qry){
				$this->settings->set_flashdata('success','Specialty Details successfully updated.');
				foreach($_POST as $k => $v){
					if($k != 'id'){
						if(!empty($data)) $data .=" , ";
						$this->settings->set_userdata($k,$v);
					}
				}
				if(isset($fname) && isset($move))
				$this->settings->set_userdata('avatar',$fname);

				return 1;
			}else{
				return "UPDATE specialties set $data where id = {$id}";
			}
			
		}
	}
	public function delete_users(){
		extract($_POST);
		$qry = $this->conn->query("DELETE FROM specialties where id = $id");
		if($qry){
			$this->settings->set_flashdata('success','Doctor Details successfully deleted.');
			return 1;
		}else{
			return false;
		}
	}
	public function save_fusers(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k => $v){
			if(!in_array($k, array('id','password'))){
				if(!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}

			if(!empty($password))
			$data .= ", `password` = '".md5($password)."' ";
		
			if(isset($_FILES['img']) && $_FILES['img']['tmp_name'] != ''){
				$fname = 'uploads/'.strtotime(date('y-m-d H:i')).'_'.$_FILES['img']['name'];
				$move = move_uploaded_file($_FILES['img']['tmp_name'],'../'. $fname);
				if($move){
					$data .=" , avatar = '{$fname}' ";
					if(isset($_SESSION['userdata']['avatar']) && is_file('../'.$_SESSION['userdata']['avatar']))
						unlink('../'.$_SESSION['userdata']['avatar']);
				}
			}
			$sql = "UPDATE faculty set {$data} where id = $id";
			$save = $this->conn->query($sql);

			if($save){
			$this->settings->set_flashdata('success','User Details successfully updated.');
			foreach($_POST as $k => $v){
				if(!in_array($k,array('id','password'))){
					if(!empty($data)) $data .=" , ";
					$this->settings->set_userdata($k,$v);
				}
			}
			if(isset($fname) && isset($move))
			$this->settings->set_userdata('avatar',$fname);
			return 1;
			}else{
				$resp['error'] = $sql;
				return json_encode($resp);
			}

	} 

	public function save_susers(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k => $v){
			if(!in_array($k, array('id','password'))){
				if(!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}

			if(!empty($password))
			$data .= ", `password` = '".md5($password)."' ";
		
			if(isset($_FILES['img']) && $_FILES['img']['tmp_name'] != ''){
				$fname = 'uploads/'.strtotime(date('y-m-d H:i')).'_'.$_FILES['img']['name'];
				$move = move_uploaded_file($_FILES['img']['tmp_name'],'../'. $fname);
				if($move){
					$data .=" , avatar = '{$fname}' ";
					if(isset($_SESSION['userdata']['avatar']) && is_file('../'.$_SESSION['userdata']['avatar']))
						unlink('../'.$_SESSION['userdata']['avatar']);
				}
			}
			$sql = "UPDATE students set {$data} where id = $id";
			$save = $this->conn->query($sql);

			if($save){
			$this->settings->set_flashdata('success','User Details successfully updated.');
			foreach($_POST as $k => $v){
				if(!in_array($k,array('id','password'))){
					if(!empty($data)) $data .=" , ";
					$this->settings->set_userdata($k,$v);
				}
			}
			if(isset($fname) && isset($move))
			$this->settings->set_userdata('avatar',$fname);
			return 1;
			}else{
				$resp['error'] = $sql;
				return json_encode($resp);
			}

	} 
	
}

$users = new specialties();
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
switch ($action) {
	case 'save':
		echo $users->save_users();
	break;
	case 'fsave':
		echo $users->save_fusers();
	break;
	case 'ssave':
		echo $users->save_susers();
	break;
	case 'delete':
		echo $users->delete_users();
	break;
	default:
		// echo $sysset->index();
		break;
}