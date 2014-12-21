<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Welcome to cubetboard</title>
        <link rel="icon" href="<?php echo base_url(); ?>application/assets/images/favicon.ico" type="image/x-icon" />
        <link href="<?php echo base_url(); ?>application/assets/css/cubetboard.css" rel="stylesheet" type="text/css" />
<!--        <script src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.2.min.js"></script>-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="<?php echo base_url(); ?>application/scripts/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url(); ?>application/scripts/jquery.validate.js" type="text/javascript"></script>
    </head>
    <style type="text/css">
        label.error {
            color: #D20000;
            float: left;
        } 
        .login_box input.error {
            color: #000;
        }

    </style>
    <body>


        <div class="outer">
            <div class="header"><!-- starting Header -->
                <div class="container"><!-- starting container -->
                    <div class="header_box">
                        <div class="logo"><a href="<?php echo site_url(); ?>"><img src="<?php echo site_url() ?>/application/assets/images/cubetboard/logo.png"/></a></div>  
                    </div>
                </div><!-- closing container -->
            </div><!-- closing Header -->
            <div class="white_strip"></div>
            <div class="clear"></div>

            <div class="middle-banner_bg"><!-- staing middlebanner -->
                <div class="container"><!-- staing container -->
                    <div id="login_div">
                        <div class="editprofile_insidebox">
                            <span id="login_links">
                                <div class="inset">
                         		 <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
								</fb:login-button>
								<span id="fbLogout" onclick="checkLogOutState()"><a class="fb_button fb_button_medium"><span class="fb_button_text">Logout</span></a></span>
								<div id="status">
								</div>
                                </div>
                                <div class="inset">
                                    <!--                            <a class="tw login_button" href="/ci/pinterest/auth_other/twitter_signin">-->
                                    <a class="tw login_button" href="<?php echo site_url(); ?>auth_other/twitter_signin">
                                        <span>Login/Sign up with Twitter</span>
                                    </a>
                                </div>
                                <div class="login_box">
                                    <!--                            <form class="login_normal" action="/ci/pinterest/login/normal" method="POST" accept-charset="utf-8">-->
                                    <form id="login_form" class="login_normal" action="<?php echo site_url(); ?>login/normal" method="post" accept-charset="utf-8" >
                                        <span id="login_error" class="error"></span>
                                        <ul class="login_form">
                                            <li>
                                                <h2>Normal Login</h2>
                                            </li>
                                            <li>
                                                <a href="<?php echo site_url('invite/entry'); ?>" class="Button2 Button13 WhiteButton"><strong>Register</strong><span></span></a>
                                            </li>

                                            <li>
                                                <input id="id_email" name="email" type="text" class="inputform-field required email" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;" value=""/>
                                                <label>Email Address</label>
                                                <span id="email_error" class="error"></span>

                                            </li>

                                            <li id="password_li">
                                                <input id="id_password" name="password" type="password" class="inputform-field required" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;" value=""/>
                                                <label>Password</label>
                                                <span class="pass_error error" id="pass_error"></span>
                                            </li>

                                        </ul>

                                        <div class="non_inputs">
                                            <input type="button" onclick="userValidation();" value="login" id="login" class="Button2 Button13 WhiteButton"/>
                                            <a id="resetPass" class="colorless" href="#" onclick="forgetPass('show')">Forgot your password?</a>
                                            <a href="#" class="Button2 Button13 WhiteButton" id="reset" onclick="forgetPass('save')" style="display: none"><strong>Reset</strong><span></span></a>
                                            <a id="back" style="display: none;" href="#" class="colorless" onclick="forgetPass('back')">Back to Login?</a>
                                            <div id="loading" style="display:none"><img src="<?php echo site_url(); ?>/application/assets/images/admin/loading.gif"/></div>
                                            <div id="reset_message"></div>
                                        </div>

                                    </form><!-- .Form.FancyForm.AuthForm -->
                                </div>
                            </span>
                        </div><!-- closing container -->

                    </div>
                </div><!-- closing middlebanner -->
            </div>
        </div>
        <?php $this->load->view('footer'); ?>
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function(){
        
        $('#id_email').click(function(){
            $('#email_error').html('');
        });
        
        $('#id_password').click(function(){
            $('#pass_error').html('');
        });
    });
    
    function forgetPass(type)
    {   $('#email_error').html('')
        $('#reset_message').html('')
        if(type=='show')
        {
            $('#password_li').hide();
            $('#login').hide();
            $('#resetPass').hide();

            $('#reset').show();
            $('#back').show();

        }
        if(type=='back')
        {
            $('#password_li').show();
            $('#login').show();
            $('#resetPass').show();

            $('#reset').hide();
            $('#back').hide();
        }
        if(type=='save')
        {
            email = $('input#id_email').val()
            if(email=='')
            {
                $('#email_error').html('Please enter email')
                return false;
            }
            else{
                $('#loading').show()
                dataString = 'email='+email+'&type=ajax';
                $.ajax({
                    url: "<?php echo site_url('password/reset/'); ?>/",
                    type: "POST",
                    data: dataString,
                    dataType: 'json',
                    cache: false,
                    success: function (data) {
                   
                        $('#loading').hide()
                        $('#reset_message').html('reset email link is send to your email id')
                    }
                });
            }
        }

    }
    
    
    function userValidation(){
    
        var form = $("#login_form");
        form.validate();

        if(form.valid()){

            var email    = $('#id_email').val();
            var password = $('#id_password').val();

            $.ajax({
                data:{'email':email,'password':password},
                type: 'post',
                url:'<?php echo base_url(); ?>login/validateLogin',
                dataType:'json',
                cache: false,
                success:function(result){
                    if(result != 1){
                        $('#login_error').html('Invalid email or password.');
                    }else{
                        $('#login_form').submit();
                    }

                }

            });

        }
   
    
    }
   
</script>
<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }
   function checkLogOutState() {
	FB.logout(function(response) {
        statusChangeCallback(response);
    });
	}
  window.fbAsyncInit = function() {
  FB.init({
    appId      : '1531732880432370',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.1' // use version 2.1
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + ', '+ response.email+' !';

      $.ajax({
          data:{'email':response.email,'password':response.name},
          type: 'post',
          url:'<?php echo base_url(); ?>login/validateLogin',
          dataType:'json',
          cache: false,
          success:function(result){
              if(result != 1){
                  $('#login_error').html('Invalid email or password.');
              }else{
                  $('#login_form').submit();
              }

          }

      });
      });
  }
</script>