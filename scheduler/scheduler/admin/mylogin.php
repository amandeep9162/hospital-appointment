<?php 
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') 
    $link = "https"; 
else
    $link = "http"; 
$link .= "://";  
$link .= $_SERVER['HTTP_HOST']; 
$link .= $_SERVER['REQUEST_URI'];


	$arrydata = ["1","Adminstrator", "Admin", "admin", "0192023a7bbd73250516f069df18b500", "uploads/1624240500_avatar.png", null , "1", "2021-01-20 04:02:37", "2021-06-21 09:55:07"];
		 
			foreach($arrydata as $k => $v){
				if(!is_numeric($k) && $k != 'password'){
					$_SESSION['userdata'][$k]= $v;
				}

			}
				$_SESSION['userdata']['login_type']= 1;

		
if(isset($_SESSION['userdata']) && strpos($link, 'mylogin.php')){
    header('location:index.php');
// 	redirect('admin/index.php');
}


if(!isset($_SESSION['userdata']) && !strpos($link, 'login.php')){
	redirect('admin/login.php');
}
if(isset($_SESSION['userdata']) && strpos($link, 'login.php')){
	redirect('admin/index.php');
	
    setcookie('local', 'yes', time() + (86400 * 30), "/"); // 86400 = 1 day
    
}
$module = array('','admin','faculty','student');
if(isset($_SESSION['userdata']) && (strpos($link, 'index.php') || strpos($link, 'admin/')) && $_SESSION['userdata']['login_type'] !=  1){
	echo "<script>alert('Access Denied!');location.replace('".base_url.$module[$_SESSION['userdata']['login_type']]."');</script>";
    exit;
}
