<!--<script src="< ?php echo base_url(); ?>application/scripts/jquery.js" type="text/javascript"></script>-->
<!--<script src="< ?php echo base_url(); ?>application/src/facebox.js" type="text/javascript"></script>-->
<style>
    .imageContainer{
        float: left;
        width:225px;
        height: auto;
        margin-top: 10px;
    }
    .disabled{
        color:#909090 !important;
        cursor:default;
    }
</style>
<div id="fancybox-outer">
    <div class="fancybox-bg" id="fancybox-bg-n">
    </div>
    <div class="fancybox-bg" id="fancybox-bg-ne"></div>
    <div class="fancybox-bg" id="fancybox-bg-e"></div>
    <div class="fancybox-bg" id="fancybox-bg-se"></div>
    <div class="fancybox-bg" id="fancybox-bg-s"></div>
    <div class="fancybox-bg" id="fancybox-bg-sw"></div>
    <div class="fancybox-bg" id="fancybox-bg-w"></div>
    <div class="fancybox-bg" id="fancybox-bg-nw"></div>
    <div style="border-width: 10px; width: 800px; height:600px;;" id="fancybox-content">
        <div style="width: auto; height: auto; overflow: auto; position: relative;">
            <div id="Repin_Pop" class="Pop_Up_Blk">
                <h2>Add a pin</h2>
                <div class="pop_content">
                    <div id="pop_content">
                        <div id="loader"></div>


                        <input  name="current_img" id="current_img" type="hidden"/>
                        <input  name="ajax_flag" id="ajax_flag" type="hidden"/>


                        <form method="post" action="<?php echo site_url('pins/saveAddPin'); ?>" enctype="multipart/form-data" accept-charset="utf-8" onsubmit="return validateUpload()">
                            <input  name="current_img_src" id="current_img_src" type="hidden" value=""/>    
                           <ul class="upload_pin_ul">
                                <li>
                                    <label>Link</label>
                                    <input type="text" name="link" id="link" value="" class="" style="float:left"/><input type="button" name="button" id="findImage" value="Find images" class="Button2 Button13 WhiteButton" style="float:left;margin-left: 5px;"/>
                                    <span id="error_link" class="validation-message"></span>
                                </li>
                                <li> <span id="error_image" class="validation-message"></span></li> 
                                <span class="hideAll" style="display: none;">
                                    <li>
                                        <label>Pin description</label>
                                        <textarea name="description" id="description" style="width:315px;height:60px;float: left;"value=""></textarea>
                                        <span id="error_description" class="validation-message"></span>
                                    </li>

                                    <li>
                                        <label>Board</label>
                                        <select id="board_id" name="board_id" class="Button2 Button13 WhiteButton" style="float:left">
                                            <option value="select">Select</option>
                                            <?php $userId = $this->session->userdata('login_user_id'); ?>
                                            <?php $userBoards = getUserBoard($userId); ?>
                                            <?php foreach ($userBoards as $boardKey => $boardValues): ?>
                                                <option  value="<?php echo $boardValues->id; ?>"><?php echo $boardValues->board_name; ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                        <span id="error_board" class="validation-message"></span>

                                    </li>

                                    <li>
                                        <a class="blink4"  id="create_new_board" onclick="boardAction('create')"><span>Create New Board</span></a>
                                    </li>
                                    <li>
                                        <div style="display:none;" id="newboard">
                                            <p><input name="new_board" id="new_board" value="Create New Board" onclick="this.value='';" maxlength="20" type="text"></p>
                                            <span id="errorBoardName" class="val_error"></span>
                                            <!--<input type="button" name="button" id="button" />-->
                                            <p><button type="button" name="button" id="button" class="bbutton1" onclick="boardAction('save')"><span><span>Create Board</span></span></button>
                                                <button type="button" name="button1" id="button1" class="bbutton1" onclick="boardAction('cancel')"><span><span>Cancel</span></span></button></p>
                                        </div>
                                    </li>
                                    <li id="save_btn">
                                        <input type="submit" name="button" id="submit" value="save" class="Button2 Button13 WhiteButton" style="float:left"/>
                                    </li>
                                </span>

                            </ul>
                            <div class="imageContainer">

                            </div>


                        </form>
                        <div class="clear"></div>
                    </div>


                </div>
            </div>
        </div>
    </div>
    <a style="display: inline;" id="fancybox-close" ></a>
    <div style="display: none;" id="fancybox-title"></div>
    <a style="display: none;" href="javascript:;" id="fancybox-left">
        <span class="fancy-ico" id="fancybox-left-ico"></span>
    </a>
    <a style="display: none;" href="javascript:;" id="fancybox-right">
        <span class="fancy-ico" id="fancybox-right-ico"></span>
    </a>
</div>
<script type="text/javascript">
    function validateUpload()
    {
        description = $('textarea#description').val();
        link = $('#link').val();
        var board_id = $('#board_id').val();
   
        $('#error_link').html('');
        $('#error_description').html('');
 

        failed = 0 ;

        if(link=="")
        {
            $('#error_link').html('please provide a value');
            failed = 1;
        }
        if(description=="")
        {
            $('#error_description').html('please provide a value');
            failed = 1;
        }
        if(board_id == 'select'){
            $('#error_board').html('Please select a board');
            failed = 1;
        }
    

        if(failed==1)
        {
            return false;
        }
        else{
            return true;
        }
    
    }
    
    
    function boardAction(type)
    {   if(type=='create')
            $('#newboard').show('slow');
        if(type=='cancel')
            $('#newboard').hide('slow');
        if(type=='save')
        {       
            var boardName=$('#new_board').val();
            if(boardName=='')
            {
                $('#errorBoardName').html('Required');
                return false
            }
            else{
                var category    = $('#id_category').val();
                dataString      = 'name='+boardName+'&category='+category+'&type=ajax';
                $.ajax({
                    url: baseUrl+"board/create",
                    type: "POST",
                    data: dataString,
                    dataType: 'json',
                    success: function(data){
                        $('#board_id').append('<option value='+data+' selected="selected">'+boardName+'</option>');
                        $('#newboard').hide('slow');
                    }
                })
            
            }
        }
    }
</script>
