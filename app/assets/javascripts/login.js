
function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}

function giveError(err_text,button){
    if(button == 1 ){
        $( "#login_msg" ).append('<p id="login_msg_red">' + err_text + "<p>");
    }
    else if (button == 2){
         $( "#signup_msg" ).append('<p id="login_msg_red">' + err_text + "<p>");
    }
}

$( document ).ready(function() {
    
    $("#phone_number").numeric();
    
    //Login button
    $("#btn-login").click(function() {
        
        var isValid = true;
         
        $( "#login_msg" ).html("");
        
        //Check email
        var email = $("#email_input").val();
        if(!isEmail(email)){
            giveError("Invalid email",1);
            isValid = false;
        }
        
        //Check passsword
        var pass = $("#password_input").val();
        if(pass.length < 8 ){
            giveError("Password must be at least 8 charachters.",1);
            isValid = false;
        }
        
        if(isValid){
            $("#btn-login-hidden").click();
        }
        
    });
    
    
    //Signup button
    $("#btn-signup").click(function() {
        
        var isValid = true;
         
        $( "#signup_msg" ).html("");
        
        //Check email
        var email = $("#email_input_s").val();
        if(!isEmail(email)){
            giveError("Invalid email",2);
            isValid = false;
        }
        
        //Check passsword
        var pass = $("#password_input_s").val();
        if(pass.length < 8 ){
            giveError("Password must be at least 8 charachters.",2);
            isValid = false;
        }
        
        //Check company name
        var pass = $("#company_name").val();
        if(pass.length < 3 ){
            giveError("Company name must be at least 3 charachters.",2);
            isValid = false;
        }
        
        if(isValid){
            $("#btn-signup-hidden").click();
        }
        
    });
    
    
    console.log( "ready!" );
});


