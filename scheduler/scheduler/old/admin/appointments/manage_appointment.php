<?php 
require_once('../../config.php');

if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `appointments` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
    $qry2 = $conn->query("SELECT * FROM `patient_meta` where patient_id = '{$patient_id}' ");
    foreach($qry2->fetch_all(MYSQLI_ASSOC) as $row){
        $patient[$row['meta_field']] = $row['meta_value'];
    }
    

}
    $qry3 = $conn->query("SELECT * FROM `schedule_settings`");
    $meta = array_column($qry3->fetch_all(MYSQLI_ASSOC),'meta_value','meta_field');

    $qry4 = $conn->query("SELECT * FROM `doctors`");
    $doctors = $qry4;
    $qry5 = $conn->query("SELECT * FROM `specialties`");
    $specialties = $qry5;
    
?>


<style>
    .hide{
        display: none;
    }
#uni_modal .modal-content>.modal-footer{
    display:none;
}
#uni_modal .modal-body{
    padding-top:0 !important;
}
@media only screen and (min-device-width: 181px) and (max-device-width: 1024px) 

{

.modal-body #appointment #frm-field{ width: 100%!important}
.modal-body .col-6{ width:100%!important}

}
</style>
<div class="container-fluid">
    <form id="appointment_form" class="py-2">
    <div class="row" id="appointment">
        <div class="col-6" id="frm-field">
            <input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
            <input type="hidden" name="patient_id" value="<?php echo isset($patient_id) ? $patient_id : '' ?>">
                <div class="form-group">
                    <label for="name" class="control-label">Fullname</label>
                    <input type="text" class="form-control" name="name" value="<?php echo isset($patient['name']) ? $patient['name'] : '' ?>" required>
                </div>
                <div class="form-group">
                    <label for="email" class="control-label">Email</label>
                    <input type="email" class="form-control" name="email" value="<?php echo isset($patient['email']) ? $patient['email'] : '' ?>"  required>
                </div>
                <div class="form-group">
                    <label for="contact" class="control-label">Contact</label>
                    <input type="number" class="form-control" name="contact" value="<?php echo isset($patient['contact']) ? $patient['contact'] : '' ?>"  required>
                </div>
                <div class="form-group">
                    <label for="gender" class="control-label">Gender</label>
                    <select type="text" class="custom-select" name="gender" required>
                    <option <?php echo isset($patient['gender']) && $patient['gender'] == "Male" ? "selected": "" ?>>Male</option>
                    <option <?php echo isset($patient['gender']) && $patient['gender'] == "Female" ? "selected": "" ?>>Female</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="age" class="control-label">Age</label>
                    <input type="number" class="form-control" name="age" value="<?php echo isset($patient['age']) ? $patient['age'] : '' ?>"  required>
                </div>
                
        </div>
        <div class="col-6">
                <div class="form-group">
                    <label for="gender" class="control-label">Doctors</label>
                    <select type="text" class="custom-select" name="doctor" required>
                     <?php

                     foreach ($doctors as $key => $doctor) {
                         
                     ?>   
                    <option value="<?php echo $doctor['id'] ?>"><?php echo $doctor['name'] ?></option>
                     <?php
                     }
                     ?>   
                   
                    </select>
                </div>
                <div class="form-group">
                    <label for="specialty " class="control-label">Specialty</label>
                    <select  class="custom-select" name="specialty" required>
                     <?php

                     foreach ($specialties as $key => $specialty) {
                         
                     ?>   
                    <option value="<?php echo $specialty['id'] ?>"><?php echo $specialty['name'] ?></option>
                     <?php
                     }
                     ?>   
                   
                    </select>
                </div>
                <div class="form-group">
                    <label for="gender" class="control-label">Schedule</label>
                    <select type="text" class="custom-select" name="time" id="timeSchdld" required>
                    <option value="<?php echo $meta['morning_schedule'] ?>">Morning</option>
                    <option value="<?php echo $meta['afternoon_schedule'] ?>">Evening</option>
                    </select>
                </div>
                <div class="form-group" id="morning">
                    <label for="date_sched" class="control-label">Appointment</label>
                    <input type="text" class="form-control" id="morningInput"  name="date_sched" value="" required>
                </div>
                <div class="form-group hide" id="evening">
                    <label for="date_sched" class="control-label">Appointment</label>
                    <input type="text" class="form-control" id="eveningInput"  name="date_sched" value="" required>
                </div>
                
            <?php if($_settings->userdata('id') > 0): ?>

            <div class="form-group">
                <label for="ailment" class="control-label">Ailment</label>
                <textarea class="form-control" name="ailment" rows="3" required><?php echo isset($ailment)? $ailment : "" ?></textarea>
            </div>
           
            <?php else: ?>
                <input type="hidden" name="ailment" value="">
            <?php endif; ?>
            <div class="form-group">
                <label for="remarks" class="control-label">Remarks</label>
                <textarea class="form-control" name="remarks" rows="3" required><?php echo isset($patient['remarks']) ? $patient['remarks'] : '' ?></textarea>
            </div>
            <?php if($_settings->userdata('id') > 0): ?>
            <div class="form-group">
                <label for="status" class="control-label">Status</label>
                <select name="status" id="status" class="custom custom-select">
                    <option value="0"<?php echo isset($status) && $status == "0" ? "selected": "" ?>>Pending</option>
                    <option value="1"<?php echo isset($status) && $status == "1" ? "selected": "" ?>>Confirmed</option>
                    <option value="2"<?php echo isset($status) && $status == "2" ? "selected": "" ?>>Cancelled</option>
                </select>
            </div>
            <?php else: ?>
                <input type="hidden" name="status" value="0">
            <?php endif; ?>
        </div>
        <div class="form-group d-flex justify-content-end w-100 form-group">
            <button class="btn-primary btn">Submit Appointment</button>
            <button class="btn-light btn ml-2" type="button" data-dismiss="modal">Cancel</button>
        </div>
        </form>
    </div>
</div>
<script type="text/javascript">
            $(function(){  
            var dt = new Date();
            var time = dt.getFullYear() + "-" +(dt.getMonth()+1) + "-" +dt.getDate() + " " +dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
            var timeSchdld = $('#timeSchdld').val();
            
            var finalTIme =  timeSchdld.split(",");
            
                $('#morningInput').appendDtpicker({
                    "inline": false,
                    "minuteInterval": 10,
                    "futureOnly": true,
                    "amPmInTimeList": true,
                    "dateFormat": "YY-MM-DD H:mmTT",
                    "minTime":finalTIme[0],
                    "maxTime":finalTIme[1],
                    "current": time,
                });
            });
            $('#timeSchdld').on('change',function(){
                var textName = $('#timeSchdld option:selected').text();
                
                if(textName == 'Evening'){

                $('#morning').hide();
                $('#evening').show();
                }
                if(textName == 'Morning'){
                    
                $('#morning').show();
                $('#evening').hide();
                }
                 var dt = new Date();
            var time = dt.getFullYear() + "-" +(dt.getMonth()+1) + "-" +dt.getDate() + " " +dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
            var timeSchdld = $('#timeSchdld').val();
            
            var finalTIme =  timeSchdld.split(",");
            
                $('#eveningInput').appendDtpicker({
                    "inline": false,
                    "minuteInterval": 10,
                    "futureOnly": true,
                    "amPmInTimeList": true,
                    "dateFormat": "YY-MM-DD H:mmTT",
                    "minTime":finalTIme[0],
                    "maxTime":finalTIme[1],
                    "current": time,
                });
            });

        </script>
<script >

      $(function () {
    $('#datetimepicker1').datetimepicker();
 });
</script>
<script>
$(function(){
    $('#appointment_form').submit(function(e){
        e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=save_appointment",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.log(err)
					alert_toast("An error occured",'error');
					end_loader();
				},
				success:function(resp){
					if(typeof resp =='object' && resp.status == 'success'){
                       location.reload()
					}else if(resp.status == 'failed' && !!resp.msg){
                        var el = $('<div>')
                            el.addClass("alert alert-danger err-msg").text(resp.msg)
                            _this.prepend(el)
                            el.show('slow')
                            $("html, body").animate({ scrollTop: $('#uni_modal').offset().top }, "fast");
                    }else{
						alert_toast("An error occured",'error');
                        console.log(resp)
					}
						end_loader();
				}
			})
    })
    $('#uni_modal').on('hidden.bs.modal', function (e) {
        if($('#appointment_form').length <= 0)
            location.reload()
    })
})
</script>


