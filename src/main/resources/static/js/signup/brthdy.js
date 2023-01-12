$("#yy").blur(function(){
    number();
});

$("#mm").change(function(){
    number();
});

$("#dd").change(function(){
    number();
});

function number() {
    const yy = $("#yy").val();
    const mm = $("#mm").val();
    const dd = $("#dd").val();
    if(yy != "" && mm != "" && dd != "") {
        $("#mbr_brthdy").val(yy+"-"+mm+"-"+dd);
    }
};

function handleInputLength(el, max) {
    if(el.value.length > max) {
        el.value = el.value.substr(0, max);
    }
}