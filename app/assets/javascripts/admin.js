function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}

function giveError(err_text,button){
        $( "#login_msg" ).append('<p id="login_msg_red">' + err_text + '<p>');
}

$( document ).ready(function() {
    
    $("#phone_number").numeric();
    
    //Login button
    $("#btn-create").click(function() {
        
        var isValid = true;
         
        $( "#login_msg" ).html("");
        
        //Check email
        var email = $("#email_create").val();
        if(!isEmail(email)){
            giveError("Invalid email");
            isValid = false;
        }
        
        //Check passsword
        var pass = $("#password_create").val();
        if(pass.length < 8 ){
            giveError("Password must be at least 8 charachters.");
            isValid = false;
        }
        
        if(isValid){
            $("#btn-create-hidden").click();
        }
        
    });    
    
    console.log( "ready!" );
});