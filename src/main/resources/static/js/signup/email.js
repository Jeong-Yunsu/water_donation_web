$("#user_email").blur(function(){
    email();
});

$("#email_address").change(function(){
    email();
});

function email() {
    const email = $("#user_email").val();
    const middle = $("#middle").text();
    const address = $("#email_address").val();
    if(email != "" && address != "") {
        $("#mbr_email").val(email+middle+address);
    }
};